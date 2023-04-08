TableExtension 50014 TabExtSalesHeader extends "Sales Header"
{
    fields
    {
        modify(Status)
        {
#pragma warning disable AL0600 // TODO: - Recheck
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Shipped';
#pragma warning restore AL0600 // TODO: - Recheck


        }
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            begin
                Rec.VALIDATE("Location Code", 'TANK 4');
            end;
        }


        field(50000; "Pre-printed DO No."; Code[20])
        {

            trigger OnValidate()
            begin
                "Shipping No." := "Pre-printed DO No.";
            end;
        }
        field(50001; "Sell-to Mobile No."; Text[30])
        {
        }
        field(50002; "Ship-to Mobile No."; Text[30])
        {
            Caption = 'IMO Number';
        }
        field(50003; "Close SO"; Boolean)
        {
        }
        field(50004; Cancelled; Boolean)
        {
            Description = '//GTFSDFPC1.00-Biswajit-03.05.11';
        }
        field(50020; "Customer Type"; Option)
        {
            OptionMembers = " ",Bunker,Commercial;
        }
    }

}

