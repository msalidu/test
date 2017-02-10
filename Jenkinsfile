//nome del branch da cui fare i rilasci
def RELEASE_BRANCH = "release"
    
node {
    def MYJOB_STATUS = "undef"
    try {
        //aggiorno il repo
        checkout scm
        //recupero info
        triggerInfo 'void'
        
        // Variabili globali
        def props = readProperties file: 'test.properties'
        def VERSION = props.version
        def versionRelease = VERSION.replace("-SNAPSHOT", "")
        def versionDevelop = versionRelease.split('\\.')[0] + "."+versionRelease.split('\\.')[1] + "."+ (versionRelease.split('\\.')[2].toInteger()+1)+"-SNAPSHOT";
        def  DEPLOY="", REL="", NEXT_REL=""
     
        //Imposto come variabili di env
        withCredentials([[$class: 'UsernamePasswordMultiBinding', 
                            credentialsId: '2365f259-442a-4253-9fb0-26dd5a2edb3d',
                            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']])  {
            env.AWS_S3_KEY = "${env.USERNAME}"
            env.AWS_S3_SECRET = "${env.PASSWORD}"
        }
        
        stage('Build') {
            echo  "Bulding.... ${BRANCH_NAME} -  ${env.USERNAME} " 
            sh '/tmp/printinput.sh $USERNAME $PASSWORD'
        } 
        
        if ( env.BRANCH_NAME.contains(RELEASE_BRANCH) && userTriggered ) { 
            stage('git checkout'){
                sh 'git checkout ${BRANCH_NAME}; git pull'
            }
            
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
            
            stage("Release") {
                echo  "YES ${BRANCH_NAME} ${NEXT_REL}"
                sh "echo Deploy ${DEPLOY} - NextREL ${NEXT_REL}"
                sh "echo version=${NEXT_REL} > version.properties"
            }
        } 
        MYJOB_STATUS ="SUCCESS"
    } catch (error) {
        MYJOB_STATUS ="FAIILLURE"
        throw error
    } finally {
        if ( env.BRANCH_NAME.contains(RELEASE_BRANCH) && userTriggered ) { 
             stage('git clean'){
                //sh 'git branch -d ${BRANCH_NAME}'
                checkout scm
            }
        }
        sendMail MYJOB_STATUS
    }
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
