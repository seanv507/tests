require (penalized)
poly_order<-9
x_long<-seq(0,1, length.out = 100)
nx<-10
x<-seq(0,1, length.out = nx)
noise<- rnorm(nx, 0, 1)
noise_scale<-0.2
y<-sin(2*pi*x)+noise_scale*noise

training_data<-data.frame(x=x,y=y)
y_long<-sin(2*pi*x_long)

plot(x,y, col ='blue',ylim=c(-1.5,1.5))
lines(x_long,y_long,col='green')

polyfit_raw<-lm(y~poly(x,poly_order,raw=TRUE),data=training_data)
summary(polyfit_raw)

polyfit_raw_ridge1<-penalized(y,~poly(x,poly_order,raw=TRUE), model='linear', data=training_data, lambda2=0.0001, maxiter=10000, standardize=TRUE)

polyfit_orthog<-lm(y~poly(x,poly_order),data=training_data)
summary(polyfit_orthog)

pred_raw<-predict(polyfit_raw,data.frame(x=x_long))
pred_ortho<-predict(polyfit_orthog,data.frame(x=x_long))
pred_raw_ridge<-predict(polyfit_raw_ridge1,data=data.frame(x=x_long))[,'mu']
lines(x_long,pred_raw,col='red')
# add 0.1 offset to make visible
lines(x_long,pred_ortho+0.1,col='black')
lines(x_long,pred_raw_ridge,col='purple')
legend("bottomleft",legend=c('data sin(2 pi x) + noise','sin(2 pi x)', 
                             'raw poly','orthog poly +0.1 offset','raw poly + ridge regression'),
       fill=c('blue','green','red','black','purple'))


