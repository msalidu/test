node {

    stage('Build') {
        sh 'echo build'
    }

    stage('Test') {

        sh 'echo test'
        trig= currentBuild.rawBuild.getCauses()[0]
        println(currentBuild.rawBuild.getCauses()[0].class.getName())
        println(trig.class.getName())
        	
    }

    stage('Deploy') {
        //echo("hello from Pipeline ");
         echo "${BRANCH_NAME} ${env.BRANCH_NAME}"
        sh 'echo Deploy ${AMBIENTE}'
    }
}

