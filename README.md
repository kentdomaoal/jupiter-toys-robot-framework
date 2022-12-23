# jupiter-toys-robot-framework
Sample Test automation using Robot Framework

HTML Report is auto-generated or you can generate it via Allure-report.

## How to run in local machine

- ## 💻 Pre-requisites
  - Git Bash
  - Python 3 or higher
  - Allure commandline for Allure report viewing


### 1. Clone the project

        git clone https://github.com/kentdomaoal/jupiter-toys-robot-framework.git
        
        cd jupiter-toys-robot-framework

### 2. Install dependencies

        *** to be updated ***  
    
### 3. Run the test
  (a) Run with default HTML report

        robot --variablefile Resources/Config/robot-config-qa.py -d results --name Tests TestCases/*Test*.robot

  (b) Run with Allure report

        robot --variablefile Resources/Config/robot-config-qa.py -d results --listener 'allure_robotframework;./results/allure' --name Tests TestCases/*Test*.robot

### 4. View html report
   
   Default HTML report can be found on `/result/report.html`
       
   Or you can run this command to open the allure generated report
       
       allure serve ./results/allure
