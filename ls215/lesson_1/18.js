let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

const updateCountry = function(band, countryName) {
  band.country = countryName;
};

const capitalizeBandName = function(band) {
  const capitalize = function(string) {
    return string.slice(0, 1).toUpperCase() + string.slice(1);
  };
  // let tempNameArray = band.name.split(' ');

  // band.name = tempNameArray.map(capitalize).join(' ');
  band.name = band.name.split(' ').map(capitalize).join(' ');
};

const removeDotsInBandName = function(band) {
  band.name = band.name.replace(/\./g, '');
};

const updateBandInfo = function(band) {
  updateCountry(band, 'Canada');
  capitalizeBandName(band);
  removeDotsInBandName(band);
  return band;
};

const processBands = function(data) {
  return data.map(updateBandInfo);
};

console.log(processBands(bands));

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]