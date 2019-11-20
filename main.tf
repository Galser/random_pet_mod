# Random Pet over-simplified moduel for
# TFC rehgistry test
# HashiCorp ZD ticket : 21301

resource "random_pet" "doggy" {
  keepers = {
    date = formatdate("MMM DD, YYYY", timestamp())
  }
}

resource "null_resource" "echo_chant" {
  triggers = { 
    timey = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo Who let the dog : ${random_pet.doggy.id} out ?!"
  }
}