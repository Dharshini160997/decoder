$(document).ready(function()
{
  $(".decode-button").click(function(){
    var cin = $(".input").val()
    if (cin.length!=21)
    {
      alert("Please enter a valid corporate identification number")
    }
    else
    {
      $.ajax({
        type:"GET",
        url:"/decode/result",
        data:{cin:cin},
        success:function(result)
        {
          console.log(result)
          if(result.code==200)
          {
            $(".result").html(result.decoded_answer)
          }
        }
      })
      alert(cin.length)
    }
  })
})
