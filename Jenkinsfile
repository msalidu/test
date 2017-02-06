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
       verNexDev = VERSION.split('\\.')[0] + "."+VERSION.split('\\.')[1] + "."+ (VERSION.split('\\.')[2].toInteger()+1);
       //echo ("Versione sul file:" + VERSION + "--- " + verNexDev);
    }

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
