TableExtension 50009 TabExtSalesShipmentheader extends "Sales Shipment Header"
{
    fields
    {
        field(50000; "Pre-printed DO No."; Code[20])
        {
        }
        field(50001; "Sell-to Mobile No."; Text[30])
        {
        }
        field(50002; "Ship-to Mobile No."; Text[30])
        {
            Caption = 'IMO Number';
        }
    }
    keys
    {
        key(Key1001; "Shipment Date")
        {
        }
        key(Key2001; "Posting Date")
        {
        }
    }
}

