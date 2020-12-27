class DecoderController < ApplicationController
  def login
    render :loginpage
  end

  def get_cin
    render :get_user_cin
  end

  def decode_cin
    begin
      cache_value = params['cin'] + '-' + Time.now.strftime("%d/%m/%Y %H:%M")
      (session[params['user_name']] ||= []) << cache_value
      if(session[params['cin']].blank?)
        decoded_result = DecoderHelper.decoding(params['cin'])
        session[params['cin']] = decoded_result
        render json:{code: 200,decoded_answer: render_to_string(partial: 'decoder/decoded_result', locals: {decoded_result:decoded_result})}
      else
        render json:{code: 200,decoded_answer: render_to_string(partial: 'decoder/decoded_result', locals: {decoded_result:session[params['cin']]})}
      end
    rescue => exception
      render json:{code:500,error:exception.message}
    end
  end
  def get_user_history
    begin
      page = params['page'].blank? ? 1 : params['page'].to_i
      from_limit = ((page-1) * 10 ) + 1
      records =session[params['user_name']].paginate(page:params[:page],per_page:10)
      flash[:alert] = "Oops! You have no search history"
      render :partial => 'decoder/history_page' , :locals=>{search_record:records,username:params['user_name'],error:false,from_limit:from_limit}
    rescue => exception
      puts exception     
      render :partial => 'decoder/history_page' , :locals=>{message:"Something went wrong!Please try again later",error:true}
    end
  end
end