using Pkg
using SQLite

dbName = ARGS[1]
babyName = ARGS[2]
gender = ARGS[3]

db = SQLite.DB(dbName)
