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
    def verNexDev = "0.0.0" ;
    stage('Read props') {
       def props = readProperties file: 'test.properties'
       VERSION = props.version
       def relVer = String(VERSION).split( '.' )
       //def (ZZ, XX, YY) = VERSION.tokenize( '.' );
       //verNexDev = ZZ+"."+XX+"."+(YY.toInteger()+1)+"-SNAPSHOT"
       echo ("Versione sul file:" + VERSION);
    }
   /*
    def AMBIENTE = "";
    def NEXT_REL = "";
    stage('input') {
        AMBIENTE =  input ( message: 'Segli ambiente', parameters: [choice(choices: "DEV\nUAT\nPRO\n", description: 'Ambiente target', name: 'AMBIENTE')] );    //echo ("AMBIENTE selezionato: " + AMBIENTE)  
        NEXT_REL =  input ( message: 'Next rel', parameters: [string(defaultValue: verNexDev, description: 'Next versione', name: 'NEXT_REL')] ); 
        echo("Ambiente Selezionato: "+ AMBIENTE);
    }
    */
    
    def userInput;
    stage('User input') {  
        userInput = input message: 'Seleziona i valori', 
                          parameters: [choice(choices: "DEV\nUAT\nPRO\n", description: 'Ambiente target', name: 'AMBIENTE'), 
                                       string(defaultValue: verNexDev, description: 'versione da rilasciare', name: 'VERSIONE')]
        //echo("Ambiente Selezionato: "+ userInput['AMBIENTE'] + " -- rel: " + userInput['VERSIONE']);
        
        AMBIENTE = userInput['AMBIENTE'];
        NEXT_REL = userInput['VERSIONE'];
    }   
    
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Deploy: "+ AMBIENTE + " - "+ VERSION + " - " + BRANCH_NAME + " -- " + NEXT_REL);
        sh "echo DEPLOY ${AMBIENTE} - ${VERSION} - ${BRANCH_NAME} "
    }   
    
}
