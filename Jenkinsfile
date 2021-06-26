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
        stage ('Run Flutter Tests') {
            steps {
                sh "flutter test --update-goldens"
                sh "flutter test"
            }
        }

        stage('Update GIT') {
            steps {
                sh "git config user.email 'lu851not@htwg-konstanz.de'"
                sh "git config user.name 'lu851not'"
                sh "git add -A"
                sh "git stash push"
                sh "git checkout -B master origin/master"
                sh "git stash pop"
                sh "git reset --soft"
                sh "git add test/"
                sh "git diff-index --quiet HEAD || (git commit -m 'Added Golden Screenshots from Build 1.0' \
                && git push https://gitlab-ci-token:2LDK9QYHeQYzT57zGD-9@gitlab.in.htwg-konstanz.de/lehre/rschimka/mobile/g-mobile-sose21/04-mobile-sose21.git master:screenshots-build-1.0)"
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