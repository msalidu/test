node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
    }
/*    
    def userInput;
    stage('input') {
        userInput =  input ( message: 'Release and deploy', 
        					 parameters: [choice(choices: "DEV\nUAT\nPRO\n", description: 'Ambiente target', name: 'AMBIENTE')],
        								 [string(defaultValue: '1.0.0', description: 'Next versione', name: 'NEXT_REL')]
         );   
        echo("Ambiente Selezionato: "+ userInput['AMBIENTE'] + " -- rel: " + userInput['AMBIENTE']);
    }
*/
    stage('input2') {  
        input message: 'Seleziona i valori', parameters: [string(defaultValue: 'UAT', description: 'ambiente target', name: 'AMBIENTE'), string(defaultValue: '0.0.0', description: 'versione da rilasciare', name: 'VERSIONE')]
    } 
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}
