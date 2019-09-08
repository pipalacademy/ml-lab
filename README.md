# ML Lab

Lab setup for Machine Learning training.

This repo contains the terraform scripts to start a host with jupyterlab
running for every participant.

# How to Use

Go to terraform directory:

    $ cd terraform

Prepare secrets.tfvars:

    $ cp secrets.tfvars.sample secrets.tfvars
    # edit the secrets.tfvars and add add access keys and tokens

To start the nodes:

    $ cd terraform
    $ make apply

You may have to edit the `secrets.tfvars` to specify the `instance_type` and `num_nodes`
