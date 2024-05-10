function standardizeToDash(string) {
  return string.replace(/(:|\.\.)/g, '-');
}

function convertToArray(string) {
  return string.match(/([\d]+|-)/g);
}

function toLongHand(array) {
  let lastNum = 0;

  return array.map((elem, idx) => {
    if (idx === 0) {
      lastNum = Number(elem);
      return lastNum;
    } else if (elem === '-') {
      return elem;
    } else {
      let digitPlace = Math.pow(10, elem.length);

      if (lastNum % digitPlace <= Number(elem)) {
        lastNum = (Math.floor(lastNum / digitPlace) * digitPlace) + Number(elem);
        return lastNum;
      } else {
        lastNum = (Math.ceil(lastNum / digitPlace) * digitPlace) + Number(elem);
        return lastNum;
      }
    }
  });
}

function expandRange(array) {
  let index = array.indexOf('-');

  while (index !== -1) {
    let start = array[index - 1];
    let end = array[index + 1];
    let rangeArr = [];
    for (let num = start + 1; num < end; num += 1) {
      rangeArr.push(num);
    }

    array.splice(index, 1, ...rangeArr);
    index = array.indexOf('-');
  }

  return array;
}

function completeNumbers(numberStr) {
  let numberArr = toLongHand(convertToArray(standardizeToDash(numberStr)));
  return expandRange(numberArr).join(', ');
}

console.log(completeNumbers("1, 3, 7, 2, 4, 1")); //--> 1, 3, 7, 12, 14, 21
console.log(completeNumbers("1-3, 1-2")); //--> 1, 2, 3, 11, 12
console.log(completeNumbers("1:5:2")); //--> 1, 2, 3, 4, 5, 6, ... 12
console.log(completeNumbers("104-2")); //--> 104, 105, ... 112
console.log(completeNumbers("104-02")); //--> 104, 105, ... 202
console.log(completeNumbers("545, 64:11")); //--> 545, 564, 565, .. 611