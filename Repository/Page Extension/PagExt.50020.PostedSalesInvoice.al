PageExtension 50020 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
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
        addafter(Print)
        {
            action(PrintInvoice)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    REPORT.RUNMODAL(50042, TRUE, TRUE, SalesInvHeader);
                end;


            }
        }

    }
}

