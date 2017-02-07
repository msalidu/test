node {
    //aggiorno il repo
    checkout scm
    
    // Variabili globali
    def props = readProperties file: 'test.properties'
    def VERSION = props.version
    def versionDevelop = VERSION.split('\\.')[0] + "."+VERSION.split('\\.')[1] + "."+ (VERSION.split('\\.')[2].toInteger()+1)+"-SNAPSHOT";
    def versionRelease = VERSION.replace("-SNAPSHOT", "")
    def DEPLOY="", REL="", NEXT_REL=""
 
    stage('Build') {
        // Get all Causes for the current build
        def causes = currentBuild.rawBuild.getCauses()
        // Get a specific Cause type (in this case the user who kicked off the build),
        // if present.
        def specificCause = currentBuild.rawBuild.getCause(hudson.model.Cause$UserIdCause)

        echo("Bulding.... "+ causes + " - "+specificCause);
    } 
    
    if ( env.BRANCH_NAME.contains("release") ) {    
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
        stage('Build on feat* ') {
            echo  "YES ${BRANCH_NAME} ${env.BRANCH_NAME}" 
            
         }
    } 
    
    //when { branch "feature/*" }
    /*
    withEnv(['BRANCH_NAME=feat2']) 
    {
        stage('zzz stage if') {
            sh 'printenv'
        }
    }
*/

   /*
     
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Deploy: "+ DEPLOY + "- " + BRANCH_NAME + " -- " + NEXT_REL + " -- " + REL);

        sh "export DEPLOY=${DEPLOY};bash ./test.sh "
    }   
*/
    
}
