# Statusy domen globalnych

Domain Status: clientHold https://icann.org/epp#clientHold

Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited

Domain Status: pendingDelete https://icann.org/epp#pendingDelete

Domain Status: serverHold https://icann.org/epp#serverHold

Domain Status: autoRenewPeriod https://icann.org/epp#autoRenewPeriod

Domain Status: redemptionPeriod https://icann.org/epp#redemptionPeriod


## [EPP Status Codes | What Do They Mean, and Why Should I Know? - ICANN](https://www.icann.org/resources/pages/epp-status-codes-2014-06-16-en#clientHold)

### Server Status Codes are Set by Your Domain's Registry

+ RDAP Status Mapping
+ EPP Status Code
+ What does it mean?
+ Should you do something?

### add period
addPeriod

This grace period is provided after the initial registration of a domain name. If the registrar deletes the domain name during this period, the registry may provide credit to the registrar for the cost of the registration.

This is an informative status set for the first several days of your domain's registration. There is no issue with your domain name.

### auto renew period
autoRenewPeriod

This grace period is provided after a domain name registration period expires and is extended (renewed) automatically by the registry. If the registrar deletes the domain name during this period, the registry provides a credit to the registrar for the cost of the renewal.

This is an informative status set for a limited time after your domain's auto- renewal by the registry. If you do not want to keep it (i.e., pay the renewal fee) anymore, you should contact your registrar immediately to discuss what options are available.

### inactive
inactive

This status code indicates that delegation information (name servers) has not been associated with your domain. Your domain is not activated in the DNS and will not resolve.

If your domain has remained in this status for several days, you may want to contact your registrar to request information about the delay in processing.

If the TLD requires documentation to be provided for registration, you may need to provide the required documentation.

### active
ok

This is the standard status for a domain, meaning it has no pending operations or prohibitions.

Asking your registrar to enact status restrictions, like clientTransferProhibited, clientDeleteProhibited, and clientUpdateProhibited, can help to prevent unauthorized transfers, deletions, or updates to your domain.

### pending create
pendingCreate

This status code indicates that a request to create your domain has been received and is being processed.

If the TLD is on a special registration period (e.g. sunrise), this may indicate that the domain name will be allocated at the end of such period.

If the TLD is not on a special registration period and you are NOT the listed Registrant, you should contact your registrar immediately to resolve the issue.

### pending delete
pendingDelete

This status code may be mixed with redemptionPeriod or pendingRestore. In such case, depending on the status (i.e. redemptionPeriod or pendingRestore) set in the domain name, the corresponding description presented above applies. If this status is not combined with the redemptionPeriod or pendingRestore status, the pendingDelete status code indicates that your domain has been in redemptionPeriod status for 30 days and you have not restored it within that 30-day period. Your domain will remain in this status for several days, after which time your domain will be purged and dropped from the registry database.

Once deletion occurs, the domain is available for re-registration in accordance with the registry's policies.

If you want to keep your domain name, you must immediately contact your registrar to discuss what options are available.

### pending renew
pendingRenew

This status code indicates that a request to renew your domain has been received and is being processed.

If you did not request to renew your domain and do not want to keep it (i.e., pay the renewal fee) anymore, you should contact your registrar immediately to discuss what options are available.

### pending restore
pendingRestore

This status code indicates that your registrar has asked the registry to restore your domain that was in redemptionPeriod status. Your registry will hold the domain in this status while waiting for your registrar to provide required restoration documentation. If your registrar fails to provide documentation to the registry operator within a set time period to confirm the restoration request, the domain will revert to redemptionPeriod status.

Watch your domain's status codes within this frequently defined seven day period to ensure that your registrar has submitted the correct restoration documentation within the time window. If this period ended and your domain has reverted back to a redemptionPeriod status, contact your registrar to resolve whatever issues that may have halted the delivery of your domain's required restoration documentation.

### pending transfer
pendingTransfer

This status code indicates that a request to transfer your domain to a new registrar has been received and is being processed.

If you did not request to transfer your domain, you should contact your registrar immediately to request that they deny the transfer request on your behalf.

### pending update
pendingUpdate

This status code indicates that a request to update your domain has been received and is being processed.

If you did not request to update your domain, you should contact your registrar immediately to resolve the issue.

### redemption period
redemptionPeriod

This status code indicates that your registrar has asked the registry to delete your domain. Your domain will be held in this status for 30 days. After five calendar days following the end of the redemptionPeriod, your domain is purged from the registry database and becomes available for registration.

If you want to keep your domain, you must immediately contact your registrar to resolve whatever issues resulted in your registrar requesting that your domain be deleted, which resulted in the redemptionPeriod status for your domain. Once any outstanding issues are resolved and the appropriate fee has been paid, your registrar should restore the domain on your behalf.

### renew period
renewPeriod

This grace period is provided after a domain name registration period is explicitly extended (renewed) by the registrar. If the registrar deletes the domain name during this period, the registry provides a credit to the registrar for the cost of the renewal.

This is an informative status set for a limited period or your domain's renewal by your registrar. If you did not request to renew your domain and do not want to keep it (i.e., pay the renewal fee) anymore, you should contact your registrar immediately to discuss what options are available.

### server delete prohibited
serverDeleteProhibited

This status code prevents your domain from being deleted. It is an uncommon status that is usually enacted during legal disputes, at your request, or when a redemptionPeriod status is in place.

This status may indicate an issue with your domain that needs resolution. If so, you should contact your registrar to request more information and to resolve the issue. If your domain does not have any issues, and you simply want to delete it, you must first contact your registrar and request that they work with the Registry Operator to remove this status code.

Alternatively, some Registry Operators offer a Registry Lock Service that allows registrants, through their registrars to set this status as an extra protection against unauthorized deletions. Removing this status can take longer than it does for clientDeleteProhibited because your registrar has to forward your request to your domain's registry and wait for them to lift the restriction.

### server hold
serverHold

This status code is set by your domain's Registry Operator. Your domain is not activated in the DNS.

If you provided delegation information (name servers), this status may indicate an issue with your domain that needs resolution. If so, you should contact your registrar to request more information. If your domain does not have any issues, but you need it to resolve in the DNS, you must first contact your registrar in order to provide the necessary delegation information.

### server renew prohibited
serverRenewProhibited

This status code indicates your domain's Registry Operator will not allow your registrar to renew your domain. It is an uncommon status that is usually enacted during legal disputes or when your domain is subject to deletion.

Often, this status indicates an issue with your domain that needs to be addressed promptly. You should contact your registrar to request more information and resolve the issue. If your domain does not have any issues, and you simply want to renew it, you must first contact your registrar and request that they work with the Registry Operator to remove this status code. This process can take longer than it does for clientRenewProhibited because your registrar has to forward your request to your domain's registry and wait for them to lift the restriction.


### server transfer prohibited
serverTransferProhibited

This status code prevents your domain from being transferred from your current registrar to another. It is an uncommon status that is usually enacted during legal or other disputes, at your request, or when a redemptionPeriod status is in place.

This status may indicate an issue with your domain that needs to be addressed promptly. You should contact your registrar to request more information and resolve the issue. If your domain does not have any issues, and you simply want to transfer it to another registrar, you must first contact your registrar and request that they work with the Registry Operator to remove this status code.

Alternatively, some Registry Operators offer a Registry Lock Service that allows registrants, through their registrars to set this status as an extra protection against unauthorized transfers. Removing this status can take longer than it does for clientTransferProhibited because your registrar has to forward your request to your domain's registry and wait for them to lift the restriction.


### server update prohibited
serverUpdateProhibited

This status code locks your domain preventing it from being updated. It is an uncommon status that is usually enacted during legal disputes, at your request, or when a redemptionPeriod status is in place.

This status may indicate an issue with your domain that needs resolution. If so, you should contact your registrar for more information or to resolve the issue. If your domain does not have any issues, and you simply want to update it, you must first contact your registrar and request that they work with the Registry Operator to remove this status code.

Alternatively, some Registry Operators offer a Registry Lock Service that allows registrants, through their registrars to set this status as an extra protection against unauthorized updates. Removing this status can take longer than it does for clientUpdateProhibited because your registrar has to forward your request to your domain's registry and wait for them to lift the restriction.


### transfer period
transferPeriod

This grace period is provided after the successful transfer of a domain name from one registrar to another. If the new registrar deletes the domain name during this period, the registry provides a credit to the registrar for the cost of the transfer.

This is an informative status set for a limited period or your domain's transfer to a new registrar. If you did not request to transfer your domain, you should contact your original registrar.

### Client Status Codes are Set by Your Domain's Registrar


### client delete prohibited
clientDeleteProhibited

This status code tells your domain's registry to reject requests to delete the domain.

This status indicates that it is not possible to delete the domain name registration, which can prevent unauthorized deletions resulting from hijacking and/or fraud. If you do want to delete your domain, you must first contact your registrar and request that they remove this status code.


### client hold
clientHold

This status code tells your domain's registry to not activate your domain in the DNS and as a consequence, it will not resolve. It is an uncommon status that is usually enacted during legal disputes, non-payment, or when your domain is subject to deletion.

Often, this status indicates an issue with your domain that needs resolution. If so, you should contact your registrar to resolve the issue. If your domain does not have any issues, but you need it to resolve, you must first contact your registrar and request that they remove this status code.


### client renew prohibited
clientRenewProhibited

This status code tells your domain's registry to reject requests to renew your domain. It is an uncommon status that is usually enacted during legal disputes or when your domain is subject to deletion.

Often, this status indicates an issue with your domain that needs resolution. If so, you should contact your registrar to resolve the issue. If your domain does not have any issues, and you simply want to renew it, you must first contact your registrar and request that they remove this status code.


### client transfer prohibited
clientTransferProhibited

This status code tells your domain's registry to reject requests to transfer the domain from your current registrar to another.

This status indicates that it is not possible to transfer the domain name registration, which will help prevent unauthorized transfers resulting from hijacking and/or fraud. If you do want to transfer your domain, you must first contact your registrar and request that they remove this status code.


### client update prohibited
clientUpdateProhibited

This status code tells your domain's registry to reject requests to update the domain.

This domain name status indicates that it is not possible to update the domain, which can help prevent unauthorized updates resulting from fraud. If you do want to update your domain, you must first contact your registrar and request that they remove this status code.

