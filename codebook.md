#Dataset: Electric power consumption

##Description: 
Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the [UCI web site](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)

## Variables
After transformation by the script in plot1.R plot2.R plot3.R or plot4.R the variables are arranged as follows:

__Date__: Date object between 2007-02-01 and 2007-02-02
__Time__: time in POSIXct format from 2007-02-01 00:00:00 to 2007-02-02 23:59:00
__GlobalActivePower__: household global minute-averaged active power (in kilowatt)
__GlobalReactivePower__: household global minute-averaged reactive power (in kilowatt)
__Voltage__: minute-averaged voltage (in volt)
__GlobalIntensity__: household global minute-averaged current intensity (in ampere)
__SubMetering1__: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
__SubMetering2__: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
__SubMetering3__: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.