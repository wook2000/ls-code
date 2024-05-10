function firstLetter(string) {
  return string[0];
}

function acronym(string) {
  console.log(string.split(/[- ]/).map(firstLetter).join('').toUpperCase());
}

acronym('Portable Network Graphics');                  // "PNG"
acronym('First In, First Out');                        // "FIFO"
acronym('PHP: HyperText Preprocessor');                // "PHP"
acronym('Complementary metal-oxide semiconductor');    // "CMOS"
acronym('Hyper-text Markup Language');                 // "HTML"