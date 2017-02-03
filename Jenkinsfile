pipeline {
    agent any // <1>
    stages {
        stage('Build') { // <2>
            steps { // <3>
                sh 'echo build' // <4>
            }
        }
        stage('Test'){
            steps {
                sh 'echo test'
               
            }
        }
        stage('Deploy') {
            input 'Do you approve deployment?'
            steps {
                sh 'echo Deploy'
            }
        }
    }
}
