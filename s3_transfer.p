import boto3

s3= boto3.client('s3')

#(file_directory,bucket_name, file_to_save)
s3.upload_file('s3_transfer.txt','swaroupbanikk','s3_script.txt')
