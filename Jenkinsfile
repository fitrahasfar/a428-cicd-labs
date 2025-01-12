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

node {
    stage('Checkout Code') {
        checkout scm
    }

    docker.image('node:16-buster-slim').inside('-p 3000:3000') {
        stage('Build') {
            sh 'ls'
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

    docker.image('node:16-buster-slim').inside('-p 3000:3000') {
        stage('Deploy') {
            sh 'npm start &'
            echo 'Aplikasi berjalan selama 1 menit...'
            sleep 60
            echo 'Tahap Deploy selesai.'
        }
    }

    stage('Build Docker Image') {
        script {
            def imageName = "my-app-image"
            def tag = "latest"

            sh """
                # Build Docker image
                docker build -t ${imageName}:${tag} .
            """
        }
    }

    stage('Run Docker Container') {
        script {
            def imageName = "my-app-image"
            def tag = "latest"

            sh """
                # Run Docker container
                docker run -d -p 3000:3000 --name my-app-container ${imageName}:${tag}
            """
            echo 'Docker container berhasil dijalankan.'
        }
    }

    stage('Debug Docker') {
        steps {
            sh 'docker ps -a'
            sh 'docker logs my-app-container'
        }
    }

}
