TableExtension 50017 TabExtPurchaseHeader extends "Purchase Header"
{
    fields
    {



        field(50000; Cancelled; Boolean)
        {
            Description = '//GTFSDFPC1.00-Biswajit-03.05.11';
        }
        field(50001; "Close PO"; Boolean)
        {
        }
        field(50002; User; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-03.05.11';
            Editable = false;
        }

        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            var

            begin
                Rec.VALIDATE("Location Code", 'TANK 4');
            end;

        }

        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var

            begin
                IF "Sell-to Customer No." = '' THEN
                    VALIDATE("Location Code", 'TANK 4')
                ELSE
                    VALIDATE("Ship-to Code", '');
            end;

        }
    }
}

