'use strict';

function addScores(score1, score2) {
  return score1 + score2;
}

function getStudentAverage(scoreArr) {
  return Math.round(scoreArr.reduce(addScores) / scoreArr.length);
}

const EXAM_WEIGHT = 0.65;
const EXERCISE_WEIGHT = 0.35;

function getNumberGrade(exams, exercises) {
  return Math.round((exams * EXAM_WEIGHT) + (exercises * EXERCISE_WEIGHT));
}

const MIN_GRADE_A = 93;
const MIN_GRADE_B = 85;
const MIN_GRADE_C = 77;
const MIN_GRADE_D = 69;
const MIN_GRADE_E = 60;

function getLetterGrade(grade) {
  if (grade >= MIN_GRADE_A) {
    return 'A';
  } else if (grade >= MIN_GRADE_B) {
    return 'B';
  } else if (grade >= MIN_GRADE_C) {
    return 'C';
  } else if (grade >= MIN_GRADE_D) {
    return 'D';
  } else if (grade >= MIN_GRADE_E) {
    return 'E';
  } else {
    return 'F';
  }
}

function generateStudentReport(number, letter) {
  return `${String(number)} (${letter})`;
}

function getStudentScore(scoreObj) {
  let examAverage = getStudentAverage(scoreObj.exams);
  let exercisesTotal = scoreObj.exercises.reduce(addScores);
  let finalNumberGrade = getNumberGrade(examAverage, exercisesTotal);
  let finalLetterGrade = getLetterGrade(finalNumberGrade);

  return generateStudentReport(finalNumberGrade, finalLetterGrade);
}

function findMinScore(minScore, currentScore) {
  return currentScore <= minScore ? currentScore : minScore;
}

function findMaxScore(maxScore, currentScore) {
  return currentScore >= maxScore ? currentScore : maxScore;
}

function getExamAverage(scoreArr) {
  return parseFloat((scoreArr.reduce(addScores) / scoreArr.length).toFixed(1));
}

function getExamMin(scoreArr) {
  return scoreArr.reduce(findMinScore);
}

function getExamMax(scoreArr) {
  return scoreArr.reduce(findMaxScore);
}

function getExamStats(examScoreArr) {
  return {
    average: getExamAverage(examScoreArr),
    minimum: getExamMin(examScoreArr),
    maximum: getExamMax(examScoreArr),
  };
}

function transpose(nestedArray) {
  return nestedArray[0].map((examScore, examNumber) => {
    return nestedArray.map(studentExamArr => studentExamArr[examNumber]);
  });
}

function getExamSummary(examData) {
  let scoresPerExam = transpose(examData);

  return scoresPerExam.map(getExamStats);
}

function generateClassRecordSummary(scores) {
  let scoreData = Object.keys(scores).map(student => scores[student].scores);
  let examData = scoreData.map(score => score.exams);

  return {
    studentGrades: scoreData.map(getStudentScore),
    exams: getExamSummary(examData),
  };
}

let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassRecordSummary(studentScores));

// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }