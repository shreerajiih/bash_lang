#! /bin/bash

# For Push Project Into The Git

select task in new pushOnly
do
    case $task in
        new)
            echo "Git Command Initializing......"
            git init
            git add .
            
            echo -n "Enter commit message: "
            read commit_msg
            git commit -m "$commit_msg"
            
            echo -n "Enter remote URL: "
            read remote_url
            git remote add origin "$remote_url"
            
            echo -n "Enter Branch Name To Push code: "
            read branch_name
            git branch -M "$branch_name"
            git push -u origin "$branch_name"
            
            echo "Code Push Successfully..."
            break
            ;;
            
        pushOnly)

            read -p "Enter Branch To Move Inside  " checkout_branch
            git checkout $checkout_branch

            git add .

            echo -n "Enter commit message: "
            read commit_msg
            git commit -m "$commit_msg"

            read -p "Which Branch i push ? " branch_name
            git push origin $branch_name

            echo "Code Push Successfully..."
            break
            ;;

        createBranch)

            read -p "Parent branch  " parent_branch
            git checkout $parent_branch

            read -p "New Branch name  " new_branch
            git checkout -b $new_branch

            read -p "You want to taken pull from other branch ? y or n" pull_y
            if [ $pull_y -eq y ]
            then
                read -p "Which branch You Taken pull From ? " pull_branch_name
                git pull origin $pull_branch_name
            fi

            echo branch created successfully....
            break
            ;;
            
        *)
            echo "Invalid option"
            break
            ;;
    esac
done
