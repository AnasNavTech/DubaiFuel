Page 50001 "Vehicle List"
{
    Editable = false;
    PageType = List;
    SourceTable = Vehicle;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; Rec."Registration No.")
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

