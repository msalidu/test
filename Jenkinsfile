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
        userInput = input(
            id: 'userInput', message: 'Let\'s promote?', parameters: [
            [$class: 'TextParameterDefinition', defaultValue: 'uat', description: 'Environment', name: 'env']
        ]);
        
        stage('Deploy') {
            echo ("Env: "+userInput);
            steps {
                sh 'echo Deploy'
            }
        }
    }
}
