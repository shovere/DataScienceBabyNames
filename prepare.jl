
#important note, any packages must be added via the repl terminal, no fuckin clue why 
#im asuming ya gotta do like a config file or some shit so that the thing will work without a bunch of bullshit 
using Pkg
using ZipFile
using SQLite
using Tables

zipName = ARGS[1]
print(zipName, '\n')


rd = ZipFile.Reader(zipName)
for file in rd.files 
    println("Filename: $(file.name)")
end 
close(rd)

db = SQLite.DB("Baby_Names.sqlite")

x = Tables.rows(x)
Tables.istable(x)
Tables.schema(x) = 

SQLite.createtable!(db, "hello",Tables.schema(x), temp=false, ifnotexists=true)
println(db)