if Rails.env.production?
  AWS.config(
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  )

  S3_BUCKET = AWS::S3.new.buckets[ENV['S3_BUCKET']]
else
  AWS.config(
    :access_key_id => 'x',
    :secret_access_key => 'y'
  )

  S3_BUCKET = AWS::S3.new.buckets[ENV['S3_BUCKET']]

end


