node {
    triggerInfo 'void'
    
    stage('Build') {
        sh 'echo build'
    }

    stage('JIRA') {
        def version = jiraGetVersion id: '1.0.1', site: "jira", failOnError: false
        echo version.data.toString()
    }
    
    stage('Test') {
        sh 'echo test'  
        println("is userTriggered:" +userTriggered +" - is indexTriggered:" +  indexTriggered) 
    }

    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}


// Funzione per reperire informazioni sull'evento di partenza
boolean userTriggered = false;
boolean indexTriggered = false;
@NonCPS
def triggerInfo(info){
    def triggerObj = currentBuild.rawBuild.getCauses()[0];
    userTriggered = triggerObj instanceof hudson.model.Cause$UserIdCause
    indexTriggered = triggerObj instanceof jenkins.branch.BranchIndexingCause
    println("[" + triggerObj + "]Triggered by: "+ triggerObj.getShortDescription() );
}
