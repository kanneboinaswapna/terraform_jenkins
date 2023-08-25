pipeline {
    agent { label 'yellow'}
stages {
    stage ('vcs') {
        steps {
            git url: "https://github.com/kanneboinaswapna/terraform_jenkins.git", branch: 'main'
        }
    }
    stage ('build') {
        steps {
            sh """terraform init
                 terraform apply -auto-approve"""
        }
    }
}
}