#!/bin/sh
ENTRIES=`ibus read-config | grep engines-order | sed 's/engines-order:\|\[\|\]\| //g' | sed 's/,/\n/g' | sed "s/'//g"`

# OUTPUT=""
# for entry in $ENTRIES
# do
#     e=`echo $entry | awk -F ':' '{print $1'}`
#     la=`echo $entry | awk -F ':' '{print $2'}`
#     la_v=`echo $entry | awk -F ':' '{print $3'}`
#     lang=`echo $entry | awk -F ':' '{print $4'}`
#     if [ ! ${lang} = '\n' ]
#     then
#         OUTPUT="$OUTPUT language: $lang"
#     fi
#     if [ ! ${la} = '\n' ]
#     then
#         if [ ! ${la_v} = '\n' ]
#            then
#                OUTPUT="$OUTPUT layout: $la, $la_v"
#         else
#             OUTPUT="$OUTPUT layout: $la"
#         fi
#     fi
#     OUTPUT="$OUTPUT engine: $e\n"
# done

SELECTION=`printf "%s\n" $ENTRIES | rofi -dmenu -i -p 'Select'`

if [ -n $SELECTION ] && [ ! $SELECTION = '\n' ]
then
    ibus engine $SELECTION
fi

exit 0
