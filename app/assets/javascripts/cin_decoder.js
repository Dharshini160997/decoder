$(document).ready(function()
{
  $(".decode-button").click(function(){
    var cin = $(".input").val()
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    var user_name  = urlParams.get('name');
    console.log(user_name)


    if (cin.length!=21)
    {
      alert("Please enter a valid corporate identification number")
    }
    else
    {
      $.ajax({
        type:"GET",
        url:"/decode/result",
        data:{cin:cin,user_name:user_name},
        success:function(result)
        {
          console.log(result)
          if(result.code==200)
          {
            $(".result").html(result.decoded_answer)
          }
          else
          {
            alert("Oops!Some error has occured!")
          }
        }
      })
    }
  })
  $(".login-btn").click(function(e){
    e.preventDefault()
    var username = $(".user-name").val();
    window.location.href = "/cin?name="+username
  })
  $(".history-button").click(function(e){
    e.preventDefault()
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    var user_name  = urlParams.get('name');
    window.location.href = "/user/history?user_name="+user_name
  })
  $(".page-num").onclick = function(e){
    e.preventDefault()
    alert("hi")
    console.log(e.target.id)
  }
  // $("#page-numbers").onclick = function(e){
  //   alert("hi")
  // }
  $("#page-num-ul").onclick = function(e) {console.log(e)}

  // $(document).on('click', '#page-num-ul',function(e){
  //   console.log(e)
  // })

})