node {

    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {

        sh 'echo test'
        def trig= currentBuild.rawBuild.getCauses()[0]
        //println(currentBuild.rawBuild.getCauses()[0].class.getName())
        println(trig.class.getName());
        userTriggered = trig instanceof hudson.model.Cause$UserIdCause
        indexTriggered = trig instanceof jenkins.branch.BranchIndexingCause
        
        println("Triggered short desc: "+ trig.getShortDescription() );
        println("is userTriggered:" +userTriggered +" - is indexTriggered:" +  indexTriggered)
        
        triggerInfo ''

    }

    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}


boolean userTriggered = false;
boolean indexTriggered = false;
// with @NonCPS workflow can be serialized
// It returns a simple string map so the workflow can be serialized
@NonCPS
def triggerInfo(){
    println ("from funzione triggerInfo") 
    def triggerObj = currentBuild.rawBuild.getCauses()[0];
}
