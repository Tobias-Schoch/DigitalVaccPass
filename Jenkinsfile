pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:"
    }
    stages {
        stage ('Flutter Doctor') {
            steps {
                sh "flutter doctor -v"
            }
        }
        stage ('Run Flutter Tests') {
            steps {
                sh "flutter test"
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