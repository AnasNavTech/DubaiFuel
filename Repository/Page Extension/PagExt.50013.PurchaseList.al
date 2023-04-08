PageExtension 50013 "Purchase List Ext" extends "Purchase List"
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
        addafter("No.")
        {
            field("Vendor Order No."; Rec."Vendor Order No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {


        modify("Purchase Reservation Avail.")
        {
            Visible = false;
        }
    }
}

