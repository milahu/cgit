#ifndef UI_TREE_H
#define UI_TREE_H

#ifndef SHOW_DIRECTORIES_FIRST
// default: show directories first
#define SHOW_DIRECTORIES_FIRST 1
#endif

extern void cgit_print_tree(const char *rev, char *path);

#endif /* UI_TREE_H */
