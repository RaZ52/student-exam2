node {
    try {
        stage('Test') {
            sh 'python3 --version'
        }
        stage('AppTest') {
            sh "pip install -e '.[test]'"
            sh 'coverage run -m pytest'
            sh 'coverage report'
        }
    }
    catch (err) {
        throw err
    }
}