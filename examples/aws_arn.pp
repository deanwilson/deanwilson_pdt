class aws_arn(
  Deanwilson_pdt::AWSARN $arn,
) {

  notify { "${arn} is a valid Amazon Resource Name": }

}

## and the code that calls it

class { 'aws_arn':
  # this fails
  arn => 'MY:FAKE:ARN',
  # this will succeed
  #arn => 'arn:aws:cloudsearch:us-east-1:123456789012:domain/imdb-movies'
}
