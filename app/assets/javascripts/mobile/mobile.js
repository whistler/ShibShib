function goto(form) { var index=form.select.selectedIndex
if (form.select.options[index].value != "0") {
location=form.select.options[index].value;}}


function ClipBoard()
{
  copyID.innerText = copytext.innerText;
  Copied = copyID.createTextRange();
  Copied.execCommand("Copy");
  alert("Copied");
}
