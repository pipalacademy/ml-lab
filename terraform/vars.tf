
variable "aws_region" {
  type = "string"
  default = "us-west-1"
}

variable "instance_type" {
  type = "string"
  default = "t2.micro"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "names" {
  type = "list"
  default = [
    "alpha",
    "beta",
    "gamma",
    "delta",
    "epsilon",
    "zeta",
    "eta",
    "theta",
    "iota",
    "kappa",
    "lambda",
    "mu",
    "nu",
    "xi",
    "omicron",
    "pi",
    "rho",
    "sigma",
    "tau",
    "upsilon",
    "phi",
    "chi",
    "psi",
    "omega"
  ]
}

variable "num_nodes" {
  type = "string"
  default = "2"
}
