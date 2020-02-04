# SER 502 Spring2019 Project

# !Xobile Programming language
Link to Project Demo (video) - https://www.youtube.com/watch?v=alSF_ZnxZB4

Team12
## Team Members:
- Vaibhav Singhal	ASU ID- 1215185400
- Manikanta Chintakunta	ASU ID- 1215146842
- Nikhila Saini	ASU ID- 1216596212
- Janani Anand	ASU ID- 1215175481

## Description 
Everyone has their favorite programming language and their little gripes about the language. This project is our chance to try and do better! We have to design, implement, and demonstrate our own language. You are to implement a lexical analyzer, parser, intermediate code generator, and runtime environment (intermediate code executor) for a simple programming language.



## PROJECT STRUCTURE
The src (source folder) consists of the files to define grammer, generate syntax tree, evaluate semantics and run the main program 	
The document folder contains the project presentation and contribution.txt file
The data folder contains - the sample programs 

## INSTALLATION

Requires SWI-Prolog 7.6.4 to be installed on the computer

## RUN TIME STEPS

1. Inside the root directory there is a mainFile.py.
2. After compiling this file it will ask for the name of the file that we want to execute,default directory is !xobile Samples.
3. The file that needs to be executed, should be in .lol extension, otherwise it will throw error.
4. After executing this file,mainFile.py will create a <filename>.tokens, and store it in !xobile Samples.
5. .tokens file will have all the tokens will the will be further processed.
6. mainfile.pl in !xobile Samples will be executed after consulting generate_parsetree.pl and semanticMain.pl
7. main('<filename>.tokens',Env).

## RSTRICTIONS:
The identifier shiuld be named as a single character range from a..z.
