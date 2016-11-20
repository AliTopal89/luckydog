var scripturl = "/assets/zxcvbn.js";

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
  if (!z || z.score > 2) return '';

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

  // the pw strength module is hidden by default ("hide" CSS class)
  // (so that javascript disabled browsers won't see it)
  // thus, first step is unhiding it
  if (pswdCntnr){
    pswdCntnr.className = '';
  }

  input.addEventListener('keyup', function(e) {
    const z = zxcvbn(e.target.value);

    const [result, strength] = addStrength(z);
    const feedback = addFeedback(z);

    if (pswdCntnr){
      pswdCntnr.className = result;
     } 
    pswdStrength.innerHTML = strength;
    pswdTxt.innerHTML = feedback;
  });
}


document.addEventListener('DOMContentLoaded', analyzePswd);