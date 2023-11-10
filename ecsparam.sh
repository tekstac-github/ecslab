echo "###### ECR REPOSITORY_URI #######"
export REPOSITORY_URI=$(aws ecr describe-repositories --query 'repositories[].[repositoryUri]' --output text)
echo -e  "$REPOSITORY_URI \n"

echo "###### Subnets ######"
subnets=$(aws ec2 describe-subnets | jq -r .Subnets[].SubnetId)
echo -e "$subnets \n"

echo "###### ecstaskdefinitionrole #######"
ecstaskdefinitionrole=$(aws iam list-roles | jq -r .Roles[].Arn | grep ecstaskdefinitionrole)
echo  -e "$ecstaskdefinitionrole \n"


echo "####### target-group #######"
targetArn=$(aws elbv2 describe-target-groups | jq -r .TargetGroups[].TargetGroupArn)
echo -e "$targetArn \n"


echo "####### security group #######"
securitygroup=$(aws ec2 describe-security-groups --filters Name=tag:Name,Values=Web-SG | jq -r .SecurityGroups[].GroupId)
echo -e "$securitygroup \n"

echo "####### DNSName of the Load Balancer ######"
LoadbalancerURL=$(aws elbv2 describe-load-balancers | jq -r .LoadBalancers[].DNSName)
echo -e "$LoadbalancerURL \n"
