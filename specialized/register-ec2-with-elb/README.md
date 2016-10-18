# register-ec2-with-elb

[![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/)

When using an IAM Role and Docker Cloud, the deployment is quite simple. Just create a stack
pointing to this image, and change the `AWS_DEFAULT_REGION` and `LOAD_BALANCER_NAME` environment variables:

```
add-to-elb:
  image: elementar/register-ec2-with-elb
  autodestroy: on_success
  deployment_strategy: every_node
  environment:
    AWS_DEFAULT_REGION: us-east-1
    LOAD_BALANCER_NAME: my-load-balancer
```

If you can't use IAM Roles, you can specify the access key and secret of an IAM user
using the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables. 

## Tips

You might want to use tags to limit the machines which would be added to the Load Balancer. See
[Docker Cloud's Stack YAML Reference](https://docs.docker.com/docker-cloud/apps/stack-yaml-reference/)
for more information.

## Sample Policy

The EC2 instance must have an IAM Role with permission to add instances to the ELB. The following policy should work:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
            "Resource": "*"
        }
    ]
}
```
