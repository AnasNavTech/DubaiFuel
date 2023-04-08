PageExtension 50025 "Post Purch. Invoi Subform Ext" extends "Posted Purch. Invoice Subform"
{
    Caption = 'Posted Purch. Invoice Subform';
    layout
    {
        addafter("No.")
        {
            field(Cancelled; Rec.Cancelled)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

