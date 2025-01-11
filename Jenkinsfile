// // declarative pipeline
// pipeline {
//     agent {
//         docker {
//             image 'node:16-buster-slim'
//             args '-p 3000:3000'
//         }
//     }
//     stages {
//         stage('Build') {
//             steps {
//                 sh 'rm -rf node_modules package-lock.json'
//                 sh 'npm install'
//             }
//         }
//         stage('Test') {
//             steps {
//                 sh './jenkins/scripts/test.sh'
//             }
//         }
//     }
// }

// // Scripted Pipeline
// node {
//     docker.image('node:16-buster-slim').inside('-p 3000:3000') {
//         stage('Build') {
//             sh 'npm install'
//         }
//         stage('Test') {
//             sh './jenkins/scripts/test.sh'
//         }
//     }
// }

// node {
//     docker.image('node:16-buster-slim').inside('-p 3000:3000') {
//         stage('Build') {
//             sh 'npm install'
//         }

//         stage('Test') {
//             sh './jenkins/scripts/test.sh'
//         }
//     }

//     stage('Manual Approval') {
//         script {
//             def userInput = input(
//                 message: 'Lanjutkan ke tahap Deploy?',
//                 parameters: [
//                     choice(name: 'Approval', choices: ['Proceed', 'Abort'], description: 'Pilih Proceed untuk melanjutkan ke tahap Deploy atau Abort untuk menghentikan pipeline')
//                 ]
//             )
//             if (userInput == 'Abort') {
//                 error('Pipeline dihentikan oleh pengguna')
//             }
//         }
//     }

//     docker.image('node:16-buster-slim').inside('-p 3000:3000') {
//         stage('Deploy') {
//             sh 'npm start &'
//             echo 'Aplikasi berjalan selama 1 menit...'
//             sleep 60
//             echo 'Tahap Deploy selesai.'
//         }
//     }
// }

node {
    docker.image('node:16-buster-slim').inside('-p 3000:3000') {
        stage('Build') {
            sh 'npm install'
        }

        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }
    }

    stage('Manual Approval') {
        script {
            def userInput = input(
                message: 'Lanjutkan ke tahap Deploy?',
                parameters: [
                    choice(name: 'Approval', choices: ['Proceed', 'Abort'], description: 'Pilih Proceed untuk melanjutkan ke tahap Deploy atau Abort untuk menghentikan pipeline')
                ]
            )
            if (userInput == 'Abort') {
                error('Pipeline dihentikan oleh pengguna')
            }
        }
    }

    stage('Prepare Deploy') {
        script {
            // Buat direktori app-directory jika tidak ada
            sh '''
                mkdir -p $WORKSPACE/app-directory
                echo "Sample file for deployment" > $WORKSPACE/app-directory/index.html
            '''
        }
    }

    stage('Deploy to EC2') {
        script {
            withCredentials([sshUserPrivateKey(credentialsId: 'aws-ec2-key', keyFileVariable: 'AWS_KEY')]) {
                sh '''
                    #!/bin/bash

                    # IP EC2
                    EC2_IP="47.129.47.98"

                    # Buat direktori sementara untuk known_hosts
                    mkdir -p $WORKSPACE/ssh
                    chmod 700 $WORKSPACE/ssh

                    # Tambahkan host EC2 ke known_hosts
                    ssh-keyscan -H $EC2_IP > $WORKSPACE/ssh/known_hosts

                    # Salin aplikasi ke EC2
                    scp -o UserKnownHostsFile=$WORKSPACE/ssh/known_hosts -i $AWS_KEY -r $WORKSPACE/app-directory ubuntu@$EC2_IP:/home/ubuntu/app-directory/

                    # SSH ke EC2 untuk menjalankan deployment
                    ssh -o UserKnownHostsFile=$WORKSPACE/ssh/known_hosts -i $AWS_KEY ubuntu@$EC2_IP << EOF
                        cd /home/ubuntu/app-directory
                        docker build -t my-app .
                        docker stop my-app-container || true
                        docker rm my-app-container || true
                        docker run -d --name my-app-container -p 3000:3000 my-app
                    EOF
                '''
            }
            echo 'Aplikasi berjalan selama 1 menit di Docker pada EC2...'
            sleep 60
            echo 'Tahap Deploy selesai.'
        }
    }
}
