#!/bin/bash

CSV_FILE="$HOME/physics_payments/physics_payments.csv"

add_payment() {
    read -p "Enter student name: " name
        read -p "Enter amount: " amount

            echo "Payment method:"
                echo "1. Cash"
                    echo "2. Transfer"
                        read -p "Choose (1 or 2): " method_choice

                            if [ "$method_choice" == "1" ]; then
                                    method="Cash"
                                        else
                                                method="Transfer"
                                                    fi

                                                        date=$(date +%Y-%m-%d)

                                                            echo "$name,$amount,$method,$date" >> "$CSV_FILE"
                                                                echo "✅ $name added successfully!"
                                                                }

                                                                echo "===== Physics Payment Manager ====="

                                                                while true; do
                                                                    add_payment

                                                                        read -p "Add another student? (yes/no): " another
                                                                            if [ "$another" != "yes" ]; then
                                                                                    break
                                                                                        fi
                                                                                        done

                                                                                        echo ""
                                                                                        echo "Syncing with GitHub..."
                                                                                        cd "$HOME/physics_payments"
                                                                                        git fetch origin
                                                                                        git checkout --ours physics_payments.csv
                                                                                        git add .
                                                                                        git commit -m "Update payments - $(date +%Y-%m-%d)"
                                                                                        git push

                                                                                        echo ""
                                                                                        echo "✅ All done! Payments saved and pushed to GitHub!"
