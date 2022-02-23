# Creating a firestore timestamp from a date

Firestore timestamps work with the same format as dates, but with microsecond precision.
you can see them as objects with two properties:
seconds and nanoseconds.

```
{
	"seconds": 1548894200,
	"nanoseconds": 0
}
```

you can create a timestamp from a date by using the firestore.Timestamp() function like so:

```
const timestamp = admin.firestore.Timestamp.fromDate(new Date())
```
