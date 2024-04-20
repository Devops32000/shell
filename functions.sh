userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
scriptname=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$timestamp-$scriptname.log 
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2....$R FAILURE $N"
    else 
        echo -e "$2....$G SUCCESS $N"
    fi 
}

if [ $userid -ne 0 ]
then 
    echo "Please run with sudo previliges"
    exit 1
else
    echo "You are a super user"
fi 

dnf install mysql -y &>>$logfile
VALIDATE $? "installing mysql" 

dnf remove mysql -y &>>$logfile
VALIDATE $? "Termintaing mysql" 


