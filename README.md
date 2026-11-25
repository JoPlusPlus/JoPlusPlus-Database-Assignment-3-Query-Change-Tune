# LmsTrainingLab - Query, Change & Tune Data

Simulation Academy | .NET Diploma | Cycle 1 | Database Assignment 3

This repo has my SQL answers for Assignment 3. The work is done on the `LmsTrainingLab` database (SQL Server).
The written explanations are in `NOTES.md`. The screenshots for Tasks 6 to 9 are in the `screenshots` folder.

## What is inside

| Folder / file | Content |
|---|---|
| `*.sql` | One script per group of tasks, with the task number above every answer (for example `-- 5.12`) |
| `screenshots/` | Execution plans and warnings for Tasks 6, 7, 8 and 9 |
| `NOTES.md` | Written answers: plan explanations, spill explanation, DISTINCT answer, CTO answer |

## The database

The database has 10 schemas:

`academic`, `assessment`, `attendance`, `communication`, `content`, `delivery`, `finance`, `identity`, `operations`, `ref`

## What each task covers

| Task | Topic | Result |
|---|---|---|
| 1 | The Finance Meeting | Session-only list of overdue unpaid invoices, with remaining amount, days late and priority (urgent, medium, low) |
| 2 | A New Department | DSAI department, its first course, Summer 2027 term, an announcement and a Teaching Assistant role |
| 3 | Invoice Numbers | Numbering like `LAB-INV-2026-000001` that does not depend on one table, a new invoice, and what happens to a number from a cancelled transaction |
| 4 | Next Summer's Timetable | All sections of the latest term copied into Summer 2027 in one go |
| 5 | Management Reports | 24 report queries (5.1 to 5.24), one table per query |
| 6 | Reading the Plan | Expected operators, measured reads and time, actual plan, and every operator explained |
| 7 | Make It Faster | 7 slow queries rewritten, plus my own example (7.8), with plans and logical reads before and after |
| 8 | When the Estimate Is Wrong | A sort that spills to tempdb, the warning, and the fix |
| 9 | One of Each | DISTINCT on an unindexed column and on a unique column, with plans |
| 10 | The CTO's Question | Numbers vs GUIDs for ids, with trade-offs |
| 11 | End of Semester Changes | Pass mark update, letter grades, role removal, staging table with `TRUNCATE`, cleanup |
| 12 | The Auditors Are Coming | Pass mark history and announcement archive, each in a single statement using `OUTPUT` |
| 13 | The Nightly Website Sync | One `MERGE` statement that inserts, updates and hides courses, never deletes |



## Rules I followed

- No `JOIN` in my answers. In Task 5, no subqueries either, so each query uses one table.
- The Task 6 query is the one given in the assignment, so it keeps its `JOIN`.
- If an insert failed because a value already existed, I added my initials to make it different, and kept using it.
- Tables I created for practice are dropped in 11.5. The production tables and the five production indexes are not touched.


