# scan2pdf

A bash script for scanning several pages directly to a PDF file.

## Requirements

Apart from the obvious requirement of a recent version of bash, you need:

- [SANE](http://www.sane-project.org)'s scanimage for scanning
- [ImageMagick](http://www.imagemagick.org)'s convert for converting to PDF
- Some wipe utiltiy to securely delete the scanned images afterwards 

## Usage

To simply scan one page, run

   `# scan2pdf.sh`

This will create a file *scan.pdf* with then scanned page at 150 dpi.

If you want to scan at a higher resolution, use the *-d/--dpi* option:

   `# scan2pdf.sh --dpi 300`

To scan three pages at once and save them all in one PDF file called
*invoice.pdf*, use:

   `# scan2pdf.sh -n 3 --dpi 300 invoice.pdf`

## License

This small utility is release under the GPL, version 3. See the accompanying
[license file](LICENSE.txt).

