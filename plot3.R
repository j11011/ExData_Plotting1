library(lubridate)

#change lenguage to english
Sys.setlocale("LC_ALL", "English")

# read the data

df = read.table("household_power_consumption.txt",
                sep=";",header = T,stringsAsFactors = F,na.strings = "?")




df$full_time=paste(df$Date,df$Time)
df$full_time= dmy_hms(df$full_time)

df$Date= dmy(df$Date)


df_filter = df[is.element(df$Date,as.Date(c("2007-02-01","2007-02-02"))), ]



df_filter <- df_filter[complete.cases(df_filter),]


df_filter$Sub_metering_1 =as.numeric(df_filter$Sub_metering_1)

df_filter$Sub_metering_2  =as.numeric(df_filter$Sub_metering_2)

df_filter$Sub_metering_3 =as.numeric(df_filter$Sub_metering_3)


plot(df_filter$full_time,df_filter$Sub_metering_1,type="l",xlab = "",
     ylab = "Energy sub metering")


lines(df_filter$full_time,df_filter$Sub_metering_2,col="red")

lines(df_filter$full_time,df_filter$Sub_metering_3,col="blue")



legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","blue","red"), lty = "solid",
       y.intersp=0.2,x.intersp=0.2,text.width=50000,cex=0.8)

dev.copy(png,"plot3.png", width=480, height=480)

dev.off()