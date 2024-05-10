function formatNumber(string) {
  let phoneNumber = '';

  if (string.length === 11) {
    phoneNumber = `+${string.slice(0, 1)} `;
    string = string.slice(1);
  }

  phoneNumber += `(${string.slice(0,3)}) ${string.slice(3,6)}-${string.slice(6)}`;

  return phoneNumber;
}


function cleanPhoneNumber(toBeCleaned) {
  const validNumber = /^[^\d]*\d([^\d]*?\d){9,10}[^\d]*$/;

  if (!validNumber.test(toBeCleaned)) {
    return formatNumber('0000000000');
  }

  let cleanerNum = toBeCleaned.match(validNumber)[0];
  let cleanNumber = cleanerNum.replace(/[^\d]/g, '');

  return formatNumber(cleanNumber);
}

console.log(cleanPhoneNumber('1112223333') === '(111) 222-3333');
console.log(cleanPhoneNumber('123456789') === '(000) 000-0000');
console.log(cleanPhoneNumber('123-456-7890') === '(123) 456-7890');
console.log(cleanPhoneNumber('123.456.7890') === '(123) 456-7890');
console.log(cleanPhoneNumber('123(456)7890') === '(123) 456-7890');
console.log(cleanPhoneNumber('123 456 7890') === '(123) 456-7890');
console.log(cleanPhoneNumber('1 234 567 89 0') === '(123) 456-7890');
console.log(cleanPhoneNumber('12345667901') === '+1 (234) 567-8901');
console.log(cleanPhoneNumber('123456789012') === '(000) 000-0000');
console.log(cleanPhoneNumber('onetwothree') === '(000) 000-0000');
console.log(cleanPhoneNumber('123hello4567world8901') === '+1 (234) 567-8901');

// console.log(cleanPhoneNumber('123456679'));
// console.log(cleanPhoneNumber('1234566790'));
// console.log(cleanPhoneNumber('(123)456-6790'));
// console.log(cleanPhoneNumber('12345667901'));
// console.log(cleanPhoneNumber('123456789012'));