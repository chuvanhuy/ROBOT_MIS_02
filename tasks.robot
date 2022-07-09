*** Settings ***
Documentation       Saves the order HTML receipt as a PDF file

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             RPA.Excel.Files
Library             RPA.HTTP
Library             RPA.PDF


*** Tasks ***
Saves the order HTML receipt as a PDF file
    Open the intranet website
    Collect the results
    Export the table as a PDF
    [Teardown]    Close the browser


*** Keywords ***
Open the intranet website
    Open Available Browser
    ...    http://mis.hvnh.edu.vn/tin_tuc/chi_tiet/523_talkshow_hoc_tap_va_lam_viec_tai_nuoc_ngoai.html

Collect the results
    Screenshot
    ...    tag:html
    ...    ${OUTPUT_DIR}${/}sales_summary.png

Export the table as a PDF
    Wait Until Element Is Visible    tag:html
    ${sales_results_html}=    Get Element Attribute    tag:html    outerHTML
    Html To Pdf    ${sales_results_html}    ${OUTPUT_DIR}${/}sales_results.pdf

Close the browser
    Close Browser
