library(ggplot2)
library(hrbrthemes)                       

get_data = function(fname, type, N = NULL) {
  o = readRDS(fname)
  o = o[o$V1 == 0 & o$n > 2,]# Bug re-running
  o$type = type
  o = o[order(-o$util),]  
  o$id = 1:nrow(o)
  o$se = sqrt((o$util2 - o$util^2)/(o$n-1))/sqrt(o$n)
  o$mean = o$util
  if(!is.null(N)) o = o[1:min(N,nrow(o)), ]
  o
}

N = 100
o1 = get_data(fname = "data/aphids/output4/aphids1.Rds", type="Initialisation", N)
o2 = get_data(fname = "data/aphids/output4/aphids2.Rds", type="m = 1", N)
o3 = get_data(fname = "data/aphids/output4/aphids3.Rds", type="m = 2", N)
o4 = get_data(fname = "data/aphids/output4/aphids4.Rds", type="m = 3", N)

o = rbind(o1, o2)
o = rbind(o, o3)
o = rbind(o, o4)
#o = rbind(o, o5)
#o = rbind(o, o6)

extrafont::loadfonts()
g = ggplot(o) + 
  geom_errorbar(aes(x=id, ymin=mean-2*se, ymax=mean+2*se), size=0.1) + 
  geom_point(aes(id, mean), size=0.5) + 
  theme_ipsum_rc() + 
  labs(y="u(d)", x=NULL)  + 
  facet_grid(~type)
g

fname = "graphics/figure9.pdf"
pdf(fname, width = 8, height = 6)
suppressMessages(extrafont::loadfonts())
print(g)
dev.off()
system(paste("pdfcrop", fname))