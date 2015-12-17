import 'dart:html';
import 'package:cookie/cookie.dart'as cookie;
import 'dart:convert';

<<<<<<< HEAD
ImageElement button_3;//å­˜æ”¾å›¾ç‰‡
InputElement todoInput;
List<String> my_email=[];//å­˜æ”¾ä»æœåŠ¡å™¨ä¸­ä¼ è¿‡æ¥çš„å€¼
void main(){
  var name=cookie.get('name');
  document.getElementById('test').value=name.toString();
  var path = 'http://127.0.0.1:8080/studentpage';//å”¯ä¸€çš„åœ°å€URL
  var httpRequest = new HttpRequest();//è®¿é—®webç½‘ç«™çš„åè®®ï¼ˆç½‘ä¸Šè¯·æ±‚æ–‡ä»¶â€”â€”ftpè¶…æ–‡æœ¬ä¼ è¾“åè®®ï¼‰
  httpRequest
    //..open('GET', path)//æ‹¨å·ï¼Œæ‰“å¼€ä¸€æ¡é€šé“
    ..open('POST', path)
    ..send(JSON.encode(name))//æŠŠç”¨æˆ·åä¼ ç»™æœåŠ¡å™¨ï¼ŒæœåŠ¡å™¨æ ¹æ®ç”¨æˆ·åè¿›è¡ŒæŸ¥æ‰¾ä¸ç”¨æˆ·ååŒ¹é…çš„ä¿¡æ¯
=======
ImageElement button_3;//´æ·ÅÍ¼Æ¬
InputElement todoInput;
List<String> my_email=[];//´æ·Å´Ó·şÎñÆ÷ÖĞ´«¹ıÀ´µÄÖµ
void main(){
  var name=cookie.get('name');
  document.getElementById('test').value=name.toString();
  var path = 'http://127.0.0.1:8080/studentpage';//Î¨Ò»µÄµØÖ·URL
  var httpRequest = new HttpRequest();//·ÃÎÊwebÍøÕ¾µÄĞ­Òé£¨ÍøÉÏÇëÇóÎÄ¼ş¡ª¡ªftp³¬ÎÄ±¾´«ÊäĞ­Òé£©
  httpRequest
  //..open('GET', path)//²¦ºÅ£¬´ò¿ªÒ»ÌõÍ¨µÀ
    ..open('POST', path)
    ..send(JSON.encode(name))//°ÑÓÃ»§Ãû´«¸ø·şÎñÆ÷£¬·şÎñÆ÷¸ù¾İÓÃ»§Ãû½øĞĞ²éÕÒÓëÓÃ»§ÃûÆ¥ÅäµÄĞÅÏ¢
>>>>>>> refs/remotes/origin/10130340223
    ..onLoadEnd.listen((e) => requestComplete(httpRequest));
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {
<<<<<<< HEAD
    //200ä»£è¡¨æ•°æ®æ­£ç¡®æ‹¿åˆ°
    my_email = JSON.decode(request.responseText);
    var num=my_email.length;
    //document.getElementById('test').value=my_email.toString();//åˆ¤æ–­æ˜¯å¦æœ‰æ–°æ¶ˆæ¯
    button_3=querySelector('#button_3');
    if(num==0) {
      button_3.src="index_picture/button3.png";//åœ¨æ²¡æœ‰æ–°æ¶ˆæ¯çš„æƒ…å†µä¸‹ï¼Œä½¿ç”¨button_3å›¾ç‰‡
    }
    else{
      button_3.src="index_picture/button3_1.png";//æœ‰äº†æ–°æ¶ˆæ¯ä¹‹åä¼šä½¿ç”¨button_3_1å›¾ç‰‡
    }
  }
}
=======
    //200´ú±íÊı¾İÕıÈ·ÄÃµ½
    my_email = JSON.decode(request.responseText);
    var num=my_email.length;
    //document.getElementById('test').value=my_email.toString();//ÅĞ¶ÏÊÇ·ñÓĞĞÂÏûÏ¢
    button_3=querySelector('#button_3');
    if(num==0) {
      button_3.src="index_picture/button3.png";//ÔÚÃ»ÓĞĞÂÏûÏ¢µÄÇé¿öÏÂ£¬Ê¹ÓÃbutton_3Í¼Æ¬
    }
    else{
      button_3.src="index_picture/button3_1.png";//ÓĞÁËĞÂÏûÏ¢Ö®ºó»áÊ¹ÓÃbutton_3_1Í¼Æ¬
    }
  }
}
>>>>>>> refs/remotes/origin/10130340223
