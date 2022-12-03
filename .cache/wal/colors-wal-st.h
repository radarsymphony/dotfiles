const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#240a05", /* black   */
  [1] = "#b6371c", /* red     */
  [2] = "#c59506", /* green   */
  [3] = "#aa870d", /* yellow  */
  [4] = "#0896b4", /* blue    */
  [5] = "#565ba9", /* magenta */
  [6] = "#b44d87", /* cyan    */
  [7] = "#c8c1c0", /* white   */

  /* 8 bright colors */
  [8]  = "#5a4743",  /* black   */
  [9]  = "#b6371c",  /* red     */
  [10] = "#c59506", /* green   */
  [11] = "#aa870d", /* yellow  */
  [12] = "#0896b4", /* blue    */
  [13] = "#565ba9", /* magenta */
  [14] = "#b44d87", /* cyan    */
  [15] = "#c8c1c0", /* white   */

  /* special colors */
  [256] = "#240a05", /* background */
  [257] = "#c8c1c0", /* foreground */
  [258] = "#c8c1c0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
