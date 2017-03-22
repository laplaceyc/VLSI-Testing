#include<stdio.h>
#include<stdlib.h>

int main()
{
	printf("┌─┬─┬─┬─┐\n");
	printf("│x1│x2│x3│ z│\n");
	printf("├─┼─┼─┼─┤\n");
	int x1, x2, x3, a, b, z;
	int as0 = 0, as1 = 0, bs0 = 0, bs1 = 0, zs0 = 0, zs1=0;
		for (x1 = 0; x1 < 2;x1++)
			for (x2 = 0; x2 < 2; x2++)
				for (x3 = 0; x3 < 2; x3++) {
					a = !(x1 || x2);
					b = !(x2 && x3);
					z = !(a || b);
					if (z != (!(0 || b))) as0++;
					if (z != (!(1 || b))) as1++;
					if (z != (!(a || 0))) bs0++;
					if (z != (!(a || 1))) bs1++;
					if (z != 0) zs0++;
					if (z != 1) zs1++;
					printf("│ %d│ %d│ %d│ %d│\n", x1, x2, x3, z);
					if(x1==1&&x2==1&&x3==1)	printf("└─┴─┴─┴─┘\n");
					else printf("├─┼─┼─┼─┤\n");
				}
		printf("┌───────┬───┬───┬───┬───┬───┬───┐\n");
		printf("│     Fault    │a-sa-0│a-sa-1│b-sa-0│b-sa-1│z-sa-0│z-sa-1│\n");
		printf("├───────┼───┼───┼───┼───┼───┼───┤\n");
		printf("│ #Test Pattern│     %d│     %d│     %d│     %d│     %d│     %d│\n", as0, as1, bs0, bs1, zs0, zs1);
		printf("└───────┴───┴───┴───┴───┴───┴───┘\n");
	system("PAUSE");
    return 0;
}