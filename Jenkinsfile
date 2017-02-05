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
    
    def VERSION = "";
    stage('Read props') {
       def props = readProperties file: 'test.properties'
       VERSION = props.version
       echo ("Versione sul file:" + VERSION);
    }
    
    def AMBIENTE = "";
    stage('input') {
        AMBIENTE =  input ( message: 'Segli ambiente', parameters: [choice(choices: "DEV\nUAT\nPRO\n", description: 'Ambiente target', name: 'AMBIENTE')] );    //echo ("AMBIENTE selezionato: " + AMBIENTE)  
        echo("Ambiente Selezionato: "+ AMBIENTE);
    }
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Deploy: "+ AMBIENTE + " - "+ VERSION + " - " + BRANCH_NAME);
        sh 'echo Deploy ${AMBIENTE} - ${VERSION} '
        bash "echo  ${AMBIENTE} - ${VERSION} - ${BRANCH_NAME}"
    }   
    
}
