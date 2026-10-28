' ============================================================
' Econometrics blog — reproduce every table in Posts 1 to 8
' Put this file in the same folder as blog_datasets.xlsx and run it.
' All data are simulated for teaching purposes.
' ============================================================

%path = @runpath
cd %path
%xl = "blog_datasets.xlsx"

wfcreate(wf=blog, page=p1) m 2015m01 2024m12

' ---------------- Post 1: Does ice cream drown people? ----------------
import(type=excel) %xl range="P1_icecream" @freq m 2015m01
equation eq1a.ls drown c icecream
equation eq1b.ls drown c icecream temp
equation eq1c.ls icecream c temp

' ---------------- Post 2: Two random walks ----------------
pagecreate(page=p2) u 1 200
import(type=excel) %xl range="P2_spurious" @freq u 1
equation eq2a.ls popcorn c goldfish
equation eq2b.ls d(popcorn) c d(goldfish)
popcorn.uroot(adf)        ' unit root test on each series
goldfish.uroot(adf)

' ---------------- Post 3: R-squared is not a report card ----------------
pagecreate(page=p3) u 1 40
import(type=excel) %xl range="P3_rsquared" @freq u 1
equation eq3a.ls score c hours
equation eq3b.ls score c hours shoe bmonth letters buswait
freeze(wald3) eq3b.wald c(3)=0, c(4)=0, c(5)=0, c(6)=0

' ---------------- Post 4: The noisy ruler ----------------
pagecreate(page=p4) u 1 150
import(type=excel) %xl range="P4_measurement" @freq u 1
equation eq4a.ls marks c sleep_tracker
equation eq4b.ls marks c sleep_self
scalar reliability = @var(sleep_tracker)/@var(sleep_self)

' ---------------- Post 5: When the errors fan out ----------------
pagecreate(page=p5) u 1 200
import(type=excel) %xl range="P5_hetero" @freq u 1
equation eq5a.ls food c income
freeze(white5a) eq5a.hettest(type=white)
equation eq5b.ls(cov=white) food c income
equation eq5c.ls log(food) c log(income)
freeze(white5c) eq5c.hettest(type=white)

' ---------------- Post 6: The monsoon dummy ----------------
pagecreate(page=p6) m 2015m01 2024m12
import(type=excel) %xl range="P6_monsoon" @freq m 2015m01
equation eq6a.ls umbrella c trend
equation eq6b.ls umbrella c trend monsoon may
' The dummy variable trap: the next line stops with a near singular matrix error
' equation eq6trap.ls umbrella c trend monsoon dry may
equation eq6c.ls umbrella trend monsoon dry may

' ---------------- Post 7: The day the rules changed ----------------
pagecreate(page=p7) m 2012m01 2021m12
import(type=excel) %xl range="P7_break" @freq m 2012m01
equation eq7a.ls digital c trend
freeze(chow7) eq7a.chow 2016m11
equation eq7b.ls digital c trend post post*(trend-59)

' ---------------- Post 8: Two friends who always arrive together ----------------
pagecreate(page=p8) u 1 60
import(type=excel) %xl range="P8_multicol" @freq u 1
equation eq8a.ls rent c builtup carpet
freeze(vif8) eq8a.varinf
freeze(wald8) eq8a.wald c(2)=0, c(3)=0
equation eq8b.ls rent c builtup
scalar corr_area = @cor(builtup, carpet)

' ================= Unit Root Series =================
' Chapters 1-8 of the Unit Root Series (blog posts 9-16)

' ---------------- Chapter 1: The kite and the balloon ----------------
pagecreate(page=p9) u 1 200
import(type=excel) %xl range="P9_kite_balloon" @freq u 1
freeze(corr_kite) kite.correl(12)
freeze(corr_balloon) balloon.correl(12)
' Chapter 5 (KPSS) uses these two series as well
freeze(kpss_kite) kite.uroot(kpss, const)
freeze(kpss_balloon) balloon.uroot(kpss, const)
freeze(adf_kite) kite.uroot(adf, const)
freeze(adf_balloon) balloon.uroot(adf, const)

' ---------------- Chapter 2: Dickey-Fuller ----------------
pagecreate(page=p10) m 2005m01 2024m12
import(type=excel) %xl range="P10_dickey_fuller" @freq m 2005m01
freeze(df_exrate) exrate.uroot(adf, trend, lag=0)
freeze(df_infl) infl.uroot(adf, const, lag=0)

' ---------------- Chapter 3: Augmented Dickey-Fuller ----------------
pagecreate(page=p11) q 1995q1 2024q4
import(type=excel) %xl range="P11_adf" @freq q 1995q1
freeze(df0_lgdp) lgdp.uroot(adf, trend, lag=0)
freeze(adf_lgdp) lgdp.uroot(adf, trend, info=sic)
freeze(adf_dlgdp) lgdp.uroot(adf, const, dif=1, info=sic)
' Chapter 5 (KPSS) on the same series
freeze(kpss_lgdp) lgdp.uroot(kpss, trend)

' ---------------- Chapter 4: Phillips-Perron ----------------
pagecreate(page=p12) m 2005m01 2024m12
import(type=excel) %xl range="P12_phillips_perron" @freq m 2005m01
freeze(pp_spread) spread.uroot(pp, const)
freeze(adf_spread) spread.uroot(adf, const, info=sic)

' ---------------- Chapters 5 and 6: MYSTERY ----------------
pagecreate(page=p14) u 1 100
import(type=excel) %xl range="P14_mystery" @freq u 1
freeze(adf_mystery) mystery.uroot(adf, const, info=sic)
freeze(kpss_mystery) mystery.uroot(kpss, const)
freeze(dfgls_mystery) mystery.uroot(dfgls, const, info=sic)
freeze(np_mystery) mystery.uroot(np, const)

' ---------------- Chapter 7: Structural breaks ----------------
pagecreate(page=p15) a 1960 2023
import(type=excel) %xl range="P15_break" @freq a 1960
freeze(adf_lincome) lincome.uroot(adf, trend, info=sic)
' Zivot-Andrews / breakpoint test: open LINCOME and use
' View -> Unit Root Tests -> Breakpoint Unit Root Test
' (Trend and intercept, break in trend and intercept, innovational outlier,
'  minimize Dickey-Fuller t-statistic).

' ---------------- Chapter 8: Panel unit root tests ----------------
pagecreate(page=p16) u 1 600
import(type=excel) %xl range="P16_panel" @freq u 1
' Turn the stacked data into a dated panel (state x year).
' If this line stops with an error, use Proc -> Structure/Resize Current Page
' -> Dated Panel, with STATE as the cross-section ID and YEAR as the date.
pagestruct state @date(year)
freeze(panel_summary) infl.uroot(sum, const)
freeze(panel_hadri) infl.uroot(hadri, const)
