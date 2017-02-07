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
                sh 'env'
                echo "user ${env.USERNAME}"
            }
    stage('Build') {
        echo  "Bulding.... ${BRANCH_NAME} -  ${env.USERNAME} " 
        sh '/tmp/printinput.sh ${env.USERNAME} ${env.PASSWORD}'
    } 
    
    if ( env.BRANCH_NAME.contains("release") ) {    
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
        stage('Build on feat* ') {
            echo  "YES ${BRANCH_NAME} ${env.BRANCH_NAME}" 
            
         }
    } 
    
    //when { branch "feature/*" }
    /*
    withEnv(['BRANCH_NAME=feat2']) 
    {
        stage('zzz stage if') {
            sh 'printenv'
        }
    }
*/

   /*
     
    stage('Deploy') {
        //echo("hello from Pipeline ");
        echo  "${BRANCH_NAME} ${env.BRANCH_NAME}"
        echo("Deploy: "+ DEPLOY + "- " + BRANCH_NAME + " -- " + NEXT_REL + " -- " + REL);

        sh "export DEPLOY=${DEPLOY};bash ./test.sh "
    }   
*/
    
}
