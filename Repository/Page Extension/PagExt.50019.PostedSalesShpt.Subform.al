PageExtension 50019 "Posted Sales Shpt. Subform Ext" extends "Posted Sales Shpt. Subform"
{
    Caption = 'Posted Sales Shpt. Subform';
    layout
    {
        addafter(Type)
        {
            field("Document No."; Rec."Document No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("No.")
        {
            field(Cancelled; Rec.Cancelled)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

