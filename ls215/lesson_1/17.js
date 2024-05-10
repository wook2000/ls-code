function anagram(word, list) {
  const isAnagram = function(string) {
    return string.split('').sort().join('') === word.split('').sort().join('');
  };

  return list.filter(isAnagram);
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
