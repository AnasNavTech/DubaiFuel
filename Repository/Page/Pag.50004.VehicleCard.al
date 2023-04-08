Page 50004 "Vehicle Card"
{
    PageType = Card;
    SourceTable = Vehicle;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit then
                            CurrPage.Update;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Registration No.";Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Capacity in IG';
                }
            }
        }
    }

    actions
    {
    }
}

