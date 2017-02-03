pipeline {
    agent any

    stages {
        stage('Deploy') {
            when { currentBuild.result == 'SUCCESS' } // <1>
            steps {
                sh 'make publish'
            }
        }
    }
}
