PageExtension 50031 "Item Journal Batches Ext" extends "Item Journal Batches"
{


    layout
    {

        modify(Control1900383207)
        {
            Visible = false;
        }
        modify(Control1905767507)
        {
            Visible = false;
        }
        addafter(Description)
        {
            field("Internal Consumption"; Rec."Internal Consumption")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("No. Series")
        {
            field("G/L Account No."; Rec."G/L Account No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

