pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                echo 'Hello World'
            }
        }
    }
    post { /* <1> */
        always { /* <2> */
            echo 'I will always say Hello again!'
        }
    }
}
