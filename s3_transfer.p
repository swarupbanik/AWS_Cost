import boto3

s3= boto3.client('s3')

for file in os.listdir():
  if '.txt' in file:
    upload_file_bucket='swaroupbanikk'
    upload_file_key='text/' + str(file)
    s3.upload_file(file,upload_file_bucket,upload_file_key)
    
  if '.py. in file:
    upload_file_bucket='banikk'
    upload_file_key='python/' + str(file)
    s3.upload_file(file,upload_file_bucket,upload_file_key)
    
#(file_directory,bucket_name, file_to_save)
#s3.upload_file('s3_transfer.txt','swaroupbanikk','s3_script.txt')
