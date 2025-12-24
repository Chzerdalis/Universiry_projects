CC = icx
CFLAGS = -Wall -O0
LDFLAGS = -lm

VERSIONS_DIR = All_versions

V0_DIR = $(VERSIONS_DIR)/v0
V1_DIR = $(VERSIONS_DIR)/v1
V2_DIR = $(VERSIONS_DIR)/v2
V3_DIR = $(VERSIONS_DIR)/v3
V4_DIR = $(VERSIONS_DIR)/v4
V5_DIR = $(VERSIONS_DIR)/v5
V6_DIR = $(VERSIONS_DIR)/v6
V6_1_DIR = $(VERSIONS_DIR)/v6.1
V7_DIR = $(VERSIONS_DIR)/v7
V7_1_DIR = $(VERSIONS_DIR)/v7.1

V0_SRC = $(V0_DIR)/First_commit
V1_SRC = $(V1_DIR)/For_Interchange
V2_SRC = $(V2_DIR)/Loop_unrolling
V3_SRC = $(V3_DIR)/Loop_fusion
V4_SRC = $(V4_DIR)/Function_inlining
V5_SRC = $(V5_DIR)/Loop_Invariant_code_motion
V6_SRC = $(V6_DIR)/Strenght_Reduction_Common_Subexpression_Elimination
V6_1_SRC = $(V6_1_DIR)/v6_with_lookup
V7_SRC = $(V7_DIR)/2xfactor_unroll
V7_1_SRC = $(V7_1_DIR)/v7_with_lookup

V0_EXEC = v0
V1_EXEC = v1
V2_EXEC = v2
V3_EXEC = v3
V4_EXEC = v4
V5_EXEC = v5
V6_EXEC = v6
V6_1_EXEC = v6_1
V7_EXEC = v7
V7_1_EXEC = v7_1

ALL_VERSIONS = $(V0_EXEC) $(V1_EXEC) $(V2_EXEC) $(V3_EXEC) $(V4_EXEC) $(V5_EXEC) $(V6_EXEC) $(V6_1_EXEC) $(V7_EXEC) $(V7_1_EXEC)

all: $(ALL_VERSIONS)

$(V0_EXEC): $(V0_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V1_EXEC): $(V1_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V2_EXEC): $(V2_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V3_EXEC): $(V3_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V4_EXEC): $(V4_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V5_EXEC): $(V5_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V6_EXEC): $(V6_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V6_1_EXEC): $(V6_1_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V7_EXEC): $(V7_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

$(V7_1_EXEC): $(V7_1_SRC)
	$(CC) $(CFLAGS) -x c $< -o $@ $(LDFLAGS)

all-O0: CFLAGS = -Wall -O0
all-O0: clean $(ALL_VERSIONS)

all-ofast: CFLAGS = -Wall -Ofast
all-ofast: clean $(ALL_VERSIONS)

clean:
	rm -f $(ALL_VERSIONS)
	rm -f output_*.grey
	rm -f *.jpg

.PHONY: all all-O0 all-ofast test test-all clean images help
