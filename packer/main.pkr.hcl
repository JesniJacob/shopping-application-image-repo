packer {
  required_plugins {
    amazon = {
       source  = "github.com/hashicorp/amazon"
        version = "~> 1"
       }
}
}

#souce block
source "amazon-ebs" "image" {
  ami_name      = local.image_name
  instance_type = "t2.micro"
  source_ami    = var.ami_id
  ssh_username  = "ec2-user"
  tags = {
    Name    = local.image_name
    project = var.project_name
    env     = var.project_env
  }
}

#build block

build {
  sources = ["source.amazon-ebs.image"]
  
provisioner "file" {
    source = "../website"
  destination= "/tmp/"
}

provisioner "shell" {
    script          = "./setup.sh"
    execute_command = "sudo {{.Path}}"

  }
}
