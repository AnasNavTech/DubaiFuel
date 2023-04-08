PageExtension 50003 "Customer Card Ext" extends "Customer Card"
{
    layout
    {

        modify(Control1905532107)
        {
            Visible = false;
        }
        modify(Control1907829707)
        {
            Visible = false;
        }
        modify(Control1902613707)
        {
            Visible = false;
        }
        modify(Control1900383207)
        {
            Visible = false;
        }
        modify(Control1905767507)
        {
            Visible = false;
        }
        addafter("Phone No.")
        {
            field("Mobile No."; Rec."Mobile No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(ContactDetails)
        {
            field("PDC Customer"; Rec."PDC Customer")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Credit Limit (LCY)")
        {
            field("PDCs On Hand"; Rec."PDCs On Hand")
            {
                ApplicationArea = Basic;
            }
            field("Security Cheque/BG/LC"; Rec."Security Cheque/BG/LC")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Last Date Modified")
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Copy Sell-to Addr. to Qte From")
        {
            field("Budgeted Amount"; Rec."Budgeted Amount")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {


        modify("Blanket Orders")
        {
            Visible = false;
        }
        modify(Quotes)
        {
            Visible = false;
        }
        modify(Invoices)
        {
            Visible = false;
        }
        modify(Orders)
        {
            Visible = false;
        }
        modify(NewSalesCreditMemo)
        {
            Visible = false;
        }
        modify("Return Orders")
        {
            Visible = false;
        }
        modify(NewServiceQuote)
        {
            Visible = false;
        }
        modify(NewServiceInvoice)
        {
            Visible = false;
        }
        modify("Service Orders")
        {
            Visible = false;
        }
        modify(NewServiceCreditMemo)
        {
            Visible = false;
        }
        modify(NewReminder)
        {
            Visible = false;
        }
        modify(NewFinanceChargeMemo)
        {
            Visible = false;
        }


        modify("Post Cash Receipts")
        {
            Visible = false;
        }
        modify("Sales Journal")
        {
            Visible = false;
        }

        modify("Report Customer Detailed Aging")
        {
            Visible = false;
        }
        modify("Report Customer - Labels")
        {
            Visible = false;
        }
        modify("Report Customer - Balance to Date")
        {
            Visible = false;
        }  //TODO
    }
}

