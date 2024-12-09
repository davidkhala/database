`$addToSet`: add a value (if not exist) to an array

`$inc`: increments a field by a specified value.
- It can accept negative values.
- If the field does not exist, it creates the field and sets the field to the specified value.
  - But if the field has a null value, it throw an error.
