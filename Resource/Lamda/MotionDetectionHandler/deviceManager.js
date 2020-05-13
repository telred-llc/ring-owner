// Load the AWS SDK for Node.js
var AWS = require('aws-sdk');

// Create the DynamoDB service object
var ddb = new AWS.DynamoDB({apiVersion: '2012-08-10', region: 'us-west-2'});

exports.getAllEndpointsArn = (callback) => {
    const params = {
        TableName: 'AppSync_RingApp_usersTable',
        FilterExpression: 'attribute_exists(#arn)',
        ProjectionExpression: 'awsSNSEnpointARN',
        ExpressionAttributeNames:{
            '#arn': 'awsSNSEnpointARN'
        }
    };

    // Call DynamoDB to scan the items from the table
    ddb.scan(params, function(err, data) {
        if (err) {
            console.log("Error", err);
            callback([]);
        } else {
            console.log(data);
            const enpointsArn = data.Items.map(function(item) {
                return item.awsSNSEnpointARN.S;
            });
            
            console.log('enpointsArn ', enpointsArn);
            callback(enpointsArn);
        }
    });
};

exports.getEndpointArn = (userId, callback) => {
    const params = {
        TableName: 'AppSync_RingApp_usersTable',
        Key: {
            "cognitoId" : {
                S : userId
            }
        }
    };

    // Call DynamoDB to scan the items from the table
    ddb.getItem(params, function(err, data) {
        if (err) {
            console.log("Error", err);
            callback(null);
        } else {
            console.log(data);
            const enpointsArn = data.Item.awsSNSEnpointARN.S
            
            console.log('enpointsArn ', enpointsArn);
            callback(enpointsArn);
        }
    });
};

exports.getUserIdsConntectedDevice = (deviceId, callback) => {
    
    console.log('type: ' + typeof deviceId);
    
    const params = {
        TableName: 'AppSync_RingApp_userCamerasTable',
        ProjectionExpression: "userId",
        FilterExpression: "#deviceIdKey = :deviceIdValue",
        ExpressionAttributeNames: {
            "#deviceIdKey": "deviceId",
        },
        ExpressionAttributeValues: {
             ":deviceIdValue": {
                 S: deviceId,
             }
        }
    };
 
    // Call DynamoDB to scan the items from the table
    ddb.scan(params, function(err, data) {
        if (err) {
            console.log("Error", err);
            callback([]);
        } else {
            console.log(data);
            const userIds = data.Items.map(function(item) {
                return item.userId.S;
            });
            
            console.log('userIds ', userIds);
            callback(userIds);
        }
    });
};