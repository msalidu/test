node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }

        stage 'input'
    def userPasswordInput = input(
        id: 'userPasswordInput', message: 'your password', parameters: [
            [$class: 'TextParameterDefinition', defaultValue='mb', description: 'vbn', name: 'password']
        ]
    )
    echo ("Password was: " + userPasswordInput)  

    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}
