PageExtension 50021 "Post Sale Invoi Subform Ext" extends "Posted Sales Invoice Subform"
{
    Caption = 'Posted Sales Invoice Subform';
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

