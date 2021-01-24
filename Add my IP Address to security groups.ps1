$ip=(Invoke-WebRequest -uri "http://ipconfig.me/ip" -usebasicparsing).Content+"/32" 
aws ec2 authorize-security-group-ingress --group-name pihole --protocol tcp --port 80 --cidr $ip --region ap-south-1
aws ec2 authorize-security-group-ingress --group-name default --protocol tcp --port 3389 --cidr $ip --region ap-south-1
aws ec2 authorize-security-group-ingress --group-name default --protocol tcp --port 22 --cidr $ip --region ap-south-1
aws ec2 authorize-security-group-ingress --group-name default --protocol tcp --port 5901 --cidr $ip --region ap-south-1