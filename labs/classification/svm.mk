% ML 4/M SVM lab
% Simon Rogers
% 4th March 2016

# Aims

To experiment with an SVM classifier, gaining an understanding of the effects of varying the different parameters.

# Tasks

 - download `simplesvm.py` from Moodle. This is an implementation of an SVM using the SMO algorithm.
 - Download the notebook `SVM.ipynb` from Moodle and place this in the same directory as all the files downloaded above. Run ipython notebook from this directory.
 - Run the code and observe the predictive contours obtained. Experiment with varying C, as well as the kernel type (linear or rbf) and observe how the predictive contours change. 
 - In the first cell there is some code commented out that adds some noise to the labels (i.e. changes some classes). Uncomment this and run the notebook again. You should now see large effects from varying C. Note that if you make C too large now, it might take the optimiser a long time to converge.
