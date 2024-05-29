# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Crm.Repo.insert!(%Crm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Crm.Countries
alias Crm.Companies
alias Crm.Contacts
alias Crm.Contracts
alias Crm.Devices

countries = [
  %{    name: "Singapore"  },
  %{    name: "Malaysia"  },
  %{    name: "Indonesia"  },
  %{    name: "Vietnam"  },
  %{    name: "Australia"  },
  %{    name: "Japan"  },
  %{    name: "Korea"  }
]

companies = [
  %{
    name: "Company01",
    billingadd1: "someaddress01",
    billingadd2: "#08-88",
    postalcode: "112233",
    country_id: "1"
  },
  %{
    name: "Company02",
    billingadd1: "someaddress02",
    billingadd2: "#09-99",
    postalcode: "1334455",
    country_id: "2"
  },
  %{
    name: "Company03",
    billingadd1: "someaddress03",
    billingadd2: "#01-10",
    postalcode: "1553325",
    country_id: "3"
  },
  %{
    name: "Company04",
    billingadd1: "someaddress04",
    billingadd2: "#02-11",
    postalcode: "234334",
    country_id: "4"
  }
]

contacts = [
  %{
    name: "Bob",
    email: "bob@test.com.sg",
    mobileno: "112233344",
    officeno: "333343423",
    location: "SomeLocation01",
    company_id: "1"
  },
  %{
    name: "Jane",
    email: "jane@test.com.my",
    mobileno: "545433344",
    officeno: "564543423",
    location: "SomeLocation02",
    company_id: "2"
  },
  %{
    name: "Izzy",
    email: "izzy@test.com.my",
    mobileno: "665653344",
    officeno: "766767643423",
    location: "SomeLocation3",
    company_id: "3"
  },
  %{
    name: "Rock",
    email: "rock@test.com.my",
    mobileno: "665445444",
    officeno: "64443423",
    location: "SomeLocation4",
    company_id: "4"
  }
]

contracts = [
  %{
    do: "",
    po: "4524343F",
    itq: "",
    startdate: "2020-01-01",
    enddate: "2025-01-01",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "5000",
    value: "10000",
    active: true,
    contractno: "20200101001",
    company_id: "1",
    careof_id: "1",
    remarks: "Some Remark"
  },
  %{
    do: "232132",
    po: "54544454A",
    itq: "343324",
    startdate: "2019-01-01",
    enddate: "2020-12-01",
    type: "PM",
    svcalloperdevice: "2",
    timeallo: "",
    value: "5000",
    active: true,
    contractno: "201912010112",
    company_id: "1",
    careof_id: "1",
    remarks: "no remarks"
  },
  %{
    do: "",
    po: "3542334343C",
    itq: "",
    startdate: "2018-06-01",
    enddate: "2025-05-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "20000",
    active: true,
    contractno: "201806001111",
    company_id: "1",
    careof_id: "1",
    remarks: ""
  },
  %{
    do: "",
    po: "324324",
    itq: "23213",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "1",
    careof_id: "1",
    remarks: "Nothing"
  }
]

devices = [
  %{
    serialno: "3434221232",
    brand: "Kodak",
    model: "i3200",
    currentlocation: "Some office level floor 7",
    remarks: "call before service",
    contract_id: "1",
    active: true
  },
  %{
    serialno: "664543543",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "some office",
    remarks: "some remark",
    contract_id: "2",
    active: true
  },
  %{
    serialno: "44545433243",
    brand: "Zetuschel",
    model: "OS C2",
    currentlocation: "ANRI",
    remarks: "Under Tata",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "3454645435",
    brand: "Mekel",
    model: "MEKEL VIEWSCAN M200",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "2",
    active: true
  }
]

Enum.each(countries, fn(data)->
  Countries.create_country(data)
end)
Enum.each(companies, fn(data)->
  Companies.create_company(data)
end)
Enum.each(contacts, fn(data)->
  Contacts.create_contact(data)
end)
Enum.each(contracts, fn(data)->
  Contracts.create_contract(data)
end)
Enum.each(devices, fn(data)->
  Devices.create_device(data)
end)
