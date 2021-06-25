pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:~/development/flutter/bin:"
    }
    stages {
        stage ('Flutter Doctor') {
            steps {
                sh "flutter doctor -v"
            }
        }
        stage('SonarQube Analysis') {
            steps {
                sh "flutter pub get"
                sh "flutter test --machine > tests.output"
                sh "flutter test --coverage"
                script {
                    def scannerHome = tool 'SonarScanner 4.0';
                    sh "${scannerHome}/bin/sonar-scanner -X"
                }
            }
        }
        stage('Cleanup') {
            steps {
                sh "flutter clean"
            }
        }
    }
}