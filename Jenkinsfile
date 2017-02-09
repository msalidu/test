node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
        /*
        def cBuild = currentBuild;
         println(cBuild);
         println(cBuild.getProjectName());
         println(cBuild.getRawBuild());
        */
        def causesObj = currentBuild.rawBuild.getCauses();
        boolean userTriggered = false;
        boolean indexTriggered = false;
        if(causesObj != null){
            firstCauses =  causesObj[0];
            userTriggered = firstCauses instanceof hudson.model.Cause
            indexTriggered = firstCauses instanceof jenkins.branch.BranchIndexingCause      
        }
        println( causesObj );
        println("Triggered short desc: "+ causesObj[0].getShortDescription() );
        println("is userTriggered:" +userTriggered +" - is indexTriggered:" +  indexTriggered)
        	
    }

    
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}
