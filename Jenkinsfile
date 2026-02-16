pipeline {
    agent any

    stages {

        stage('Terraform Init & Apply') {
            steps {
                dir('Terraform') { // match the folder name exactly (capital T)
                    // Initialize Terraform
                    sh 'terraform init'

                    // Apply Terraform configuration automatically
                    sh 'terraform apply -auto-approve'

                    // Capture EC2 public IP from Terraform output
                    script {
                        ec2_ip = sh(
                            script: "terraform output -raw ec2_public_ip",
                            returnStdout: true
                        ).trim()
                        echo "EC2 Public IP captured: ${ec2_ip}"
                    }
                }
            }
        }

        stage('Generate Ansible Inventory') {
            steps {
                script {
                    // Create Ansible inventory dynamically with the EC2 IP
                    inventory_content = "[webservers]\n${ec2_ip} ansible_user=ec2-user ansible_ssh_private_key_file=/path/to/your/key.pem"
                    writeFile file: 'Ansible/inventory.ini', text: inventory_content
                    echo "Generated Ansible inventory with EC2 IP"
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                dir('Ansible') {
                    // Execute your Ansible playbook
                    sh 'ansible-playbook -i inventory.ini playbook.yml'
                }
            }
        }

        stage('SonarCloud Scan') {
            steps {
                // Run SonarCloud scan
                sh "sonar-scanner -Dsonar.login='YOUR_SONARCLOUD_TOKEN'"
            }
        }

    }
}

