node {
    //aggiorno il repo
    checkout scm

    // Variabili globali
    def props = readProperties file: 'test.properties'
    def VERSION = props.version
    def versionDevelop = VERSION.split('\\.')[0] + "."+VERSION.split('\\.')[1] + "."+ (VERSION.split('\\.')[2].toInteger()+1)+"-SNAPSHOT";
    def versionRelease = VERSION.replace("-SNAPSHOT", "")
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

    stage('Jira Update ') {
        echo  "Jira release ${NEXT_REL} $NEXT_REL" 
        step([$class: 'hudson.plugins.jira.JiraReleaseVersionUpdaterBuilder', 
            jiraProjectKey: 'TJP', 
            jiraRelease: '0.0.0' ])    
    }

    // sendMail 'SUCCESS'
}

def sendMail(status) {
     echo "Send emali status: ${status}"
    //def subject = config.subject ? config.subject : "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} - ${currentBuild.result}!"
    //def content = '${JELLY_SCRIPT,template="html"}'
    //def content = '${SCRIPT,template="groovy-pipeline-text.template"}'
    
    def content = '${SCRIPT,template="groovy-pipeline.template"}'
    //def content = '${JELLY_SCRIPT,template="html-with-health-and-console"}'

    currentBuild.result = 'SUCCESS'
    emailext body: content, mimeType: 'text/html', 
             recipientProviders: [[$class: 'DevelopersRecipientProvider']], 
             subject: 'aa', to: 'massimo.salidu@openmindonline.it'
}
