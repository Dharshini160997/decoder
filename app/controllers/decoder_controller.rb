class DecoderController < ApplicationController

  def login
    render :loginpage
  end

  def get_cin
    render :get_user_cin
  end

  def decode_cin
    begin
      decoded_result = DecoderHelper.decoding(params['cin'])
      render json:{code: 200,decoded_answer: render_to_string(partial: 'decoder/decoded_result', locals: {decoded_result:decoded_result})}
    rescue => exception
      render json:{code:500,error:exception.message}
    end
    
  end
end