node("ci") {
    try {
	def image
        stage('Git Clone') {
            sh 'git clone https://github.com/RaZ52/student-exam2'
        }
        stage('Test') {
	        sh 'pip3 install -e ./student-exam2[test]'
            sh 'coverage run -m pytest'
            sh 'coverage report'
        }
        stage('Build Image') {
	        checkout scm
            image = docker.build("raz52/cicd_exam:flaskapp${env.BUILD_ID}")
        }
        stage('Deploy Image') {
            docker.withRegistry('', '48cdcec7-3998-4f42-960c-6736198d01de') {
                image.push()
            }
        }
        stage('Remove Image') {
            sh "docker rmi raz52/cicd_exam:flaskapp${env.BUILD_ID}"
        }
    }
    catch (err) {
        throw err
    }
    finally {
        stage('Delete Repo') {
            sh 'rm -rf /home/jenkins/workspace/ci/student-exam2'
        }
    }
}