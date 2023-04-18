*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.amazon.in/
${browser}    chrome


${Prouct_Name}    iPhone 14 Pro Max

### Home_page_xpath ###
${Search_box}    xpath://input[@id='twotabsearchtextbox']
${Search_button}    xpath://input[@type='submit']

### Xpath_Product ###
${click_P}    xpath://span[contains(text(),'Apple iPhone 14 Pro Max (256 GB) - Gold')]

### Table_Xpath ###

${scroll}    xpath://h2[contains(text(),'Technical Details')]

# row_Xpath #
${row_count}    xpath://table[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr

# Coloum_Xpath #
${coloum_count}    xpath://table[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tbody//tr[1]//td


## Titles ##

${Title}    Apple iPhone 14 Pro Max (256 GB) - Gold : Amazon.in: Electronics
${Title}    Chip 
${Expexted}   A16 Bionic chip,6-core CPU with 2 performance cores and 4 efficiency cores, 5-core GPU, 16-core Neural Engine


## Setup and Teardown ##

${sup}    Searching Particular Product
${td}    Done With Searching
${sup1}    Get Particular Product
${td1}    Successfully got particular product 