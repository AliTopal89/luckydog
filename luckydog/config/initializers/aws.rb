require 'aws-sdk'

Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
# s3 = Aws::S3::Client.new
# resp = s3.list_buckets
# S3_BUCKET = resp.buckets[0]
# resp.buckets.map(&:name)

S3 = Aws::S3::Resource.new(region: 'us-east-1')