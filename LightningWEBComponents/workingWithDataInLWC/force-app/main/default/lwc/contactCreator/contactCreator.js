import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import CONTACT_FIRST_NAME from '@salesforce/schema/Contact.FirstName';
import CONTACT_LAST_NAME from '@salesforce/schema/Contact.LastName';
import CONTACT_EMAIL from '@salesforce/schema/Contact.Email';

export default class ContactCreator extends LightningElement {
    objectApiName = CONTACT_OBJECT;
    fields = [CONTACT_FIRST_NAME, CONTACT_LAST_NAME, CONTACT_EMAIL];

    handleSuccess(event) {
        const contactId = event.detail.id;

        const toastEvent = new ShowToastEvent({
            title: 'Success!',
            message: `Contact created with Id: ${contactId}`,
            variant: 'success',
        });
        this.dispatchEvent(toastEvent);
    }
}
