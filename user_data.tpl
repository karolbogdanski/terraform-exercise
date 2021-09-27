  #!/bin/bash
  echo "*** Installing apache2"
  sudo yum update -y
  sudo yum install -y httpd
  echo "*** Completed Installing apache2"
  sudo systemctl start httpd
  aws s3 cp s3://${bucket_name}/sample-page.html /var/www/html/index.html