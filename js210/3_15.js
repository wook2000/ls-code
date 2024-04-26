function trim(string) {
  let trimmed = trimLeft(string);
  trimmed = trimRight(trimmed);

  return trimmed;
}

function trimLeft(string) {
  let trimmed = '';
  let whiteSpace = true;

  for (let index = 0; index < string.length; index += 1) {
    if (string[index] !== ' ') {
      whiteSpace = false;
    }

    if (!whiteSpace) {
      trimmed += string[index];
    }
  }

  return trimmed;
}

function trimRight(string) {
  let trimmed = '';
  let whiteSpace = true;

  for (let index = string.length - 1; index >= 0; index -= 1) {
    if (string[index] !== ' ') {
      whiteSpace = false;
    }

    if (!whiteSpace) {
      trimmed = string[index] + trimmed;
    }
  }

  return trimmed;
}

console.log(trim('  abc  '));
console.log(trim('abc   '));
console.log(trim(' ab c'));
console.log(trim(' a b  c'));
console.log(trim('      '));
console.log(trim(''));
