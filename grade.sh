CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

# 1. clone student repo
rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

# 2. check student code has correct file submitted
cd student-submission

if [[ -f ListExamples.java ]]
then 
    echo "Found ListExamples"
else 
    echo "Need file ListExample"
    exit 1
fi 

# 3.  get student code and test .java file into same directory
cp *.java ../
cd ..

# 4. compile tests and student's code from appropriate directory with appropriate classpath commands.
javac -cp $CPATH *.java

if [[ $? == 0 ]]
then 
    echo "compiled tests and code successfully"
else
    echo "compiled tests and code failed"
    echo "Grade 0"
    exit 2
fi 

# 5. Run the tests and report the grade based on the JUnit output
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt
#grep -l "OK" > grade.txt
if [[ 'wc -l grep "OK"  output.txt == 1' ]]
then
    echo "Grade 100"
    exit 0
else
    echo "Grade 0"
    exit 2
fi 
