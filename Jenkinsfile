pipeline {
    agent any
    // agent is where my pipeline will be eexecuted
   
    stages {
        stage('pull from scm') {
            steps {
            git credentialsId: 'github-token-new', url: 'https://github.com/TrinadhAchanta/spring-petclinic.git'
            }
        }
        stage('mvn build') {
            steps {
            sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            post {
                //if maven build was able to run the test we will create a test report and archive the jar in local machine
                success {
                    junit '**/target/surefire-reports/*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
        stage('checkstyle') {
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
        }
         stage('checkstyle Report') {
            steps {
                recordIssues(tools: [checkStyle(pattern: 'target/checkstyle-result.xml')])
            }
        }
     
    }
}
