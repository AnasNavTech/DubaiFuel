Page 50005 "Vehicle Consumption Detail"
{
    Editable = false;
    PageType = List;
    SourceTable = "Vehicle Consumption Detail";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Code"; Rec."Vehicle Code")
                {
                    ApplicationArea = Basic;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Starting KM"; Rec."Starting KM")
                {
                    ApplicationArea = Basic;
                }
                field("Ending KM"; Rec."Ending KM")
                {
                    ApplicationArea = Basic;
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Code"; Rec."Driver Code")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

