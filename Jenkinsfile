pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                echo 'Hello World'
            }
            
            def DEPLOY="", REL="", NEXT_REL=""
            def versionRelease= "1.0.0"
            def versionRelease= "1.0.1-SNAPSHOT"
            stage('User input') {  

                    def userInput = input message: 'Seleziona i valori', 
                                          parameters: [choice(choices: "NO\nUAT\n", description: 'Deploy', name: 'DEP'), 
                                                       string(defaultValue: versionRelease, description: 'Release Version', name: 'VER'),
                                                       string(defaultValue: def versionRelease= "1.0.0", description: 'Development Version', name: 'DEV')]        
                    DEPLOY = userInput['DEP'];
                    REL = userInput['VER'];
                    NEXT_REL = userInput['DEV'];

            }
        }
    }
    post { /* <1> */
        always { /* <2> */
            echo 'I will always say Hello again!'
        }
    }
}
