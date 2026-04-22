data <- read.csv(file.choose())

retval <- subset(data, likes == 222)

write.csv(retval, "runoob.csv")
print(read.csv("runoob.csv"))