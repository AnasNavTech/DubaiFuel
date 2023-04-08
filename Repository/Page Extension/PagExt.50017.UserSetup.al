PageExtension 50017 "User Setup Ext" extends "User Setup"
{
    layout
    {

        modify(Control1900383207)
        {
            Visible = false;
        }

        addafter("User ID")
        {
            field("Sales Price Visible"; Rec."Sales Price Visible")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

