PageExtension 50004 "Customer List ext" extends "Customer List"
{
    layout
    {

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
        addafter("No.")
        {
            field("Budgeted Amount"; Rec."Budgeted Amount")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Name)
        {
            field("PDCs On Hand"; Rec."PDCs On Hand")
            {
                ApplicationArea = Basic;
            }
            field(Balance; Rec.Balance)
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
        modify(NewSalesInvoice)
        {
            Visible = false;
        }
        modify(Orders)
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

        modify(NewReminder)
        {
            Visible = false;
        }


        modify(NewServiceCrMemo)
        {
            Visible = false;
        }
        modify(Reminder)
        {
            Visible = false;
        }
        modify("Issued &Finance Charge Memos")
        {
            Visible = false;
        }
        modify(NewFinChargeMemo)
        {
            Visible = false;
        }

        modify("Cash Receipt Journal")
        {
            Visible = false;
        }
        modify("Sales Journal")
        {
            Visible = false;
        }

        modify("Customer List")
        {
            Visible = false;
        }
        modify("Customer Register")
        {
            Visible = false;
        }
        modify(ReportCustomerDetailTrial)
        {
            Visible = false;
        }
        modify(ReportCustomerSummaryAging)
        {
            Visible = false;
        }
        modify(ReportCustomerDetailedAging)
        {
            Visible = false;
        }
        modify("Customer - Order Summary")
        {
            Visible = false;
        }
        modify("Customer - Order Detail")
        {
            Visible = false;
        }
        modify("Customer - Top 10 List")
        {
            Visible = false;
        }
        modify("Sales Statistics")
        {
            Visible = false;
        }
        modify("Customer/Item Sales")
        {
            Visible = false;
        }
        modify(Statement)
        {
            Visible = false;
        }

        modify("Customer - Sales List")
        {
            Visible = false;
        }
        modify(ReportAgedAccountsReceivable)
        {
            Visible = false;
        }
        modify(ReportCustomerBalanceToDate)
        {
            Visible = false;
        }
        modify(ReportCustomerTrialBalance)
        {
            Visible = false;
        }
        modify(ReportCustomerPaymentReceipt)
        {
            Visible = false;
        }
        //TODO
        addfirst("&Customer")
        {
            action(Card)
            {
                ApplicationArea = Basic;
                Caption = 'Card';
                Image = EditLines;
                RunPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                            "Global Dimension 1 Filter" = field("Global Dimension 1 Filter");
                RunObject = Page "Customer Card";
                ShortCutKey = 'Shift+F7';
            }
        }
    }



}

