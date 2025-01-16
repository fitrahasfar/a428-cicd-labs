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

// declarative pipeline
// pipeline {
//     agent any
//     environment {
//         IMAGE_NAME = 'react-app'
//         TAG = '1.1.0'
//     }
//     stages {
//         stage('Build') {
//             agent {
//                 docker {
//                     image 'node:18-alpine' // Menggunakan image Node.js
//                     args '-p 3000:3000'
//                 }
//             }
//             steps {
//                 sh 'ls'
//                 sh 'npm install'
//             }
//         }
//         stage('Test') {
//             agent {
//                 docker {
//                     image 'node:18-alpine' // Menggunakan image Node.js
//                     args '-p 3000:3000'
//                 }
//             }
//             steps {
//                 sh './jenkins/scripts/test.sh'
//             }
//         }
//         stage('Manual Approval') {
//             steps {
//                 script {
//                     def userInput = input(
//                         message: 'Lanjutkan ke tahap Deploy?',
//                         parameters: [
//                             choice(name: 'Approval', choices: ['Proceed', 'Abort'], description: 'Pilih Proceed untuk melanjutkan atau Abort untuk menghentikan pipeline')
//                         ]
//                     )
//                     if (userInput == 'Abort') {
//                         error('Pipeline dihentikan oleh pengguna')
//                     }
//                 }
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 script {
//                     sh "docker build -t ${env.IMAGE_NAME}:${env.TAG} ."
//                     sh '''
//                     if [ $(docker ps -q -f name=react-app) ]; then
//                         docker stop react-app
//                         docker rm react-app
//                     fi
//                     '''
//                     sh "docker run -d -p 3000:3000 --name react-app ${env.IMAGE_NAME}:${env.TAG}"
//                 }
//             }
//         }
//     }
// }

// Scripted Pipeline
node {
    environment {
        IMAGE_NAME = 'react-app'
        TAG = '1.1.0'
    }

    stage('Build') {
        docker.image('node:18-alpine').inside('-p 3000:3000') {
            sh 'ls'
            sh 'npm install'
        }
    }

    stage('Test') {
        docker.image('node:18-alpine').inside('-p 3000:3000') {
            sh './jenkins/scripts/test.sh'
        }
    }

    stage('Manual Approval') {
        script {
            def userInput = input(
                message: 'Lanjutkan ke tahap Deploy?',
                parameters: [
                    choice(name: 'Approval', choices: ['Proceed', 'Abort'], description: 'Pilih Proceed untuk melanjutkan atau Abort untuk menghentikan pipeline')
                ]
            )
            if (userInput == 'Abort') {
                error('Pipeline dihentikan oleh pengguna')
            }
        }
    }

    stage('Deploy') {
        script {
            sh "docker build -t ${env.IMAGE_NAME}:${env.TAG} ."
            sh '''
            if [ $(docker ps -q -f name=react-app) ]; then
                docker stop react-app
                docker rm react-app
            fi
            '''
            sh "docker run -d -p 3000:3000 --name react-app ${env.IMAGE_NAME}:${env.TAG}"
        }
    }
}
