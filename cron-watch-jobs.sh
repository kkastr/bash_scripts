#!/bin/bash 


#requires internet
#watches jobs on all commonly used snet clusters



dirname="work/espresso/polymer-capture"


ssh saw << EOF


echo -n "Saw: "; echo ""

cd $dirname

echo -n "Running: " ;sqjobs -r | wc -l
echo -n "Qeueud: ";sqjobs -q | wc -l

EOF


ssh kraken << EOF


echo -n "Kraken: "; echo ""

cd $dirname

echo -n "Running: " ;sqjobs -r | wc -l
echo -n "Qeueud: ";sqjobs -q | wc -l

cd logs
echo -n "Translocations: "; echo ""
echo -n "Standard-Capture: " ; grep standard-capture_*/* | wc -l
echo -n "Standard-Default: " ; grep standard-default_*/* | wc -l
cd ..

EOF