const pusher = require('./pusher.js');
const deviceManager = require('./deviceManager.js');

exports.handler = (event, context, callback) => {
    console.log('event: ' + event);
    event.Records.forEach(record => {
        console.log('Stream record: ', JSON.stringify(record, null, 2));
        
        if (record.eventName == 'INSERT') {
            const deviceId = record.dynamodb.NewImage.cameraId.S;
            
            console.log('deviceId: ' + deviceId);
        
            if (deviceId == null) {
                return;
            }
            
            console.log('motion dectected from deviceId: ' + deviceId);
        
            deviceManager.getUserIdsConntectedDevice(deviceId, function (userIds) {
                userIds.forEach(userId => {
                    deviceManager.getEndpointArn(userId, function (endpoint) {
                        console.log('enpoints:', endpoint);
                        
                        if (endpoint != null) {
                            console.log('request endpointARN:', endpoint);
                            
                            let payload = {
                                deviceId: deviceId
                            };
                            
                            let message = "Detected a motion from deviceId: " + deviceId;
                            
                            pusher.push(endpoint, message, payload, true, function (messageId) {
                            
                            });
                            
                            pusher.push(endpoint, message, payload, false, function (messageId) {
                            
                            });
                        }
                    });
                });
            });
        }
    });
};
