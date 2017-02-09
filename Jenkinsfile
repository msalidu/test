node {

    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {
       def triggerObj = currentBuild.rawBuild;

        sh 'echo test'
        println(triggerObj)

        	
    }

    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}

