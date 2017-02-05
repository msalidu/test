node {
    stage('checkout') {
       checkout scm
    }
    
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }
    
    stage('Read props') {
       def props = readProperties file: 'test.properties'
       def version = props.version
       echo ("Versione sul file:" + version);
    }

    stage('Deploy') {
        sh 'echo Deploy ${version} -'
    }
}
