Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794646036;
	b=J/KRDhlUjRHp5i8IyhfmNctUVQHnbdLIXmO8vCyO+BDs8sAMtpEdyeebVJ4ynWXVt7lN
	 EEIEQMnHAwyQu7fYGPWhCDmbHw2u1GqmTkHCjLuHIUiA7Rcbub7l0B/THI72qBNl0b2h4
	 qpwSWrZovcFmAddlk1rmlP6s+UaB0eLxqv1oLwDMuPfsH7+p81nTR5McoQmyazuE2sSXX
	 nUINqkve+VObM00E48MOvHkL6693d42i8WpZzUZuSYmH2HDgto1n0YfxCRgwgmXvdlGVB
	 tyd06pj9ayn7UXGkPaY2tMqW1jzWicr0Kb2MLZWXRIYmJ/90dHUiGZc5goFZNV/G89g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794646036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+4TIWnAP1NHvk78b7/b/TDbPoMrvRiPIPlb6RetZajg=;
	b=S4BT0yc3YiyEsh+xJ+NGJeJBb7yfga1QvvhgZCOPhnkx8VhV2naM6jYCbTlW+hzBt8pb
	 9H4pELZWBL+q92hCWpflJXHv4CDDVspJsLLYwkgLPFS87czQIMw+QeV37whEV+YCYCZjs
	 Xbcd0X0bzdaTxDJ+JDDHVj0igDzooe/qI6jl1ITqXAcO3NPCRjIf6F5LEIpOLiKoLIiJg
	 f7HLWPo7iiOQG/X3ti/3ep0Sdtev4kJifaZxW6k0uzUUH7VjS55aN59XtL8FPuZZ2iYw0
	 e39hd5C+RQFuSUOrHwLnBvgsGdjtcwOLujFuRBkRP5gSgvuF9mXoWcNWmZ/oLc3+Blw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D30oXydZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PI9DU1DV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33FD606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33FD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D30oXydZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PI9DU1DV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE61IVP604585
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+4TIWnAP1NHvk78b7/b/TDbPoMrvRiPIPlb
	6RetZajg=; b=D30oXydZx6vksrUw7lAQeu4z017zaCGKOx4SSS1ibxn6I7MyVbx
	j5doRoWz2nrC4eXffow8yvNDHGR/UqJK/q7M3eQAR/KTS83wumYOaR0pAIriNZcB
	tr2Bp/ah2QRZ3MXxtaelQqoguJFVaxkumJFrMXfr4UR59QYkNSQ0XdFhi0TlwDCt
	6WZ35DJLqJtI0flZKFONht9aZIknQpniJi6lotvg3SkffMvYo6Y/20UxNuI3Fufu
	r23bBbBs/eQO7WHpuEH33EhW7FPOJoz8LccuLdJJ08dcl04dU1bb4MT9IqMtcoSJ
	WshhPL5UYFobFMF9d30vPI10Dd7pKHb9+aQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rbc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:47:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08b07232so14334835ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794646034; x=1795250834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4TIWnAP1NHvk78b7/b/TDbPoMrvRiPIPlb6RetZajg=;
        b=PI9DU1DVwWhRU8BGrHKBh1fHckHhsk0laIPrCoOt9cAMc/Q/SMOSiB1mjkB84e2GNF
         32sJTTEh1irOW50KfuT0/MDpk18BfDtliaF+YLtvRpW6x8Wz/tOqTVCTwzhhdl+1T07U
         uq+283wkn2TYMYj6kj/0cvOXRUwJcyokbZcad6M+GOCIgmnTDO2OdX+rF6LPqkgdkQMe
         nfV+moeFfJTuvQQZ/mRTnm8ZKj979tGRFrxzUAO8/SgDa4c0MJm6Rf9Bg/fjeb6j4x37
         ewO8V9808D/vY1LKLqjYz5Ao3FcOBpHqepUppe2KYE2XpJ/+dQv7gRTbUUzgaYja5oTH
         yViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794646034; x=1795250834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4TIWnAP1NHvk78b7/b/TDbPoMrvRiPIPlb6RetZajg=;
        b=JfvVcLSFbosGTkDnrklLod/qcFrpxwqaxPfFDEpKDZp8YoEQNhcMSSDW75TJoZdl2b
         Yc0RdIOjZ3CCLm2DQKVi9sQxNGONQ3rujFQ+SBV+hvr7RY7jv9oJqi5eA5e6gwO68c8f
         qJF1VxJ6AopspHiRxm2PUCgB5VFxxDDE1YGcngmE5wFk1T+8L4ijdhZxbKuX8vc8sGw0
         vc1nljQwg7YFlxzTkd8tLZ2baCdwM/QD0MhoNM29KVCEQpnhMzSvW2S6pd3RM+qvdBDW
         mU0jhR8sjS6zdCuFh9yzzGaSSAsS5gDjKeSurUmRju8yq3he3YqQOln10ipkDM7Zz0CQ
         e61Q==
X-Forwarded-Encrypted: i=1; AL+hErEL4gn6RUTpkpk3yqOV0lVo/tvvnTrjP7RZePkau/M5hm2IL5nmN7gYAfk9fmtbg29xSEvWZGAKgrdgLvtJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8Aj0Y8XNo/l1nU2pO6nSxAhDF1APnNNjKeAaqC6k07Li48pX+V
	OAIVnAGfwYkQnpbFDSP0wqiivdJkTVBbaNUoNfI0iBdFWAT/XAi/rTTr2rEFBIbvBW8ajmX81qq
	KXfXFK9WNa84WhxN4uZ5UXVlKorNZIMfyd5n37RmrBObGwCH279/Jx1btJRuB3U1KhF3U
X-Gm-Gg: AYBFou2929Oauyl/lQEJk8Tj68WAyYTRjF2hiSSSw9pWF40XSKFx9Gc1CJgg8SpWyZf
	1Zkuxs1qU7q/k3v5EuDhDQR1YvfNFI+CXmJThNJmWWRCn+BZtvepxBf0PLlpQw6U2M2kn4dnKaq
	OGoVcw5ZBzUjL/7XxshyGFcet7Vtc3YwS49034msJi2HaQgi3klDeYTmuvV79jxMvFDLCpdmSot
	tv+/7vf0t3MuBWAgP+outwRwNLa1JQ23M8SBWoGIKQ+QHjAtNc691a9ZOaY/8fxJ9AuNE13jm6p
	JC8Q6SKa7Ja3+L2j6C+m+XbmebAaswRd9xHkySImenvMEX0C2kS3wXkCqVvszteyK+k7pfxf9rs
	HYsNKHLAbcVAsGT7UYaJHQ8nvqO03FlKRbgFvJtxIVvQ0do+F7CFf8Pv3NyFAQerBKBur53pCT7
	hzQPKG51B8u4pkH2OihTePXkK4nXpDPnt3e7vy
X-Received: by 2002:a17:902:d550:b0:2e5:54c6:e5c9 with SMTP id d9443c01a7336-2ee0d666a7cmr51378205ad.2.1794646033657;
        Sat, 14 Nov 2026 00:47:13 -0800 (PST)
X-Received: by 2002:a17:902:d550:b0:2e5:54c6:e5c9 with SMTP id d9443c01a7336-2ee0d666a7cmr51378125ad.2.1794646033184;
        Sat, 14 Nov 2026 00:47:13 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm19454895ad.57.2026.11.14.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:47:12 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] PCI: qcom: Mask PARF_INT_ALL_3 events on Nord
Date: Sat, 14 Nov 2026 16:47:00 +0800
Message-ID: <20261114084700.907031-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af82012 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iNQGgZdId2M00zXFBaIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzNCBTYWx0ZWRfX6TOk0hWd7SJg
 JZ/OJq2BzP1wtlzoR9d1GPA92HbIrgLGPm6iCmec/W+2EpWrCp5T0srn/zTlMlljWDkZ3CfPNCl
 H5sj6/D4HtOxk0O9VNDQs48nlsent9A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzNCBTYWx0ZWRfX+UASa0x5LWdJ
 awTchdmq4Ls/X7ZBdURoH86tuzryVj/prCGgnn8T9HhXunhEIF6kmyVCaXo8J8Z9wQ6xPM61W2t
 2J+N1zaEcfEd1ct1c78DJGEcNw/Kkun7X4S6w6D8By/ueCjbhHhlAZrISPi8jcUa2avZLfg92l4
 KX5LcR8A+FcO8Hp0FNyAnB42t/+0WseYSwJ1KHkIQfiYEMslRU3j1KxyNJfdbVPyJREgj0ABMXx
 66ESvW5jO/bF1+MghOoquDU5G+Cewr80hlWfEaRVdVFljH25XrGtzK6fSuTmmGbOId36YqFTTaD
 +tGpxEu6phFX6/wvZoNeEZXMXfuEkhi3pWwo4uDM9qDEyq9yh19fR9x/oS9N9UNT8smX6sjc+FO
 YqmcDz7MJYHKQVIiKR8tmUw9ZuybqT4pXLmg5YJm6mHEzBfl47bSsZ3OynGQCXASvyhnWLVmxaq
 c7wumxdVht7X2e8Z9Ug==
X-Proofpoint-ORIG-GUID: MWt9qqZDU6msy_Z_t9_-6XjegMtzrEmT
X-Proofpoint-GUID: MWt9qqZDU6msy_Z_t9_-6XjegMtzrEmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140034

On Nord, the PARF_INT_ALL_3 interrupt group is unmasked out of reset
(PARF_INT_ALL_3_MASK reads 0x43fff), and its events are routed to the
same 'global' IRQ as PARF_INT_ALL. The driver neither handles nor clears
any of them, and the global IRQ handler only looks at
PARF_INT_ALL_STATUS.

Some endpoints send a Device Readiness Status (DRS) message after link
up, e.g. the SK hynix HFS001TFM9X186N NVMe drive (1c5c:1069). This
latches DRS_MSG_RECEIVED (bit 12) in PARF_INT_ALL_3_STATUS and keeps
the level triggered global IRQ asserted. The threaded handler then runs
in a tight loop with PARF_INT_ALL_STATUS reading 0, starving other work
and stalling the boot (RCU/SRCU stall warnings).

Mask all PARF_INT_ALL_3 events and clear any latched status on Nord,
before the global IRQ is requested in probe and again in
qcom_pcie_reset_root_port(), since the register is reset together with
PARF_INT_ALL_MASK. To keep the two writes together, move the
PARF_INT_ALL_MASK programming in probe into the same helper, which now
runs right before devm_request_threaded_irq() instead of after it.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index eba1b2cb30f0..03b2e61fc20f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -73,6 +73,8 @@
 #define PARF_DEVICE_TYPE			0x1000
 #define PARF_BDF_TO_SID_TABLE_N			0x2000
 #define PARF_BDF_TO_SID_CFG			0x2c00
+#define PARF_INT_ALL_3_MASK			0x2d8c
+#define PARF_INT_ALL_3_CLEAR			0x2d90
 
 /*
  * Outbound blocker range registers. The blocked range has a write pair
@@ -294,6 +296,8 @@ struct qcom_pcie_ops {
   * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
   * snooping
   * @firmware_managed: Set if the Root Complex is firmware managed
+  * @mask_int_all_3: Mask PARF_INT_ALL_3 events, which are unmasked by default
+  * and would otherwise keep the 'global' IRQ asserted
   */
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
@@ -301,6 +305,7 @@ struct qcom_pcie_cfg {
 	bool firmware_managed;
 	bool no_l0s;
 	bool disable_cgc;
+	bool mask_int_all_3;
 };
 
 struct qcom_pcie_perst {
@@ -1738,6 +1743,7 @@ static const struct qcom_pcie_cfg cfg_nord = {
 	.override_no_snoop = true,
 	.no_l0s = true,
 	.disable_cgc = true,
+	.mask_int_all_3 = true,
 };
 
 static const struct qcom_pcie_cfg cfg_sc8280xp = {
@@ -1871,6 +1877,22 @@ static int qcom_pcie_set_max_opp(struct device *dev)
 	return ret;
 }
 
+static void qcom_pcie_enable_global_irq_events(struct qcom_pcie *pcie)
+{
+	/*
+	 * The PARF_INT_ALL_3 events (e.g. DRS_MSG_RECEIVED) are unmasked by
+	 * default, but not handled by the driver. Once latched, they keep the
+	 * level triggered 'global' IRQ asserted, so mask and clear them.
+	 */
+	if (pcie->cfg->mask_int_all_3) {
+		writel_relaxed(0, pcie->parf + PARF_INT_ALL_3_MASK);
+		writel_relaxed(~0U, pcie->parf + PARF_INT_ALL_3_CLEAR);
+	}
+
+	writel_relaxed(PARF_INT_ALL_LINK_DOWN | PARF_INT_MSI_DEV_0_7,
+		       pcie->parf + PARF_INT_ALL_MASK);
+}
+
 /*
  * Qcom PCIe controllers only support one Root Port per controller instance. So
  * this function ignores the 'pci_dev' associated with the Root Port and just
@@ -1928,8 +1950,7 @@ static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
 	 * non-sticky.
 	 */
 	if (pcie->global_irq)
-		writel_relaxed(PARF_INT_ALL_LINK_DOWN | PARF_INT_MSI_DEV_0_7,
-				pcie->parf + PARF_INT_ALL_MASK);
+		qcom_pcie_enable_global_irq_events(pcie);
 
 	qcom_pcie_start_link(pci);
 
@@ -2429,6 +2450,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 			goto err_host_deinit;
 		}
 
+		qcom_pcie_enable_global_irq_events(pcie);
+
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						qcom_pcie_global_irq_thread,
 						IRQF_ONESHOT, name, pcie);
@@ -2438,9 +2461,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 			goto err_host_deinit;
 		}
 
-		writel_relaxed(PARF_INT_ALL_LINK_DOWN | PARF_INT_MSI_DEV_0_7,
-				pcie->parf + PARF_INT_ALL_MASK);
-
 		pcie->global_irq = irq;
 	}
 
-- 
2.43.0

