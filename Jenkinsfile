node {
    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
        sh 'echo test'
        def cBuild = currentBuild;
         println(cBuild);
         println(cBuild.getProjectName());
         println(cBuild.getRawBuild());
          println( currentBuild.rawBuild.getCauses() );
        println ( currentBuild.rawBuild.getCause(hudson.model.Cause$UserIdCause) );
        
    }

    
    
    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}
