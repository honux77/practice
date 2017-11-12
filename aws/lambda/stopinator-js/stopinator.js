'use strict';
console.log('Loading function');

/*
stopinator: stop all instances which do not have proper name tag
*/
var aws = require('aws-sdk');
// stop all instances exceop this
var global_tags = ['watple-main', 'watple-test']
var regions = ['ap-northeast-2', 'ap-northeast-1', 'us-east-1', 'us-west-1', 'us-west-2', 'ap-southeast-1',
        'ap-southeast-2', 'eu-west-1', 'eu-central-1', 'sa-east-1'];

exports.handler = (event, context, callback) => {
    for (var i = 0; i < regions.length; i++) {
        findInstances(regions[i], findCallback);
    }
};

function findCallback(err, data) {
    if(!data.hx_empty) {
        data.hx_tags = global_tags;
        stopInstances(data);
    }
}

function findInstances(region, callback) {
        aws.config.region = region;
        var ec2 = new aws.EC2();
        var ret = {};
        ret.hx_region = region;
        ret.hx_instances = [];
        ret.hx_empty = true;
        ec2.describeInstances(function(err, data) {
                var reservations = data.Reservations;
                if (reservations.length !== 0) {
                        for (var i = 0; i < reservations.length; i++) {
                                var instances = reservations[i].Instances;
                                ret.hx_instances = ret.hx_instances.concat(instances);
                                ret.hx_empty = false;
                        }
                }
                //retrun all instances of the region
                callback(err, ret);
        });
}

function stopInstances(data) {
        console.log("region: " + data.hx_region);
        aws.config.region = data.hx_region;
        var ec2 = new aws.EC2();
        var instances = data.hx_instances;
        for (var i = 0; i < instances.length; i++){
                var id = instances[i].InstanceId;
                var state = instances[i].State.Name;
                var tags = instances[i].Tags;
                var nametag;
                nametag = tags.find(function(tag){return tag.Key === 'Name';}).Value;
                console.log(id + "," + nametag + "," + state);
                if (data.hx_tags.indexOf(nametag) == -1) {
                        console.log("FIND TO STOP:" + id +"," + nametag);
                        ec2.stopInstances({InstanceIds: [id], DryRun: false}, function(err, data) {
                                if (!err)
                                        console.log("Stop instance requested");
                        });
                }
        }
}
