exports.push = (targetArn, message, payload, silent, callback) => {
    const AWS = require('aws-sdk');
    const sns = new AWS.SNS({apiVersion: '2010-03-31', region: 'us-east-1'});
    
    console.log('loading function');

    var aps;
    
    if (silent) {
        aps = {
            'content-available': 1
        };
    } else {
        aps = {
            alert: message,
        };
    }
    const jsonMessage = {
        default: '${message}',
        APNS_SANDBOX: JSON.stringify({
            aps,
            payload,
        }),
        APNS: JSON.stringify({
            aps,
            payload,
        }),
    };

    const params = {
        Message: JSON.stringify(jsonMessage),
        MessageStructure: 'json',
        TargetArn: targetArn
    };

    // Create promise and SNS service object
    var publishTextPromise = sns.publish(params).promise();

    // Handle promise's fulfilled/rejected states
    publishTextPromise.then(
        function(data) {
            console.log("Message ${params.Message} send sent to the topic ${params.TopicArn}");
            console.log("MessageID is " + data.MessageId);
            callback(data.MessageId);
        }).catch(
            function(err) {
            console.error(err, err.stack);
            callback('undefined');
        });
}
