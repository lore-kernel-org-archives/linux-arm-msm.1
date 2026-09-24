Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D7D47ECD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251642; cv=none; b=LVDxFr6wRhiokxCcUkcvVDfLiyZgSpzVrULFdglhLzEj30pgwdpbd6XPuIE+0NgMcePMYnB1b1xaNitdeQVOAG+TLJ83cwTx/ASLsZPaT3vp1F+lh0wNXjTvD6UzEbuvhbEe4ccWPi8uEP437dFSkifrcfrpCfMNAK0pYQUdO9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251642; c=relaxed/simple;
	bh=0fSXr4b+Ztfd2K7iKjW4OpK/vjCYRtqxTfuIJpfY0OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AywhbAHJEmry4Uu7AHkRLVmbhCTICuA8vYcdFk3yPLIlyNvpEDN/hlBTxDaamPO1Lp16tB0iIa7k9pDEhjjBph/DlEm2PXtiTLR+lrMaKluwTiJCoqYRdjldHvq4c3UHkluTN554t58gDvXt0cGxdJp6nREBaBaVs5OP7dhgUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMWlN5vL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0IGeC7N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMWlN5vL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0IGeC7N"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4d7S2594220
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=; b=bMWlN5vLbXMG2MWF
	awa5PZ4kgqgh7l+y9Ie5R7WnA5DQ+K10w8A56927cH80XzkSp5eUY3L7L4D5AZfD
	UyIc47jMrTgMm7m+zlNuczRNCaGv+fr8hEgoz4AkOFAvl70jZWH4fiwMPAjSBArr
	FnFOpO+UIbyA7DwFH+jCbnqDcrxn2zXa7hu5Joe9GkichTwOOtfQS2TsyMSj1rB1
	SZ1mFcqGeNoUtL3ynuiPM2fdroG4oTIDEuPsDhMTWTDZXzrXtaLyXWTjtY5Z8/FI
	gAEAjdfT6LkqAt79wuEv3eTTWeDc1FQFRAWCKd+4Qu+o77g6GFxBdEYr5kSm0+u7
	TLq4ww==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjge6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc46a7765so368580241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251638; x=1790856438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=;
        b=f0IGeC7NF+jalAWScnXRw42euq6f0mkg4eBrIAbaTvJ2IjLIPNmurZe5s8PGiPM8J5
         4r8lcPCaBluU/KxWuFcGIQwPgkuNNi10tAy29eeaogsr1BtQw9x018ZIS7hGC9DV0baZ
         zCuvbNU0UccPCN2AjzQbi3yAsxsVqPteJWv/O8fmFoF4SbcqXAo87EiSNW9oEFGaYq0K
         4niR+VODFr7ervEL6ngKEj6nw7ca4GLbkGxaDumnPcTdgwbcR2TPWQ7ssxrKpNk0Hf7c
         kxx+lMh6n9eACNBtDlvsZnBE440Txc0VBMv3nuff4cw7X+UfOl8htyozUI2B3FUIs4GX
         yHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251638; x=1790856438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=;
        b=DmAvRJL8ZMMVD/DPbMGYfEXOryz762xHGWsjxLeWSiwn5F4QdxomadD0ew/n8adR/9
         OLlkwobuAoYP09BOHjwrNxDFH5evLDJBxk13QYJeut9MWtfoh6km1cp7nrzBJ0UNPcbg
         7vKapYq7K/VUyEguYFx9dxli1BLKyjF1qd3u3RXmh1OID2Ksxo0TziI8MlsiAxAKs0P2
         1JVmf723Nyez7Qr9z3wrvCGbfNNSDx7UC0sc2z1Yu9LPsKSNmZgJ5T8MY5FsXAt4yFSA
         ra/+K0N1UQh7jMMi2XP6Q/YqXCknqygNpw2CugZiYvOLFJzB3YAZ6/Z9RN4XRw5ACOxI
         49gw==
X-Gm-Message-State: AFuF++mNCNNPfGG+OGqdbCBK+b5k2b9EZ+dkopBAw6wUad/RWoIRUN9X
	srHNX7N4QTzxrUzSY29LxEqMk1XXGNPNsJC8ljBdRnWCu8VwRBz/Z9CI79dOls1tjv6afpRN4Fq
	GykxNU+u7bUAU5yN5ca8+fyiEn2RBu2PL+PFuB/tkxmTceAW6yKpIEeT7iC2INFVmEEdLjpd6FD
	GV
X-Gm-Gg: AYBFou3hS7HNeh0gIZmp4pUE3UvyFzs9RH3kCZqN4tK5FSWgWrp6Rx3oArlMl6e6ZnO
	5A4TSTEYh8nWBBOrht4tHzUNW843hijE24bvF1f/u06xGkQ3DeUbNzUQX1v1yiitYdyD7IFDUuV
	gaPazxFb5UCuidXZY8/uWpnomsavrh20fUAnDzgasZOe+0ZtRxbtgIAGmiufQPHktFo0Q8Lyxiw
	Q88/vRSiBG0Ks0ibs/L5JYS1gX3wlOv7whhOdce628HqmkSsJouYMWDuXpnxlkaXUYqrSzwzphU
	Qf8vVfUCg69s7uSIyarj11RIvEqjdZqDXUJPYYtN527VqepcITWVxRP/pF5sSttt9FEBArKi0Z5
	s37hsd3aW
X-Received: by 2002:a05:6102:5344:b0:7a1:f7d2:e831 with SMTP id ada2fe7eead31-7af1d4bbe21mr907576137.17.1790251637725;
        Thu, 24 Sep 2026 05:07:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5344:b0:7a1:f7d2:e831 with SMTP id ada2fe7eead31-7af1d4bbe21mr907565137.17.1790251637177;
        Thu, 24 Sep 2026 05:07:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:13 +0300
Subject: [PATCH v2 01/48] clk: qcom: camcc-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-1-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0fSXr4b+Ztfd2K7iKjW4OpK/vjCYRtqxTfuIJpfY0OE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJCRYr3Wwy4NAWEYeTIzSiE8cz7r00/8LUhz
 zslueJPu0+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSQgAKCRAbX0TJAJUV
 Vv3pD/kBnr+PrtFVwupmgHnQww9oqbZzTSjENLc0rv27gSdLYVL3XWPYGwqvugGozZiIg8cOZJc
 OFTqLhjYXDU17iUVFjBScc9AID1YKmoPpVsude2GKHZQxXojjqlFOZQ271ISfYLvsjQmM37ceiq
 lwp7EgQgN/G0pofYC3F3EcMI7wKSGCYHk3ySvpfFrkE/jr0hQn0OH/cXASoojXuPDEVlwtd3RxK
 32EunynxPvrrvboAZrCK3okFTDCcpGnIUkOEnqIHypDlg2lpR03AY9w+L26yeSKtWbkwt8XpRjG
 10XISCiPaewT+W0mTaVwxzY5enyL1XGK41rpa15b/E/1zV80Qx46+H7GIpRYMyIbXkvz/5oCkUA
 w8UMaFsCO6TuFRDedN27izQ0WhqmS20B/H7FytvEt14WvHOSyiAoL7qvMZLq0HG3BKJ9qJWhpAV
 CUmUWSBxAVC7Ubqqma2mkPwRcPbIku1jtYyDYb4V0jUWmYJszfjlpk41bLIc3dv+NbwH+pYLpjR
 ByBydIisnnZPRcj66kNr448M/XEaTO/GtBimRxNc4Rt9GWqZUo5DorPp5vrOSQgDI/u3IbFPbLA
 9Qces79dZLSkCyUKGSXJ5Ghxs1Tm6F8wQuhQstNdSFFRVL82ymZHD+z+kAEcvEaukozaEIPRPHZ
 BtDvzyRRViSbq0w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ReZqFTxl_LLPKTHh9hZgePJMLGFhee-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX027/mi+e8zwB
 r613JzSxpUPUM3M9odHHhgs7cdT5ZU/oGUdcyLF8rzOog2Aoe34tLDq19f4D72gSalQgznH4pA9
 sBgjFUbvhTOXtLksr/V7sWaO1tayKdw/TZYlvNUe/OL1lrBvb/qT77QN+jjk7UL3owVnPtW8Kn8
 5OUU08kciA3VhOYn++PvIvYUiI0foC4K6hxg1R+o1WA47892hmf7P6cqXyZ1feTRNbsxuK4ls9b
 JiYjDwJvHR8ewn6SF7LxdqRLYu+mf1TwrciSS0KmcpPq3cRf2rNve2ZRCJoZPPN6fA0CddPuNe1
 7Ewm1M68+VwZ0wxiRPIheyX+ryCnpnVCClJ78Uv6C7NDkb2RhhaTDy7FG+3K2NMgnY6XGAWB64F
 Arb10iQQfir+56ZrBypBGYP8Wrt+x1dKXNlyOqTowpw+K82c/MI1ahWKljB0UdByXH6ydgv6+kk
 SY5XjeJM5oqQQCr5iig==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab51276 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8Nt88UfW2CkDv28g5HoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: ReZqFTxl_LLPKTHh9hZgePJMLGFhee-k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX16nOPVj8kve6
 5epx6kLZy74XBHckKn6bSNNjN/4+md1Wchsq8doNplth0/0bH+kaCzApqc4STJRPzsrzn9+X3v6
 +GA011kkvUJaQ8ZfqvVaxWtyYsiNjGo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Keep separate CBCR arrays for SA8775P and QCS8300 to preserve their
different CAMNOC XO, GDSC and sleep clock register offsets.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sa8775p.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index 914478139e97..b0a8f0077dd8 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -1818,7 +1818,30 @@ static const struct regmap_config cam_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sa8775p_critical_cbcrs[] = {
+	0x13194, /* CAM_CC_CAMNOC_XO_CLK */
+	0x131ec, /* CAM_CC_GDSC_CLK */
+	0x13208, /* CAM_CC_SLEEP_CLK */
+};
+
+static const u32 cam_cc_qcs8300_critical_cbcrs[] = {
+	0x13178, /* CAM_CC_CAMNOC_XO_CLK */
+	0x131d0, /* CAM_CC_GDSC_CLK */
+	0x131ec, /* CAM_CC_SLEEP_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sa8775p_driver_data = {
+	.clk_cbcrs = cam_cc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sa8775p_critical_cbcrs),
+};
+
+static const struct qcom_cc_driver_data cam_cc_qcs8300_driver_data = {
+	.clk_cbcrs = cam_cc_qcs8300_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_qcs8300_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sa8775p_desc = {
+	.driver_data = &cam_cc_sa8775p_driver_data,
 	.config = &cam_cc_sa8775p_regmap_config,
 	.clks = cam_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sa8775p_clocks),
@@ -1837,6 +1860,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sa8775p_match_table);
 
 static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 {
+	struct qcom_cc_desc desc = cam_cc_sa8775p_desc;
 	struct regmap *regmap;
 	int ret;
 
@@ -1927,18 +1951,10 @@ static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 		cam_cc_sa8775p_clocks[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] =
 				&cam_cc_titan_top_accu_shift_clk.clkr;
 
-		/* Keep some clocks always enabled */
-		qcom_branch_set_clk_en(regmap, 0x13178); /* CAM_CC_CAMNOC_XO_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131d0); /* CAM_CC_GDSC_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_SLEEP_CLK */
-	} else {
-		/* Keep some clocks always enabled */
-		qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
-		qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
+		desc.driver_data = &cam_cc_qcs8300_driver_data;
 	}
 
-	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sa8775p_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 

-- 
2.54.0

