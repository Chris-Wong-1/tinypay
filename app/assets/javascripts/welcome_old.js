$(document).ready(function(){
  showMastercardGif();
})

function showMastercardGif(){
  //showmastercardgif
  $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/99875/screenshots/1805070/more-drib.gif' alt='mastercard'>")

  function loading(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Listening for payment</p>")
  }
  setTimeout(loading, 7000);

  $(window).keypress(function(e) {
    if (e.which === 32) {
      $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>TinyPay payment text received.</p>")


      function verifyingSenderAndReciepient(){
        $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Verifying Sender and Recipient</p>")
      }
      setTimeout(verifyingSenderAndReciepient, 2000);

      // function verifiedSenderAndReciepient(){
      //     $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/799964/screenshots/3004653/5.1_cc_to_safe.gif' alt='verify'><br><p class='animatedText'>Verified Sender and Recipient</p>")
      // }
      // setTimeout(verifiedSenderAndReciepient, 4000);


      $(window).keypress(function(e) {
        if (e.which === 32) {
          $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Asking user for payment amount... </p>")

          function loading(){
            $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Waiting for user to reply with amount...</p>")
          }
          setTimeout(loading, 2000);
          $(window).keypress(function(e) {
            if (e.which === 32) {
                $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Amount Received.</p>")
                function askPin(){
                  $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Asking user to verify with PIN...</p>")
                }
                setTimeout(askPin, 2000);
                function waitingPin(){
                  $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Waiting for user to confirm verification with PIN...</p>")
                }
                setTimeout(waitingPin, 2000);
              //amount received
              //prompting user for pin verficiation
              //pin verification received
              //processing payment
              //transaction successful
              $(window).keypress(function(e) {
                if (e.which === 32) {
                  $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>PIN received.</p>")

                  function verifyingUser(){
                    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Verifying user with PIN.</p>")
                  }
                  setTimeout(verifyingUser, 2000);

                  function verifiedUser(){
                    $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/159981/screenshots/2345952/vcn.gif' alt='send'><br><p class='animatedText'>User verified.</p>")
                  }
                  setTimeout(verifiedUser, 4000);

                  function sendPayment(){
                    $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/486050/screenshots/2832783/seamless-payments.gif' alt='send'><br><br><p class='animatedText'>Processing payment</p>")
                  }
                  setTimeout(sendPayment, 6000);

                  $(window).keypress(function(e) {
                    if (e.which === 32) {
                      $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/760333/screenshots/2123456/lipco.gif' alt='send'><br><br><p class='animatedText'>Payment Complete!</p>")
                      // $('.loader').clear
                      // loading();
                    }
                  });

                }
              });
            }
          });
        }
      });
    }
  })



}
