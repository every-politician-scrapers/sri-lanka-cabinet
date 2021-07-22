// wd create-entity create-office.js "Minister for X"
module.exports = (label) => {
  return {
    type: 'item',
    labels: {
      en: label,
    },
    descriptions: {
      en: 'Sri Lankan Cabinet position',
    },
    claims: {
      P31:   { value: 'Q294414' }, // instance of: public office
      P279:  { value: 'Q83307'  }, // subclas of: minister
      P17:   { value: 'Q854'    }, // country: Sri Lanka
      P1001: { value: 'Q854'    }, // jurisdiction: Sri Lanka
      P361: {
        value: 'Q3783006',         // part of: Cabinet of Sri Lanka
        references: {
          P854: 'http://www.cabinetoffice.gov.lk/cab/index.php?option=com_content&view=article&id=25&Itemid=23&lang=en',
        },
      }
    }
  }
}
