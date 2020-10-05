#! /bin/bash
#

if [ $# -lt 1 ]; then
Echo "Attention: Must provide a single argument when operating this script"
else
[ $# -eq 1 ]
Echo "FASTA file is loaded correctly
fi

#initialize variable
reverse=""

#read in data
name=`grep ">" $1`
sequence=`grep -v ">" $1`


#calculate length of sequence
len=${#sequence}


#loop through sequence in reverse
for (( i=$len; i>=0; i-- ))
do
    reverse="$reverse${sequence:$i:1}"
done


#complement sequence
rc=`echo $reverse | tr [=CHAR=] 'atcg' 'tagc'`


echo $name >$1.rc.txt
echo $rc >>$1.rc.txt
