
//nome del branch da cui fare i rilasci
def RELEASE_BRANCH = "release"
def JIRA_PROJECT = "TJP"
    
node {
    def MYJOB_STATUS = "undef"
    try {
        //aggiorno il repo
        checkout scm
        //recupero info
        triggerInfo 'void'
             
        //Imposto come variabili di env
        withCredentials([[$class: 'UsernamePasswordMultiBinding', 
                            credentialsId: '2365f259-442a-4253-9fb0-26dd5a2edb3d',
                            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']])  {
            env.AWS_S3_KEY = "${env.USERNAME}"
            env.AWS_S3_SECRET = "${env.PASSWORD}"
        }
        
        stage('Build') {
            echo  "Bulding.... ${BRANCH_NAME} -  ${env.USERNAME} " 
            //sh '/tmp/printinput.sh $USERNAME $PASSWORD'
            sh 'ls -la'
            sh 'bash ./build.sh 0'
        } 
        
        if ( env.BRANCH_NAME.contains(RELEASE_BRANCH) && userTriggered ) { 
            stage('git checkout'){
                sh 'git checkout ${BRANCH_NAME}; git pull'
            }
            def GIT_LASTREL_TAG = sh (
                script: 'git --no-pager tag -l 0.* 1.* --sort  version:refname | tail -n1',
                returnStdout: true
            ).trim()
            
            def props = readProperties file: 'test.properties'
            def VERSION = props.version
            def versionRelease = VERSION.replace("-SNAPSHOT", "")
            def versionPrevius = versionRelease.split('\\.')[0] + "."+versionRelease.split('\\.')[1] + "."+ (versionRelease.split('\\.')[2].toInteger()-1);
            def versionDevelop = versionRelease.split('\\.')[0] + "."+versionRelease.split('\\.')[1] + "."+ (versionRelease.split('\\.')[2].toInteger()+1)+"-SNAPSHOT";
            def  DEPLOY="", REL="", NEXT_REL="", PREVIOUS_REL =""

            stage('User input') { 
                echo "Git last tag: ${GIT_LASTREL_TAG} - properties last rel: ${versionRelease}" 
                timeout(5) {
                    def userInput = input message: 'Seleziona i valori', 
                                      parameters: [choice(choices: "NO\nUAT\n", description: 'Deploy', name: 'DEP'), 
                                                   string(defaultValue: versionRelease, description: 'Release Version', name: 'VER'),
                                                   string(defaultValue: versionDevelop, description: 'Development Version', name: 'DEV') 
                                                  ]        
                    
                    //string(defaultValue: versionPrevius, description: 'Previus Version (per generazione changelog)', name: 'PREV')
                    DEPLOY = userInput['DEP'];
                    REL = userInput['VER'];
                    NEXT_REL = userInput['DEV'];
                    PREVIOUS_REL = userInput['PREV'];
                }
            }
            
            stage("Release") {
                //echo  "YES ${BRANCH_NAME} ${NEXT_REL}"
                sh "echo version=${NEXT_REL} > test.properties"
                sh "git commit test.properties -m 'Release ${NEXT_REL}'"
                sh "git push"
            }
            
            stage ("Update Jira"){
                def NEW_REL = NEXT_REL.replace("-SNAPSHOT", "")
                sh "/usr/bin/ruby /data/jenkins-home/scripts/jira-client.rb -a close -n $JIRA_PROJECT -r $REL"
                sh "/usr/bin/ruby /data/jenkins-home/scripts/jira-client.rb -a create -n $JIRA_PROJECT -r $NEW_REL"
                //sh "echo rele:  $JIRA_PROJECT pre $PREVIOUS_REL - new $NEW_REL"
            }
        } 
        MYJOB_STATUS ="SUCCESS"
    } catch (error) {
       sendMail 'FAILURE'
       throw error
    } finally {
        if ( env.BRANCH_NAME.contains(RELEASE_BRANCH) && userTriggered ) { 
             stage('git clean'){
                checkout scm
                sh 'git branch -d ${BRANCH_NAME}'
            }
            sendMail MYJOB_STATUS
        }
        
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
