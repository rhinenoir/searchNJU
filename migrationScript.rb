require 'mysql2'
require 'pg'
begin
    client=Mysql2::Client.new(
        :host       =>  'localhost',
        :username   =>  "#{ARGV[0]}",
        :password   =>  "#{ARGV[1]}",
        :database   =>  'NJUCourses',
        :encoding   =>  'utf8'
    )
    clipre=PG.connect(
        :host       =>  'localhost',
        :user       =>  "#{ARGV[2]}",
        :password   =>  "#{ARGV[3]}",
        :dbname     =>  'NJUCourses',
    )
rescue Exception => e
    puts "Error: #{e.message} Connect again!"
    retry
end

# result=client.query("SELECT * from CoursesMain where id = '10060040A'")
# result.each do |row|
#     puts row["name"]
#     clipre.exec("INSERT INTO CoursesMain(id,name,point,time,area,teacher,academy,special,term) VALUES('"+row["id"]+"','"+row["name"]+"',"+row["point"].to_s+","+row["time"].to_s+",'"+row["area"]+"','"+row["teacher"]+"','"+row["academy"]+"','"+row["special"]+"','"+row["term"]+"')")
# end
checkEmpty=clipre.query("SELECT COUNT(*) FROM Coursesmains")
if checkEmpty[0]['count'] != "0"
    puts "Clear table(#{checkEmpty[0]['count']} lines): Coursesmains"
    clipre.exec("TRUNCATE TABLE Coursesmains")
end

checkEmpty=clipre.query("SELECT COUNT(*) FROM Coursesothers")
if checkEmpty[0]['count'] != "0"
    puts "Clear table(#{checkEmpty[0]['count']} lines): Coursesothers"
    clipre.exec("TRUNCATE TABLE Coursesothers")
end


puts "CoursesMain(MySQL) => Coursesmains(PostgreSQL) migration start!"
res=client.query("SELECT * from CoursesMain")
res.each do |row|
    puts "insert: #{row['name']}, #{row['teacher']}"
    clipre.exec("INSERT INTO Coursesmains(classid,name,point,time,area,teacher,academy,special,term) VALUES('"+row["id"]+"','"+row["name"]+"',"+row["point"].to_s+","+row["time"].to_s+",'"+row["area"]+"','"+row["teacher"]+"','"+row["academy"]+"','"+row["special"]+"','"+row["term"]+"')")
end

puts "CoursesOther(MySQL) => Coursesothers(PostgreSQL) migration start!"
res=client.query("SELECT * from CoursesOther")
res.each do |row|
    puts "insert: #{row['name']}, #{row['teacher']}"
    clipre.exec("INSERT INTO Coursesothers(classid,name,point,area,teacher,climit,ctype,note) VALUES('"+row["id"]+"','"+row["name"]+"',"+row["point"].to_s+",'"+row["area"]+"','"+row["teacher"]+"','"+row["climit"].to_s+"','"+row["ctype"].to_s+"','"+row["note"]+"')")
end
