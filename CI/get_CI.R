#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
fileName = args[1]
OutputName = args[2]
data <- read.delim(fileName, header=T)

rab <- sort(data$rab)
R1 <- sort(data$R1)
R0 <- sort(data$R0)

lowerindex = as.integer(length(rab) / 40)
upperindex = length(rab) - lowerindex

RABlowerCI = rab[lowerindex]
RABupperCI = rab[upperindex]
#print(RABlowerCI)
#print(RABupperCI)

R0lowerCI = R0[lowerindex]
R0upperCI = R0[upperindex]

R1lowerCI = R1[lowerindex]
R1upperCI = R1[upperindex]


a = data$a[1]
b = data$b[1]

line=paste(a,b, RABlowerCI, RABupperCI, R0lowerCI, R0upperCI, R1lowerCI, R1upperCI, sep=",")
write(line, file=OutputName, append=TRUE)
