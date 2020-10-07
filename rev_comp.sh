#! /bin/bash
#

# need to change this to fit the intructions, should only spit out message when something is wrong. Nothing to confirm it is going well.
if [ $# -lt 1 ]; then
echo "Attention: Must provide a single argument when operating this script"
else
[ $# -eq 1 ]
echo "FASTA file is loaded correctly" # added an extra quotation to close the loop
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
# modified this to make the script accept input in either case. If the input is lower case the second pipe is ignored
rc=$(echo $reverse | tr '[:upper:]' '[:lower:]' | tr 'atcg' 'TAGC')

#complement sequence with case insensitive input
rc=`echo $reverse | tr [A-Z] [a-z] | tr 'atcg' 'tagc'`

echo $name >$1.rc.txt
echo $rc >>rc.$1.txt
