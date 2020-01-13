node {
    try {
        stage('AppTest') {
            sh 'git clone https://github.com/RaZ52/student-exam2'
	    sh 'pip3 install -e ./student-exam2[test]'
            sh 'coverage run -m pytest'
            sh 'coverage report'
        }
        stage('BuildImage') {
            def image = docker.build("flaskapp:${env.BUILD_ID}")
        }
    }
    catch (err) {
        throw err
    }
    finally {
        stage('Clear') {
            sh 'rm -rf /home/jenkins/workspace/ci/student-exam2'
        }
    }
}