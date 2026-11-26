Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682372;
	b=bWiAJhuYDbkv008kqmQxh+BgoytcHr/fINanj1u4bqOuFI9ik7S6RMq51qFvgVry5xkG
	 dW9u71kCkiPKv+0UqjZWttiauob1Fuabf/EUKCu6QL5971hei2U4Yx6PPoiJndVQUD4A5
	 JUyB4FhWHu6vJhqbfS29kmuNRl6quolMAZDtjyYckq5e5RMXJZp9vTMBMkAWnGSrt02PJ
	 RS9UJUBBvN/2ZwA6GzjEf0KKjNFbjquySSkiKRogQxoJ9vnvY1DE1SEdE+BSasUiFKt4B
	 gAz1d47cLcYWf799nGpYaaHLk4IIkvAhem93cEpke+7aA0LCOAzCF5vwJ1vEjEiIdEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6vmCyk1wHKXw+7g14mItgN1PaoGOIgGRCupW0b+o84s=;
	b=jrVMCVYFJpm4ez6kRu/5gHXEtFmWCq0kdXxf/b187/CEvcbJImBKFnPclg3WsOVp80Sa
	 pHxiwadlEVg/MQeFiRFv73i8G9B827Xno/0ww5jPcuz8WPdGWng61asTbV4xeux8dOPgJ
	 GV4c9mOfpywMi3tinzLQEWqGAKUtnoyeMW7VKX0Qq39ih5g184P7OKTawaPWZYr47BGG/
	 n2r7Uir1mfIXYtcl1mDAWc9p9KhBpZ9SmTmPWLsiok4l/P1caSry39EU18pprJRLSJ8sg
	 f6rMORrPc60QrJOUCBgYDh2+Vs4b35d0AiymzlR6CUlRXtDYyRr8gesMpjwGHGIrsRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVKvlDz4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OHlkShL4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733C0606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVKvlDz4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OHlkShL4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B0JU695121
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6vmCyk1wHKXw+7g14mItgN
	1PaoGOIgGRCupW0b+o84s=; b=mVKvlDz4XAVNBUEKwW4wVsXdf77lI2zegcMA0v
	odQOxTr8Y2p6P5V4p181Afc0dWBY6KzdvsJLPyOU/Z4wOyyO33USBCOpLHHxSGrH
	OXe2Mp+rt0uOKPgbvJ9x7tZeJZ0rx4YFlzfwuCqEYBoLVaZI2qAUkEFI1IOzvbOq
	eWqBm0W/lyCgewIAadmaRVGWLn0hO34DPmudo90GH+ZGC3rjOoITzbfywQiVu+9A
	DKilelZ8PamXv37PxARNNKtTeu31T4Qg+2iPtobLbWVii4cILVGOWVliwnF/N/bJ
	YhYPQ9dvp7O/qYsBlqlLzkImJx3WYNt2ZQlT1u4GE2dt2aNQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7rd5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:39:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so2805771eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 00:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682370; x=1796287170; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6vmCyk1wHKXw+7g14mItgN1PaoGOIgGRCupW0b+o84s=;
        b=OHlkShL4stRj23ESt0R3+DoYudU+HShE9AZeskIQnQuwJR1RitOzzf6VszspDdreFQ
         BVE5QFEBdMzjEBsp/BfIwEXtuxwjHKsBL6pfZycFGM0zff1kZja2TzuWcKWQlVY5Q0mf
         WagcHZjeNt8QRKCoA2xshcmN7NrMowCSFcKRFpG4VRTOXUqSoj3bgzBrP2hCxl8OH6DF
         WKqEte/txB4gItFUti1FuoCYeDgRnnlL4f+ktcyfTz3vbKhoywg4beObCI70kTgd512V
         Se6ih7a+TbYDhAVIgT+SoCSIfAQzpvaXVwQm59lbakJ+ptcTNyuVpZLvCw9TRVV6hm4i
         B0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682370; x=1796287170;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6vmCyk1wHKXw+7g14mItgN1PaoGOIgGRCupW0b+o84s=;
        b=JYN2b8hP1GP7IcFap+kHllNg4tghwwqlxRiLNaTqFj1Ng+/aGiO/lsSWTxaignnKmt
         YZg8jSuJJrf8cJGL7sZDuEmDnJIiOtftkJ/xJ810FK/jFa0932TdYDdctmNBLbWd6P9Y
         nAXoTMjltnnCtzZubQKgamKonLCPd2sUCPtC5BsSbg15TwioD8+QsS7D2p1/h6KglZB4
         P3fjmsAyjvPIYM4Tie47GnxYWd9Xl0kHFIx5/16FWHEMGb7z+rpYpRhWNFw6dcpyqyFO
         19bOEbR6Ip6fldM++Q0NyjCRZUWaXUdiIsJmOhb9TpTGrBGw1MWn57ds5lG8YCXRv/IZ
         4ADw==
X-Forwarded-Encrypted: i=1; AL+hErGuZQrxLTZ8iB9zWcR0MByYP2gGH4voBHcvUgIwk4Rr8k4lVtqrW72HEq+uSfDg36qiOsCFr/WwBTPz26BG@vger.kernel.org
X-Gm-Message-State: APuU4Z8TZovoZR/mz7OYkFwqHPl0+KlZNrQRlvR5IhK862PNiVABn0ET
	ZGPjaH+ehq17Jtf3P/FPCey9MHfKxgQtDGNo1w3Sihqc6dVlRpslTdKMEDEU9jmtq4dwz/XaEhf
	3VoEEOBOSPNnxeh1irgOC+4IGJRLnNete2HrYAo/13JkVdrGk6PyXlif/JTiy+rxkKrq5
X-Gm-Gg: AZFdTZfbw6nQNnUCdjhkOYP08axcnDz+MeOButnkLtlhbbcP7DUD2xolMYqwyiLMzOa
	j6MwaCJZJqEh1CxELj0rC9H5Z4Le5xVwRxoM6s4BvXJOq339E4bhJcDlfh/aRVLmEmcifYyJckt
	hNZr5MbNY4PF5p8sUzQJJWNjR9Db49BkkQuE6o/CZ0ZqMiq2L/Nqbk3Sfj2Qfx9uvGfss8Rt0ia
	2VztAzMKlNJ6rcFILPkm9uBLStL1dRcH6KZ7aljJmnT3yPS9DIJSmVMuO5OwADIPZzee22MyTuI
	Kk4HFtPli686AlAeh9hlblXcy6whPe9o/76Y0+8dr6w+UPbDtOwOOXhCOglltxTLBV+nAJa6nLO
	Rf29E8h26o0FnHjt5m9TgnB6/CnBSCrkXDXvmA8mA+FhHEI09WWL3VYfayiG4414cGK1fyviQwO
	au/FjX07qq2q/DFRVn2m3/x6b9KEcN0kBabR3y8OGLGGwLC8BuAkhAHjd7L2vwXS/6wbSt3My5R
	y4phU0=
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr24366945eec.24.1795682370195;
        Thu, 26 Nov 2026 00:39:30 -0800 (PST)
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr24366933eec.24.1795682369733;
        Thu, 26 Nov 2026 00:39:29 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm107946003eec.3.2026.11.26.00.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:39:29 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:09:13 +0530
Subject: [PATCH] i2c: qcom-geni: Allow minor deviation in clock rate for
 clock map selection
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-i2c-rate-v1-1-6b8c5731077d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADDwB2sC/y3MQQqDMBCF4auEWXfAGWgWXqW4SOKoszC2k7QI4
 t0bapf/4/EdUMRUCvTuAJOPFt1yC7o5SEvIs6COrYE79kTsUTmhhSo4BqIYpePoJ2j3p8mk+49
 6DFebvN5NrNcIMRTBtK2r1t5l2Sv+1TsM5/kF3ITrLIsAAAA=
X-Change-ID: 20261126-i2c-rate-da11bbe02b6f
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX7j3M4eS/uigE
 9Wh3RVNya9LVzoOktpSk1xVECC8Tv+wLmZ5Vado0+gV7KT5cN1COfXLzsd/dJSfsnmWBn2Ju+nc
 t7drmfUmS5KMpdP2JSHQDjTqmUzTLtU=
X-Proofpoint-GUID: jbi1_kEH4JhDmAUQWBXGa8-__ArP-lcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX3oLS4fx80wjZ
 B69/V/f45t6mNsslkqr6Myyq7ypFsfJ4EWEZFmUrbhE0+BCp/6TcQ7dkNBI0j1/YGJxAV/FutJn
 UHEezioo5DpI+0vgEAEvCc7Fk1RnXHTbqFG1PsmA4JhQhafpVbcWqAnJP7TkE46GiXkAvnFYMdV
 1opAfht9R9jgp18vHLs+zPjmQgd6W8inc/oNV2CM6RGNE8cemo/PF6JYiAfbFrwLEr5i0f0dxZ7
 7MDlcTH4rhCKDv3H9DeiHMSU/BlfmODE54ifHnqNbR/ElEntYwtD5nHYrZPoCUD7MEpXPS6BEF3
 NWUr1o1Q0lTFwG6wJSU6boYnDcY55iwtJJmwxu/+BUcAPOTp50ms3J74bnL9gU+2H2Xb7rmklGv
 TZQ+Tfwy+fw1Hp/HK34SeFyoafTB/R4DUUH9cXPCj/r6js15/HpnuRTKb24ceLYRndiKu4STePA
 IvB+A8Jdef4G2/t5R2g==
X-Proofpoint-ORIG-GUID: jbi1_kEH4JhDmAUQWBXGa8-__ArP-lcJ
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07f043 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z4ZaAWoGcyzahfyhXEUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260033

gi2c->se.clk rate is set to a value of 32MHz +/- delta by calc_rate().
This results in the clock rate comparison against GENI_SE_CLK_32MHZ to
fail, and the requested frequency is assumed as 19.2MHz.

To avoid this allow for a +/- delta in the rate comparison.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ef48ab3e8b94..88b5b9aa4667 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -207,14 +207,19 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
 	unsigned long req_freq, res_freq;
+	unsigned long rate;
 	int ret;
 
 	/*
 	 * Use 32 MHz only if already selected, otherwise use 19.2 MHz.
 	 * Preferring 32 MHz merely because DFS supports it breaks I2C
 	 * transfers on X1E80100 CRD.
+	 * The clock's rate may not exactly match 32 MHz. It is slightly off
+	 * due to the calculation in mult_frac() in clk-rcg2.c:calc_rate().
 	 */
-	if (clk_get_rate(gi2c->se.clk) == GENI_SE_CLK_32MHZ) {
+	rate = clk_get_rate(gi2c->se.clk);
+
+	if (abs_diff(rate, GENI_SE_CLK_32MHZ) <= HZ_PER_KHZ) {
 		req_freq = GENI_SE_CLK_32MHZ;
 		itr = geni_i2c_clk_map_32mhz;
 	} else {
@@ -222,6 +227,8 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 		itr = geni_i2c_clk_map_19p2mhz;
 	}
 
+	dev_dbg(gi2c->se.dev, "rate: %lu req_freq: %lu\n", rate, req_freq);
+
 	ret = geni_se_clk_freq_match(&gi2c->se, req_freq, &gi2c->clk_idx,
 				     &res_freq, true);
 	if (ret)

---
base-commit: 47588e4c16d8876d3058bcec030ed8a016794b9e
change-id: 20261126-i2c-rate-da11bbe02b6f

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

