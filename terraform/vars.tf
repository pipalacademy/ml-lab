variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "digitalocean_token" {}

variable "aws_region" {
  type = "string"
  default = "us-west-2"
}

variable "instance_type" {
  type = "string"
  default = "t2.micro"
}

variable "nodes" {
  type = "list"
  default = [
    {name = "alpha",    instance_type="m5.xlarge"},
    {name = "beta",     instance_type="m5.xlarge"},
    {name = "gamma",    instance_type="m5.xlarge"},
    {name = "delta",    instance_type="m5.xlarge"},
    {name = "epsilon",  instance_type="m5.xlarge"},

    {name = "zeta",     instance_type="m5.xlarge"},
    {name = "eta",      instance_type="m5.xlarge"},
    {name = "theta",    instance_type="m5.xlarge"},
    {name = "iota",     instance_type="m5.xlarge"},
    {name = "kappa",    instance_type="m5.xlarge"},

    {name = "lambda",   instance_type="m5.xlarge"},
    {name = "mu",       instance_type="m5.xlarge"},
    {name = "nu",       instance_type="m5.xlarge"},
    {name = "xi",       instance_type="m5.xlarge"},
    {name = "omicron",  instance_type="m5.xlarge"},

    {name = "pi",       instance_type="m5.xlarge"},
    {name = "rho",      instance_type="m5.xlarge"},
    {name = "sigma",    instance_type="m5.xlarge"},
    {name = "tau",      instance_type="m5.xlarge"},
    {name = "upsilon",  instance_type="m5.xlarge"},

    {name = "phi",      instance_type="m5.xlarge"},
    {name = "chi",      instance_type="m5.xlarge"},
    {name = "psi",      instance_type="m5.xlarge"},
    {name = "omega",    instance_type="m5.xlarge"}
  ]
}


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
