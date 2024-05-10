// function onlyLetters(string) {
//   return Boolean(string.match(/^[A-Za-z]+$/));
// }

function isValidEmail(email) {
  // if (!email.match(/@/)) {
  //   console.log(false);
  //   return;
  // } else if (!email.split('@')[0].match(/^[A-Za-z0-9]+$/)) {
  //   console.log(false);
  //   return;
  // } else if (!(email.split('@')[1].match(/\./) && email.split('@')[1].split(/\./).every(onlyLetters))) {
  //   console.log(false);
  //   return;
  // }

  // console.log(true);

  console.log(/^[a-z0-9]+@([a-z]+\.)+[a-z]+$/i.test(email));
}

isValidEmail('Foo@baz.com.ph');          // returns true
isValidEmail('Foo@mx.baz.com.ph');       // returns true
isValidEmail('foo@baz.com');             // returns true
isValidEmail('foo@baz.ph');              // returns true
isValidEmail('HELLO123@baz');            // returns false
isValidEmail('foo.bar@baz.to');          // returns false
isValidEmail('foo@baz.');                // returns false
isValidEmail('foo_bat@baz');             // returns false
isValidEmail('foo@bar.a12');             // returns false
isValidEmail('foo_bar@baz.com');         // returns false
isValidEmail('foo@bar.....com');         // returns false