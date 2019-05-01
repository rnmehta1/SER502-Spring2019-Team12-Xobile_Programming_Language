SER 502- Team 12- Spring19

Our programming language is called !XOBILE. 

Link to youtube video - https://www.youtube.com/watch?v=alSF_ZnxZB4

PROJECT STRUCTURE

The src (source folder) consists of the files to define grammer, generate syntax tree, evaluate semantics and run the main program 	

The document folder contains the project presentation and contribution.txt file

The data folder contains - the sample programs 

INSTALLATION

Requires SWI-Prolog 7.6.4 to be installed on the computer

RUN TIME STEPS

1. Inside the root directory there is a mainFile.py.
2. After compiling this file it will ask for the name of the file that we want to execute,default directory is !xobile Samples.
3. The file that needs to be executed, should be in .lol extension, otherwise it will throw error.
4. After executing this file,mainFile.py will create a <filename>.tokens, and store it in !xobile Samples.
5. .tokens file will have all the tokens will the will be further processed.
6. mainfile.pl in !xobile Samples will be executed after consulting generate_parsetree.pl and semanticMain.pl
7. main('<filename>.tokens',Env).

RSTRICTIONS:

1. The identifier shiuld be named as a single character range from a..z.

TEAM MEMBERS

Janani Anand - janand3@asu.edu - 1215175481

Manikanta Chintakunta - mchintak@asu.edu - 1215146842 

Nikhila Saini - nsaini3@asu.edu - 1216596212

Vaibhav Singhal - vsingha5@asu.edu - 1215185400 





