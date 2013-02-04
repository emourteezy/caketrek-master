// Additional JS functions here
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '206480192823128', // App ID
      channelUrl : 'http://fbc.com/users/login', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true,  // parse XFBML
      oauth		 : true
    });

    // Additional init code here

  };

  // Load the SDK Asynchronously
  (function(d){
  	
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/fr_FR/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
   
   
   //Jquery
   $(document).ready(function() {

	   $('.facebookConnect').click(function(){
	   	 var url= $(this).attr('href');
	   	 FB.login(function(response){
		 if(response.authResponse){
			 window.location = url; 
			 }
		 },{scope : 'email'});
		  return false;
	  }); 
});
  