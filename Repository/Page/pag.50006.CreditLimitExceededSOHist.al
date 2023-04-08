Page 50006 "Credit Limit Exceeded SO Hist."
{
    Caption = 'Credit Limit Exceeded SO History';
    Editable = false;
    PageType = Card;
    SourceTable = "Credit Limit Exceeded SOs";
    SourceTableView = where("Document Type" = const(Order),
                            Approved = const(true));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Credit Limit Exceeded"; Rec."Credit Limit Exceeded")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approved Date"; Rec."Approved Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approved Time"; Rec."Approved Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reason/Comment"; Rec."Reason/Comment")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction()
                    begin
                        SalesHeaderArchive.SetRange("Document Type", Rec."Document Type");
                        SalesHeaderArchive.SetRange("No.", Rec."Document No.");
                        if SalesHeaderArchive.Find('+') then
                            page.Run(page::"Sales Order Archive", SalesHeaderArchive);
                    end;
                }
            }
        }
    }

    var
        SalesHeaderArchive: Record "Sales Header Archive";
}

