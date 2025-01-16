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
//     stage('Checkout Code') {
//         checkout scm
//     }
//     docker.image('node:16-buster-slim').inside('-p 3000:3000') {
//         stage('Build') {
//             sh 'ls'
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

// node {
//     stage('Checkout Code') {
//         checkout scm
//     }

//     docker.image('node:16-buster-slim').inside('-p 3000:3000') {
//         stage('Build') {
//             sh 'ls'
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

//     stage('Build Docker Image') {
//         script {
//             def imageName = "my-app-image"
//             def tag = "latest"

//             sh """
//                 # Build Docker image
//                 docker build -t ${imageName}:${tag} .
//             """
//         }
//     }

//     stage('Run Docker Container') {
//         script {
//             def imageName = "my-app-image"
//             def tag = "latest"

//             sh """
//                 # Run Docker container
//                 docker run -d -p 3000:3000 --name my-app-container ${imageName}:${tag}
//             """
//             echo 'Docker container berhasil dijalankan.'
//         }
//     }

//     stage('Debug Docker') {
//         steps {
//             sh 'docker ps -a'
//             sh 'docker logs my-app-container'
//         }
//     }

// }

// node {
//     stage('Checkout Code') {
//         checkout scm
//     }

//     docker.image('node:16-buster-slim').inside('-p 3000:3000') {
//         stage('Build') {
//             sh 'ls'
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
//             // Mematikan proses yang menggunakan port 3000 sebelum memulai deploy
//             sh """
//                 if lsof -i:3000; then
//                     echo "Port 3000 sedang digunakan. Menghentikan proses..."
//                     fuser -k 3000/tcp || true
//                 fi
//             """
//             // Menjalankan aplikasi
//             sh 'npm start &'
//             echo 'Aplikasi berjalan selama 1 menit...'
//             sleep 60
//             echo 'Tahap Deploy selesai.'
//         }
//     }

//     stage('Build Docker Image') {
//         script {
//             def imageName = "my-app-image"
//             def tag = "latest"

//             sh """
//                 echo "Membangun Docker image..."
//                 docker build -t ${imageName}:${tag} .
//             """
//         }
//     }

//     stage('Run Docker Container') {
//         script {
//             def imageName = "my-app-image"
//             def tag = "latest"

//             // Hapus container lama jika ada
//             sh """
//                 if [ \$(docker ps -a -q -f name=my-app-container) ]; then
//                     echo "Menghapus container lama..."
//                     docker rm -f my-app-container || true
//                 fi

//                 # Menjalankan container baru
//                 echo "Menjalankan Docker container..."
//                 docker run -d -p 3000:3000 --name my-app-container ${imageName}:${tag}
//             """
//         }
//     }

//     stage('Debug Docker') {
//         script {
//             // Debugging untuk melihat log dan status container
//             sh """
//                 echo "Daftar container Docker:"
//                 docker ps -a

//                 echo "Log dari container my-app-container:"
//                 docker logs my-app-container || echo "Tidak ada log atau container belum berjalan."
//             """
//         }
//     }
// }

// node {
//     stage('Checkout Code') {
//         checkout scm
//     }

//     stage('Build Docker Image') {
//         script {
//             def imageName = "my-app-image"
//             def tag = "latest"

//             // Kirim kode sumber ke EC2 melalui SCP
//             sh """
//                 echo "Mengirim kode sumber ke EC2..."
//                 scp -o StrictHostKeyChecking=no -r ./ ec2-user@<EC2_PUBLIC_IP>:/home/ec2-user/app/
//             """

//             // SSH ke EC2 untuk membangun Docker image
//             sh """
//                 echo "Membangun Docker image di EC2..."
//                 ssh -o StrictHostKeyChecking=no ec2-user@<EC2_PUBLIC_IP> << EOF
//                     cd /home/ec2-user/app
//                     docker build -t ${imageName}:${tag} .
//                 EOF
//             """
//         }
//     }

//     stage('Run Docker Container') {
//         script {
//             def imageName = "my-app-image"
//             def tag = "latest"

//             // SSH ke EC2 untuk menghentikan container lama dan menjalankan yang baru
//             sh """
//                 echo "Menjalankan Docker container di EC2..."
//                 ssh -o StrictHostKeyChecking=no ec2-user@<EC2_PUBLIC_IP> << EOF
//                     # Hentikan dan hapus container lama jika ada
//                     if [ \$(docker ps -a -q -f name=my-app-container) ]; then
//                         docker rm -f my-app-container || true
//                     fi

//                     # Menjalankan container baru
//                     docker run -d -p 3000:3000 --name my-app-container ${imageName}:${tag}
//                 EOF
//             """
//         }
//     }

//     stage('Debug Docker') {
//         script {
//             // SSH ke EC2 untuk melihat status container dan log
//             sh """
//                 echo "Debugging container di EC2..."
//                 ssh -o StrictHostKeyChecking=no ec2-user@<EC2_PUBLIC_IP> << EOF
//                     echo "Daftar container Docker:"
//                     docker ps -a

//                     echo "Log dari container my-app-container:"
//                     docker logs my-app-container || echo "Tidak ada log atau container belum berjalan."
//                 EOF
//             """
//         }
//     }
// }

// berhasil hapus container
// node {
//     stage('Checkout Code') {
//         checkout scm
//     }

//     docker.image('node:16-buster-slim').inside('-p 3000:3000') {
//         stage('Build') {
//             sh 'ls'
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
//             // Build container
//             sh "docker build -t ${IMAGE_NAME}:${TAG} ."

//             // Menghapus container sebelumnya
//             sh """
//                 if [ \$(docker ps -q -f name=react-app) ]; then
//                 docker stop dreamacademy
//                 docker rm dreamacademy
//                 fi
//                 """
//                 // Jalankan container
//                 sh "docker run -d -p 3000:3000 --name react-app ${IMAGE_NAME}:${TAG}"
//             // Menjalankan aplikasi
//             echo 'Aplikasi berjalan selama 1 menit...'
//             sleep 60
//             echo 'Tahap Deploy selesai.'
//         }
//     }

//     // stage('Build Docker Image') {
//     //     script {
//     //         def imageName = "my-app-image"
//     //         def tag = "latest"

//     //         sh """
//     //             echo "Membangun Docker image..."
//     //             docker build -t ${imageName}:${tag} .
//     //         """
//     //     }
//     // }

//     // stage('Run Docker Container') {
//     //     script {
//     //         def imageName = "my-app-image"
//     //         def tag = "latest"

//     //         // Hapus container lama jika ada
//     //         sh """
//     //             if [ \$(docker ps -a -q -f name=my-app-container) ]; then
//     //                 echo "Menghapus container lama..."
//     //                 docker rm -f my-app-container || true
//     //             fi

//     //             # Menjalankan container baru
//     //             echo "Menjalankan Docker container..."
//     //             docker run -d -p 3000:3000 --name my-app-container ${imageName}:${tag}
//     //         """
//     //     }
//     // }

//     // stage('Debug Docker') {
//     //     script {
//     //         // Debugging untuk melihat log dan status container
//     //         sh """
//     //             echo "Daftar container Docker:"
//     //             docker ps -a

//     //             echo "Log dari container my-app-container:"
//     //             docker logs my-app-container || echo "Tidak ada log atau container belum berjalan."
//     //         """
//     //     }
//     // }
// }

// node {
//     // stage('Clean Up Docker') {
//     //     script {
//     //         // Membersihkan container dan image Docker sebelum melanjutkan pipeline
//     //         sh """
//     //             echo "Membersihkan container dan image Docker di host..."

//     //             # Hentikan semua container yang sedang berjalan
//     //             if [ \$(docker ps -q | wc -l) -gt 0 ]; then
//     //                 echo "Menghentikan semua container yang sedang berjalan..."
//     //                 docker ps -q | xargs -r docker stop || true
//     //             fi

//     //             # Hapus semua container
//     //             if [ \$(docker ps -a -q | wc -l) -gt 0 ]; then
//     //                 echo "Menghapus semua container..."
//     //                 docker ps -a -q | xargs -r docker rm || true
//     //             fi

//     //             # Hapus semua image Docker
//     //             if [ \$(docker images -q | wc -l) -gt 0 ]; then
//     //                 echo "Menghapus semua image Docker..."
//     //                 docker images -q | xargs -r docker rmi -f || true
//     //             fi
//     //         """
//     //     }

//     //     input message: 'Proses clean-up selesai. Lanjutkan ke tahap Checkout Code?'
//     // }

//     stage('Checkout Code') {
//         checkout scm
//     }

//     docker.image('node:16-buster-slim').inside('-p 3000:3000') {
//         stage('Build') {
//             sh 'ls'
//             sh 'npm install'
//             sh 'npm run build' // Pastikan build menghasilkan file untuk aplikasi
//         }

//         stage('Test') {
//             sh './jenkins/scripts/test.sh'
//         }
//     }

//     stage('Prepare Docker Image') {
//         script {
//             def imageName = "my-app-image"
//             def tag = "latest"

//             // Build Docker image di Jenkins
//             sh """
//                 echo "Membangun Docker image..."
//                 docker build -t ${imageName}:${tag} .
//             """

//             // Save Docker image ke file
//             sh """
//                 echo "Menyimpan Docker image ke file..."
//                 docker save ${imageName}:${tag} > my-app-image.tar
//             """

//             // Kirim file image ke server remote
//             def vmUser = "ubuntu"
//             def vmHost = "52.221.196.161"
//             def deployDir = "/home/ubuntu/deploy"
//             def sshCredentialId = "vmRemote"

//             sshagent([sshCredentialId]) {
//                 sh """
//                     echo "Mengirim Docker image ke server remote..."
//                     scp -o StrictHostKeyChecking=no my-app-image.tar ${vmUser}@${vmHost}:${deployDir}/
//                 """

//                 // Load Docker image di server remote
//                 sh """
//                     echo "Meload Docker image di server remote..."
//                     ssh -o StrictHostKeyChecking=no ${vmUser}@${vmHost} "bash -c '
//                         cd ${deployDir}
//                         docker load < my-app-image.tar
//                     '
//                     "
//                 """
//             }
//         }
//     }

//     stage('Deploy to VM') {
//         script {
//             def vmUser = "ubuntu"
//             def vmHost = "52.221.196.161"
//             def deployDir = "/home/ubuntu/deploy"
//             def sshCredentialId = "vmRemote"

//             sshagent([sshCredentialId]) {
//                 // Jalankan aplikasi di server remote menggunakan Docker
//                 sh """
//                     echo "Menjalankan aplikasi di server menggunakan Docker..."
//                     ssh -o StrictHostKeyChecking=no ${vmUser}@${vmHost} "bash -c '
//                         if docker ps -q --filter name=my-app-container; then
//                             echo \"Container sudah berjalan. Menghentikan container lama...\"
//                             docker stop my-app-container && docker rm my-app-container
//                         fi
//                         echo \"Menjalankan container baru...\"
//                         docker run -d --name my-app-container -p 3000:3000 my-app-image:latest
//                     '
//                     "
//                 """
//             }
//         }
//     }

//     stage('Debug Docker') {
//         script {
//             def vmUser = "ubuntu"
//             def vmHost = "52.221.207.76"
//             def sshCredentialId = "remoteVm"

//             sshagent([sshCredentialId]) {
//                 // Debugging untuk melihat log dan status container di server remote
//                 sh """
//                     echo "Melihat status container di server remote..."
//                     ssh -o StrictHostKeyChecking=no ${vmUser}@${vmHost} "bash -c '
//                         docker ps -a
//                         echo \"Log dari container my-app-container...\"
//                         docker logs my-app-container || echo \"Tidak ada log atau container belum berjalan.\"
//                     '
//                     "
//                 """
//             }
//         }
//     }
// }

pipeline {
    agent any
    environment {
        IMAGE_NAME = 'react-app'
        TAG = "${env.GIT_COMMIT}" // Menggunakan commit hash sebagai tag
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            agent {
                docker {
                    image 'node:16-buster-slim'
                    args '-p 3000:3000'
                }
            }
            steps {
                sh 'ls'
                sh 'npm install'
            }
        }
        stage('Test') {
            // agent {
            //     docker {
            //         image 'node:16-buster-slim'
            //         args '-p 3000:3000'
            //     }
            // }
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image 'node:16-buster-slim'
                    args '-p 3000:3000'
                }
            }
            steps {
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
                sh "docker build -t ${IMAGE_NAME}:${TAG} ."

                // Menghapus container sebelumnya jika ada
                sh """
                    if [ \$(docker ps -q -f name=react-app) ]; then
                        docker stop react-app
                        docker rm react-app
                    fi
                """

                // Jalankan container baru
                sh "docker run -d -p 3000:3000 --name react-app ${IMAGE_NAME}:${TAG}"

                // Menjalankan aplikasi
                echo 'Aplikasi berjalan selama 1 menit...'
                sleep 60
                echo 'Tahap Deploy selesai.'
            }
        }
    }
}
