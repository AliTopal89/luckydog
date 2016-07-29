class UploadsController < ApplicationController
	# before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  def new
  end

  def create
    # file_to_upload = params[:file]
    # file_name = params[:file].original_filename
    # bucket = S3.bucket(S3_BUCKET.name)
    # Make an object in your bucket for your upload
    # obj = S3_BUCKET.objects[params[:file].original_filename]

    file_to_upload = params[:file]
    file_name = params[:file].original_filename
    bucket = S3.buckets(S3_BUCKET.name).object('key')

    obj = buckets.obj(file_name)

    # obj.put(
    #   acl: 'public_read',
    #   body: file_to_upload
    #   )
     obj.write(
      file: params[:file],
      acl: :public_read
      )

    # Create an object for the upload
    @upload = Upload.new(
        url: obj.public_url,
        name: obj.key
        )

    # Save the upload
    if @upload.save
      redirect_to uploads_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def index
  	@uploads = Upload.all
  end

  # private
  # def set_s3_direct_post
  #   @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  # end
end