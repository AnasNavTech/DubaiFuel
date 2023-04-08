PageExtension 50037 "Transfer Order Ext" extends "Transfer Order"
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
    }
    actions
    {

        modify("Re&lease")
        {
            Promoted = false;
        }



        modify("Inventory - Inbound Transfer")
        {
            Visible = false;
        }
    }
}

