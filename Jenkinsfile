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
    

    def versionRelease = "" ;
    def versionDevelop = "0.0.0-SNAPSHOT" ;
    stage('Read props') {
       def props = readProperties file: 'test.properties'
       def VERSION = props.version
       versionDevelop = VERSION.split('\\.')[0] + "."+VERSION.split('\\.')[1] + "."+ (VERSION.split('\\.')[2].toInteger()+1)+"-SNAPSHOT";
       versionRelease = VERSION.replace("-SNAPSHOT", "")
       //echo ("Versione sul file:" + VERSION + "--- " + versionDevelop);
    }


    def DEPLOY="", REL="", NEXT_REL=""
    stage('User input') {  
        deg userInput = input message: 'Seleziona i valori', 
                              parameters: [choice(choices: "NO\nUAT\n", description: 'Deploy', name: 'DEP'), 
                                           string(defaultValue: versionRelease, description: 'Release Version', name: 'VER'),
                                           string(defaultValue: versionDevelop, description: 'Development Version', name: 'DEV')]
        //echo("Ambiente Selezionato: "+ userInput['DEPLOY'] + " -- rel: " + userInput['VERSIONE']);
        
        DEPLOY = userInput['DEP'];
        REL = userInput['VER'];
        NEXT_REL = userInput['DEV'];
    }   
    
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Deploy: "+ DEPLOY + " - "+ VERSION + " - " + BRANCH_NAME + " -- " + NEXT_REL + " -- " + REL);
        sh "echo DEPLOY ${DEPLOY} - ${VERSION} - ${BRANCH_NAME} "
    }   
    
}
