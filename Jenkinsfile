pipeline {
   agent { label 'java-docker-slave' }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Checkout') {
            steps {
              script {
                    // The below will clone your repo and will be checked out to master branch by default.
                    git credentialsId: 'si764662', url: 'https://github.com/si764662/sringjava.git'
                    // Do a ls -lart to view all the files are cloned. It will be clonned. This is just for you to be sure about it.
                    sh "ls -lart ./*" 
                    // List all branches in your repo. 
                    sh "git branch -a"
                    // Checkout to a specific branch in your repo.
                    sh "git checkout master"
                }
            }
        }    
        stage('Build') {
            steps {
                sh './gradlew clean build'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('deploy') {
            steps {
                sh 'scp -o StrictHostKeyChecking=no app/build/libs/*.jar ec2-user@18.222.218.252:/home/ec2-user'
                sh 'ssh -o StrictHostKeyChecking=no ec2-user@18.118.82.255 "java -cp /home/ec2-user/app.jar sringjava.App" '
            }
        }
    }
    post {
        success {
            mail bcc: '', body: 'your jenkins build jo success', cc: '', from: 'siva09999@gmail.com', replyTo: '', subject: 'Build Success', to: 'siva09999@gmail.com'
        }
    }
}
