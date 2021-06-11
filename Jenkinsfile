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
        stage('Update Screenshots in Git') {
                    steps {
                        sh '''
                            if [ 'git diff-index --quiet HEAD' ]
                            then
                                exit 0
                            else
                                git config user.email 'jenkins@f776e35e-dd5a-47aa-8cb8-5826c98b5ed0.ma.bw-cloud-instance.org'
                                git config user.name 'jenkins'
                                git add -A
                                git stash push
                                git checkout -B master origin/master
                                git stash pop
                                git reset --soft
                                git add test/*
                                git commit -m 'Added Golden Screenshots from Build ${BUILD_NUMBER}'
                                git push https://gitlab.in.htwg-konstanz.de/lehre/rschimka/mobile/g-mobile-sose21/04-mobile-sose21.git master:screenshots-build-${BUILD_NUMBER}"

                            fi
                        '''
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