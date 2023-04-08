PageExtension 50033 "Inventory Setup Ext" extends "Inventory Setup"
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
        addafter("Posted Invt. Pick Nos.")
        {
            field("Vehicle Nos."; Rec."Vehicle Nos.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

