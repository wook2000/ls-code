function calcGrade() {
  let rlSync = require('readline-sync');
  let scores = [];

  for (let round = 0; round < 3; round += 1) {
    let score = rlSync.question(`Enter score ${round + 1}: `);
    scores[round] = parseInt(score, 10);
  }

  average = scores.reduce((accum, elem) => accum + elem, 0) / 3;

  let grade;
  if (average >= 90) {
    grade = 'A';
  } else if (average >= 70) {
    grade = 'B';
  } else if (average >= 50) {
    grade = 'C';
  } else {
    grade = 'F';
  }

  console.log(`Based on the average of your 3 scores your letter grade is "${grade}".`)
}

calcGrade();
