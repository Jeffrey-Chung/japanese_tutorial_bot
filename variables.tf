variable "bucket_name" {
  default = "tf-aws-japanese-language-bot-files-bucket"
}
variable "logging_bucket_name" {
  default = "tf-aws-japanese-language-bot-files-logging-bucket"
}
variable "region" {
  default = "ap-southeast-2"
}
variable "docker_file" {
  default = "docker-compose.yml"
}
variable "beanstalk_application_name" {
  default = "japanese_language_bot"
}
variable "beanstalk_application_description" {
  default = "Bot that assigns resources for Japanese Language Classes"
}
variable "beanstalk_version_label" {
  default = "Version 0.1"
}
variable "beanstalk_environment_name" {
  default = "language-bot-environment"
}