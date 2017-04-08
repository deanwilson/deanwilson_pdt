# == Class: ubuntu_code
#
# A simple class that ensures its parameter is a valid ubuntu code name,
# not just a string. The example here will fail. Change `trusted` to `trusty`
# to make it work.
#
# === Parameters:
#
# [*ubuntu_code_name*]
#   A ubuntu release code name. Examples are trusty and xenial
#
class ubuntu_code(
  # here we use one of the types provided by this module.
  Deanwilson_pdt::Ubuntucodename $ubuntu_code_name,
) {

  notify { "Hello from ${ubuntu_code_name}": }

}

# now we call our class
class { 'ubuntu_code':
  # this is an invalid codename and so an EvaluationError will be
  # raised when puppet runs
  ubuntu_code_name => 'trusted',
}
