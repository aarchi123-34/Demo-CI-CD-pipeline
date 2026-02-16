pipeline {
    agent any

    stages {
        stage('Terraform Init & Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                    script {
                        // Capture EC2 public IP directly into a variable
                        ec2_ip = sh(script: "terraform output -raw ec2_public_ip", returnStdout: true).trim()
                        echo "EC2 Public IP: ${ec2_ip}"
                    }
                }
            }
        }

        stage('Generate Ansible Inventory') {
            steps {
                script {
                    // Create inventory.ini with captured IP
                    inventory_content = "[webservers]\n${ec2_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/your/key.pem"
                    writeFile file: 'ansible/inventory.ini', text: inventory_content
                    echo "Generated Ansible inventory with EC2 IP"
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                dir('ansible') {
                    sh 'ansible-playbook -i inventory.ini playbook.yml'
                }
            }
        }

        stage('SonarCloud Scan') {
            steps {
                // Replace YOUR_SONARCLOUD_TOKEN with the actual token
                sh 'sonar-scanner -Dsonar.login='71619e0ac3f96ce595fb2c5e82f60ffe3d9b34bb'
            }
        }
    }
}
