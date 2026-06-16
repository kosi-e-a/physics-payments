SV_FILE="$HOME/physics_payments/physics_payments.csv"

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

                                                            # Count existing data rows (total lines minus header) to get next number
                                                                last_no=$(($(wc -l < "$CSV_FILE") - 1))
                                                                    next_no=$((last_no + 1))

                                                                        echo "$next_no,$name,$amount,$method,$date" >> "$CSV_FILE"
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
                                                                                                    echo "Pushing to GitHub..."
                                                                                                    cd "$HOME/physics_payments"
                                                                                                    git add .
                                                                                                    git commit -m "Update payments - $(date +%Y-%m-%d)"
                                                                                                    git push

                                                                                                    echo ""
                                                                                                    echo "✅ All done! Payments saved and pushed to GitHub!"
