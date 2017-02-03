node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }

        stage 'input'
    def userPasswordInput = input message: 'Segli ambiente', parameters: [choice(choices: "DEV\nUAT\nPRO\n", description: 'Ambiente target', name: 'AMBIENTE')
    echo ("Password was: " + userPasswordInput)  

    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}
