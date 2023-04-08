TableExtension 50027 tabexttransferline extends "Transfer Line"
{
    fields
    {
        field(50000; "Receipt No."; Code[20])
        {
            Caption = 'Receipt No.';
            Editable = false;
        }
        field(50001; "Receipt Line No."; Integer)
        {
            Caption = 'Receipt Line No.';
            Editable = false;
        }
    }
}

