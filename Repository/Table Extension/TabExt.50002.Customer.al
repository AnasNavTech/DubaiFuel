TableExtension 50002 TabExtCustomer extends Customer
{
    fields
    {
        field(50000; "PDCs On Hand"; Decimal)
        {
            CalcFormula = sum("Gen. Journal Line"."Credit Amount" where("Journal Template Name" = const('PDC_CUST'),
                                                                         "Journal Batch Name" = const('PDC_CUST'),
                                                                         "Account Type" = filter(Customer),
                                                                         "Account No." = field("No."),
                                                                         "Document Type" = filter(Payment),
                                                                         "Reason Code" = filter('PDC_CUST')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "PDC Customer"; Boolean)
        {
        }
        field(50002; "Mobile No."; Text[30])
        {
        }
        field(50003; "Bypass Credit Limit Check"; Boolean)
        {
        }
        field(50004; "Avg. Daily Consumption (IG)"; Integer)
        {
        }
        field(50005; "Storage Capacity (IG)"; Integer)
        {
        }
        field(50006; "Reorder Level (IG)"; Integer)
        {
        }
        field(50007; "Required Supply Qty (IG)"; Integer)
        {
        }
        field(50008; "Required Supply Frequency"; Integer)
        {
        }
        field(50009; "Customer Acquisition Date"; Date)
        {
        }
        field(50010; "Active Customer"; Boolean)
        {
        }
        field(50011; "Security Cheque/BG/LC"; Decimal)
        {
        }
        field(50020; "Customer Type"; Option)
        {
            OptionMembers = " ",Bunker,Commercial;
        }
        field(50021; "G1 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('G1'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50022; "F180 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('F180'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50023; "GO1 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('GO1'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50024; "FO180 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('FO180'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50025; "GO2 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('GO2'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50026; "GO3 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('GO3'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50027; "GO4 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('GO4'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50028; "GO5 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('GO5'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50029; "GO6 Quantity (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('GO6'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50030; "Total FuelOil Qty (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('F180' | 'FO180'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50031; "Total GasOil Qty (IG)"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Invoiced Quantity" where("Source No." = field("No."),
                                                                        "Item No." = filter('G1' | 'GO1' | 'GO2' | 'GO3' | 'GO4' | 'GO5' | 'GO6'),
                                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50032; "Total GasOil Sales Amount"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Sales Amount (Actual)" where("Source No." = field("No."),
                                                                            "Item No." = filter('G1' | 'GO1' | 'GO2' | 'GO3' | 'GO4' | 'GO5' | 'GO6'),
                                                                            "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50033; "Total GasOil Cost Amount"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Cost Amount (Actual)" where("Source No." = field("No."),
                                                                           "Item No." = filter('G1' | 'GO1' | 'GO2' | 'GO3' | 'GO4' | 'GO5' | 'GO6'),
                                                                           "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50034; "Total FuelOil Sales Amount"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Sales Amount (Actual)" where("Source No." = field("No."),
                                                                            "Item No." = filter('F180' | 'FO180'),
                                                                            "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50035; "Total FuelOil Cost Amount"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Cost Amount (Actual)" where("Source No." = field("No."),
                                                                           "Item No." = filter('F180' | 'FO180'),
                                                                           "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
    }
}

