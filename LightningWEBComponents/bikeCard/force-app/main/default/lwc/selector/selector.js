import { LightningElement, wire } from 'lwc';
//importar getRecord y los campos necesarios
import { getRecord } from 'lightning/uiRecordApi';
import USER_ID from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';


export default class Selector extends LightningElement {
    selectedProductId;

    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }
    //Wire para conectar datos del usuario y el adapatador getRecord para obtener registros
    //El primer argumento debe ser una función o adaptador
    //segundo es un objeto de configuración que depende del adaptador, recordId: El ID del registro a consultar, fields: Los campos del registro a obtener. 
    @wire(getRecord, { recordId: USER_ID, fields: [NAME_FIELD] })
    userData;
}
