pipeline {
    agent any

    tools {
        python 'Python3'  // Make sure this is configured in Jenkins under Global Tool Configuration
    }

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Mohesh-mkp/Project-Code-1997.git'
            }
        }

        stage('Set Up Python Environment') {
            steps {
                sh '''
                python -m venv ${VENV_DIR}
                . ${VENV_DIR}/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh '''
                . ${VENV_DIR}/bin/activate
                robot -d results TestCases/
                '''
            }
        }

        stage('Publish Report') {
            steps {
                publishHTML([reportDir: 'results',
                             reportFiles: 'report.html',
                             reportName: 'Robot Framework Report',
                             keepAll: true])
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/*.html', allowEmptyArchive: true
        }
    }
}
