node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
        junit 'reports/**/*.xml'
    }

    stage('Deploy') {
        sh 'echo Deploy'
    }
}
