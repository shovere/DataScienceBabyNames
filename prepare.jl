using Pkg
using ZipFile
using SQLite
using CSV
using DataFrames

zipName = ARGS[1]
dbName = ARGS[2]
nameRgx = r"^yob.*\.txt$"
dateRgx = r"[12][0-9]{3}"

db = SQLite.DB(dbName)
DBInterface.execute(db, "CREATE TABLE names (
year INTEGER,
name TEXT,
sex TEXT,
num INTEGER
)")

rd = ZipFile.Reader(zipName)
for file in rd.files
    if match(nameRgx, file.name) !== nothing
        date = match(dateRgx, file.name).match 
        namesDF = CSV.File(file, header = ["name","sex","num"]) |> DataFrame
        namesDF[!,:year] .= date
        namesDF |> SQLite.load!(db, "names")
    end 
end 

close(rd)
close(db)