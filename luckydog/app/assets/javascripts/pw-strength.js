// var scripturl = "/assets/zxcvbn.js";
var matched = 0;
function addStrength(z){
  const scale = {
    0: ['pw-very-weak', 'Very weak'],
    1: ['pw-weak', 'Weak'],
    2: ['pw-so-so', 'So-so'],
    3: ['pw-good', 'Good'],
    4: ['pw-great', 'Great!'],
  };

  // fallback result if password field is empty or zxcvbn lookup fails
  const fallback = ['pw-na', 'None'];

  return z && z.password.length ? scale[z.score] : fallback;
}

function addFeedback(z) {

  // if (!z || z.score > 2) return '';

  const { warning, suggestions } = z.feedback;
  if (!warning && !suggestions.length) return '';

  return warning || suggestions;
}
// `${suggestions.map(function(s) { return s; }).join('; ')}`
function analyzePswd() {
  const input = document.querySelector('input[id="user_password"]');
  const pswdCntnr = document.getElementById('pswd-strength-cntnr');
  const pswdTxt = document.getElementById('pswd-feedback');
  const pswdStrength = document.getElementById('pswd-strength-txt');

  function matcher(z) {
    const pass = document.querySelector('input[id="user_password"]');
    pass.addEventListener('keyup', function(e) {
      const strongRe = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
      const password = e.target.value;
      console.log(password);
      console.log("e is +" + password);
      console.log ("in here " + strongRe.test(password) + " END");
      
      var matcher =  password.match(strongRe);
       if (matcher) {
        console.log(matcher);
        // set the global variable
        matched = 1;
       // console.log ("pass: " + matched + strongRe.test(password) + " END"); 
      }
      else {
        matched = 0;
        // console.log ("failed: " + matched + testing1);
      }
    
    // console.log("checking the score:  = " + z.score + "and the match" + matched);

  });
  }
  // the pw strength module is hidden by default ("hide" CSS class)
  // (so that javascript disabled browsers won't see it)
  // thus, first step is unhiding it
  if (pswdCntnr){
    pswdCntnr.className = '';
  }

  input.addEventListener('keyup', function(e) {
    const z = zxcvbn(e.target.value);
    const fallback = ['pw-na', 'None'];
    const [result, strength] = addStrength(z);
    const feedback = addFeedback(z);


    matcher(z);

    // if the password doens't meet our constraints, we don't want it to have
    // a rating of great
    // console.log("score: " + z.score + "matched: " + matched);
    if (!matched && z.score == 4)
    {
      z.score=3;
      z.feedback.suggestion = "Please add minimum characters";
    }
    if (matched && z.score ==3)
    {
      z.feedback.suggestions = "Godd strong password but you can make it stonger";
    }

    if (pswdCntnr){
      pswdCntnr.className = result;
     } 
    pswdStrength.innerHTML = strength;
    pswdTxt.innerHTML = feedback;
  });
}


document.addEventListener('DOMContentLoaded', analyzePswd);