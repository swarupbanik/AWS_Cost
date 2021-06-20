import boto3

s3_ob=boto3.resource('s3')
for each_b in s3_ob.buckets.all():
	print( each_b.name)

ec2_ob=boto3.resource('ec2')
for each_e in ec2_ob.instances.all():
        print(each_e.id)

