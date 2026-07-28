Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A875427FA3
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236302; cv=none; b=W/RIXWu6KwkGLbNMKW0+9m5cWCQvdmvRayopW2qgcLLqA6H2YSgcPQ87vx+Iy4ho5C7cy9R4QcYwgJvMlpJYyrzkjjUknU1HlP7SnTlcotgzvqmEvPwypEK44SvjfMT9cF4JE7ZPuEsdgbKcxQXpyKB4kKPG7+Fw8fAoelU52hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236302; c=relaxed/simple;
	bh=YcfIyQ7phpzgDR6Sj0LcOKmnQuVVnjn7mGBSvd7KmOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGUxkfnUatBPagFxtEjRP7QbrjaZlEGuqi7l935C4yaxzevmvscz75JJxa0w/etdRaie9LrYA/4VkMtGDr0gVXxzukCXli/iKTZXC0bMBFdTWC2U/POpofNDgEvPuz7xkSCQeGrQJDy+nwADaxsyiyNSKhgCdK1WZIbRhzqoNVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NH9bA6dy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kj1/F6Wd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NH9bA6dy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kj1/F6Wd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgSRu3673393
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pakv7Ob2t7cxw6cZ+F10BS0e+WczfsQikxrNu7YI5F4=; b=NH9bA6dyKCnB1WMd
	v9vPjQwjeiGMOXir2zSIygNblfPP88WN8L8vvU8P6qa5x2YKzbUpau1poJ3kH7uO
	zIX6qE1LXblgwN0WeL3m47u48mBu0Vf30OwrXLi9DGypFf8QjBJrxF5dbIRw2CcV
	Ut68r2nBqZ3lmN9KP4LTXzzK70yx80FttNssobMEJLdnU7KRYSA3EIpIIUicwFmB
	GcoZ3rqFPin0Rw4GZlXp8+Vg0cAn+Xi+9Y6e9/lF4euJmGwb5Iz1lsAsXOGWrosN
	0W0xB2JLLcdDeJhMHmSuzyUJuQVzHWMJ/yHe2uJ/La6iPEoA0jXnbhL8oJAtGmbr
	plcXsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5kwft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:58:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so104541505ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785236298; x=1785841098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pakv7Ob2t7cxw6cZ+F10BS0e+WczfsQikxrNu7YI5F4=;
        b=Kj1/F6WdIgrR1rjfLJkzhbuO4H7/M9yZ/6pZtly2iEyuX12DezZsKbKwr1V5EVDiAt
         G5M8/a5mSrOukyrVb60yA5xQPMKd/aGGIsP2wfr0bYO9opZ5zmkze94zafoXmVM1INm2
         1MFA9csOOA8WRLAUJKn0Hex+sdCk3OSk2bcNq4XaKE6lXudBihgHzgnopjzF8hLAPp28
         lgnnhLhKMA2lghy5H1QjB4swI2DBeyXQtim31OLqfFDtpCDPdP+7Y/c3Qnl3D0flbmIV
         rthm0lFX3VRJ5kDjypE+J12v3ImE+9zwNBHPMTTZGmhD1KaBGQVYW5SGAlnnNf/D/M0E
         E5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785236298; x=1785841098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pakv7Ob2t7cxw6cZ+F10BS0e+WczfsQikxrNu7YI5F4=;
        b=E0R65IVSSB9nQ+WHklUYJKrXBgdq/4k7yDIe9KlkvWE7HtHF3ULo7MersntlzivATd
         TpnVA2/8BJMOxeWzm2i9C+dA/sdnCVcvMvHZLXD/g1OH3KuOH8P9lXh21YpTorT57h7p
         MlcTRO9ZZy3oHJrSszk0RgE6w/J5NvAIP9StxqCWSBKO/9pqLdhr5CCRZ2NMQTB6EbGz
         UDwyF3l9SfdKjoHRIMJMDE5N3ArOPsNUvx34t9BOSoVTx55inEiYKpjA5yVQ1bVLmHee
         n59nPCn7g0mGysmOTwBYBnMV/l9oDcQnYKiQJZp2iwzZcRC7Ioj4O793UC/ql5kYHDXY
         zBxg==
X-Gm-Message-State: AOJu0Yx2guYxTvD7ubxtFKElmp5WvF2owVSDVylm9TpiYgBWOK3PzhbX
	rbARAa4c8YXI7XB0Kr9+dLh8AwhsypxWbRy3SZJKh/tAoJLQcmN4L6o+BQHBa1NPSv48sXvrnZP
	g3JKC3kx51ovfykXo4RE/bwsDwtXeGVoZQn8s6Q7LxN7Wh9lK9y508j4pRH784wXI5SlE+M/Lep
	RU
X-Gm-Gg: AR+sD129amZY1z6FxULIxSCM67xpWlWjZY1qY2McuNRY95/SF5N8QTcFGTepzD3ZXJA
	3cxAFR57oHXDHymvTutFmL+tUcvUeXOrnJBQ2KGLDMeOCOnJnDq+TkxuLibxDuYKkD3ZXRTfQLh
	JqZ2StUvMgRzGpjP5G5CwJTObTB32f/xup6kkAT//znOX884/t6/C2WKjCPeIUx2LYtQGa7GRBx
	7bNmfE1wcTnKE2e/LUcOECXQaR+riZjtKAjxz45r+JxV9T6rk2nDPH2GYhOYCGXX1r64WRJoE3S
	FM7joMk0AXKQOZQHNcKVhscg6+zmubNmgwyu5vSzNd3Awy56V/s9oZuLCOfuF4r9d/Jjb6NMKWL
	lJHw+10ETRkAmBwMz5H20XUVx+bIUqFbsQZ7FYkyHzaxTA3npGhcxnyky9wGv1Bg5gvFRPglc3Z
	/Rej6eTM7ueAY3fV2kcVB1avtz0pLZM9S6MZg=
X-Received: by 2002:a17:903:2b0f:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2d015c9c4c4mr23996355ad.3.1785236297766;
        Tue, 28 Jul 2026 03:58:17 -0700 (PDT)
X-Received: by 2002:a17:903:2b0f:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2d015c9c4c4mr23996025ad.3.1785236297364;
        Tue, 28 Jul 2026 03:58:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm42192544eec.10.2026.07.28.03.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:58:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:28:02 +0530
Subject: [PATCH 1/2] watchdog: qcom: report WDIOF_POWERUNDER in bootstatus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-qcom_wdt_powerunder-v1-1-de8d9e964e7d@oss.qualcomm.com>
References: <20260728-qcom_wdt_powerunder-v1-0-de8d9e964e7d@oss.qualcomm.com>
In-Reply-To: <20260728-qcom_wdt_powerunder-v1-0-de8d9e964e7d@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NiBTYWx0ZWRfX6vAT7VwXRJcn
 ucB9h7ztXqcncrD+9lrez7mN8gweMNSy/pdVJ2VX2WDIEWNe/Kk40j5jXWOcjxuz/jWuwG7Uv9l
 y8Awh6+bAQL8vN+i0vC0ZPKZEbvM3Hc=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a688b4a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r3dvFDkSt932AH7NsF4A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NiBTYWx0ZWRfX5GksGUj6NUMw
 n1TIHEaauix1cdb4CzlVcdr/fBrGq0xt//516TakWiVYyqVeYSwKeGZNwiEk8kSKnaPamPOPV9J
 aQSePwrKhIH0FV2e7xHazOeBWNb4EOsXh+K5/1y1K+2pRWxn9lGZySm6ENkplRGakc5wFe98rpR
 3Dqkhnhga00l0qIEkpZXO/YQqvzWT7J9tv0JzEneD1zMBF1qA3V5RNI3iada/u0jViO3xiTOoG1
 Q+mZQZuRNwOQFLvkxea0HRiPomtU54WdgQetuyPlPtmJkKr53vuKe2vY84DBP2h+8dJiqrn1gIk
 P1hpjJ3yf9T+v5cohZXwj0hyAVmlU5qkhZw2fB5pC5VDHgqoAK1i+4ZM5L2zLkF+ddpB9K+8siP
 rLNGSlqhBCZOCx8alCeWOoBVDEANT2Gw/JW5uZMTjVrWf7RCpa29VQrl2zEpSxAtDkFqHuiomaV
 YsVJRKv+SpG/Jtp3JFA==
X-Proofpoint-ORIG-GUID: 3rcEkbB_GfQH7Ghnxacbl5zYzbbiS-97
X-Proofpoint-GUID: 3rcEkbB_GfQH7Ghnxacbl5zYzbbiS-97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280096

On IPQ platforms, identify the restart reason as POWERUNDER, similar to
CARDRESET, and expose it via the bootstatus sysfs interface.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/watchdog/qcom-wdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 49bd04841f0c..8e1fa1347343 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -44,6 +44,7 @@ struct qcom_wdt_match_data {
 	bool pretimeout;
 	u32 max_tick_count;
 	u32 wdt_reason_val;
+	u32 powerunder_reason_val;
 };
 
 struct qcom_wdt {
@@ -164,7 +165,8 @@ static const struct watchdog_info qcom_wdt_info = {
 	.options	= WDIOF_KEEPALIVEPING
 			| WDIOF_MAGICCLOSE
 			| WDIOF_SETTIMEOUT
-			| WDIOF_CARDRESET,
+			| WDIOF_CARDRESET
+			| WDIOF_POWERUNDER,
 	.identity	= KBUILD_MODNAME,
 };
 
@@ -173,7 +175,8 @@ static const struct watchdog_info qcom_wdt_pt_info = {
 			| WDIOF_MAGICCLOSE
 			| WDIOF_SETTIMEOUT
 			| WDIOF_PRETIMEOUT
-			| WDIOF_CARDRESET,
+			| WDIOF_CARDRESET
+			| WDIOF_POWERUNDER,
 	.identity	= KBUILD_MODNAME,
 };
 
@@ -188,6 +191,7 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
 	.pretimeout = true,
 	.max_tick_count = 0xFFFFFU,
 	.wdt_reason_val = 5,
+	.powerunder_reason_val = 1,
 };
 
 static const struct qcom_wdt_match_data match_data_kpss = {
@@ -197,12 +201,13 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 };
 
 static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
-				   u32 val)
+				   const struct qcom_wdt_match_data *data)
 {
 	struct device_node *imem;
 	struct resource res;
 	void __iomem *addr;
 	int ret;
+	int val;
 
 	imem = of_parse_phandle(dev->of_node, "sram", 0);
 	if (!imem) {
@@ -222,8 +227,11 @@ static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
 	if (!addr)
 		return -ENOMEM;
 
-	if (readl(addr) == val)
+	val = readl(addr);
+	if (val == data->wdt_reason_val)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	else if (val == data->powerunder_reason_val)
+		wdt->wdd.bootstatus = WDIOF_POWERUNDER;
 
 	iounmap(addr);
 
@@ -310,7 +318,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
+	ret = qcom_wdt_get_bootstatus(dev, wdt, data);
 	if (ret)
 		dev_err(dev, "failed to get the bootstatus, %d\n", ret);
 

-- 
2.34.1

