// wb ar add-source-name.js Q97131330-4C4A7FD7-C10F-4D38-B5FD-03F6EADF409A "Vassilios Demetriades" "Deputy Minister of Shipping"

module.exports = (guid, name, position) => ({
    guid,
    snaks: {
      P854: 'http://www.cabinetoffice.gov.lk/cab/index.php?option=com_content&view=article&id=25&Itemid=23&lang=en',
      P1476: {
        text: 'LIST OF CABINET MINISTERS',
        language: 'en',
      },
      P813: new Date().toISOString().split('T')[0],
      P407: 'Q1860', // language: English
      P1810: name, // named as (Person)
      P1932: position, //stated as (Position)
    }
})
