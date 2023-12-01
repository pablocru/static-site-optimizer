import fs from 'fs';

function displayFilesNoRecursive(folderPath) {
  const files = fs.readdirSync(folderPath);

  console.log(files);
}

const folderPath = process.argv[2];

if (!folderPath) {
  console.error('Error: Folder path must be provided.');
  process.exit(1);
}

displayFilesNoRecursive(folderPath);
