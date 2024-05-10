function isBalanced(string) {
  let stringArr = string.split('');
  let left = 0;
  let right = 0;

  for (let idx = 0; idx < stringArr.length; idx += 1) {
    if (left - right < 0) {
      console.log(false);
      return;
    } else if (/\(/.test(stringArr[idx])) {
      left += 1;
    } else if (/\)/.test(stringArr[idx])) {
      right += 1;
    }
  }

  console.log(left === right);
}

isBalanced('What (is) this?');        // true
isBalanced('What is) this?');         // false
isBalanced('What (is this?');         // false
isBalanced('((What) (is this))?');    // true
isBalanced('((What)) (is this))?');   // false
isBalanced('Hey!');                   // true
isBalanced(')Hey!(');                 // false
isBalanced('What ((is))) up(');       // false