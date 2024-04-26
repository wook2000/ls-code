function generatePattern(nStars) {
  for (let lineNumber = 1; lineNumber <= nStars; lineNumber +=1) {
    let message = '';

    for (let charPosition = 1; charPosition <= nStars; charPosition += 1) {
      message += charPosition <= lineNumber ? String(charPosition) : '*'
    }

    console.log(message);
  }
}

generatePattern(7);
