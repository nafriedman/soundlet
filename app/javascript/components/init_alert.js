const clear = () => {
  notice.innerText = '';
  notice.classList.remove('alert');
};

const alert = () => {
  const notice = document.getElementById('notice');
  if (notice && notice.innerText === "Status updated successfully!") {
    notice.classList.add('alert');
    setTimeout(clear, 3000);
  }
};

export { alert }