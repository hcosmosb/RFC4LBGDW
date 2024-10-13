# RFC4LBGDW

This project contains the IGM Lyα tranmission dataset from the CoDa II simulation and a pipeline to build a Random Forest Classier. When you use this model in your paper, please cite the following papers.
[1] Main paper for this model
https://ui.adsabs.harvard.edu/abs/2024arXiv241007377P/abstract
[2] CoDa II simulation paper
https://ui.adsabs.harvard.edu/abs/2020MNRAS.496.4087O/abstract

## File list

1. RFC4LBGDW_input_data.npy:  
   This is the main data file for the Random Forest Classifier. Due to its large size, it should be downloaded separately from the following Dropbox link:  
   https://www.dropbox.com/scl/fi/3ntxcnijwua1i0v1834kw/RFC4LBGDW_input_data.npy?rlkey=lhy2opfmdvtep8emq209vv1t1

2. RFC4LBGDW_notebook.ipynb:  
   The Jupyter notebook that contains the pipeline. Users should modify the second code block to apply their own data.

3. sig_a_app.py:  
   A Python function for calculating the Lyα cross-section.

4. hlsp_jades_jwst_nirspec_goods-n-mediumhst-00003991_clear-prism_v1.0_x1d.fits:  
   The first JWST spectrum of GN-z11, used for example calculations.

5. hlsp_jades_jwst_nirspec_goods-n-mediumjwst-00005591_clear-prism_v1.0_x1d.fits:  
   The second JWST spectrum of GN-z11, used for example calculations.
