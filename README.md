# Picard
![myimage-alt-tag](https://github.com/WorkflowCenter-Repositories/Picard/raw/master/picard.png)
  
The Sequence Cleaning workflow (SC) is one of the steps in the Next Generation Sequencing pipeline.  
  
  WF-Title: The Sequence Cleaning workflow (SC)    
  version: 1.0    
  Description: The workflow is one of the steps in the Next Generation Sequencing pipeline. It was designed in the e-Science Central system.  
  
###WF-Tasks:  
  
  No-of-tasks: 8  
  Tasks: {importDir: 1, Pick-File: 1, Picard-Clean: 1, Picard-Mark: 1, Picard-Add: 1, SAMTools-index: 1, ExportFiles: 2}  
  Dependency-Libs: {java1.7: all, SAMTools-lib: SAMTools-index}   

###Blueprint:

  blueprint-name: Picard.yaml  
  Docker-images: rawa/picard:01  
  sizes: 268 MB (Virtual size 594.6 MB)  
  OS-types: ubuntu14.4  
  tools: Java1.7, SAMTools-lib  
  
###Input:  
  
  input-Dir:  {  
  Probe.PFC_0030_MSt_GAGTGG.sorted.bam.bai, Probe.PFC_0030_MSt_GAGTGG.sorted.bam,                                                       Probe.PFC_0030_MSt_GAGTGG_nodups.sorted.realigned.Recal.bai,                                                
  Probe.PFC_0030_MSt_GAGTGG_nodups.sorted.realigned.Recal.bam,                                                                          Probe.PFC_0030_MSt_GAGTGG_nodups.sorted.realigned.Recal.reducedReads.bai,                                                             Probe.PFC_0030_MSt_GAGTGG_nodups.sorted.realigned.Recal.reducedReads.bam  
              }  
  description: input Dir including 5 input files

###Outputs:

  output-folder: '~/blueprint-name'  
  output-file(s): {index-BAI-files, output-SAM_BAM-files}  
  description:  
  types: {' ', ' '}  

###Execution-Environment:  
  
  Cloudify-version: 3.2  
  Docker-version: 1.8+  
  OS-type: ubuntu14.04  
  Disk-space: 10 GB  
  RAM: 3 GB  
  
#Deployment Instruction  
This repository includes all files and scripts to deploy Picard workflow on Multiple Docker containers as follow:  
  
1- Clone the repository to your machine, open a terminal window and change to workflow repository.  
2- To execute the workflow with multi containers and the attached input sample, in the terminal run:   
   . ./Picard-deploy.sh 1    
3- If you have own input files, copy your files Dir to Picard/Input-sample folder, open Input.yaml file and change input Dir name, then  
   run: . ./Picard-deploy.sh 1  
  
4- To execute the workflow with single container, follow either step 2 or 3 but run:    
   . ./Picard-deploy 2  
  
After successfully running the workflow, five output files can be found in ~/blueprint-name folder
