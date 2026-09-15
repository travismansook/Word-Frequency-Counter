#/bin/bash

echo -n "Enter the path to the text file: "
read filename
echo ""

if [ -f "$filename" ]; then

       echo "Word Frequency:"
       echo "--------------------------------------"


       sort "$filename" | uniq -c | sort -k1nr | awk '{print $2, $1}'

       #sort "$filename" | uniq -c | sort -k1nr | tr -s " " | cut -d " " -f 3 > words
       #sort "$filename" | uniq -c | sort -k1nr | tr -s " " | cut -d " " -f 2 > freq
       #paste words freq
       #I did not realize this created a words and freq file in my directory so I had to abandon this approach
       
       echo ""
       echo "Summary:"
       echo -n "Total unique words: " 
       sort "$filename" | uniq -c | wc -l

elif [ -d "$filename" ]; then 
       echo "Error. Path requires a valid text file NOT directory."
       exit 100 # exit status
else
	echo "File does not exist!"
	exit 100
fi







