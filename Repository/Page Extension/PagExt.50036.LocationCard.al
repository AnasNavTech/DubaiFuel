PageExtension 50036 "Location Card Ext" extends "Location Card"
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
        addafter(Contact)
        {
            field("Capacity in IG"; Rec."Capacity in IG")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {



    }
}

