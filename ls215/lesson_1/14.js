let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

const calcRectangleArea = function(rectangle) {
  return rectangle[0] * rectangle [1];
};

const add = function(previousValue, element) {
  return previousValue + element;
};

const totalArea = function(array) {
  return array.map(calcRectangleArea).reduce(add);
};

const isSquare = function(rectangle) {
  // if (rectangle[0] === rectangle[1]) {
  //   return true;
  // } else {
  //   return false;
  // }
  return rectangle[0] === rectangle[1];
};
const totalSquareArea = function(array) {
  // return array.filter(isSquare).map(calcRectangleArea).reduce(add);
  return totalArea(array.filter(isSquare));
};

console.log(totalArea(rectangles));    // 141
console.log(totalSquareArea(rectangles));    // 121
