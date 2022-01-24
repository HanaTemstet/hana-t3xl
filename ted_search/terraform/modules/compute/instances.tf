resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3_profile"
  role = data.aws_iam_role.s3_role.name
}
resource "aws_instance" "hana-app-1" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = data.aws_subnet.hana-doiteasy-subnet-1.id
    associate_public_ip_address = var.associate_public_ip_address
    key_name                    = var.instace_key_name
    vpc_security_group_ids       = [aws_security_group.hana-doiteasy-sg.id]
    iam_instance_profile        = "${aws_iam_instance_profile.s3_profile.name}"

    user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update -y && \
        sudo apt-get install docker.io -y && \
        sudo service docker start && \
        sudo apt install docker-compose -y && \
        sudo usermod -a -G docker $USER
        pushd /home/ubuntu/
        sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        sudo apt install unzip
        sudo unzip awscliv2.zip
        sudo ./aws/install
        sudo aws s3 cp --recursive s3://hana-doitdianamic-bucket/ted_search_files .
        sudo docker-compose up -d
      EOF
    /* connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/ted_search/adir-terra-sa-east-key.pem")
      host = aws_instance.adir-1.public_ip
    } 
    provisioner "file" {
        source      = "~/ted_search/app/docker-compose.yml"
        destination = "~/docker-compose.yml"
    } 
    provisioner "file" {
        source      = "~/ted_search/app/nginx.conf"
        destination = "~/nginx.conf"
    } 
    provisioner "file" {
        source      = "~/ted_search/app/src/main/resources/static"
        destination = "~/static"
    } */
    tags = {
        Name = var.instance_name_1
    }
}
