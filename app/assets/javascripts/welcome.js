$(document).ready(function(){
  showMastercardGif();
})

function showMastercardGif(){
  //showmastercardgif
  $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/99875/screenshots/1805070/more-drib.gif' alt='mastercard'>")

  function loading(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p>Listening for payment</p>")
  }
  setTimeout(loading, 6000);

  $(window).keypress(function(e) {
    if (e.which === 32) {
      $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/799964/screenshots/3004653/5.1_cc_to_safe.gif' alt='verify'><br><p>Verified Sender and Recipient</p>")
      $(window).keypress(function(e) {
        if (e.which === 32) {
          $('.loader').html("<br><br><div id='spinner'></div><br><br><p>Asking user for payment amount... </p>")

          function loading(){
            $('.loader').html("<br><br><div id='spinner'></div><br><br><p>Waiting for user to reply with amount...</p>")
          }
          setTimeout(loading, 2000);
          $(window).keypress(function(e) {
            if (e.which === 32) {
                $('.loader').html("<br><br><div id='spinner'></div><br><br><p>Amount Received.</p>")
                function askPin(){
                  $('.loader').html("<br><br><div id='spinner'></div><br><br><p>Asking user to verify with PIN...</p>")
                }
                setTimeout(askPin, 2000);
                function waitingPin(){
                  $('.loader').html("<br><br><div id='spinner'></div><br><br><p>Waiting for user to confirm verification with PIN...</p>")
                }
                setTimeout(waitingPin, 2000);
              //amount received
              //prompting user for pin verficiation
              //pin verification received
              //processing payment
              //transaction successful
              $(window).keypress(function(e) {
                if (e.which === 32) {
                  $('.loader').html("<br><br><div id='spinner'></div><br><br><p>PIN received.</p>")

                  function verifiedUser(){
                    $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/159981/screenshots/2345952/vcn.gif' alt='send'><br><p>User verified.</p>")
                  }
                  setTimeout(verifiedUser, 2000);

                  function sendPayment(){
                    $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/486050/screenshots/2832783/seamless-payments.gif' alt='send'><br><br><p>Processing payment</p>")
                  }
                  setTimeout(sendPayment, 4000);

                }
              });
            }
          });
        }
      });

    }
  })



}
