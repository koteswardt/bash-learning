#! /bin/bash 

# Today we are learning Loops 

echo "Welcome to automation Factory!!!"

for iterator in 1 2 3 4 5 6
do
    echo "day $iterator of scripting"
done

echo "initial phase of factory devolpment Need to Create files using touch!!!!"
for iterator in {1..10}
do
    echo "its day $iterator for factory renovation"
    touch "file$iterator.txt"
done

echo "Phase 3 of factory renovation developers need files that are ending with *.txt"
# in linux the concept globling *txt shell checks and gets all the like file 1 fil2 file3 etc as for loop input 

for file in *.txt
do
    echo "Hi devolper here is the $file that you needed for renovation"
done    

