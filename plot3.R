file <- read.table("./household_power_consumption.txt", stringsAsFactors=FALSE, header=FALSE, sep=";", nrow=1000000)
file2 <- read.table("./household_power_consumption.txt", stringsAsFactors=FALSE, header=FALSE, sep=";", skip=1000000)
file3 <- file[file$V1 %in% c("1/2/2007", "2/2/2007"),]
file3$V1V2 <- paste(file3$V1, file3$V2)
file3$V1V2 <- strptime(file3$V1V2, "%d/%m/%Y %H:%M:%S")

file3$V3 <- as.numeric(file3$V3)
par(bg = "white")
plot(file3$V1V2, file3$V7, type="l", xlab="", ylab="Energy sub metering")
lines(file3$V1V2, file3$V8, col="red")
lines(file3$V1V2, file3$V9, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=c(1,1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()