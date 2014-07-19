#aFile =  File.new("D:/Study/Ruby/Scripts/Basics/file/output/newfile1.txt","w")
#aFile.puts "This is an alternative way to write"
#aFile.close

##File.absolute_path("Ruby_Path","D:/Study/Ruby/Scripts/") -- don't understand the use

File.open("D:/Study/Ruby/Scripts/Basics/file/output/newfile1.txt", "w") do |aFile|
	while line=gets.chomp
		if line=="Exit"
			break
		end
		aFile.puts line
   end
end

File.open("D:/Study/Ruby/Scripts/Basics/file/output/newfile1.txt", "r") do |bfile|
	while getline=bfile.gets
		puts getline
	end
end