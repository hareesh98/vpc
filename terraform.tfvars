access_key = "" # Access key
secret_access_key = "" # Secret access key
region = "us-east-1"
vpc_cidr_addr = "10.0.0.0/26"
public_subnets = [ "10.0.0.0/24", "10.0.2.0/24" ]
private_subnets = [ "10.0.1.0/24", "10.0.3.0/24" ]
security_groups = {
    "ec2-sg" = {
       name = "ec2-sg"
       description = "EC2 security group"
       tags = {
         "Name" = "ec2-sg"
       }
       ingress = [
         {
          description      = "Allow ssh access from anywhere"
          from_port        = 22
          to_port          = 22
          protocol         = "tcp"
          cidr_blocks      = ["0.0.0.0/0"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
         },
         {
          description      = "Allow http access from anywhere"
          from_port        = 80
          to_port          = 80
          protocol         = "tcp"
          cidr_blocks      = ["0.0.0.0/0","10.0.0.0/28"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
         }
       ]
       egress = [
         {
          description      = "Allow all egress access"
          from_port        = 0
          to_port          = 0
          protocol         = "-1"
          cidr_blocks      = ["0.0.0.0/0"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
         }
       ]
    }
    "ecs-sg" = {
       name = "ecs-sg"
       description = "ecs security group"
       tags = {
         "Name" = "ecs-sg"
       }
       ingress = []
       egress  = []
    }
}
