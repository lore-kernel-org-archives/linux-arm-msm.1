Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083C4AF142
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554582; cv=none; b=AacqHNRQG0YTw+oSqsaladfpgR05RgH2SWiGYrP+IbDRJInutv/LE+LnJBROI5mFajyUHwOR3c01bTa826ebFugs+wVAnvhXcyh4Hlk7M0uPwExFT9/jS+80N0sw/osPOSjecEvlXQbR/Qy03ERLsroPvXgBsNgEza3cY8wcMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554582; c=relaxed/simple;
	bh=VqEBhAc+je+QLk1thcaX/xUiR2txfR576Si9Id9vd9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlXPqSbxto66CiA3PQpHoGA4RzjcBDoquC4yexIrYUb7ViuNXoONvgNvn+jE594mcyc/lEnsjSXuOYCPgdEFvkJE36QFJ0jpzFrD9TJC90eSzMh51sgCMbUXPBBGzOrq31qteVaA7x4USb4/cuSLthQSryItpgmpmoWGxpYAtCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhxIkExT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aw8DsoSO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhxIkExT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aw8DsoSO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92bFJ3169041
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=; b=UhxIkExTGLr6ksiV
	Ck9zenvLkpEFVQkjBpLnIxr9QsX9Dt/YtwiV5HH6ptQ2EtE80oooriAUiCYeX6aC
	xCtYUe0QGXDv/nsuWJz3WeCHbVE6ojPQb4ED+n5L1C7X9VjQz+GfrnwMJQNJtD6X
	G2fnCodx6WKt4i+OQXGQwJb5hkcxmT0gatjoHQsoJwIHN6u+e1XhIceHAF0cKot/
	TidwSzBJ47ANyG9xr1FmIYkskqkgoSQmWIM8vIK5eOhUJKBiNiNugguHaIYXOahH
	UTD0eLR0XDVk5wQISoELlSK3ZY7lMfPvRRM3MkDTZnlUdgA9IS0bs7VBNhezaynw
	0QTKtg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rpxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so1016541185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554559; x=1790159359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=;
        b=aw8DsoSOC+PN6DrdN/UjIQNlu+Bpk6T5f7Nb3rUmhCsGgWpY1t1A7bbS0t8c1lry9l
         uKNIm3spMfa5VuzjPTTiM2hqc6kr2sx31vPYosTeZKqjakXDVgi3dKYmf25luOeovTkT
         s6Ao0RqgpJ7RzW++NT/owQhlbTLeLpGkjfRsT2Av5s61+wSVT/jC3ACsnkh5y/LQgAm1
         yy25kPxLvAvCdwN/9qybZAkMh7PV9Qy9LAjNLQPz5SSd3D9O/fWb705OB5IdGpL+yxr+
         PqSMnWqb5NMazxWtsreEEjF/jmQUOTpKJGxc/9y0XPZu1Ocvwce9fZ4A1P8NC+Yuxjtn
         Xhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554559; x=1790159359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=;
        b=EYKLS1hLdQvECODMxAi65RoMWvwskEkLDe1r0ySBFaHf2yj7lls5ubIbejJWVJfzAX
         wUExzRcMrbZv3XwX73Cvp2mhwtF9iMXA05M0rxJ125V1SGAAcTLk+4+F7SYXJk/xA3oJ
         mSJCeKCfXgbYovVaRBUmLB+r0LYVtoUb/RPViUNPOJCr3sfS1fEmra7cm9Xo3CqE33C9
         JZwGRsJKHfxCwJ+h5+AhdkVfBkqTSfcaM7Vhf9LVvGujZpdrw2//+YMGY6YapS6CXpV5
         b1f68Sp7R0FdM2IcxWUD1wPPRS8Rb3f1cQGUWqO4eF/ErIHU3Lqxs4zTYFMQw33iusbM
         +hjg==
X-Gm-Message-State: AFuF++kI7wMsu57KdWIukKW9J0kDcMX1b7q+wx9iwAEqdQaLAEbXPlHA
	wtGvHjvDZAcdpqBLeR4KX+zeMoT6IlLCc0zpqiuOF7P2wzUJ2GBXm2TWOzTuLJN2Rq0sGe3Dq4Y
	kuEzC99IrlmdaIzlzqlpMb4q8FbmmSXAhOSqCEXLY0+OFeSdxcZOD6l1rY4mbxxBa4l04
X-Gm-Gg: AYBFou2u6gV+P/KE4by5fAbx1NisRowKCU3qDII+cl9au6KDYQH9e8msFizNcnqXyvy
	hgbW33EBFro9sUMHKZHvAEbj4O8ySbqIvnRHWeHOGttDmIen9S048b8pObokiKU3jtYQecjTVw9
	nXWVQ7bX7l+JGIryClb2QhXb1ritpMsCsVc3Ru/TmPzp0X2rXTKej2JUWmM2GfubKQyNIp37qz9
	xYj0SYhrldme64GOEej1lP/rym/kv3i3bsc0eN5yUf2z9wFZzyzy/hGW6L7Ckphvx7F3xBJXTP1
	XRLvkW7hQXCkPo9rzfeQeHjEPEMMhGPv8uLfITvLMTGzfZ355YRNDMJ+tKr4fRIOeOnc8eArQz3
	spSh5TdE=
X-Received: by 2002:a05:620a:4693:b0:939:de6c:cb45 with SMTP id af79cd13be357-93bb793e1f1mr298994085a.47.1789554558718;
        Wed, 16 Sep 2026 03:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:939:de6c:cb45 with SMTP id af79cd13be357-93bb793e1f1mr298989485a.47.1789554558151;
        Wed, 16 Sep 2026 03:29:18 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:17 +0300
Subject: [PATCH 01/48] clk: qcom: camcc-sa8775p: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-1-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3027;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VqEBhAc+je+QLk1thcaX/xUiR2txfR576Si9Id9vd9U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9LD0sjyesYKIoV0/4C9ypVNoFj3s6SMvr/J
 9srqvc4UHKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvSwAKCRAbX0TJAJUV
 VnvzD/0X463c3vRToWa0/H0xRHYuwCZm7CpCyBw64RZMS17w2Q5L0LeMjR49NWypljWexF3HNsZ
 Ud8YvehPpNdjJrvmf7Zay2CrJTPHSXXrtMl0eLUCe45iNZF6OgG4db3jF9ZUwRGiU+oLImadjcq
 gsBqNunngj+PUTIvKRcJamtTs6bQ/NWgFkiirXQ0KznjlcwqQDiE4EKMKxdI591lsdu8v69W1W4
 Suwcjb6M+haLUXOrdD77Tqc7cn9pZlKiI2yPOh+BlA+dDlWyIm0zqDsHX7qqAx2X3tULSsI3Kwy
 +TmntwhG0hmaa9rMAsgyPxoRimrx++DQ0ekzrzefbJew1HM0ScsqVHrWlxdkFMgBAIJchhiRDG2
 Rt/oI0gtBieONAEJgYfXCSMVi03BY3RNVX3Am2EesynW75DVH0JnZQDJu/U3exT5wGqIGIAp8Sn
 wwFkJtfCADVMgEwzIXZDni411TtkUy7WHixUog0yfpZXta/CMqPFbsY4vFF10nK6ZN2Yw5naA6/
 NS4f8QYfXw/DqQq+sbKFlnzcCa8sXBPJhGQSddWXRdfKuKSHSE4Eu061dnhYM9QdtuFaPl2ooui
 nU8bQhvmSkN5DEj59AuBcmz0TKW6ChDWpaMK5VwXuyD3I+v1G6esSmS/OKrd38RTjnyiFA8tD1B
 V5GwRdMSV6b7Z6w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: cH1LZemwK9JmdNnmvvi3RY-d20tbQToL
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa6f7f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q3HO4hYmujdu-APuiMYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cH1LZemwK9JmdNnmvvi3RY-d20tbQToL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+QgdmLlpdYB1
 MgWFNY8Kax97dfWcStq1XQWEhfkjo8IZ7JZ7Is/ScbFtafuYWDzAZEO750I3rsj3T/64jn1zTGV
 5JJOqh9DPm5VIrgDG7EnDQKDmE7REWqqe2ikX7/XkC1D1mFuJ9BbLRPxBoSnvDCU9vyu9lLdfrF
 SHRCXjaK6PiWxNmdvdw1oShR7QL9RFvYIL0ieke4QqA7sPc79WZlngh18txHXUO1aLoQZovSzd7
 dhWX0DGl7T+VmHaBUM3xEr68PvCGcAxqjUZwqyIm4j30R4ozDBaZemr656/ImNCv5XitbEc7QdI
 9/nCWIresc0uYCVRb3iYbSKAsykRfXWhtTsfpdQkIWmkhJWYh7Ye6ZmHj4kjuQPenadKA8Wve4V
 7GTRJFBRg1Txr+mtDQSuJBLzuU0ULQDPi3GtHjbKfNJ/7qrevFuV+iscWko4UvgKiHocROHCcao
 Sw9SEosQ7vwoyyn/Ljw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX09XgmLNfgb6c
 LSMDc/rfKBcF+f+yJtY4I1weTvf4UV3fwX3jlnRltSHA638hLc7qP54zz37SBn1cA9f7PqJKvjk
 I58LfVErs+4KSjtIK5uyjaDIPeZS7Hg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Keep separate CBCR arrays for SA8775P and QCS8300 to preserve their
different CAMNOC XO, GDSC and sleep clock register offsets.

Assisted-by: LLM
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

