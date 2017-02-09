node {
    //aggiorno il repo
    checkout scm
    //recupero info
    triggerInfo 'void'
    
    // Variabili globali
    def props = readProperties file: 'test.properties'
    def VERSION = props.version
    def versionRelease = VERSION.replace("-SNAPSHOT", "")
    def versionDevelop = versionRelease.split('\\.')[0] + "."+versionRelease.split('\\.')[1] + "."+ (versionRelease.split('\\.')[2].toInteger()+1)+"-SNAPSHOT";
    def DEPLOY="", REL="", NEXT_REL=""
 
     withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '2365f259-442a-4253-9fb0-26dd5a2edb3d',
                            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                //available as an env variable, but will be masked if you try to print it out any which way
                sh '/tmp/printinput.sh $USERNAME $PASSWORD'
                echo "user ${env.USERNAME}"
            }
    stage('Build') {
        echo  "Bulding.... ${BRANCH_NAME} -  ${env.USERNAME} " 
        sh "git status"
       
    } 
    
    if ( env.BRANCH_NAME.contains("release") ) { 
        sh 'git checkout $BRANCH_NAME'
        sh 'git diff --stat $BRANCH_NAME'
        
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
    sendMail 'SUCCESS'

   /*
     
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Deploy: "+ DEPLOY + "- " + BRANCH_NAME + " -- " + NEXT_REL + " -- " + REL);

        sh "export DEPLOY=${DEPLOY};bash ./test.sh "
    }   
*/


}

//Funzione send mail
def sendMail(status) {
    echo "Send emali status: ${status}"    
    content = '${SCRIPT,template="groovy-pipeline.template"}'
    currentBuild.result = status
    
    emailext body: content, mimeType: 'text/html', 
             recipientProviders: [[$class: 'DevelopersRecipientProvider']], 
             subject: "${env.JOB_NAME} - Build #${env.BUILD_NUMBER}", to: 'massimo.salidu@openmindonline.it'
}

// Funzione per reperire informazioni sull'evento di partenza
boolean userTriggered = false;
boolean indexTriggered = false;
@NonCPS
def triggerInfo(info){
    def triggerObj = currentBuild.rawBuild.getCauses()[0];
    userTriggered = triggerObj instanceof hudson.model.Cause$UserIdCause
    indexTriggered = triggerObj instanceof jenkins.branch.BranchIndexingCause
    println( "[" + triggerObj + "]: " + "Triggered short desc: "+ triggerObj.getShortDescription() );
}
