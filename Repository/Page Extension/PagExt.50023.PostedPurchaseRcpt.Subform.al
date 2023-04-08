PageExtension 50023 "Post Purch Rcpt. Subform Ext" extends "Posted Purchase Rcpt. Subform"
{
    Caption = 'Posted Purchase Rcpt. Subform';
    layout
    {
        addafter("No.")
        {
            field(Cancelled; Rec.Cancelled)
            {
                ApplicationArea = Basic;
            }
            field("Vehicle Code"; Rec."Vehicle Code")
            {
                ApplicationArea = Basic;
            }
            field("Driver No."; Rec."Driver No.")
            {
                ApplicationArea = Basic;
            }
            field("Driver Name"; Rec."Driver Name")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

