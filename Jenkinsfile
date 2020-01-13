node {
    try {
        stage('Test') {
            sh 'python3 --version'
        }
        stage('AppTest') {
            sh 'git clone https://github.com/RaZ52/student-exam2'
            sh 'cd student-exam2'
            sh "pip3 install -e '.[test]'"
            sh 'coverage run -m pytest'
            sh 'coverage report'
        }
    }
    catch (err) {
        throw err
    }
}