# All questions needed are answered in their sql file


# TASK 10
- `id` is good for unique value across one DB , if we want a unique id across multiple DBs -> use `GUID`
- `id` consume small size (4bytes usually) while `GUID` takes 16bytes, so if we want to oprimize for space -> id
