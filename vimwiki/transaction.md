#Updating data with transactions

Using the Cloud Firestore client libraries, you can group multiple operations into a single transaction. Transactions are useful when you want to update a field's value based on its current value, or the value of some other field.

A transaction consists of any number of get() operations followed by any number of write operations such as set(), update(), or delete(). In the case of a concurrent edit, Cloud Firestore runs the entire transaction again. For example, if a transaction reads documents and another client modifies any of those documents, Cloud Firestore retries the transaction. This feature ensures that the transaction runs on up-to-date and consistent data.

Transactions never partially apply writes. All writes execute at the end of a successful transaction.

When using transactions, note that:

Read operations must come before write operations.
A function calling a transaction (transaction function) might run more than once if a concurrent edit affects a doument that the transaction reads.
Transaction functions should not directly modify application state.
Transactions will fail when the client is offline.
The following example shows how to create and run a transaction:


** the transaction must return a promise therefore it is good practice to pass an async function as a callback as this will always return a promise

VERSION 8
``` javascript
// Initialize document
const cityRef = db.collection('cities').doc('SF');
await cityRef.set({
  name: 'San Francisco',
  state: 'CA',
  country: 'USA',
  capital: false,
  population: 860000
});

try {
  await db.runTransaction(async (t) => {
    const doc = await t.get(cityRef);

    // Add one person to the city population.
    // Note: this could be done without a transaction
    //       by updating the population using FieldValue.increment()
    const newPopulation = doc.data().population + 1;
    t.update(cityRef, {population: newPopulation});
  });

  console.log('Transaction success!');
} catch (e) {
  console.log('Transaction failure:', e);
}
```


VERSION 9
``` javascript
import { runTransaction } from "firebase/firestore";

try {
  await runTransaction(db, async (transaction) => {
    const sfDoc = await transaction.get(sfDocRef);
    if (!sfDoc.exists()) {
      throw "Document does not exist!";
    }

    const newPopulation = sfDoc.data().population + 1;
    transaction.update(sfDocRef, { population: newPopulation });
  });
  console.log("Transaction successfully committed!");
} catch (e) {
  console.log("Transaction failed: ", e);
}
```
