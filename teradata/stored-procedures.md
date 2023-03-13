# Scripts, Run Files, Macros, and Stored Procedures
Depending on where they are stored and how they are executed, files that contain a user’s BTEQ commands and Teradata SQL statements are called scripts, run files, macros, or stored procedures.

Like PL/SQL files

## Script (input stream file)
- A disk file contained in `SYSIN` file on mainframe-attached system
- It contains query that produces a standard report or display, which should have been thoroughly tested
- Scripts in `SYSIN` mean they will be executed automatically when BTEQ is invoked.
## Run files
- A disk file containing query can be used repeatedly.
- To execute the file, define the file with a z/OS DD statement. Then, invoke BTEQ and use the RUN command to execute the file.

## Stored Procedures
- A file that is created, compiled and stored on Teradata
- Is executed in response to SQL `CALL` statement.
- Either externally or internally
## Macro
- Act as a sort of polymorphic (parameterized) view
- A file that is created and stored on Teradata
- Is executed in response to SQL `EXECUTE` statement.
- Use case similar to Run file
# Basic Teradata Query (BTEQ)
- It is a command-driven utility, used to run any DML statement, DDL statement, create Macros, and stored procedures.
- BTEQ utility is used in both batch and user-interactive mode.
  - Batch mode has error checking and conditional logic, and allows for the work to be done in the background.
