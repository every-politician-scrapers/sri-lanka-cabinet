module.exports = (id, position) => ({
  id,
  claims: {
    P39: {
      value: position,
      qualifiers: {
        P580: '2020-08-12',
        P5054: 'Q104847864' // Second Gotabaya Rajapaksa cabinet
      },
      references: {
        P854: 'http://www.cabinetoffice.gov.lk/cab/index.php?option=com_content&view=article&id=25&Itemid=23&lang=en',
        P1476: {
          text: 'LIST OF CABINET MINISTERS',
          language: 'en',
        },
        P813: new Date().toISOString().split('T')[0],
        P407: 'Q1860', // language: English
      }
    }
  }
})
