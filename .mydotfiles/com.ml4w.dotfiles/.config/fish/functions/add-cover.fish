# A function to add a cover image to MKV files.
# It can be run from any directory and will iterate through all
# .mkv files in the current directory and add the specified
# cover image to each one.
function add-cover
    # Check if a filename for the cover image was provided
    if test (count $argv) -eq 0
        echo "Usage: add-cover <cover_image_filename>"
        return 1
    end

    set cover_image $argv[1]

    # Check if the cover image file exists
    if not test -f "$cover_image"
        echo "Error: Cover image file '$cover_image' not found."
        return 1
    end

    # Loop through all .mkv files in the current directory
    for file in *.mkv
        # Check if any .mkv files were found
        if test "$file" = "*.mkv"
            echo "No .mkv files found in the current directory."
            return 1
        end

        echo "Adding '$cover_image' to '$file'..."

        # Use mkvpropedit to add the attachment
        mkvpropedit "$file" --add-attachment "$cover_image" --set attachment-mime-type="image/jpeg"

        if test $status -eq 0
            echo "Successfully added cover to '$file'."
        else
            echo "Failed to add cover to '$file'."
        end
    end
end
