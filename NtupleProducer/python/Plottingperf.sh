export WORKDIR=$PWD
export SIGNAL=$WORKDIR/perfNano_TTbar_PU200.root
export MinBias=$WORKDIR/perfNano_SingleNeutrino_PU200.root
htsuite=test_DC_SC8
Label=SC8

export FOLDER=$WORKDIR/Label
python3 scripts/makeJecs.py "$SIGNAL" -A -o "$Label"JECs.root

echo "Making plots for jet hT"
python3 scripts/jetHtSuite.py "$SIGNAL" "$MinBias" "$outdir"/ht -w "$Label" -v ht
for i in {1..12}; do
    echo "Making plots for jet $i"
    python3 scripts/jetHtSuite.py "$SIGNAL" "$MinBias" "$outdir"_plots/jet"$i" -w "$Label" -v jet"$i" --jecs "$Label"JECs.root --gendr 0.4
done
