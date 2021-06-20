import boto3

s3_ob=boto3.resource('s3')

for each_b in s3_ob.buckets.all():
	print( each_b.name)


