
# regions like china can have aws-cn as the second colon delimited value
type Deanwilson_pdt::AWSARN = Pattern[/\Aarn:aws.*?:[\w\d]*:.*:\d*:(.+)\Z/]

