node {
    def app
    stage('Build Docker Image') {
        checkout scm
        docker.withServer('tcp://dockerhost:2376', 'docker-swarm') {
            app = docker.build('dockerhp/jenkins-app:latest')
        }
    }
    
    stage('Publish to Docker Hub') {
        docker.withServer('tcp://dockerhost:2376', 'docker-swarm') {
            docker.withRegistry("https://index.docker.io/v1/", "dockerhub") {
               app.push('latest')
            }
        }
    }

    stage('Deploy to Production') {
        docker.withServer('tcp://dockerhost:2376', 'docker-swarm') {
            sh "docker service update app --force --image ${app.id}"
        }
    }
}
