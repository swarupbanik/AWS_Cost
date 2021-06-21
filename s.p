import boto3
import sys
import os
import time
from time import gmtime, strftime, sleep 
os.environ['TZ'] = 'Asia/Kolkata'

hh = time.strftime('%H')

#start="19"
#stop="20"

def get_ec2_con_for_give_region(my_region):
	ec2_con_re=boto3.resource('ec2',region_name=my_region)
	return ec2_con_re

def list_instances_on_my_region(ec2_con_re):
	for each in ec2_con_re.instances.all():
		print( each.id)


def start_instance(ec2_con_re):
	for each in ec2_con_re.instances.all():
		each.start()
		print("Please wait Swarup it is going to start , Once if it is started then we will let you know")
		each.wait_until_running()
	print(" BANIK its running now")
	return

def Thank_you():
	print("\n\n ************ Thank You for using this script (TEAM) ************")
	return None

def stop_instance(ec2_con_re):
        for each in ec2_con_re.instances.all():
                each.stop()
                print("Please wait Swarup it is going to stop , Once if it is stops  then we will let you know")
                each.wait_until_stopped()
        print(" BANIK it has stopped  now")
        return


def welcome():
	print("Welcome Banik , This script will help you to start or stop ec2 instances based on your required region and instance id")
	print("Enjoy by using this script\n\n")
	time.sleep(3)


def main():
	welcome()
	my_region=input("Enter your region name:")
	print("Please wait .. CONNECTING TO BANIK's AWS EC2 CONSOLE ")
	ec2_con_re= get_ec2_con_for_give_region(my_region)
	print( "Please Wait listing all instances ids in your region {}.format(my_region)")
	list_instances_on_my_region(ec2_con_re)
	start=input("Banik now choose your instance   start time")
	stop = input("Banik now choose your instance close time ")
        

        #while True:
        #        if start_stop not in ["start","stop"]:
        #                start_stop=input("Enter only stop or start commands:")
        #                continue
        #        else:
        #                break
       
	if (hh  == start):
		start_instance(ec2_con_re)
	if ( hh == stop ):
		stop_instance(ec2_con_re)
	Thank_you()

if __name__ == '__main__':
	os.system('cls')
	main()
