<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.2/bootstrap-material-design.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<style type="text/css">

.btn#my-btn {
     background: white;
    padding-top: 13px;
    padding-bottom: 12px;
    border-radius: 45px;
    padding-right: 40px;
    padding-left: 40px;
    color: #5865C3;}

#chat-overlay {
    background: rgba(255,255,255,0.1);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    display: none;}

#chat-circle {
  position: fixed;
  bottom: 50px;
  right: 50px;
  background: #5A5EB9;
  width: 80px;
  height: 80px;
  border-radius: 50%;
  color: white;
  padding: 28px;
  cursor: pointer;
  box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}

.chat-box {
  display:none;
  background: #efefef;
  position:fixed;
  right:30px;
  bottom:50px;
  width:350px;
  max-width: 85vw;
  max-height:100vh;
  border-radius:5px;
/*   box-shadow: 0px 5px 35px 9px #464a92; */
  box-shadow: 0px 5px 35px 9px #ccc;
}
#chatbot-form-btn{
  position:absolute;
  bottom:3px;
  right:10px;
  background: transparent;
  box-shadow:none;
  border:none;
  border-radius:50%;
  color:#5A5EB9;
  width:35px;
  height:35px;
}
.chat-box-toggle {
  float:right;
  margin-right:15px;
  cursor:pointer;
}
.chat-box-header {
  background:#5A5EB9;
  height:70px;
  border-top-left-radius:5px;
  border-top-right-radius:5px;
  color:white;
  text-align:center;
  font-size:20px;
  padding-top:17px;
}
.panel-footer > form {
    margin-bottom: 0;
}
#messageText{
background: #f4f7f9;
  width:100%;
  position:relative;
  height:47px;
  padding-top:10px;
  padding-right:50px;
  padding-bottom:10px;
  padding-left:15px;
  border:none;
  resize:none;
  outline:none;
  border:1px solid #ccc;
  color:#888;
  border-top:none;
  border-bottom-right-radius:5px;
  border-bottom-left-radius:5px;
  overflow:hidden; }
#messageText::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  color: #ccc;
}
#messageText::-moz-placeholder { /* Firefox 19+ */
  color: #ccc;
}
#messageText:-ms-input-placeholder { /* IE 10+ */
  color: #ccc;
}
#messageText:-moz-placeholder { /* Firefox 18- */
  color: #ccc;
}
.panel{
  position: relative;
  height:370px;
  height:auto;
  border:1px solid #ccc;
  overflow: hidden;
}
.panel:after {
  content: "";
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  height:100%;
  position: absolute;
  z-index: -1;
}

 .media-list { padding:15px;
  height:370px;
  width:100%;
  overflow-y:auto;
  overflow-x:auto;
}

#errMsg { padding:15px;
 height:370px;
 width:100%;
 overflow-y:auto;
 overflow-x:auto;
}

  .media-list::-webkit-scrollbar-track
{
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  border-radius: 5px;
  background-color: #F5F5F5;
}

.media-list::-webkit-scrollbar
{
  width: 5px;
  height: 5px; border-radius: 5px;
  background-color: #F5F5F5;
}

.media-list::-webkit-scrollbar-thumb
{
  background-color: #5A5EB9;border-radius: 5px;
}
.media-list::-webkit-scrollbar-corner{ background: rgba(0,0,0,0.5); }
</style>
    </head>
    <body>

        <div id="chat-circle" class="btn btn-raised">
        <div id="chat-overlay"></div>

        <i class="material-icons">chat</i>
        </div>
        <div class="chat-box">
            <div class="chat-box-header">ChatBot<span class="chat-box-toggle"><i id="close" class="material-icons">close</i></span></div>
            <div id="chatPanel" class="panel panel-info">
                <div class="panel-body fixed-panel">
                    <div class="media-list">
                      <div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;"> Hi There,Do You have a query?</div>
                      <div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;"><button style="color:#5A5EB9; border: 2px solid #4145A0; border-radius:8px;" id="messageT" name="messageText" value="YES"> YES</button></div>
                      <div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;"><button style="color:#5A5EB9; border: 2px solid #4145A0; border-radius:8px;" id="messageT" name="messageText" value="NO"> NO</button></div>
                    </div>
                    <span id="errMsg" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;"></span>
                </div>
            </div>
            <div class="panel-footer">
                <form method="post" id="chatbot-form">
                    <input type="text" class="form-control" placeholder="Send a message..." name="messageText" id="messageText" autofocus/>
                    <button class="btn btn-info" type="button" id="chatbot-form-btn"><i class="material-icons">send</i></button>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

        <script>
        $(function throughtext() {

            $('#chatbot-form-btn').click(function(e) {
                e.preventDefault();
                $('#chatbot-form').submit();
            });

            $('#chatbot-form').submit(function(e) {
                e.preventDefault();
                var message = $('#messageText').val();
                if(message=="")
                {$('#errMsg').text(' Add something ').fadeIn();
                 $('#errMsg').delay(3000).fadeOut();
                }
                else {$(".media-list").append('<div class="media"><div style =" text-align:right; color : #B95A5E" class="media-body">' + message + '</div></div>');

                $.ajax({
                    type: "POST",
                    url: "/ask",
                    data: $(this).serialize(),
                    success: function(response) {
                        $('#messageText').val('');
                        var answer = response.answer;
                        var words = answer.split("#");
                        const chatPanel = document.getElementById("chatPanel");

                      //  $.each(words, function(index,value){$(".media-list").append('<li class="media"><div class="media-body"><div class="media"><div style = "color : white" class="media-body">' + value + '<hr/></div></div></div></li>')});
                        $.each(words, function(index,value){
                          if(value.charAt(0)=='$'){
                            value=value.replace('$','');
                            $(".media-list").append('<div class="media-body"><div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;" class="media-body">' + value + '</div></div>')}
                          else if(value.charAt(0)=='@'){
                            value=value.replace('@','');
                          $(".media-list").append('<div class="media-body"><div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;" class="media-body"><a href="' + value + '" target="_blank">'+ value +'</a></div></div>')}
                          else{$(".media-list").append('<div class="media-body"><div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;" class="media-body"><button style="color:#5A5EB9; border: 2px solid #4145A0; border-radius:8px;" id="messageT" name="messageText" value="' + value + '">' + value + '</button></div></div>')}});
                        $(".media-list").stop().animate({ scrollTop: $(".media-list")[0].scrollHeight}, 1000);

                    },
                    error: function(error) {
                        console.log(error);
                    }
                });}
            });

           $(document).on("click",'#messageT',function(e) {
              e.preventDefault();
              var message= $(this).val() ;
              $(".media-list").append('<div class="media-body"><div class="media"><div style = "text-align:right; color : #B95A5E" class="media-body">' + message + '</div></div></div>');


              $.ajax({
                  type: "POST",
                  url: "/ask",
                  data: {messageText : message } ,
                  success: function(response) {
                      var answer = response.answer;
                      var words = answer.split("#");
                      const chatPanel = document.getElementById("chatPanel");
                    //  $.each(words, function(index,value){$(".media-list").append('<li class="media"><div class="media-body"><div class="media"><div style = "color : white" class="media-body">' + value + '<hr/></div></div></div></li>')});
                      $.each(words, function(index,value){
                        if(value.charAt(0)=='$'){
                          value=value.replace('$','');
                          $(".media-list").append('<div class="media-body"><div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;" class="media-body">' + value + '</div></div>')}
                        else if(value.charAt(0)=='@'){
                            value=value.replace('@','');
                          $(".media-list").append('<div class="media-body"><div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;" class="media-body"><a href="' + value + '" target="_blank">'+ value +'</a></div></div>')}
                        else{$(".media-list").append('<div class="media-body"><div class="media" style = "line-height: 1.4;position: relative;overflow-wrap: break-word;color:#5A5EB9;" class="media-body"><button style="color:#5A5EB9; border: 2px solid #4145A0; border-radius:8px;" id="messageT" name="messageText" value="' + value + '">' + value + '</button></div></div>')}});
                      $(".media-list").stop().animate({ scrollTop: $(".media-list")[0].scrollHeight}, 1000);

                  },
                  error: function(error) {
                      console.log(error);
                  }
              });

         });

        });
$("#chat-circle").click(function () {
    $("#chat-circle").toggle('scale');
    $(".chat-box").toggle('scale');
    });

  $(".chat-box-toggle").click(function () {
    $("#chat-circle").toggle('scale');
    $(".chat-box").toggle('scale');
  });
  $("#close").click(function(){$(".media-body").html("");});
        </script>
    </body>
</html>