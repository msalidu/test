node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }

stage('input') {
def AMBIENTE =  input ( message: 'Segli ambiente', parameters: [choice(choices: "DEV\nUAT\nPRO\n", description: 'Ambiente target', name: 'AMBIENTE')] );    //echo ("AMBIENTE selezionato: " + AMBIENTE)  
}
    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}
