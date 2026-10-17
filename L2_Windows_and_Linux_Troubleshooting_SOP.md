# Standard Operating Procedure (SOP): L2 Server & Log Troubleshooting
**Application:** FinCart E-Commerce Order & Billing System  
**Database:** `fincart_support` (MySQL 8.0)  
**Target Audience:** L1 / L2 Application Support Engineers  

---

## Part 1: Ubuntu Linux Log & Server Diagnostics
When an alert triggers for failed orders, database connection drops, or slow application response on the Ubuntu Linux server (`~/ase-practice/logs/server.log`), run the following commands:

### 1. View Complete or Recent Log Entries
```bash
# View full server log
cat server.log

# View the latest 5 lines to check current application status
tail -n 5 server.log

# Follow the log in real time during an active outage
tail -f server.log