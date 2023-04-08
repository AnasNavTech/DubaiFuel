PageExtension 50018 "Posted Sales Shipment Ext" extends "Posted Sales Shipment"
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
        addafter("&Print")
        {
            action(PrintInvoice)
            {
                ApplicationArea = all;
                Caption = 'Print Invoice';
                Image = Print;
                trigger OnAction()
                var
                    SalesShptHeader: Record "Sales Shipment Header";
                begin
                    SalesShptHeader.RESET;
                    SalesShptHeader.SETRANGE("No.", Rec."No.");
                    REPORT.RUNMODAL(50033, TRUE, TRUE, SalesShptHeader);
                end;


            }
        }


    }
}

