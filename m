Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529B388E62
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274636; cv=none; b=uGWTZbT/OnDE9r1MvGf3EZmjvUlYUyrZ4XyQi5hIccg9aNMQpvnPxzGhSHqIsALRgsRSSc06oXUwgfN8xAhUoPAHTZmSycfn2gqPWrAI9WwS51iu1HYlMzFSm003/Zs630vgpj25P1zCqrLKwfjgGcUdwOl64pGuOcv12C6D+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274636; c=relaxed/simple;
	bh=7i+JXXDlYBK3MDq0Hdq7MfbGWZyvnjJI80agD+XQt7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmUa5sgFTmKoEKkcKB2LAaGzI2Xqhy+FzxXrPXHz+OZTl8pnvWFMDtGfnIs7ShrJvRpKOJiy3J+yWAyhdWI9mePia3+S5J53gNgeJ8h+0UhUcYW2/pYkN8VO4EJMBCUPrS7G0RvaM7LxQcCS/XtqCInHYXc1C5Tw1fUlrUjEHkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5RISfnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SL2893+a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5RISfnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SL2893+a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQJj794281
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZaK9pKaiDY1FJ5cIz2wkB3Psxd6tGaNxrlShKe2xLkc=; b=F5RISfnFZXnCfcry
	+Q4MtyvKGl3BIqMmjRVlbsWa702sfXK7r5vKLIX6ghEZXc1k8Eegl4h2AysTZJmi
	5ojNqdMvhepjfOQtRn1Gu/j/K2J/3jzsMCVx7xncYulzMy3BQ/2FTZzWmm6ik5xG
	kSvU3a4gY5ja1qv3Ee2CZEwyc2bEJeh7Dm1CQOWeIqwjWSHT29aVMm3ZC7cEZETL
	d1sOUvcsmfMVduHmckyJ6YT0oydDOVVNc9pKRT+TqRsCTMZ8Yh7WOVDs1Ke7bWPx
	wux5C2lOy7WhqSngmrvc26n0hYHY+dpdrcwKR/15punf0SPkiHLHQdNyVbtZr5dG
	vKF/Pg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8jpq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1833393a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784274630; x=1784879430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZaK9pKaiDY1FJ5cIz2wkB3Psxd6tGaNxrlShKe2xLkc=;
        b=SL2893+aJOd7odwUBT+DI4X+pbVn3YnQgDMGjYDU/Wx9roRkvIrRVR3neixyuNU4ho
         aNuhl8GcbwjnaRee6rvGNJfP6FJR8WmZzuJ/tGZ/KtQksArLX8rgtgcPP8jwrqgX752c
         WZGTU4HZLVrynLfsMVgFNE+6nwtKMqFcXwZSWEH6d8mwF8TCcQ58hwR3hxYCmHSlqQ50
         eZ00/MbqtckYf7tZ1TZPO9IbYdUD+S9JWRoa/R6+9reA6XstBvqEdFw0j04gdilnzU/3
         rRJj59Fo9PTawc+lxykKLh3lA+BZPMMFHkCiXpRjmuccdlEqVBuSg88C5hNU5063S7md
         uSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784274630; x=1784879430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZaK9pKaiDY1FJ5cIz2wkB3Psxd6tGaNxrlShKe2xLkc=;
        b=YN6LQe59GuvXvs5TgZn/TPfBoBW4xIn0dPKts3vpA2sUO/pAa4W45T/CHAR/+DxSM1
         x/RHOzA8Za3TyM9vNQLUlb+w5cN5wHBYzTWvE33pJdBqVRMIirMfW+VzqW5cPZN/eqbr
         fFXaLGd59bzfbC0sXwag9NpP6Um+El4F2lt0SoE77o8eYJElRDy6fqo4F7O01Wcpdp9C
         NOVYdDwrk0l8/Rf3pAbjrKrE0ZtyRP3nZUUGgxV4sM9DKYm1AvPq++500miwdBnGIBcO
         HGAP6KXATmu2O68cUdaCBQa+hs9cV2jGbUNCeD7wN1tlTiDnXwPcofjH+BDjT8vNpJiY
         PJIg==
X-Gm-Message-State: AOJu0Yy/lYH4LJmvrF2i/LYj7HNYJQAPST+OEPOWx26jN5BC73OTGicv
	ItCtL2OdkJT9jQYBJuIFIWAxC/LMcn4wvx59e5KbWT29LoafeXWWamSKcVcsQLzlflJGN1kzk68
	YG9eUsLA9vYGHc0fdbnMLb9SGrFSqS3VWou9iw/ve3mQgm0/cnyOknG0I9DBH1U0VzujZ
X-Gm-Gg: AfdE7ckEkLrmUZqNlXk1EJuyOA8cxDFf5zhkj3vY4BqIJqzRK/mGn2Q6K+LwrebCwBR
	YfwZHUtHCZeeZ9aQu23vHoifNn4g58b6XspxHmaacWkW7ltpk36QgNfb1sg8Oc02nue8e/L9f4e
	Xm3KIgD96TDSGxB1Ld8miQ566aAvvsuwXFN/V7Gb/zpT0vco5GrJlS2qxrx/NAJz+DA+5wTVsL9
	6dVCSDCUToMh60vXT7TnnArczPETCJsA6p+fpMV0HDSznVOL+x8YSg8I74KT0S0EAZSn06wHUAe
	iiCq8MuzmUupvFYnyvG+Cdnc94ijNYTx4sPdm6ePoZEmc9zvvJK8VdsvVbz+12mscc9OsJmI7Mc
	0QZkm6Mq6Q+sIDr+SKs52lfXSsdrq
X-Received: by 2002:a05:6a21:e0a6:b0:3c3:800a:45f0 with SMTP id adf61e73a8af0-3c3ad002cf6mr1551930637.30.1784274629768;
        Fri, 17 Jul 2026 00:50:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:e0a6:b0:3c3:800a:45f0 with SMTP id adf61e73a8af0-3c3ad002cf6mr1551915637.30.1784274629277;
        Fri, 17 Jul 2026 00:50:29 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f8f223sm449323a12.9.2026.07.17.00.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:50:28 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:19:42 +0530
Subject: [PATCH v2 1/3] soc: qcom: cmd-db: export RPMh accelerator type
 string helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-rpmh-timeout-debug-v1-v2-1-81ade4fcdb49@oss.qualcomm.com>
References: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
In-Reply-To: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274624; l=2502;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=7i+JXXDlYBK3MDq0Hdq7MfbGWZyvnjJI80agD+XQt7o=;
 b=7hZ+llkGDTNjBcvBPjmf4iVIXd2aJOxhcr7HNmpo9vb0PLyR/rhNmbIBjUKI1t5eJMD1fnMe9
 zQWbUh6qgcjA6zuKg7PYbaTGB1f1GtF+oKtGYpM2XfYDCbb2fi+P//z
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: GfY_OoJ-NvYXKeN2LnGOr-w9hXlBSmRe
X-Proofpoint-ORIG-GUID: GfY_OoJ-NvYXKeN2LnGOr-w9hXlBSmRe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfXxoUzWQs9M2Tl
 AJxo/IVWY9Y0N5JHt4kWWw04FJgvd8sYYsbeV4k3bVCHxQ8di+Wa2hlZZM1xeK5M7Xaz5OSbIo5
 jGq/dO3cfvs7T/k3NrqMdAo67rV0PeM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfXytfLyQzD4phc
 EmQtRkAF/TZ9ouSaue9dlLU1BZvSW8CffVyX4c/NkD2VHjEYwdcyd2UOw521SfXfC7G+PkCuFEh
 PbvnqO7F4oqt9Ah5dus45oitfNzYtOqK9Z0Mo2ZPg1eHST9FoSebfVPudcB6J1KQrMBcpf5/ukN
 TqyYXzFnYpUSQgTe/+qsOuUtpcTlIfsvHRbLxwxl7VznB8nLEyGYHFNam2jpY57GbYXpLf4eqCo
 sEHpR9xu2Usy3W482eRTdU0bTaYyYudmVkpiZIg70TegH65kwEi6izsd/ow2YoPE8ZM5LWhTAwE
 +B8LKIfwpwnbyfhtEJeqslXCVTqeY3uT8WFylkCtXt73CaQk3ZuuQ1MbvHe0K73xCw0ugkBlQmS
 ZbZkscC9mMCcaQJgylB2flwCO1ie4pOOfx1AX82sAE0taTzIWGh5UzaWc8kgYzYVX+28Zx468Dm
 XGpLcxsdweyyZpLXjaw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59dec6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OEZb8WWwy_IDIPDo1iAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170076

RPMh resource addresses encode the accelerator type (ARC, VRM, BCM)
in bits [19:16], matching the cmd_db_hw_type enum values. Add
cmd_db_hw_type_str() to map an RPMh address to its accelerator type
name string using the existing SLAVE_ID() macro, and export it so
drivers that handle raw RPMh addresses can produce human-readable
diagnostic output without duplicating the address encoding knowledge.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/cmd-db.c | 20 ++++++++++++++++++++
 include/soc/qcom/cmd-db.h |  5 +++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 3f1eee784387..117f810d5ca4 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -267,6 +267,26 @@ enum cmd_db_hw_type cmd_db_read_slave_id(const char *id)
 }
 EXPORT_SYMBOL_GPL(cmd_db_read_slave_id);
 
+/**
+ * cmd_db_hw_type_str() - Return the name string for an RPMh accelerator address.
+ * @addr: RPMh resource address whose slave ID encodes the accelerator type.
+ *
+ * Extracts the slave ID from bits [19:16] of @addr and maps it to the
+ * corresponding cmd_db_hw_type name.
+ *
+ * Return: A constant string: "ARC", "VRM", "BCM", or "unknown".
+ */
+const char *cmd_db_hw_type_str(u32 addr)
+{
+	switch (SLAVE_ID(addr)) {
+	case CMD_DB_HW_ARC: return "ARC";
+	case CMD_DB_HW_VRM: return "VRM";
+	case CMD_DB_HW_BCM: return "BCM";
+	default:            return "unknown";
+	}
+}
+EXPORT_SYMBOL_GPL(cmd_db_hw_type_str);
+
 #ifdef CONFIG_DEBUG_FS
 static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 {
diff --git a/include/soc/qcom/cmd-db.h b/include/soc/qcom/cmd-db.h
index 47a6cab75e63..34adc04eac94 100644
--- a/include/soc/qcom/cmd-db.h
+++ b/include/soc/qcom/cmd-db.h
@@ -29,6 +29,8 @@ bool cmd_db_match_resource_addr(u32 addr1, u32 addr2);
 enum cmd_db_hw_type cmd_db_read_slave_id(const char *resource_id);
 
 int cmd_db_ready(void);
+
+const char *cmd_db_hw_type_str(u32 addr);
 #else
 static inline u32 cmd_db_read_addr(const char *resource_id)
 { return 0; }
@@ -44,5 +46,8 @@ static inline enum cmd_db_hw_type cmd_db_read_slave_id(const char *resource_id)
 
 static inline int cmd_db_ready(void)
 { return -ENODEV; }
+
+static inline const char *cmd_db_hw_type_str(u32 addr)
+{ return "unknown"; }
 #endif /* CONFIG_QCOM_COMMAND_DB */
 #endif /* __QCOM_COMMAND_DB_H__ */

-- 
2.43.0

