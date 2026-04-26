#!/bin/bash

printf "\n"
printf "░█████╗░██████╗░██████╗░  ░██████╗░███████╗███╗░░██╗
██╔══██╗██╔══██╗██╔══██╗  ██╔════╝░██╔════╝████╗░██║
██║░░╚═╝██████╔╝██████╔╝  ██║░░██╗░█████╗░░██╔██╗██║
██║░░██╗██╔═══╝░██╔═══╝░  ██║░░╚██╗██╔══╝░░██║╚████║
╚█████╔╝██║░░░░░██║░░░░░  ╚██████╔╝███████╗██║░╚███║
░╚════╝░╚═╝░░░░░╚═╝░░░░░  ░╚═════╝░╚══════╝╚═╝░░╚══╝\033[m\n"

printf "\n                            By : \x1b[33mmarbenMB\033[m [mbenbajj]\n"
printf "\n                   Modified By : \x1b[33meliotgrd\033[m \n"
echo ""

echo -n "Current Directory : "
pwd

#Variables
PATH=""
CLASS=""
OPTION=""

#PATH
echo "*******************************************************"
echo -ne "\x1b[33mEnter Path Of Creation : \033[m"
read PATH

if [ -d $PATH ] &> /dev/null
then 
	cd $PATH
	echo "Changing Directory to : " $PATH
	echo "*******************************************************"
	echo -ne "\x1b[33mEnter Class Name : \033[m"
	read CLASS
	if [ $CLASS != "" ] 2> /dev/null
	then
		echo "Class Name : " $CLASS
		echo "*******************************************************"
		/usr/bin/touch $CLASS.cpp $CLASS.hpp 

		#	***		Printing To Class.hpp	***

		echo "#ifndef "$CLASS"_HPP" >> $CLASS.hpp
		echo "#define "$CLASS"_HPP" >> $CLASS.hpp
		printf "\n" >> $CLASS.hpp
		echo "#include <iostream>" >> $CLASS.hpp
		printf "\n" >> $CLASS.hpp

		printf "\nclass	$CLASS
{
	private	:
		//	DataType	attributes.
	
	public	:
		$CLASS ();
		$CLASS ($CLASS const &obj);
		~$CLASS ();
		$CLASS &operator= (const $CLASS &obj);
};\n\n" >> $CLASS.hpp

		echo "#endif" >> $CLASS.hpp

		#	***		Printing To Class.cpp	***

		printf "#include \"$CLASS.hpp\"

$CLASS::$CLASS()
{
	std::cout << \"$CLASS : Default Constructor Called\" << std::endl;
}

$CLASS::~$CLASS()
{
	std::cout << \"$CLASS : Destructor Called\" << std::endl;
}

$CLASS::$CLASS($CLASS const &obj)
{
	std::cout << \"Copy Constructor Called\" << std::endl;
	if (this != &obj)
		*this = obj;
}

$CLASS	&$CLASS::operator= (const $CLASS &obj)
{
	std::cout << \"Copy Assignment Operator Called\" << std::endl;
	if (this != &obj)
	{
		//this->attributes = obj.attributes;
	}
	return (*this);
}\n" > $CLASS.cpp

	echo -ne "\x1b[33mCreate main.cpp \033[m[\x1b[32my\033[m/\x1b[31mn\033[m] : "
	read OPTION
	if [ $OPTION == "y" ] || [ $OPTION == "yes" ] &> /dev/null
	then
		/usr/bin/touch main.cpp

			#	***		Printing To main.cpp	***

			printf "#include \"$CLASS.hpp\"\n
int main()
{
	//	You Code\n
	std::cout << \"\" << std::endl;\n
	return (0);
}\n" > main.cpp
	fi
		printf "\n░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
█████╗█████╗█████╗█████╗█████╗█████╗█████╗
╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n\n"
		echo -e "\x1b[32m+> " $CLASS " : Files Created !\033[m\n"
	else
		echo -e "______________________________________\n"
		echo -e "\x1b[31mNo Class Name Entred\033[m\n"
	fi
	else
		echo -e "______________________________________\n"
		echo -e "\x1b[31m*** $PATH : ** Path not found !! **\033[m\n"
fi
