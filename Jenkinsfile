node {

    stage('Build') {
        sh 'echo build'
    }
        boolean userTriggered = false;
        boolean indexTriggered = false;
    stage('Test') {

        sh 'echo test'
        def trig= currentBuild.rawBuild.getCauses()[0]
        //println(currentBuild.rawBuild.getCauses()[0].class.getName())
        //println(trig.class.getName())
        userTriggered = trig instanceof hudson.model.Cause
        indexTriggered = trig instanceof jenkins.branch.BranchIndexingCause
        
        println("Triggered short desc: "+ trig].getShortDescription() );
        println("is userTriggered:" +userTriggered +" - is indexTriggered:" +  indexTriggered)

        	
    }

    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}

