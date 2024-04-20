userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Please run with sudo previliges"
    exit 1 
else 
    echo "You are a super user"
fi 

dnf install mysql -y 
if [ $? -ne 0 ]
then 
    echo "Installation of mysql....FAILED"
    exit 1 
else 
    echo "Installation of mysql....SUCCESSFUL"
fi 

dnf remove mysql -y 
if [ $? -ne 0 ]
then 
    echo "removal of mysql....FAILED"
    exit 1 
else 
    echo "removal of mysql....SUCCESSFUL"
fi 

