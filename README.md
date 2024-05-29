# Crm

This is a simple CRM for companies that deal with serviceable equipment they sell or rent out.

Steps:
1. mix phx.new crm
2. Get into the folder
  - mix ecto.create
3. mix phx.gen.live Countries Country countries name:string
  - copy routes to router.ex
  - mix ecto.migrate
4. mix phx.gen.live Companies Company companies name:string billingadd1:text billingadd2:text postalcode:string country_id:references:countries
  - copy routes to router.ex
  - mix ecto.migrate
5. modify the company.ex to properly link to countries
  - remember to preload the data in companies so that it shows in the index
6. mix phx.gen.live Contacts Contact contacts name:string email:string mobileno:string officeno:string location:text company_id:references:companies
  - copy routes to router.ex
  - mix ecto.migrate
7. modify the contact.ex to properly link to companies
  - remember to preload the data in contact so that it shows up in index
8. mix phx.gen.live Contracts Contract contracts do:string po:string itq:string startdate:date enddate:date type:string svcalloperdevice:integer timeallo:integer value:float active:boolean company_id:references:companies
  - copy routes to router.ex
  - mix ecto.migrate
9. modify the contract.ex to properly link to companies
10. Work on the drop down lists by listing all and using Enum.map
  - Countries in Company
  - Companies in Contacts
  - Companies in Contracts
    - modify the index.ex defp apply actions for the new and edit to assign the respective variables
    - pass the variable through index.html.heex to form_component
    - Enum.map in the options for the select type
11. Add c/o and remarks and contractno into contracts
    - mix ecto.migration add_careof_and_remarks
    - alter contracts table to add careof and remarks
    - update contract.ex to include the new fields
    - mix ecto.migrate
12. mix phx.gen.live Devices Device devices contract_id:references:contracts serialno:string brand:string model:string currentlocation:text active:boolean remarks:text
  - copy routes to router.ex
  - mix ecto.migrate
13. modify the device.ex to properly link to companies and contracts
14. Work on the drop down lists by listing all and using Enum.map
  - Companies in Devices
  - Contracts in Devices
15. Create the dummy database entries in seeds.exs