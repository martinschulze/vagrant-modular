# The following lines need some adjustment.

USERNAME      = "martin"          # This is your login name. MUST be one word without whitespace!
FULLNAME      = "Martin Schulze"  # This should be your full name.
VM_NAME       = "DevelopmentVM"   # Use one word without whitespace!

# You have to either place your ssh credential files (id_rsa, id_rsa.pub and
# config) within the folder or switch the following line to true.
NO_SSH_CONFIG = "false"
#NO_SSH_CONFIG = "true"

# Configure your features here. At the moment a feature consists of a line
# in the following array and a corresponding puppet file in the features
# directory.
FEATURES = [
    "latex",
    "eclipseDSL",
  ]
