PageExtension 50001 "Chart of Accounts Ext" extends "Chart of Accounts"
{
    Editable = false;
    layout
    {


        modify(Control1905532107)
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
    }
    actions
    {


        modify("G/L Register")
        {
            Visible = false;
        }


        modify("Detail Trial Balance")
        {
            Visible = false;
        }
        modify("Trial Balance")
        {
            Visible = false;
        }
        modify("Trial Balance by Period")
        {
            Visible = false;
        }
        modify(Action1900210206)
        {
            Visible = false;
        }
        addfirst("A&ccount")
        {
            action(Card)
            {
                ApplicationArea = Basic;
                Caption = 'Card';
                Image = EditLines;
                RunPageLink = "No." = field("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                             "Budget Filter" = FIELD("Budget Filter"),
                              "Business Unit Filter" = FIELD("Business Unit Filter");
                RunObject = Page "G/L Account Card";
                ShortCutKey = 'Shift+F7';
            }
        }
    }



}

