class gpgtestid(
  Deanwilson_pdt::Gpgkeyid $gpg_key_id,
) {

  notify { "Hello from ${gpg_key_id}": }

}

class { 'gpgtestid':
  # this is valid
  # gpg_key_id => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
  # This will fail
  gpg_key_id => 'SHORTKEY',
}

