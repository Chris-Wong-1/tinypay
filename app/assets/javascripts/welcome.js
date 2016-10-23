$(document).ready(function(){
  animations();
  receiveText();
  verifyingSenderAndReciepient();
})


function animations(){
  //showmastercardgif
  $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/99875/screenshots/1805070/more-drib.gif' alt='mastercard'>")

  function loading(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Listening for payment</p>")
  }
  setTimeout(loading, 7000);
}

function receiveText(){
  $(window).keypress(function(e) {
    if (e.which === 32) {
      $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>TinyPay text received.</p>")
      $(window).keypress(function(e) {
        if (e.which === 32) {
          $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Verifying Sender and Recipient...</p>")
          verifiedSenderAndReciepient()
        }
      })
    //   function loading(){
    //       $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Verifying Sender and Recipient</p>")
    //   }
    //   setTimeout(loading, 2000);
    }
  })
}

function verifiedSenderAndReciepient(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
    $('.loader').html("<p class='animatedText'>Verified Sender and Recipient.</p><br><img src='https://d13yacurqjgara.cloudfront.net/users/799964/screenshots/3004653/5.1_cc_to_safe.gif' alt='verified sender and recipient'>")

    askUserforpayment()
  }
})
}


function askUserforpayment(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
  $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Asking user for payment amount... </p>")

    waitingAmount()
  }
})
}

function waitingAmount(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
  $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Waiting for user to reply with amount...</p>")

    amountReceived()
  }
})
}

function amountReceived(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
  $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Amount Received.</p>")

    askPin()
  }
})
}

function askPin(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
  $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Asking user to verify with PIN...</p>")

    waitingPin()
  }
})
}

function waitingPin(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Waiting for user to confirm verification with PIN...</p>")

    receivedPin()
  }
})
}

function receivedPin(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>PIN received.</p>")

    verifyingUser()
  }
})
}

function verifyingUser(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Verifying user with PIN...</p>")

    userVerified()
  }
})
}

function userVerified(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
    $('.loader').html("<p class='animatedText'>User verified.</p><br><img src='https://d13yacurqjgara.cloudfront.net/users/159981/screenshots/2345952/vcn.gif' alt='send'>")

    processingPayment()
  }
})
}

function processingPayment(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
    $('.loader').html("<p class='animatedText'>Sending payment...</p><br><img src='https://d13yacurqjgara.cloudfront.net/users/486050/screenshots/2832783/seamless-payments.gif' alt='send'>")

    paymentSuccess()
  }
})
}

function paymentSuccess(){
  $(window).keypress(function(e) {
  if (e.which === 32) {
    $('.loader').html("<p class='animatedText'>Success! Payment Complete.</p><br><img src='https://d13yacurqjgara.cloudfront.net/users/760333/screenshots/2123456/lipco.gif' alt='send'><br>")
  }
})
}
