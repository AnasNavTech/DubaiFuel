PageExtension 50015 "Purch. Invoice Subform Ext" extends "Purch. Invoice Subform"
{
    Caption = 'Purch. Invoice Subform';
    layout
    {

    }
    actions
    {

        modify("F&unctions")
        {
            Visible = false;
        }
        modify("E&xplode BOM")
        {
            Visible = false;
        }
        modify(InsertExtTexts)
        {
            Visible = false;
        }
        modify(GetReceiptLines)
        {
            Visible = false;
        }
        modify("&Line")
        {
            Visible = false;
        }
        modify("Item Availability by")
        {
            Visible = false;
        }
        modify(Period)
        {
            Visible = false;
        }
        modify(Variant)
        {
            Visible = false;
        }
        modify(Location)
        {
            Visible = false;
        }
        modify(Dimensions)
        {
            Visible = false;
        }
        modify("Co&mments")
        {
            Visible = false;
        }
        modify(ItemChargeAssignment)
        {
            Visible = false;
        }
        modify("Item &Tracking Lines")
        {
            Visible = false;
        }
    }
}

