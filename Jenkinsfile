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
    def verNexDev = "" ;
    stage('Read props') {
       def props = readProperties file: 'test.properties'
       VERSION = props.version
       def (ZZ, XX, YY) = VERSION.tokenize( '.' );
       verNexDev = ZZ+"."+XX+"."+(YY.toInteger()+1)+"-SNAPSHOT"
       echo ("Versione sul file:" + VERSION);
    }
    
    def AMBIENTE = "";
    def NEXT_REL = "";
    stage('input') {
        AMBIENTE =  input ( message: 'Segli ambiente', parameters: [choice(choices: "DEV\nUAT\nPRO\n", description: 'Ambiente target', name: 'AMBIENTE')] );    //echo ("AMBIENTE selezionato: " + AMBIENTE)  
        NEXT_REL =  input ( message: 'Next rel', parameters: [string(defaultValue: verNexDev, description: 'Next versione', name: 'NEXT_REL')] ); 
        echo("Ambiente Selezionato: "+ AMBIENTE);
    }
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Deploy: "+ AMBIENTE + " - "+ VERSION + " - " + BRANCH_NAME + " -- " + NEXT_REL);
        sh "echo DEPLOY ${AMBIENTE} - ${VERSION} - ${BRANCH_NAME}"
    }   
    
}
