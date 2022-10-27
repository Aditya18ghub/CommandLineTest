<<Documentation
Name : Aditya Venkata Sheshu
Date : 10 oct 2022 
Description : Making a test page with particular accounts. Every user can create their own account and sign for taking test user also can check logs of all user. 
Sample Input :
Sample Output :
Documentation

#!/bin/bash/

main=0

while [ $main -eq 0 ]
do
    clear
    echo -e "----------------------------------------------------------------------------------------------------------------------------"
    echo -e "--------------------------------------\t\t\tWELCOME\t\t\t--------------------------------------------"   #printing a welcome greeting
    echo -e "----------------------------------------------------------------------------------------------------------------------------\n"
    
    echo -e " 1.SIGN UP\n 2.SIGN IN\n 3.EXIT\n "    #print options 
    read -p "choose your option: " op              #op variable reads the user input
    user_array=(`cat user_name.txt | cut -d "," -f 1`)
    pass_array=(`cat user_name.txt | cut -d "," -f 2`)
    
    case $op in 
	1)
	    clear
	    #user_array=(`cat user_name.txt | cut -d "," -f 1`)
            echo "${user_array[@]}"
            again1=1
            again2=1
      
          	
            while [ $again2 -eq 1 ]    #while loop for changing user name
            do
		clear
                echo -e "----------------------------------------sign up page-------------------------------------\n\n"        #1st case for signup page
		read -p "enter new USER NAME: " user_name	#reading user name from user
      	        flag=0
		for i in `seq 0 $((${#user_array[@]}-1))`
          	do
		    if [ $user_name = ${user_array[$i]} ]
          	    then
			flag=1
      		        break
          	    fi
          	done
		if [ $flag -eq 0 ]
          	then
		    while [ $again1 -eq 1 ]              #while loop changing password
          	    do
			echo -e "\n"
			read -p "enter PASSWORD: " -s password
			echo -e "\n"
			read -p "re-enter PASSWORD: " -s repassword
          		if [ $password -eq $repassword ]
          		then
			    clear
			    echo "$user_name,$password" >> user_name.txt
          		    echo -e "\nCONGRETULATIONS... \e[92m$user_name\e[0m your account has been created\n"
			    echo -e "`date` \t sing-up \t $user_name \t ACCOUNT CREATED SUCCECFULLY" >> log.txt
			    again1=0
      		            again2=0
			else
			    clear
			    echo -e "\n\n\e[31mPassword NOT MATCHING !!!\e[0m\n"
          		    echo -e "\e[34menter 1 for TRY AGAIN: \e[0m"
			    read again1
			fi
		    done
		else
		    clear
		    echo -e "\n\e[31m******user name already exist******\e[0m\n"
          	    echo -e "\n\e[34menter 1 for TRY AGAIN: \e[0m"
		    read again2 
		fi
	    done
	    ;;


	2)
	    clear
	    again=1
	    while [ $again -eq 1 ]
	    do
		clear
		echo -e "--------------------\tsign in page\t--------------------\n\n"          #2nd case for signin page
		read -p "enter your USER NAME: " u_name
		read -p "eneter your PASSWORD: " -s pass
		login=0
		user_name_error=0
		user_password_error=0
		for i in `seq 0 $((${#user_array[@]}-1))`
		do
			if [ $u_name = ${user_array[$i]} ]
			then
	 	            user_name_error=1
			    if [ $pass -eq ${pass_array[$i]} ]
			    then
				again=0
			        login=1
		                user_password_error=1
			        break
			    fi
			fi
		done

		if [ $user_name_error -ne 1 ]
		then
		    #clear
		    echo -e "\n\e[91m**** USER NAME NOT EXIST ****\e[0m\n\n"
		    read -p "enter 1 for try again: " again

		elif [ $user_password_error -ne 1 ]
		then
		    clear
		    echo -e "\n\e[91m**** WRONG PASSWORD ****\e[0m\n\n"
		    read -p "enter 1 for try again: " again
		
		fi

	    done

	    if [ $login -eq 1 ]
	    then
	        echo -e "`date` \t sign-in \t $u_name \t USER SIGNIN SUCCECFULLY" >> log.txt
		case2_again1=1
	    	while [ $case2_again1 -eq 1 ]
		do
		    clear
		    echo -e "...........................LOGIN SUCCESSFUL as $u_name..............................\n\n"
		    echo -e "1.TEST\n2.LOGS\n3.EXIT\n"
                    read -p "choose option: " op
                
		    case $op in
			1)
			    for i in `seq 5 -1 0`
			    do
			        clear	
				echo -n -e "\r\n\n\t\t$i\n\nNOTE:- don't forget to press \e[92mENTER-KEY\e[0m after selecting \e[92mANSWER-OPTION\e[0m"; sleep 1
			    done

			    echo -e "`date` \t test \t\t $u_name \t TEST ATTENDED" >> log.txt

			    clear
		            echo "" > user_result.txt
		            echo "" > user_answer.txt
                            count=0
		            for i in `seq 5 5 50`
		            do
		                echo -e "..\t..\tBEST OF LUCK FOR YOUR TEST\t..\t..\n\n"
		                echo -e "`cat questions.txt | head -$i | tail -5`\n\n"
#<<comment
                                for j in `seq 10 -1 0`
				do

                                    #user_ans=z
				    if [ $j -ge 6 ]
				    then
					echo -n -e "\rchoose option: $j \c"
				        #read -t 1 user_ans
				    elif [ $j -le 5 -a $j -ge 3 ]
				    then
					echo -n -e "\rchoose option: \e[33m$j\e[0m \c"
				        #read -t 1 user_ans
				    elif [ $j -lt 3 ]
				    then
					echo -n -e "\rchoose option: \e[31m$j\e[0m \c"
				        #read -t 1 user_ans
				    fi
				        read -t 1 user_ans
					if [ -z "$user_ans" -a $j -eq 0 ]
					then
					    user_ans=z
					fi

				    if [ ${#user_ans} -eq 1 ]
				    then
			                echo $user_ans >> user_answer.txt
					break
				    fi

				done

#comment
		                real_ans_array=(`cat answers.txt`)
                                user_ans_array=(`cat user_answer.txt`)
		        
		                check=$((($i/5)-1))
		                echo "real= ${real_ans_array[$check]}"
		                echo "user=${user_ans_array[$check]}"
                     
		                if [ ${user_ans_array[$check]} = ${real_ans_array[$check]} ]
	                        then
				    cat result.txt | head -$i | tail -5 >> user_result.txt
			            echo -e "\n${user_ans_array[$check]}.\e[92mCorrect\e[0m\n\n\n" >> user_result.txt
			            count=$(($count+1))
				elif [ ${user_ans_array[$check]} = z ]
				then
				    cat result.txt | head -$i | tail -5 >> user_result.txt
				    echo -e "\n\e[33mMissed\e[0m\n\n\n" >> user_result.txt
			        else
				    cat result.txt | head -$i | tail -5 >> user_result.txt
			            echo -e "\n${user_ans_array[$check]}.\e[91mWrong\e[0m\n\n\n" >> user_result.txt
			        fi
                            
			        clear
		            done	    
		            echo -e "\n\n\n----finish----\n\n\n"
		            read -p "enter 1 to see result: " result
		
			    if [ $result -eq 1 ]
		            then
			        clear
		                echo -e "\e[103m\e[30mYOUR SCORE IS : $count/10\e[0m\e[0m"
		                echo -e "\n\n"
		                cat user_result.txt
		            fi
			    break
			    ;;
			2)
			    clear
			    cat log.txt
			    echo -e "\n\n\e[34menter 1 for BACK: \e[0m"
			    read case2_again1
			    
			    ;;
			3)
			    clear
		            echo  ....BYE BYE....; sleep 1
			    again=0
			    case2_again1=0

			    ;; 
			*)
			 clear
		        echo -e "\n....Oops  please enter a valid option\n\n"; sleep 2
			case2_again1=1
		esac
	    done
	    fi
	    ;;
	3)
	    clear
	    echo -e "\n\tEXIT"                 #3rd case for exit
	    clear
	    main=0
	    ;;
        *)
	    clear
	    echo -e "\n\n\e[91mplease choose a correct option!...\e[0m"       #default msg if user enters a wrong option
    esac
    echo -e "\n\n\e[34menter 0 for MAIN MENU:\nenter any number for EXIT: \e[0m" 
    read main
done
