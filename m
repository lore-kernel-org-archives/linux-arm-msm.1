Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E24D235045
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242829; cv=none; b=mNU6Qg4jkna8cbX/EgfpEjAIahFgiDkYRtLJuMMsoPf5NgVrIqekKq54LjobvxyEm0zbSkCi6KnVfxy8kPlNEVhZkZXOuDCdb/16XmhYZX/92/5iS/ovDKKFyLh04jBSuqiLACi9MsiQqfSqN75bzBsTuVmNDxSEIX6+0oC/caQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242829; c=relaxed/simple;
	bh=7kh4ZgB9VWJM1x4v5o80hyppDSt+3VV+HLjLFnM3EMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XAdgG600TPkiOh8pdA5psdbwM66rfl8ZSjK/TQBwwAckFocMdgjYe57WW6/fjcaEYqWe1GW4OMlNLoBhewDr4Tt4ccYoDJaAgB+MKa9fjPOPyre/eMbTFBolJJui5Vt7gA62C1sUZP7qE8AlxskN5kqj4FiddoJDtVqcal2ZEPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJUaZlNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Suh7BX6T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJUaZlNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Suh7BX6T"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Q8la2238168
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sKfkfgei71i9bFDAQ/f6qc
	tZa/AzU0W+tjMKL/QROEU=; b=RJUaZlNXmOVatxs3YzlVh9FGKD+4x91N9LOIjd
	uXogjs6c0FNIMg5RkXJdrXsmkydZphQEvLbulNq8ATPGSqq0AAvWkwojf4+pwH37
	m89SGe0QDthlhY5niY9WeH9jwbgAG3SaP4n7hcZYiTq69t+mBSWkrPMV2bLGCh24
	O7MsTGrvAF0tE6mOVq9Wtq18cMg0bdDM3JWq6Xw33iUzccmNQ8UTnk44TrTQHPHg
	6vxoiPnjHcRxtFmT777UsN/XjyzMgbExivbNRKoh+NcGzNfMjJ1HXKfZCKDiKTrw
	gXvBB3yVC2/nTFhp6l9AJ7WsKLGVNslyD/T1xjRJ7rq2dfHQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbmbqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:40:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso777123eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790242822; x=1790847622; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sKfkfgei71i9bFDAQ/f6qctZa/AzU0W+tjMKL/QROEU=;
        b=Suh7BX6TY8e6qxQWArMN6l24t7LBf7b7/qZNoKdAJ6YngO1G9b9ZHdjLp1qPWNvuJ5
         lHrcp6W4nCm07j1umvyiS8ogXT9eESjrjJdWp7fOJxSQ/x3tB1dn7kgNHaDlA/nXuihR
         m+CV+q667VAiQFbvovaIyCD1EiU1/h2EcKK6xDKe/3DT/zxVjVJBbDEp5J9VDB2twoUf
         3upUpGvbbjsBozQVve+YooFw+Gns02LJM7Ynn6SxYTuEngxWdSlKJmdRr/ZP4Qjtl7D4
         aoOE9zeYxvJpfckCDT1Wex/ukeZljBI3v7beJMeJ9ETq8NfY1xAnOsvxPgVDthIWZqE0
         ry5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242822; x=1790847622;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sKfkfgei71i9bFDAQ/f6qctZa/AzU0W+tjMKL/QROEU=;
        b=zY9/n+oTY80fT+UV3nGHUvn1LolMGq2C3rd5eQH/mfovcBqz9Tz+Eq7i27FQB23BjS
         Nd3phzZMaylo+Gn0Us8o4cI1GJvdrJu4znZ3ymlza9+DFFea8rZYMX6qcKXboi9bosTY
         pv8KJae8aOYKR5s7GpOKKNynJhl2D3yMBTZCfVMupZDFgHxDEc1axTCEiDw/WEevvTJj
         cSN7txp7/eHp+1ni+tjpGVHICRjD+QGTAmVUVpu5hDI+o76Cb4db73ING094/fbrlBKf
         JcKO4pOlM3NcMlLKmC3mQ2EB6oZIO+yKXR78ZMqkLWReJzAgB8RWLENSdl/q+xb/f8Xb
         /ZQA==
X-Forwarded-Encrypted: i=1; AKwUvBzMN3H9SxmSjTHkIyIpPgM/HYB2CJF2vIHiOVhPxykJ8K5aU2Rt4f6jxR/E9rV9T+xK82m6Pp5ctj7Gc3yS@vger.kernel.org
X-Gm-Message-State: AFuF++kh7Rp31u3fBseG+bUI2GX5cJC/mQTvJ5rmgzSJIIkwfdqp7yyz
	hZ93vp/d2tYydhr5dJbJ8ux3NOXw4uag+iXMCu4k8y8B0bRqEWQh1SZIt/vq5QWvsxhg6J7nFT3
	Cr/kjoPOae1d/GtlsIRa+QbC3Sr9o54MR3TJzgdZBbzaCnjykUJUsZSnPGvDBih+8eP8s
X-Gm-Gg: AYBFou3pC+IZtT6GQpl+aHTB/cJfQdus7WkIyyJ+65VzAXhhJv141EuAQ8VA8v5Fjmz
	A0a8MhRk8I1SVuZ5GTVyWD1U8hp/N8CwxQpsFWHjakU6jUDJgBdSIlWgVHkN/xMxGAkAKPvRGSV
	ZQDSx3rt+0u0FitB6f/uvmt+yGqSDfUJmI/iygAPotrGbLW9pvEc1I6Dq9hzXrxKze8LI7/0IwV
	4gSlF0db0vCgqh3CWJCFtSfESJN7g0MHmpvZ1XLrq7eyvRBWWDJFmsxMqAfFmruXtnHaT1BJKCa
	QCcdRJ/4nDqr/Dp50y79oWT4L/a8z+2YsNX0Hrmky5PuhyfJKvheozdo2pB9RW1hJOqMwYyY7sh
	1MXqJT/g8b+5M5zAPbcghMtw=
X-Received: by 2002:a05:7300:6b1a:b0:33b:e076:f2e with SMTP id 5a478bee46e88-340040a4b88mr1338578eec.8.1790242821580;
        Thu, 24 Sep 2026 02:40:21 -0700 (PDT)
X-Received: by 2002:a05:7300:6b1a:b0:33b:e076:f2e with SMTP id 5a478bee46e88-340040a4b88mr1338548eec.8.1790242820980;
        Thu, 24 Sep 2026 02:40:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdabcsm13482354eec.3.2026.09.24.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:40:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:09:56 +0530
Subject: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOvvtGoC/x2MQQqAIBAAvyJ7Tigryb4SIeGuthcNjQiivycdZ
 2DmgUKZqcAsHsh0ceEUK3SNALdvMZBkrAyqVbo1apAxZbTBOZu8L3Raz7dE3ZMbJ4UDGqjlkan
 q/7qs7/sBepfH3WUAAAA=
X-Change-ID: 20260924-nord_gcc_offset_fix-d63ec582d4d9
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfXw8KadhJhn3JJ
 4yKsdyyEqM6dcznc27hYplClLR4kc24Kj0jPD79wC6cOF2up5aNPeFLgGuY6A4lGs8gb5NWLXlZ
 FFFyuDcvAJq5IDYRNrI4l8IoAVtVSio=
X-Proofpoint-GUID: 9_7UKLENrWoi6HF4Dh-wjrF7NLuvEpSx
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4f007 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tWc-dzksYj5tB7JG_AwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfXyPdGDY03uF/y
 jrO3h01+wCD6sLTxF/FY2tsGxzjQ090ips4mdTIvc1n9bE4h2V06NWM3GoLZnuSMebho1f0oAro
 CZoqjxLRUxLtnJ18jxrlJDwsrYVJOwPQwG8KMRC/+88c40uoONwEPtCc5cqYFchRcetU8LTDyIX
 LfvyDfsvJEQw3vWlZD2AYzXPApRaubsAXLbj16xz0BH8AiqmkdeQr8XC9VVCwevqJmNO2qBQAj4
 tATQ7JmY9pYVlF1C9vPKJ6n1p3kxK+WJY/57BdX3RE49XJ26DWK4EWBVjbKygwnv5E9F02K/2KU
 Clji0iUqcdOjkxOXR8hl+x2gqK2k4N2JU2ivdfRrqE1VdWpRNOueUlLjdCVIeybT1R2APt/+X/c
 SIJoGMgG3RmLf2DPZpBAzVIX5hWrbWHDsS1Eg/49EFzgcyZ/P2GPxRkh+c2NJqvCohLDR5f8tIF
 umz2kdoZQp/4ThrkKlw==
X-Proofpoint-ORIG-GUID: 9_7UKLENrWoi6HF4Dh-wjrF7NLuvEpSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040

The GPLLs in the North-East, North-West and South-East global clock
controllers on the Qualcomm Nord SoC were registered with a placeholder
enable register offset of 0x0. As a result the shared PLL voting register
was never programmed, leaving the PLLs' enable state uncontrolled.

Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
North-East and South-East controllers, 0x76008 for the North-West
controller). Each PLL continues to select its own vote bit through
enable_mask.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 4 ++--
 drivers/clk/qcom/nwgcc-nord.c | 2 +-
 drivers/clk/qcom/segcc-nord.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 0db284edc4e41e960adaca8f10cbcd4197352e2d..ef9ff450bcd44baf71e57eaa4f2c59a3c714b2cf 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -46,7 +46,7 @@ static struct clk_alpha_pll ne_gcc_gpll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "ne_gcc_gpll0",
@@ -85,7 +85,7 @@ static struct clk_alpha_pll ne_gcc_gpll2 = {
 	.offset = 0x2000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(2),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "ne_gcc_gpll2",
diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
index 280558f15748c95cfb373c09141b3023d7fcec5c..1eb8e53139120db4b872e7b7985c63e85d6b2013 100644
--- a/drivers/clk/qcom/nwgcc-nord.c
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -36,7 +36,7 @@ static struct clk_alpha_pll nw_gcc_gpll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x76008,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "nw_gcc_gpll0",
diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index 51d7f83e21b6b2f2780088f26f547cc48801c6e4..98b53311d333c4ec4b7fcb69e6e2f6815c37319a 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -39,7 +39,7 @@ static struct clk_alpha_pll se_gcc_gpll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "se_gcc_gpll0",
@@ -78,7 +78,7 @@ static struct clk_alpha_pll se_gcc_gpll2 = {
 	.offset = 0x2000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(2),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "se_gcc_gpll2",
@@ -95,7 +95,7 @@ static struct clk_alpha_pll se_gcc_gpll4 = {
 	.offset = 0x4000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(4),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "se_gcc_gpll4",
@@ -112,7 +112,7 @@ static struct clk_alpha_pll se_gcc_gpll5 = {
 	.offset = 0x5000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(5),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "se_gcc_gpll5",

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-nord_gcc_offset_fix-d63ec582d4d9

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

