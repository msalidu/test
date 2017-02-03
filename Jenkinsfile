node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }
  //Not required, but sensible - this will automatically abort the build if you wait too long
  timeout(30) {
    //input message: 'Segli ambiente', parameters: [choice(choices: ['UAT', 'PRO'], description: 'Ambiente target', name: 'AMBIENTE')]
    input message: 'Segli ambiente', parameters: [choice(choices: "DEV\nUAT\nPRO\n", description: 'Ambiente target', name: 'AMBIENTE')]
  }

    stage('Deploy') {
        echo("hello from Pipeline");
        sh 'echo Deploy ${AMBIENTE}'
    }
}
