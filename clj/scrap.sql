
select
    contacts.first_name, contacts.last_name, contact_types.description as contact_type, account_contacts.inactive_date
from
    account_contacts, contacts, contact_types
where
    account_contacts.account_id = 14 and
    account_contacts.contact_id = contacts.contact_id and
    account_contacts.contact_type_id = contact_types.contact_type_id
order by (contact_types.description);

select
    telecom.contact.first_name, telecom.contact.last_name, telecom.contact_type.description as contact_type, telecom.account_contact.inactive_date
from
    telecom.account_contact, telecom.contact, telecom.contact_type
where
    telecom.account_contact.account_id = 14 and
    telecom.account_contact.contact_id = telecom.contact.contact_id and
    telecom.account_contact.contact_type_id = telecom.contact_type.contact_type_id
order by (telecom.contact_types.description);

select
    addresses.street, addresses.city, addresses.state, address_types.name, address_types.description, account_addresses.inactive_date
from
    account_addresses, addresses, address_types
where
    account_addresses.account_id = 14 and
    account_addresses.address_id = addresses.address_id and
    account_addresses.address_type_id = address_types.id;

select
    telecom.address.street, telecom.address.city, telecom.address.state, compass_accounts.address_types.name, compass_accounts.address_types.description, compass_accounts.acc_addresses.inactive_date
from
    compass_accounts.acc_addresses, telecom.address, compass_accounts.address_types
where
    compass_accounts.acc_addresses.account_id = 14 and
    compass_accounts.acc_addresses.address_id = telecom.address.address_id and
    compass_accounts.acc_addresses.address_type_id = compass_accounts.address_types.id;

