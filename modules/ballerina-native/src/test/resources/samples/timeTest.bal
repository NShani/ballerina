import ballerina.lang.time;

function testCurrentTime () (int timeValue, string zoneId, int zoneoffset) {
    time:Time timeStruct = time:currentTime();
    timeValue = timeStruct.time;
    zoneId = timeStruct.zone.zoneId;
    zoneoffset = timeStruct.zone.zoneOffset;
    return;
}

function testCreateTimeWithZoneID () (int timeValue, string zoneId, int zoneoffset) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1498488382000, zone:zoneValue};
    timeValue = timeStruct.time;
    zoneId = timeStruct.zone.zoneId;
    zoneoffset = timeStruct.zone.zoneOffset;
    return;
}

function testCreateTimeWithOffset () (int timeValue, string zoneId, int zoneoffset) {
    time:Timezone zoneValue = {zoneId:"-05:00"};
    time:Time timeStruct = {time:1498488382000, zone:zoneValue};
    timeValue = timeStruct.time;
    zoneId = timeStruct.zone.zoneId;
    zoneoffset = timeStruct.zone.zoneOffset;
    return;
}

function testCreateTimeWithNoZone () (int timeValue, string zoneId, int zoneoffset) {
    time:Timezone zoneValue = {zoneId:""};
    time:Time timeStruct = {time:1498488382000, zone:zoneValue};
    timeValue = timeStruct.time;
    zoneId = timeStruct.zone.zoneId;
    zoneoffset = timeStruct.zone.zoneOffset;
    return;
}

function testCreateTimeWithNullZone () (int year) {
    time:Time timeStruct = time:createTime(2017, 3, 28, 23, 42, 45, 554, "America/Panama");
    timeStruct.zone = null;
    year = time:year(timeStruct);
    return;
}

function testCreateDateTime () (string timeString) {
    time:Time timeStruct = time:createTime(2017, 3, 28, 23, 42, 45, 554, "America/Panama");
    timeString = time:toString(timeStruct);
    return;
}


function testParseTime () (int timeValue, string zoneId, int zoneoffset) {
    time:Time timeStruct = time:parse("2017-06-26T09:46:22.444-0500", "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    timeValue = timeStruct.time;
    zoneId = timeStruct.zone.zoneId;
    zoneoffset = timeStruct.zone.zoneOffset;
    return;
}

function testToStringWithCreateTime () (string timeString) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1498488382000, zone:zoneValue};
    timeString = time:toString(timeStruct);
    return;
}

function testFormatTime () (string timeString) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1498488382444, zone:zoneValue};
    timeString = time:format(timeStruct, "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return;
}

function testGetFunctions () (int year, int month, int day, int hour, int minute, int second, int milliSecond,
                             string weekday) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1456876583555, zone:zoneValue};
    year = time:year(timeStruct);
    month = time:month(timeStruct);
    day = time:day(timeStruct);
    hour = time:hour(timeStruct);
    minute = time:minute(timeStruct);
    second = time:second(timeStruct);
    milliSecond = time:milliSecond(timeStruct);
    weekday = time:weekday(timeStruct);
    return;
}

function testGetDateFunction () (int year, int month, int day) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1456876583555, zone:zoneValue};
    year, month, day = time:getDate(timeStruct);
    return;
}

function testGetTimeFunction () (int hour, int minute, int second, int milliSecond) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1456876583555, zone:zoneValue};
    hour, minute, second, milliSecond = time:getTime(timeStruct);
    return;
}

function testAddDuration () (string timeString) {
    time:Time timeStruct = time:parse("2017-06-26T09:46:22.444-0500", "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    timeStruct = time:addDuration(timeStruct, 1, 1, 1, 1, 1, 1, 1);
    timeString = time:format(timeStruct, "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return;
}

function testSubtractDuration () (string timeString) {
    time:Time timeStruct = time:parse("2016-03-01T09:46:22.444-0500", "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    timeStruct = time:subtractDuration(timeStruct, 1, 1, 1, 1, 1, 1, 1);
    timeString = time:format(timeStruct, "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return;
}

function testToTimezone () (string timeString) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1456876583555, zone:zoneValue};
    timeStruct = time:toTimezone(timeStruct, "Asia/Colombo");
    timeString = time:format(timeStruct, "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return;
}

function testToTimezoneWithInvalidZone () (string timeString) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1456876583555, zone:zoneValue};
    timeStruct = time:toTimezone(timeStruct, "test");
    timeString = time:format(timeStruct, "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return;
}

function testToTimezoneWithDateTime () (string timeString) {
    time:Time timeStruct = time:parse("2016-03-01T09:46:22.444-0500", "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    timeStruct = time:toTimezone(timeStruct, "Asia/Colombo");
    timeString = time:format(timeStruct, "yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return;
}

function testManualTimeCreate () (string timeString) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time time = {time:1498488382000, zone:zoneValue};
    timeString = time:toString(time);
    return;
}

function testManualTimeCreateWithNoZone () (int year) {
    time:Time time = {time:1498488382555};
    year = time:year(time);
    return;
}

function testManualTimeCreateWithEmptyZone () (int year) {
    time:Timezone zoneValue = {zoneId:""};
    time:Time time = {time:1498488382555, zone: zoneValue};
    year = time:year(time);
    return;
}

function testManualTimeCreateWithInvalidZone () (int year) {
    time:Timezone zoneValue = {zoneId:"test"};
    time:Time time = {time:1498488382555, zone:zoneValue};
    year = time:year(time);
    return;
}

function testParseTimenvalidPattern () (int timeValue, string zoneId, int zoneoffset) {
    time:Time timeStruct = time:parse("2017-06-26T09:46:22.444-0500", "test");
    timeValue = timeStruct.time;
    zoneId = timeStruct.zone.zoneId;
    zoneoffset = timeStruct.zone.zoneOffset;
    return;
}

function testParseTimenFormatMismatch () (int timeValue, string zoneId, int zoneoffset) {
    time:Time timeStruct = time:parse("2017-06-26T09:46:22.444-0500", "yyyy-MM-dd");
    timeValue = timeStruct.time;
    zoneId = timeStruct.zone.zoneId;
    zoneoffset = timeStruct.zone.zoneOffset;
    return;
}

function testFormatTimeInvalidPattern () (string timeString) {
    time:Timezone zoneValue = {zoneId:"America/Panama"};
    time:Time timeStruct = {time:1498488382444, zone:zoneValue};
    timeString = time:format(timeStruct, "test");
    return;
}
