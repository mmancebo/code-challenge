##################################################################################
# INSTANCES
##################################################################################
resource "aws_instance" "ec2-dmz" {
  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  subnet_id              = module.network.public_id
  vpc_security_group_ids = [aws_security_group.dmz-roles.id]
  key_name               = var.key_name

  tags = merge(local.common_tags, { Name = "${var.name}-ec2-dmz" })

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source      = "./.hidden/access.pem"
    destination = "/home/ec2-user/.ssh/access.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 600 /home/ec2-user/.ssh/access.pem"
    ]
  }
}

resource "aws_instance" "ec2-local" {
  ami                         = data.aws_ami.aws-linux.id
  instance_type               = "t2.micro"
  subnet_id                   = module.network.private_id
  vpc_security_group_ids      = [aws_security_group.local-role.id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  tags = merge(local.common_tags, { Name = "${var.name}-ec2-local" })
}
