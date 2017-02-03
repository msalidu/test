node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }
  //Not required, but sensible - this will automatically abort the build if you wait too long
  timeout(30) {
    input "Approve/deny deployment to production system"
  }

    stage('Deploy') {
        sh 'echo Deploy'
    }
}
