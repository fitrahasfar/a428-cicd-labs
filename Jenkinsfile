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

node {
    stage('Checkout Code') {
        checkout scm
    }

    stage('Build Docker Image') {
        script {
            def imageName = "my-app-image"
            def tag = "latest"

            // Kirim kode sumber ke EC2 melalui SCP
            sh """
                echo "Mengirim kode sumber ke EC2..."
                scp -o StrictHostKeyChecking=no -r ./ ec2-user@<EC2_PUBLIC_IP>:/home/ec2-user/app/
            """

            // SSH ke EC2 untuk membangun Docker image
            sh """
                echo "Membangun Docker image di EC2..."
                ssh -o StrictHostKeyChecking=no ec2-user@<EC2_PUBLIC_IP> << EOF
                    cd /home/ec2-user/app
                    docker build -t ${imageName}:${tag} .
                EOF
            """
        }
    }

    stage('Run Docker Container') {
        script {
            def imageName = "my-app-image"
            def tag = "latest"

            // SSH ke EC2 untuk menghentikan container lama dan menjalankan yang baru
            sh """
                echo "Menjalankan Docker container di EC2..."
                ssh -o StrictHostKeyChecking=no ec2-user@<EC2_PUBLIC_IP> << EOF
                    # Hentikan dan hapus container lama jika ada
                    if [ \$(docker ps -a -q -f name=my-app-container) ]; then
                        docker rm -f my-app-container || true
                    fi

                    # Menjalankan container baru
                    docker run -d -p 3000:3000 --name my-app-container ${imageName}:${tag}
                EOF
            """
        }
    }

    stage('Debug Docker') {
        script {
            // SSH ke EC2 untuk melihat status container dan log
            sh """
                echo "Debugging container di EC2..."
                ssh -o StrictHostKeyChecking=no ec2-user@<EC2_PUBLIC_IP> << EOF
                    echo "Daftar container Docker:"
                    docker ps -a

                    echo "Log dari container my-app-container:"
                    docker logs my-app-container || echo "Tidak ada log atau container belum berjalan."
                EOF
            """
        }
    }
}
