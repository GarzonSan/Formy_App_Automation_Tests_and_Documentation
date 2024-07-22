*** Settings ***
Documentation    Stores sll variables used to test form filling scenarios

*** Variables ***
# VALID DATA
${valid_name}    Fernando
${valid_sname}    Garzon
${valid_job_title}    QA Automation Tester
${valid_date}    01/20/2024

# INVALID/INCOMPATIBLE DATA
${invalid_name}    F3rn4nd0
${invalid_sname}    647308
${invalid_job_title}    \#J0b QA*%&
${invalid_date}    20/40/12
