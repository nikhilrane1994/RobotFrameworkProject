Robot Framework Demo

Install Python - 
Download and Install Python and add path to Environment Variable

Install required Libraries - 
pip3 install -r requirements.txt

Browser Driver Path needs to set to environment variable to run test cases on specified browser(here chromedriver used for demo)

Commands to Run Test Suits - 
robot -d Results TestSuits/LoginTests.robot
robot -d Results TestSuits/CartTests.robot
robot -d Results TestSuits/CheckoutTests.robot
