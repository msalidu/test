node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }
  //Not required, but sensible - this will automatically abort the build if you wait too long
  timeout(time: 1, unit: 'WEEK') {
    input "Approve/deny deployment to production system"
  }

    stage('Deploy') {
        sh 'echo Deploy'
    }
}
