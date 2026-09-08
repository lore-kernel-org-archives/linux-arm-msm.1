Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71390545DB8
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876118; cv=none; b=ctiACIISUgk1+Nwqw88MPSD1o9wTWRblRN9Eem0aOBUPo3qfWbfh8E7ekHLJMpG6Zrr8XRSOUSXjpJzy/kuaY4eHtpBD9MFjbl+Z/al8rtX0MGubdldit/3/6c9l5+Bwhx4pj9S8liqtuIJ9PoOdAgpVya0JNWvPLw24uXQ6yMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876118; c=relaxed/simple;
	bh=q3VVEORPnlb5ty+z8CrjPhA6J+DQ5z8caK/9hZZE4Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxlLNlAjvbRxZ9XLCb7YyiQPAEv2xapGO0iWx2RSmJXaRywfyDMsQiaga81IGwbNfxum2nbBuuEocz6wArQ6A0BoP2uVhzXIP2i2ogd6hUVMX3uCM06oV5bUpVsS+R+nqF4bevWGctk1RqofH+C6SfRUdY6dyGyhVQRCmO8wlxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fownFaJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7hAnVi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fownFaJh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7hAnVi/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CklS92343514
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amqkgHTiF36uk/48XKaaWRtXH0hd/9+8IKYGEUjY5nI=; b=fownFaJhS+Hn6CKK
	/FDzKMZzpM52x0aG+HE5wT7kn9B8rNLmZihFNWxLa1l/PeR34dOA4CSSjMbfIQ39
	Py6eKUlqmOIKKE+XyplEZlQjfbLaUrUcHAfRvbEiHvnjYF1EW13KuUyknqsuRwOC
	sLK4CapHJQIPjTl9vXU3xzyrNfYiyhXEXcO/SzduNkfnP8SXDc7XAjMOQObC5F4x
	PpsWCn/HcdAoyqlgcjemYP2qQ5UIF9f1vdgsy9NK25Pu1T1D5e8ZY8uOT9JE08B7
	+SoPlxdzM5d+l5N87RKXjf4oNFF0UsIxv2paxzRSlHFWa1cn9mDd79+rafrsNO64
	G2IU6A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjjbv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:01:38 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ee1e335245so5175618a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876097; x=1789480897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amqkgHTiF36uk/48XKaaWRtXH0hd/9+8IKYGEUjY5nI=;
        b=Y7hAnVi/bJoWppYvujqUIKXDFHal5coFRUhlp5MBv/TLTCMWULdS6IiSh23bKUTRd6
         uEATZo3l+XIEviyvduseXw+r9esm+7+ZoC8r6JJKpKK6x8KuW+QVKf5zTjQrgv0NLQuP
         CSfjWqv+w1qa5rg2VOUSeOtAtHlKq7KvZ+5SNIRYPjzdcskhx+jH+Nu/bxjPjNxGljfb
         j7ufqYJK9/ODT5Ll9RHtUlbAZ/76G433/vIxeAev/KBxyLLlJ0vLAQdc+FM1gWTyDIan
         2gjX5Cb/Yd1eR26+O6892IXZ4lfXKM++ADNxfOS0SDIJktpAgFtbyz5bTGl15LOzm5YS
         uVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876097; x=1789480897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amqkgHTiF36uk/48XKaaWRtXH0hd/9+8IKYGEUjY5nI=;
        b=dbG4jhruRAUNpsqyeAe/qMS1EoOGYNPK3P9l6SYwrmQBmnOLLHEloO5AG9iLnhgM7i
         pLwJJ4Sp2aoy/ItWLebVQ31Wbg6OsxpXRvReIuGCEZaXjoQhDZZhF7gwrEdfr5TVzYQb
         52Fd/NJ/0Gu/Z3if6WBmRMBdEWA+/qHKhFy5azg3pN29XCBnCFZT+58fKB+onaNO2NhR
         BfSjfx8qIiuTY/eHpO+PZThAI5jCGQXSNtEtnaw+UXhQUyv0IZG9ovLfUMXFwxudh2IG
         0V44Xy9b6OixSL1dOVxwBgsMNMZwGIoKlVMVFACYVQQGupU2xzLtE7WAJ4UpZMEu4nsj
         hq6A==
X-Gm-Message-State: AFuF++myihT2vlIqfRKKxikWXxsfkbqwmPIc2qTys7GJpkx7LQyWIwKh
	ExhYlwlk9zDhxeLhGl+1IRYGY0SyjSUvYzWxbKveD3j2o+gN5hPLUmAYAn+ZGl1g/X/ozKPUrB7
	0kMGMiUJXEAoWxHbKkmwOfbUcrzAVy44fPNFnKyb/nz12fI5nyzdUEXBNz0lqL3v6YSCY
X-Gm-Gg: AYBFou3muxgtMIC4RIYdWGRSo8z79t5e90FpLiyc6FrxMA5pLNGBYJ9o1hutTBq6WfW
	3fGrDtOom7mhfm0oRDQG2QNByI7lr6pvZLPC2kgPmAEmhMdCtNPvk1qg26fFBN7+keOnarwpRQB
	013gfn+DrJPDsfgnoTGjQLQSFE6C34oJL7jM+OXSi5TSTJYL9d+vSbTOw5AE8apLqi2t2bvlomQ
	uQEInEYuUlz1f2yBT7fYAeoIkV2NmOVZTEkyYwf8SZr0A8TJy06TVDxj9yk2L55cdva5Nkol68i
	4nbRLaUbe+kVFLIvXi6mvoT7aKSCo/tDY+H74Cg6Avukr+GFWKEqv/EcHTDAxePekl4R9NIVs9d
	5jsG4mT5cwRnT8py5novHgDgBw1o=
X-Received: by 2002:a05:6820:4c86:b0:6b7:8396:f3d9 with SMTP id 006d021491bc7-6b78396f8c4mr12804759eaf.59.1788876097310;
        Tue, 08 Sep 2026 07:01:37 -0700 (PDT)
X-Received: by 2002:a05:6820:4c86:b0:6b7:8396:f3d9 with SMTP id 006d021491bc7-6b78396f8c4mr12804696eaf.59.1788876096755;
        Tue, 08 Sep 2026 07:01:36 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:36 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:58 +0530
Subject: [PATCH v4 5/9] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-5-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=3229;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=SZqWfqI8Uaq9Fsg26hs+0rHvzfccTqoPLnB7y5gCqGA=;
 b=pEsSqjkrPwFXoNyHe/+ypMPJijCo6Djb2nbX/7fw8WkLsEDtHXnelec5lf0WYJF3YUKtNebC8
 z6zowx16VRmDnqQ3I62ZnlgwkJClTYgawKitc2YWPeFiCi5410GBnb6
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa01542 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pJ9Jp-POzqCVGtXzzgwA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX5xqKqaGluNYy
 k6RxqSw+lagG09NgL09CEr8ClykRKeyRaJMKuGLv/34fk0TYzI+y2yhEQ52LnaSZfn+P8WsrO5H
 KEgvnV/k9ftQHjxR+DIckkGwgDZKsUI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfXwG7I0WpOWxYt
 RAGcWLjUIpM6F816w6gWVXF23GglBPihV8RiowFS52SV1zIVI0JVl5nCIkOlnLZxdXLzyxbTl8+
 HDPLenffkmRtyXf9RCw1xq0As+a0ttqveeBvFvPnGb1ibmrej04uMZcEAQE9uP28SGlnRqsBM29
 7XewpIC4xxUQTn573VAhv0BE80vRpKngKBwep3jycmR5Thay0OTYG5nkRv5PYOXVUqD/KAZSHkk
 h+jLZpnxUCe3n0tPa0WJ5hO1OFHHO12PicLqP2XeCggPOB9A/ssVUfx3x7/7MeMSSRtlyhKOybK
 OvECjSObVMEvvUACSg8IJ7MCCoiDNZN6G7BLma1loNIt1Pw1T1vu1vZVEP5fETmO1gleex1nJVK
 TbRXRpTlZ/8U9tiYBBYRDzh7dRjNVw==
X-Proofpoint-ORIG-GUID: Z_bhRcnK6lm3ssP3Ce-ZNhQri_MKixfi
X-Proofpoint-GUID: Z_bhRcnK6lm3ssP3Ce-ZNhQri_MKixfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add PCS-level drive level tables for the Glymur (V8) DP PHY:
- qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
- qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
- qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
 HBR/RBR

Add ln_drv_lvl_hbr_rbr and ln_drv_lvl_hbr3_hbr2 pointer fields to
qmp_phy_cfg to allow per-platform PCS drive level table selection.

Wire the new tables into glymur_usb3dpphy_cfg, replacing the previously
used qmp_dp_v6_pre_emphasis_hbr_rbr with the corrected v8 table.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 53fc1d1e8494..0ec382aebe2b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2456,6 +2456,30 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x22, 0xff, 0xff, 0xff }
 };
 
+/* HBR3 & HBR2: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */
+static const u8 qmp_dp_v8_ln_drv_lvl_hbr3_hbr2[4][4] = {
+	{ 0x02, 0x12, 0x16, 0x1a },
+	{ 0x09, 0x19, 0x1f, 0xff },
+	{ 0x10, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+/* HBR & RBR: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */
+static const u8 qmp_dp_v8_ln_drv_lvl_hbr_rbr[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x16, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+/* HBR & RBR: TX_EMP_POST1_LVL emphasis settings */
+static const u8 qmp_dp_v8_pre_emphasis_hbr_rbr[4][4] = {
+	{ 0x20, 0x2d, 0x34, 0x3b },
+	{ 0x20, 0x2e, 0x35, 0xff },
+	{ 0x20, 0x2e, 0xff, 0xff },
+	{ 0x22, 0xff, 0xff, 0xff }
+};
+
 struct qmp_combo_lane_mapping {
 	unsigned int lanes_count;
 	enum typec_orientation orientation;
@@ -2542,6 +2566,10 @@ struct qmp_phy_cfg {
 	const u8 (*pre_emphasis_hbr_rbr)[4][4];
 	const u8 (*pre_emphasis_hbr3_hbr2)[4][4];
 
+	/* PCS-level drive level tables (v8 / Glymur) */
+	const u8 (*ln_drv_lvl_hbr_rbr)[4][4];
+	const u8 (*ln_drv_lvl_hbr3_hbr2)[4][4];
+
 	/* DP PHY callbacks */
 	int (*configure_dp_clocks)(struct qmp_combo *qmp);
 	int (*configure_dp_phy)(struct qmp_combo *qmp);
@@ -3420,10 +3448,13 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
-	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v8_pre_emphasis_hbr_rbr,
 	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
 	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
 
+	.ln_drv_lvl_hbr_rbr	= &qmp_dp_v8_ln_drv_lvl_hbr_rbr,
+	.ln_drv_lvl_hbr3_hbr2	= &qmp_dp_v8_ln_drv_lvl_hbr3_hbr2,
+
 	.dp_aux_init		= qmp_v8_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,

-- 
2.34.1

