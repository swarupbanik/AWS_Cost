import boto3
import os

s3= boto3.client('s3')

response = s3.create_bucket(ACL='public-read-write',Bucket='swaroupsbucket',CreateBucketConfiguration={'LocationConstraint':'us-east-2'})

#(file_directory,bucket_name, file_to_save)
#s3.upload_file('s3_transfer.txt','swaroupbanikk','s3_script.txt')

for file in os.listdir():
	if '.txt' in file:
		upload_file_bucket='swaroupbanikk'
		upload_file_key='text/' + str(file)
		s3.upload_file(file,upload_file_bucket,upload_file_key)
	if '.p' in file:
                upload_file_bucket='swaroupsbucket'
                upload_file_key= str(file)
                s3.upload_file(file,upload_file_bucket,upload_file_key)
