# DataScienceBabyNames
utilize bash,sqlite3 and julialang to create a data processing activity with the names.zip dataset.
https://www.ssa.gov/oact/babynames/limits.html it would be neat to grab the zip archive using julia or bash

# prepare.jl
This program load sthe data into a sqlite database from the zip archive downloaded from Data.gov. 
TODO
Read the name of the input file and output file from the command line. You can access the command line arguments via the string array ARGS. See this post https://stackoverflow.com/questions/21056991/access-command-line-arguments-in-julia
Use the Julia ZipFile.jl https://github.com/fhs/ZipFile.jl library to scan the input zip file. This example https://www.geeksforgeeks.org/importing-data-from-files-in-julia/ might also be useful 
Use SQlite.jl https://github.com/JuliaDatabases/SQLite.jl library to interface with SQLite3. You can find some documentation here https://juliadatabases.org/SQLite.jl/stable/
Create the BabyNames table using SQLite.jl. See this blog post for https://girldatamaster.wordpress.com/2018/04/13/loading-the-data-into-sqlite3/ the schema you can use 
Scan the input zip file, find files with names "yob????.txt"
For each such file, scan the content using the CSV.jl https://csv.juliadata.org/stable/ package 
For each entry in the data file, write an entry in the table "names" recording the "year" (from the file name), "name", "sex" and "num" from the file content.
Close the zip scanner and database connection

# plot.jl
This program will take a database, a name  and the sex as an argument and produce a plot over time of the frequency of the name:
TODO
Tasks to accomplish:

Parse the command line arguments to extract the input
Establish database connection to the database file using SQLite.jl library
Query the database to get the year, num pair for the provided name and sex
Sort the data on year
Plot the data using Gadfly https://towardsdatascience.com/gadfly-jl-the-pure-julia-plotting-library-from-your-dreams-3ee6ca107a5c library (more documentation http://gadflyjl.org/stable/)

# Piecing
Create another README.md once completed and put both files in zip archive.


# getting zip file 
wget https://www.ssa.gov/oact/babynames/names.zip