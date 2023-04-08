TableExtension 50001 tabExtCustLedgerEntry extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
    }
    keys
    {
       
        key(Key1003;"Document Type",Open,"Salesperson Code","Closed by Entry No.")
        {
        }
     
        key(Key1004;"Customer No.")
        {
        }
    }
}

