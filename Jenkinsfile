node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }
    
    stage('Read props') {
       def props = readProperties file: 'test.properties'
    }

    stage('Deploy') {
        sh 'echo Deploy'
    }
}
