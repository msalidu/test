node {
    //aggiorno il repo
    checkout scm
    
    // Variabili globali
    def props = readProperties file: 'test.properties'
    def VERSION = props.version
    def versionDevelop = VERSION.split('\\.')[0] + "."+VERSION.split('\\.')[1] + "."+ (VERSION.split('\\.')[2].toInteger()+1)+"-SNAPSHOT";
    def versionRelease = VERSION.replace("-SNAPSHOT", "")
   
    stage('Build') {
        sh 'echo build'
    }

    stage('Test if baranch feature') {
        when { branch "feature/*" }
        sh 'echo test'
    }
    
    def DEPLOY="", REL="", NEXT_REL=""
    stage('User input') {  
        timeout(5) {
            def userInput = input message: 'Seleziona i valori', 
                                  parameters: [choice(choices: "NO\nUAT\n", description: 'Deploy', name: 'DEP'), 
                                               string(defaultValue: versionRelease, description: 'Release Version', name: 'VER'),
                                               string(defaultValue: versionDevelop, description: 'Development Version', name: 'DEV')]        
            DEPLOY = userInput['DEP'];
            REL = userInput['VER'];
            NEXT_REL = userInput['DEV'];
        }
    }   
     
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Deploy: "+ DEPLOY + "- " + BRANCH_NAME + " -- " + NEXT_REL + " -- " + REL);
        

        sh "export DEPLOY=${DEPLOY};bash ./test.sh "

       
        //sh "echo DEPLOY ${DEPLOY} - ${REL} - ${BRANCH_NAME} "
    }   
    
}
