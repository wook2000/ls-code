function indexOf(firstString, secondString) {
  for (let index1 = 0; index1 <= firstString.length - secondString.length; index1 += 1) {
    let count = 0;

    for (let index2 = 0; index2 <= secondString.length - 1; index2 += 1) {
      if (firstString[index1 + index2] === secondString[index2]) {
        count += 1;
      } else {
        break;
      }
    }

    if (count === secondString.length) return index1;
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
  for (let index1 = firstString.length - secondString.length; index1 >= 0; index1 -= 1) {
    let count = 0;

    for (let index2 = 0; index2 <= secondString.length - 1; index2 += 1) {
      if (firstString[index1 + index2] === secondString[index2]) {
        count += 1;
      } else {
        break;
      }
    }

    if (count === secondString.length) return index1;
  }

  return -1;
}

console.log(indexOf('Some strings', 's'));
console.log(indexOf('Blue Whale', 'Whale'));
console.log(indexOf('Blue Whale', 'Blute'));
console.log(indexOf('Blue Whale', 'leB'));

console.log(lastIndexOf('Some strings', 's'));
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));