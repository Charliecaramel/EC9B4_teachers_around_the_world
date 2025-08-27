# Who are the teachers? A cross country analysis of teacher characteristics and labour market conditions.

## Abstract
This study documents observable differences in teacher characteristics across countries at different stages of development. Using cross country population census and literacy skill assessment data, the results show that high income countries enjoy a teacher advantage. The quantity and quality of teachers improve as countries develop. This result provides an mechanism to explain the divergence in global learning outcomes. In addition, this paper shows that the the positive selectiveness of teachers fall as countries develop. The observation is largely consistent with changes in relative compensation in occupation wage premia and returns to education.


## Replication Guidlines
Where neccessary, some folder containing DO files includes a separate README document explaining the purpose of the scripts. This README offers a high-level overview to guide you through the entire replication process.

### Folder Structure
The archive includes the following:

#### Subfolders:
- **`Data_impus`** – Place where all census microdata can be stored, and where the processed data will be stroed.
- **`Data_piaac`** – Place where all  PIAAC and STEP public use files can be stored, and where the processed data will be stroed.
- **`DO`** – Contains all the STATA DO files used in the paper.
- **`Results`** – PLace all the results will be populated through replication.

#### Additional Files:
- **`LeeLee_LRdata.dta`** – Global enrollment data compiled by Lee and Lee (2016).
- **`pwt.dta`** – Penn World Tables.

### Steps to Replicate the Results relating to IPMUS-I datasets

1. **Review the Data Extraction Section Below**  
   Instructions are provided to guide you through downloading raw survey data from IPUMS.

2. **Open the `DO/ipmus_data_processing` Folder and then, open file `_mastercleaning.do`**  
   Run the master cleaning file, which handels all the data processing required to transform the microdata to the dataset we can use for the analysis. 

3. **Open the `DO/ipmus_data_processing` Folder and then, open file `_masterfile.do`**  
   This file runs the analysis. Including, estimating occupation wage premia, returns to schooling, as well as calulating occupation averages that are used to construct the country level dataset. 

4. **Open the `DO/ipmus_analysis` Folder and then, run the desired results DO file. **  
   Each table and figure has their own separte DO file. 

5. **Open the `Results` Folder**  
    Obatin the desired results. 

### Steps to Replicate the Results relating to PIAAC abd STEP datasets

1. **Review the Data Extraction Section Below**  
   Instructions are provided to guide you through downloading raw survey data from IPUMS.

2. **Open the `DO/piaac_step_data_processing` Folder and then, open file `importPUFtoStata.do`**  
   This files imports PIAAC PUFS into stata dataset for use to clean and process

3. **Open the `DO/piaac_step_data_processing` Folder and then, open file `_masterSTEP.do`** 
   This file cleans the data and runs the analysis.

5. **Open the `Results` Folder**  
    Obatin the desired results. 

---

### Data Extraction Instructions

#### IPMUS-I data
Due to the size of the raw data, it is not included in this replication archive.

To obtain the data:

- Register on the IPUMS International website:  
  [https://international.ipums.org/international](https://international.ipums.org/international)

- After registering, extract the raw survey data.  
  Note: The data was extracted by country and ordered alphabetically where possible. The downloaded files are in `.dta` format (`ipums00xx.dta`), where `xx` represents the extraction identifiers.

- Place the relavent country census `ipums00xx.dta` into the appropriate subfolders in `Data_ipmus/countryname`

#### STEP and PIAAC
Due to the size of the raw data, it is not included in this replication archive.

To obtain the data:

- Register on OECD website to obatin Public use files:(https://www.oecd.org/en/about/programmes/piaac.html)
- Save the PIACC PUF in the folder `Data_piaac/first_wave`

- Register on World Bank STEP program: (https://microdata.worldbank.org/index.php/collections/step)
- Save the PIACC PUF in the folder `Data_piaac/STEP`

### Notes

- RAM limitations were considered during extraction—data was downloaded in smaller subsets by region.
- If any scripts or processes need to be updated, please modify the DO files accordingly.
- For any issues, please contact the author.
