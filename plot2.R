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

df_filter$Global_active_power=as.numeric(df_filter$Global_active_power)

plot(df_filter$full_time,df_filter$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")


dev.copy(png,"plot2.png")

dev.off()