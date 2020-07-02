class DemoController < ApplicationController
  def index
    @original_image_url = params[:original_image_url]

    if @original_image_url.present?
      file_ext = File.extname(@original_image_url)
      output_file_name = "#{SecureRandom.uuid}#{file_ext}"
      output_path = Rails.root.join('public', 'tmp', output_file_name)

      image = MiniMagick::Image.open(@original_image_url)
      image.flip
      image.write(output_path)

      @new_image_url = "/tmp/#{output_file_name}"
    end

    render template: 'demo/index'
  end
end
