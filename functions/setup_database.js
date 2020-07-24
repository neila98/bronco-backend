const db = require('./api/database')

async function setupDatabase(req, res, next) {
    // To delete all the collections
    const collections = ['users', 'users']
    collections.forEach(async (collection) => await deleteCollection(collection))

    // Add documents to the todos collection
    addDocuments(
        'users',
        [
            { email: 'bella_e29@yahoo.com', fname: 'nabilah', password: '1234567890', surname: 'samsul' },
            { email: 'faizah@gmail.com', fname: 'faizah', password: '12345', surname: 'ahmad'},
            { email: 'sarah@gmail.com', fname: 'sarah', password: '1234567890', surname: 'khairi' },
            //{ title: 'NURUL NABILAH', completed: true },
            //{ title: 'IZZAH ATHIRAH', completed: true },
            //{ title: 'INTAN SYAHIRAH', completed: false },
            //{ title: 'FITRI NABIHA', completed: false },
            //{ title: 'FATIN HANANI', completed: true }
        ]
    )

    res.send('Setting Up Database.... Done ')
}

async function deleteCollection(collection) {
    const cref = db.firestore.collection(collection)
    const docs = await cref.listDocuments()
    docs.forEach((doc) => doc.delete())
}

function addDocuments(collection, docs) {
    docs.forEach((doc) => db.create(collection, doc))
}

module.exports = setupDatabase