# PreMU
This repository contains code and data related to a new precipitation emlator (PREMU).
PREMU is a precipitation emulator, which emulates the Earth System Model-specific precipitation by the gridded temperature at a negligible computational cost.

In combination with other lower complexity models with output gridded temperature , PREMU can account for precipitation projection at the global/local scale. 

Cal_GSWP3_1.m is for calculating the scores of the gridded temeprature from GSWP3. 

Cal_GSWP3_2.m is for calibration and validation.

Cal_ESMs_1.m is for calculating the scores of the gridded temeprature under four scenarios (SSP1-2.6, SSP2-4.5, SSP3-7.0, SSP5-8.5)from nine ESMs independently.

Cal_GSWP3_2.m is for calibration and validation.

Figure2.m-Figure11.m is for all figures in Liu et al.(2022).

Driving data can be otained from https://disk.pku.edu.cn:443/link/B6BADE68950C07B96367E11843F6FFA9

# Citing PreMU
Scientific publications using PREMU should cite the following publication:

Liu, G., Peng, S.S., Huntingford, C., and Xi, Y.: A new precipitation emulator (PREMU v1.0) for lower complexity models, Geosci. Model Dev. Discuss. [preprint], in review, 2022.
