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
        def causesObj= currentBuild.rawBuild.getCauses();
        println( causesObj );
        println("Oggetto: "+ causesObj[0].getShortDescription() );
        	
        
    }

    
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}
