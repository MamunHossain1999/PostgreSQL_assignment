
## What is PostgreSQL?

PostgreSQL হলো একটি ওপেন-সোর্স **relational database system** যা নিরাপত্তা, স্থায়িত্ব ও আধুনিক ফিচারের জন্য জনপ্রিয়। এটি traditional SQL ও JSON ডেটা সাপোর্ট করে, তাই relational ও non-relational ডেটা হ্যান্ডেল করা যায়।

**মূল বৈশিষ্ট্য:**

- ACID compliant: ডেটা সঠিক ও নিরাপদ রাখে
- Custom data types ও extensibility
- শক্তিশালী indexing (B-tree, Hash, GIN, GiST)
- Full-text search
- Replication ও High Availability
- PL/pgSQL, PL/Python ইত্যাদি ভাষায় stored procedure লেখা যায়
- JSON ও geospatial data সাপোর্ট

PostgreSQL শুরু হয় 1986 সালে, UC Berkeley-তে POSTGRES প্রকল্প হিসেবে, পরে SQL সাপোর্ট যুক্ত হয়ে এটি PostgreSQL নামে পরিচিত হয়।

---

## What is the purpose of a database schema in PostgreSQL?

Schema হলো ডেটাবেইসের ভিতরের একটি লজিক্যাল গ্রুপ, যেখানে টেবিল, ফাংশন, ইনডেক্স ইত্যাদি রাখা হয়।

**Schema ব্যবহারের উদ্দেশ্য:**

- অবজেক্ট আলাদা করে সংগঠিত রাখা
- একই নামে অবজেক্ট থাকলেও নামের সংঘর্ষ এড়ানো
- ইউজারভিত্তিক পারমিশন কন্ট্রোল
- বড় অ্যাপ্লিকেশনকে অংশে ভাগ করে পরিচালনা

উপসংহার: স্কিমা ডেটাবেইসকে পরিচ্ছন্ন, সুশৃঙ্খল ও নিরাপদ রাখতে সাহায্য করে।

---

## Primary Key এবং Foreign Key কী?

**Primary Key:** টেবিলের এমন একটি কলাম যা প্রতিটি রেকর্ডকে ইউনিকভাবে সনাক্ত করে। এটি ডুপ্লিকেট ও NULL ভ্যালু রাখে না।

**Foreign Key:** একটি টেবিলের এমন একটি কলাম যা অন্য টেবিলের Primary Key কে রেফার করে এবং টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করে।

উপসংহার: Primary Key ডেটাকে ইউনিক রাখে, আর Foreign Key ডেটার মধ্যে সম্পর্ক বজায় রাখে।

---

## Difference between VARCHAR and CHAR data types

| Feature     | VARCHAR                                    | CHAR                                       |
|-------------|--------------------------------------------|--------------------------------------------|
| Length      | Variable length                            | Fixed length                              |
| Storage     | Actual string length + 1-2 bytes overhead | Always full defined length, padded if needed |
| Use Case    | Variable length data (e.g., names, emails)| Fixed length data (e.g., country codes)   |
| Performance | Slightly slower due to length calculation  | Faster because of fixed length             |
| Padding    | No padding; stores exact input             | Pads with spaces to fill fixed length      |

**Summary:**  
- **VARCHAR** ব্যবহার করবেন যখন ডেটার দৈর্ঘ্য পরিবর্তনশীল হয়।  
- **CHAR** ব্যবহার করবেন যখন ডেটার দৈর্ঘ্য সবসময় একই থাকে।

---

## Purpose of the WHERE clause in a SELECT statement

**WHERE** ক্লজ ব্যবহার করা হয় ডাটাবেজ থেকে এমন রেকর্ড বাছাই করার জন্য যা নির্দিষ্ট শর্ত পূরণ করে। এর মাধ্যমে পুরো টেবিল থেকে না নিয়ে শুধু প্রয়োজনীয় ডেটাই পাওয়া যায়।

### কাজের ধাপ:

- SELECT স্টেটমেন্টের পরে WHERE ক্লজ লেখা হয়।
- এতে একটি বা একাধিক শর্ত দেওয়া হয়।
- শর্ত পূরণকারী সারিগুলো রিটার্ন হয়, বাকি বাদ পড়ে যায়।

### উদাহরণ:

```sql
SELECT * FROM employees
WHERE department = 'Sales';
