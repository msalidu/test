pipeline {
    agent any
    script {
                    def DEPLOY="", REL="", NEXT_REL=""
                    def versionRelease= "1.0.0"
                    def versionDevelop= "1.0.1-SNAPSHOT"
    }
    stages {
        stage('Example') {
            steps {
                echo 'Hello World'
            }
            
        }
         stage('User input') {     
            steps {  
                script {

 

                    def userInput = input message: 'Seleziona i valori', 
                                          parameters: [choice(choices: "NO\nUAT\n", description: 'Deploy', name: 'DEP'), 
                                                       string(defaultValue: versionRelease, description: 'Release Version', name: 'VER'),
                                                       string(defaultValue: versionDevelop, description: 'Development Version', name: 'DEV')]        
                    DEPLOY = userInput['DEP'];
                    REL = userInput['VER'];
                    NEXT_REL = userInput['DEV'];
                    
                    sh 'ls -la'

                }
                
            }
             /*
            steps {
                sh 'ls -la'
            }
*/
        }
    }
    post { /* <1> */
        always { /* <2> */
            echo "I will always say Hello again! $NEXT_REL "
        }
    }
}
