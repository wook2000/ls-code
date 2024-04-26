function passwordAuthentication() {
  let rlSync = require('readline-sync');

  for (let counter = 0; counter < 3; counter += 1) {
    let password = rlSync.question("What is the password: ");
    if (password === 'password') {
      console.log('You have successfully logged in.');
      return;
    }  
  }

  console.log('You have been denied access.');
}

passwordAuthentication();