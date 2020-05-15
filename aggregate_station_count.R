install.packages("xlsx")

# Recognize Chinese 识别中文
Sys.setlocale(category = "LC_ALL", locale = "Chinese")

# Read file 读取文件
library(readxl)
data <- read_excel("C:/Users/yangy/Desktop/data.xlsx")

station <- data$站名

# Aggregate count for each unique station 统计每个站点的数量
station_count <- aggregate(data$资产码 ~ data$站名, data, function(x) length(unique(x)))


# Edit column name 修改列名
names(station_count)[names(station_count) == "data$站名"] <- "station"
names(station_count)[names(station_count) == "data$资产码"] <- "count"

station_count

# library for writing to xlsx 调用包-写入excel格式
library("xlsx")

# Write to file 写入文件
write.xlsx(station_count, "C:/Users/yangy/Desktop/station_count.xlsx", sheetName = "station_count", col.names = TRUE, row.names = FALSE, append = FALSE)
