import boto3

session=boto3.Session(profile_name="Banik",region_name="us-east-2")

client=session.client(service_name="ec2")

all_region=client.describe_regions()

list=[]
for each_reg in all_region['Regions']:
	list.append(each_reg['RegionName'])

for each_reg in list:
	session=boto3.Session(profile_name="Banik",region_name=each_reg)
	resource=session.resource(service_name="ec2")
	print("List of EC2 instances from region :",each_reg)
	for each in resource.instances.all():
		print(each.id,each.state['Name'])
