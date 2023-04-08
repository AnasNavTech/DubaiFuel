PageExtension 50038 "Transfer Order Subform Ext" extends "Transfer Order Subform"
{
    Caption = 'Transfer Order Subform';
    layout
    {
        addafter(Description)
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("Item &Tracking Lines")
        {
            action("Get Receipt Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Get Receipt Lines';

                trigger OnAction()
                begin
                    GetReceipt;

                end;
            }
        }
    }

    procedure GetReceipt()
    begin
        Codeunit.Run(Codeunit::"Purch.-Get Receipt2", Rec);
    end;
}

