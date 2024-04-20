userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
scriptname=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$timestamp-$scriptname.log 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0]
    then 
        echo -e "$2...$R FAILURE $N"
        exit 1
    else 
        echo -e "$2...$G SUCCESS $N"
    fi 

}

if [ $userid -ne 0 ]
then 
    echo "Please run with sudo previliges"
else
    echo "You are a super user"
fi 

for i in $@
do
    echo "package to install $i"
    dnf list installed $i &>>$logfile
    if [ $? -eq 0 ]
    then 
        echo -e "$i already installed...$Y SKIPPING $N"
    else 
        dnf install $i -y &>>$logfile
        VALIDATE $? "Installation of $i" 
    fi 
done     
