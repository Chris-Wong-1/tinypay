$(document).ready(function(){
  animations();
})

function animations(){
  //showmastercardgif
  $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/99875/screenshots/1805070/more-drib.gif' alt='mastercard'>")

  function loading(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Listening for payment</p>");
    $(window).keypress(function(e) {
      if (e.which === 32) {
        a();
      }
  }
  setTimeout(loading, 7000);


  function a(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>TinyPay payment text received.</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        b();
      }
    })
  }

  function b(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Verifying Sender and Recipient</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        c();
      }
    })
  }

  function c(){
    $('.loader').html("<p class='animatedText'>Verified Sender and Recipient</p><br><img src='https://d13yacurqjgara.cloudfront.net/users/799964/screenshots/3004653/5.1_cc_to_safe.gif' alt='verified sender and recipient'>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        d();
      }
    })
  }

  function d(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Asking user for payment amount... </p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        e();
      }
    })
  }

  function e(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Waiting for user to reply with amount...</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        f();
      }
    })
  }

  function f(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Amount Received.</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        g();
      }
    })
  }

  function g(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Asking user to verify with PIN...</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        h();
      }
    })
  }
  function h(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Waiting for user to confirm verification with PIN...</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        i();
      }
    })
  }
  function i(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>PIN received.</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        j();
      }
    })
  }

  function j(){
    $('.loader').html("<br><br><div id='spinner'></div><br><br><p class='animatedText'>Verifying user with PIN.</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        k();
      }
    })
  }

  function k(){
    $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/159981/screenshots/2345952/vcn.gif' alt='send'><br><p class='animatedText'>User verified.</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        l();
      }
    })
  }

  function l(){
    $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/486050/screenshots/2832783/seamless-payments.gif' alt='send'><br><br><p class='animatedText'>Processing payment</p>")
    $(window).keypress(function(e) {
      if (e.which === 32) {
        m();
      }
    })
  }

  function m(){
    $(window).keypress(function(e) {
      if (e.which === 32) {
        $('.loader').html("<img src='https://d13yacurqjgara.cloudfront.net/users/760333/screenshots/2123456/lipco.gif' alt='send'><br><br><p class='animatedText'>Payment Complete!</p>")
      }
    })
    setInterval(, 7000);
  }
}
