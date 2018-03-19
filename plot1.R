library(lubridate)

# read the data

df = read.table("household_power_consumption.txt",
           sep=";",header = T,stringsAsFactors = F,na.strings = "?")

df$Date= dmy(df$Date)


head(df$Date)

df_filter = df[is.element(df$Date,as.Date(c("2007-02-01","2007-02-02"))), ]

df_filter$Global_active_power=as.numeric(df_filter$Global_active_power)


df_filter <- df_filter[complete.cases(df_filter),]



hist(df_filter$Global_active_power, col="red", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png,"plot1.png", width=480, height=480)

dev.off()