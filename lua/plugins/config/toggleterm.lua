local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
    return
done

toggleterm.setup{
  direction = 'float'
}

