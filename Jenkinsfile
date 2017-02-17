node {
    stage('Build') {
        sh 'echo build'
        GIT_COMMIT_EMAIL = sh (
            script: 'git --no-pager show -s --format=\'%ae\'',
            returnStdout: true
        ).trim()
        echo "Git committer email: ${GIT_COMMIT_EMAIL}"
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
   /* 
    def userInput;
    def  DEPLOY="", REL="", NEXT_REL=""

    stage('input2') {  
        userInput = input message: 'Seleziona i valori', parameters: [string(defaultValue: 'UAT', description: 'ambiente target', name: 'AMBIENTE'), string(defaultValue: '0.0.0', description: 'versione da rilasciare', name: 'VERSIONE')]
        DEPLOY = userInput['AMBIENTE']
        NEXT_REL = userInput['VERSIONE']
        echo("Ambiente Selezionato: "+ userInput['AMBIENTE'] + " -- rel: " + userInput['VERSIONE']);
    } 
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Ambiente Selezionato per deploy: "+ DEPLOY + " -- rel: " +  NEXT_REL);
        sh "echo Deploy $DEPLOY"
        def testVar='foo'
        sh "echo $testVar"
    }
*/
}
