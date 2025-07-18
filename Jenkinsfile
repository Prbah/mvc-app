pipeline {
    agent any

    stages {
        stage('Docker Build') {
            steps {
                sh 'docker build -t prabhusrinivasan/dotnet-mvc-demo:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                    sh 'docker push prabhusrinivasan/dotnet-mvc-demo:latest'
                }
            }
        }
    }
}
