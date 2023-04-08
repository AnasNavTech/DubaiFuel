TableExtension 50013 TabExtSalesInvheader extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Pre-printed DO No."; Code[20])
        {
        }
        field(50009; "Print Partial Invoice"; Boolean)
        {
        }
    }
    keys
    {
        key(Key1001; "Sell-to Customer No.", "Posting Date")
        {
        }
        key(Key2001; "Posting Date")
        {
        }
    }
}

