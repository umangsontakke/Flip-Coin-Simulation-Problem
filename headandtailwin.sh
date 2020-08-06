#!/bin/bash
read -p "enter  the number of times you want to flip the coin" n
hc=0
tc=0
function flip ()
{
for (( i=0; i<$n; i++))
do
z=$((RANDOM%2))
if [ $z == 0 ]
then
(( hc++ ))
#echo " head"
else
(( tc ++ ))
#echo "tails"
fi
done
echo " no of head " $hc
echo "no of tails "$tc

        if [[ $n -gt 21  &&  $hc -ge 21 || $tc -ge 21 ]]
        then
                if [[ $hc -gt $tc ]]
                then
                sum=$(( $hc - $tc ))
                        if [[  $sum -ge 2 ]]
                        then
                        echo " win with head by difference of "$sum
                        else
                        ( flip )
                        fi

                else
                sum=$(( $tc - $hc ))
                        if [[  $sum -ge 2 ]]
                        then
                        echo " win with tail by difference of "$sum
                        else
                        (flip )
                        fi

                fi

 elif  [[ $n -lt 21 && $hc -gt $tc ]]
                then
                sum=$(( $hc - $tc ))
                if [[  $sum -ge 2 ]]
                then
                echo " win with head by difference of "$sum
                else
                ( flip )
                fi

        elif  [[ $n -lt 21 && $tc -gt $hc ]]
        then
        sum=$(( $tc - $hc ))
                if [[  $sum -ge 2 ]]
                then
                echo " win with tails by difference of "$sum
                else
                ( flip )
                fi

fi
}
 if [[ $hc -eq $tc ]]
        then
        echo "draw"
        ( flip )
fi
