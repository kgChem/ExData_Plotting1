Dataset: Electric power consumption

Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the [UCI web site:](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)

Date: Date in format dd/mm/yyyy
Time: time in format hh:mm:ss
Global_active_power: household global minute-averaged active power (in kilowatt)
Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
Voltage: minute-averaged voltage (in volt)
Global_intensity: household global minute-averaged current intensity (in ampere)
Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.



R> DF <- data.frame(n=1:26, l=LETTERS)
R> write.csv(DF, file="/tmp/data.csv", row.names=FALSE)
R> read.csv(pipe("awk 'BEGIN {FS=\",\"} {if ($1 > 20) print $0}' /tmp/data.csv"),
+           header=FALSE)
  V1 V2
1 21  U
2 22  V
3 23  W
4 24  X
5 25  Y
6 26  Z
R> 

Here we use awk. We tell awk to use a comma as a field separator, and then use the conditon 'if first field greater than 20' to decide if we print (the whole line via $0).

The output from that command can be read by R via pipe().

This is going to be faster and more memory-efficient than reading everythinb into R.