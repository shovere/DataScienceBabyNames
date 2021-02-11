
#important note, any packages must be added via the repl terminal, no fuckin clue why 
#im asuming ya gotta do like a config file or some shit so that the thing will work without a bunch of bullshit 
using Pkg
using ZipFile
using SQLite
using Tables

zipName = ARGS[1]
print(zipName, '\n')

nameRgx = r"^yob.*\.txt$"

rd = ZipFile.Reader(zipName)
for file in rd.files
    if match(nameRgx, file.name) !== nothing
        println("Filename: $(file.name)")
    end 
end 
close(rd)

txtTocsv(file)
    

# db = SQLite.DB("Baby_Names.sqlite")

# DBInterface.execute(db, "CREATE TABLE names (
# year INTEGER,
# name TEXT,
# sex TEXT,
# num INTEGER
# )")
# println(DBInterface.execute(db, "SELECT * FROM names"))
# println(db)