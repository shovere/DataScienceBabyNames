using Pkg
using SQLite
using Gadfly
using DataFrames

dbName = ARGS[1]
babyName = ARGS[2]
gender = ARGS[3]

replace(babyName, Pair(babyName[1:1], uppercase))
replace(babyName, Pair(babyName[2:end], lowercase))

gender = uppercase(gender)

db = SQLite.DB(dbName)
df = DataFrame(DBInterface.execute(db, "select a.year, IFNULL(b.num, 0) as Num_Named_$(babyName)
from (select DISTINCT(names.year)
     from names ) as a left join (select * 
                                  from names 
                                  where names.name = '$(babyName)') b on a.year = b.year"))

p = plot(df, y="Num_Named_$(babyName)", x="year", Geom.point)
img = SVG("babyName.svg", 14cm, 8cm)
draw(img, p)

close(db)