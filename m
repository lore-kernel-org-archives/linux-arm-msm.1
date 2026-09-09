Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27C5221E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954536; cv=none; b=jDc87QhMYpl1cq/ipAjNAOma1TKOI5WAa7ARkrTWXCZVMfPMQpELiRbclsLkIpenaWPUKQejVIJ6UGtlRj3A/S8YkWLwu0Ch7U48Lwc3cHAPM43BhqB45Pejxg4LLUjQmiBPZUWKgHjKfCJHl+1BAQN1GphKI5BgiOKvxTEkRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954536; c=relaxed/simple;
	bh=rYPf+uUwt3u7xdZ5YdOl1l1hU7kXwIXXpn48y5XM/U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sn0S5Dd6cvgcCkik+MSqhaYWi9RypaVWqOAItdEt+54bzL24ijg3eJZ6mB3J8udJVBBk1mUScvZln6jWZIizaSlcECH6OIu99DcPabDdv5tSEaul1fB4KSirMbn5Jl5XqkfLB9k1MiwLmqQnZwXyySLzSH2gny41qyHUVjGd7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6wXl+ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYC5J9fR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6wXl+ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYC5J9fR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCue1183802
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DAXnd9GeiIwiEmnBfwIbAz3fsXOFuF+4UTK6tCPQKc=; b=J6wXl+raPUV4eDRb
	rf8ALx+JSPH4XzgixCp+VzdxXoQs6crpzX7G+y8ttp+ZyKlTyNukOK0zzAHQzoeb
	gDvYADCXE1OC/oV3dAUk1E4G4doE0TKRqQPa9lRyqOMKxOaqJn1oXWx5Kro4UEPO
	cYq6b7NUWFZghBlW3n94cMCUHU5s6+lm9mA+gqQ4sl7UqU0zZfAUIVzq81+SN/3B
	yDhkoPD20lC2mx4Oxl1E1WuGrT3FNCPZlE7mPjTFxkMJzQ58rT+zHsE40SzL+xiX
	RhlNLFMsV/0opfIlmo+BDGzUM0Ttmzzgf3PbQvBDuwscipy5RHjSI5+DXxqGZyvF
	Y5vcQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559re8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:48:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso6992731a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954533; x=1789559333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DAXnd9GeiIwiEmnBfwIbAz3fsXOFuF+4UTK6tCPQKc=;
        b=jYC5J9fRuvY+kauSX8NrPw/ABIrBn+mmGwGwsp/A5eiIj1trR6tWvtNrFOBG2RdzMv
         RiyDlVIQSVcd94XiG+aYURMppAxeLshMf0Ac1xJGGz6hcmRLb75tEDuNhBxOCD3sehJ7
         HkkhTsyId/0snWSy314TW/bDY3hKDQaodKxBciwiasJ0B3baaFmkuT25cxFG5J4qlRra
         O+nVJDTYDihbxcvl1/up5q89gQGr1wEX7ek6SD0P6AHhCSKzZz6sR9Gk/5nnKVu0cEwG
         9sG3x4tX6ZPWEOfmF4VeJdPxQFreThc0dD1OQfQnf47zpIPDzFXYeW6ZST+HmP9qjWc/
         qSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954533; x=1789559333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DAXnd9GeiIwiEmnBfwIbAz3fsXOFuF+4UTK6tCPQKc=;
        b=rzLSSu67o4vMhUV9NGKBr8OnatXzo9U8wnkqeoGKWzbL7+YmoQVvCqRFk4+ZP3rMYW
         sMtbC9xHuTXxyueEDlAjcLc7/QVMyBcSkcSRMOBVOzglfywB0oqpXxRLribaYSM5R/zj
         NlZURpBmNClfZ2jE+XbIUV9JYO6Ul4gJqGOQJQ7+sUf42n3P5nkz0z6mFid0nm8OQF+n
         uO118NAWcRt4rZvn0JH2zlo8cJQnHrY2ozmX0KauNRXL/FlSB6D41CvDZ6p2DCAZ5iR1
         6EDUrjHmynnBA/dFp/2vz83tbJIdHMX5/5SgwMk/gJ1Llw6y2Of13TOLJO15NEpPhZY9
         VyYQ==
X-Forwarded-Encrypted: i=1; AKwUvBywfwr8l5pOEH0yLqCDELwyeyIMWPEjUVHH0QPyTjW83CeH9+cF+kDwbhIaVfQDNDRXL4QvLLjqL8srp7AV@vger.kernel.org
X-Gm-Message-State: AFuF++m1N/wnb3OIbzbUeLyK6s04/QaIV1+l+qaAJc01b5UJ9SsQdFth
	MSII26kXVN9xpMC1QdeHNXyy9rKF5JI/2KjQGvqQNzwcoNtsPxd9U2nx2VdLtPzv/uAel09vbDO
	pO/XS9k8S0DJSVLmH9pnvmLylZn9Ii/g4bS9NyjkERffthYwSnIs3xssdSvfnZZvrWoL4
X-Gm-Gg: AYBFou1A6dWawEQGmEvPSnXI8UqM9habKk1q80yzsj5cno9kKKZr8YOrdezBqJCTzKK
	ExMkVGV1bvjmaUP1dnEYmWdwGs0E4ggDaFM3utVtO5MjCqUzoFpZE6jUX2J2hyYEcZTGIP+tGcC
	RQu2mjnA9L2hCAtaD1j/WpDIel4l8pkCV3zaP2eUqkBDppcAtys1Tv2U8oJAS+7y6jjT0STy+bn
	iVA3NEcCNjsvB6LsEmlxJmCpmS8a+dgMcUg7QGuTxtsL4UrWVEJYE0miIJuZpyL3UGMdP1AswT9
	SDhRjTI6uWjtbzS5C0KRMemIMWaOeYbvUvgyX25zMQJXeRDXRfNRWRBl/1J1149KWx17Ltqvlfs
	isu81pC+A0knzhchujkpSM6e3xmTajIe1oIM=
X-Received: by 2002:a05:6a21:e8b:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3da3a11ed0cmr57825822637.14.1788954532567;
        Wed, 09 Sep 2026 04:48:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8b:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3da3a11ed0cmr57825764637.14.1788954532148;
        Wed, 09 Sep 2026 04:48:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:18:18 +0530
Subject: [PATCH v3 3/5] PCI: qcom: Add CGC disable workaround for Nord PCIe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
In-Reply-To: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=2416;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rYPf+uUwt3u7xdZ5YdOl1l1hU7kXwIXXpn48y5XM/U4=;
 b=OW2v2+NG6R3Rs49rBH9Sb6H/Aj7MnXJ1eyRAzgGGDSvRTMXMGhQW3QapQxZW2ZW1JVT2nzY1q
 2urgu8Xx2zNCCFaOSl4S+j7hKio1UBh2hbgJaHLQZECdoPmb0uUVGmr
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa147a5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: EeZ6JgpY--nxW00ywIgtZ9l72EnA1v7a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX+IG/TtmVg/6F
 c4kA2KLhW4z99rFmOxBD9I7DCn10FupdrclHnm/5co//JG17ANkpb5ynZkeD39gdsfG3uvYUT4f
 0iUqmRCstEcbdoW4YneGjDhHDQ2+Cw4=
X-Proofpoint-GUID: EeZ6JgpY--nxW00ywIgtZ9l72EnA1v7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX2HZ195W+oPXY
 VYqelHsgAHq/L5GUhqA1VZINRQS8fKmZztZ7OdJHGLwfRWuydWA9iD6z7tppmJ9+9DDwzUVoFJX
 KMS3+UXP+P9z+2krBTHRnZVDeCUhN1xR1kC5UEhCJ8BfQQElOloUMTPxc3UyMC/eeEp2Ozxskbg
 cPnEe1znR8py9SKcgZnIlaxYPFk40/CSspsKemlS7c2R1hyEU2U8rW4sIzZRoPMeGJn/anmXUCW
 0ZMLUHRKE+c3MENbL9Gr1nEf05HClLI+AtKKpPPY9Aa69YFl7hbjbBdudG/LWlh7MoEDK67iEQF
 FgUm2QJzWj6+bPuoQbby+PoDQLTQfBch+VfBP9vCIOh6h0lsMh/H9/Bbr5Mji1oJcRuDLRhdD56
 w03wXZDBbiGYCpvfHe3lPezG7L5XGUYoYmKlqxJ7P9Tz0Zyc+cRBEJBtLlkKEX4xqeYfdgBS7Gw
 qEM0gcmq99LAsIb8K0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

Nord requires a workaround to address a timing convergence issue in the
PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.

The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
change adds the remaining required settings as documented in
QCTDD11972446.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b58a607b713f..b97e40fb7ec8 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -281,6 +281,7 @@ struct qcom_pcie_cfg {
 	bool override_no_snoop;
 	bool firmware_managed;
 	bool no_l0s;
+	bool cgc_dis_workaround;
 };
 
 struct qcom_pcie_perst {
@@ -1097,11 +1098,18 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	const struct qcom_pcie_cfg *pcie_cfg = pcie->cfg;
+	u32 val;
 
 	if (pcie_cfg->override_no_snoop)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
 
+	if (pcie_cfg->cgc_dis_workaround) {
+		val = readl(pcie->parf + PARF_SYS_CTRL);
+		val |= CORE_CLK_CGC_DIS | AUX_PWR_DET;
+		writel(val, pcie->parf + PARF_SYS_CTRL);
+	}
+
 	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
@@ -1630,6 +1638,13 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
 	.ops = &ops_2_9_0,
 };
 
+static const struct qcom_pcie_cfg cfg_nord = {
+	.ops = &ops_1_9_0,
+	.override_no_snoop = true,
+	.no_l0s = true,
+	.cgc_dis_workaround = true,
+};
+
 static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.ops = &ops_1_21_0,
 	.no_l0s = true,
@@ -2464,6 +2479,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 
 static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,nord-pcie", .data = &cfg_nord },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1

