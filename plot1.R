file <- read.table("./household_power_consumption.txt", stringsAsFactors=FALSE, header=FALSE, sep=";", nrow=1000000)
file2 <- read.table("./household_power_consumption.txt", stringsAsFactors=FALSE, header=FALSE, sep=";", skip=1000000)
file3 <- file[file$V1 %in% c("1/2/2007", "2/2/2007"),]
file3$V1V2 <- paste(file3$V1, file3$V2)
file3$V1V2 <- strptime(file3$V1V2, "%d/%m/%Y %H:%M:%S")

file3$V3 <- as.numeric(file3$V3)
par(bg = "white")
hist(file3$V3,main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()