Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293003E557D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906653; cv=none; b=EchQXrOEk5TFgulyHiVnQvCV+3UV/F53sN98AEPskNK5ds1sE6zelNRDOmvvxxpAlN0wc1krBiy3Gpgc4N3Ds/0SE9l1NCY72tjcCjejowFObZ4XUZ78bTm2UsoSpiOcXiQ2Nj6HYillAVY/ZfObbIwD0YJhXrv7Wg8d1lrr4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906653; c=relaxed/simple;
	bh=5x5TirLtHA0c0Rb9PKOOjbyhhs2shQyZ5pqbvgZXqk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7Bi23S7E7Vaw+W0MONBBZmnd8ACCiKiToWadX2rxYSgrIijiiRzsSTdky6XOE9p2mTEWUdU+8mYi1GubM4OJ+wSXZ6RxS/yAPQqwYC54ZNHyAcqzBGqp/gB0ndwbWd5P1E0/oXJ0bSUI82wynrXiIhviovBGJMubqE/FA/Bebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep6PIZSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+YiNbiG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep6PIZSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+YiNbiG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66gGr3205957
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oqpp/YqJcmbInDW8NldSo8VxqiOBNOhc5Rb5jj2yQKE=; b=ep6PIZSQAJWh9+CJ
	DHUfyd9B+GP3xPPswsw1/HCdB4ePEc22XCkhVeh3bYEyEMU9sLWx2opdPWMShUHo
	Ppzvw1R5P5M5ruThZg5Viv/fNBrJYjPELTIWlmf22y8wsVSKLrjdQn4ysODiYR4B
	ncGb1D8gKwL65HXKtkDbwQffMNc6b7hDs2hCEFh+Q7lzb5w73D6AV8ALUOXbnTbS
	0eLjgorj5up28hi3EkBZY+yZ97EgjSXsgMw+bccSIgLoxmdqEV3ohocqxtqlIPkZ
	n6UP603TmG4WrhgcyuL8eWoUTUi2qV/dvoDlv5O2lCfMaaJTc5x4rQuaGoXzhxJT
	07yAgg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatfxk63f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:44:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7151120d6so15323005ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787906651; x=1788511451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oqpp/YqJcmbInDW8NldSo8VxqiOBNOhc5Rb5jj2yQKE=;
        b=I+YiNbiGB7aF6ctGIz1sBNwyjTGyeeZbqVkjujq6iS2DQGkiRXfaOOndyj5caOjQJP
         RevEYKX8o2RYc9VFvc1UYUNtTf28ktNN14dA/L0/u/z8bx5bZ1Cry7PE7zJLWu/sAGFh
         RBzyjHpHEOj6ZNMhnjLysJahqLK2lNqTYU3LWeXaEbDXdrqAQyRcpqq7IRkzeXHehfU8
         GQ7OPRCMYUOWwBAMFjE7VYho6t33Gu/kwcO0AOJ5EDvaiPZYUetH0YzpcICuT5n6TE8i
         Cpo4RABAkSZ4LU1w46ASaqhmqUvf2xMFfAe3qf/JEzcBR6rggu2VaUQC3GTUf2BPXqHu
         DlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906651; x=1788511451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oqpp/YqJcmbInDW8NldSo8VxqiOBNOhc5Rb5jj2yQKE=;
        b=bqwy5EEi2b4mh2v99tlEwWLwSfCMXGbJeYD6XWZfNME4l8gJKOal6X8+6DnIUV4mC4
         2k5Hjy+VWO8ZgGwschZOsva17KAxElGW6GZ7tmLha60ErasXyNlojAjKPGFyxVHaNkLn
         5PGwTu8h5UZ6+WbtFAp2u3kP5W7ZjMQHDgMRplG6Fw7Vk8uXGcQXPZSQu6ub/XQSedEe
         V5qRuZhV1H+RGhPfEshWiwx4fOhGwOEFQa/yyW9R465btJbUji1bnl6nQMwHiHOhdB9v
         9UOBpypi1OKIkLUotJBPk4v3izvHN7pbuj42GPGg+Oe/yVOrTqSbaIvIKijUYG48WVxr
         4TXg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+d1T6DFZDDL7d1o0Jgopzu7sqKZ+MRPyLneeZiJ5ekjygPZha4KsRAJEIHWbbl+tbMekynTb9EnYlY6dR@vger.kernel.org
X-Gm-Message-State: AFuF++kp/IGU8vPcSgFMNen36c73vM8Og3++7FmDlVknZR2EBf/5beV9
	/0ZZKnBIlFiG+BCvmDDFLvcOMxHPUsyXb1aGwKSu0LeziIJWHZJLJsIJ+kbIqWO59M0XFTHtbpq
	KzMILUVD60NCoaoIb1p/BlxWTDqC+kK0IdeAqpqZQaGZlQACgq1s2zFZX0rZ/gcZcQecjFoE+es
	EN
X-Gm-Gg: AR+sD11HQ7IYtayyXY+SWpD4TsCIqFJnYfI7NcNqD+iZQdjvgLzV+22nr1xqdTA1AU4
	4bErj+4qRGyYSzi7D2sPvssLqQMdv8J56LqOtHpVVvQOgU1uUxdzD/X1HnE530r/waEUg/dY6WB
	duNYMn0aB4CckOFn68TgsSARn/+8Hl6z3oIUS7HT9EWoPikSkdzzuYT1kykdssH2VJCgEudyNel
	dZ7S3/X5I8B1dbDiNjglq+ecwPSwREYnvvAAV8cl1SV5N6pqMlyhoFQTb51g0bASk2MSXX5F4fa
	iJyUU17eiZvXqdtfllYqNBlJ4nO001NrbaDYw0x7jmk1g9/hBoTZEAGqZMNDeKQqEqzXmA40XJX
	w2aA5tgeSWi01M2kEdmA3UDvL5Gq2CrpFaeM=
X-Received: by 2002:a17:903:24f:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d74df5fa9dmr90023475ad.10.1787906650715;
        Fri, 28 Aug 2026 01:44:10 -0700 (PDT)
X-Received: by 2002:a17:903:24f:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d74df5fa9dmr90022845ad.10.1787906650197;
        Fri, 28 Aug 2026 01:44:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784857sm3673459eec.3.2026.08.28.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:44:09 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:13:37 +0530
Subject: [PATCH v2 3/4] PCI: qcom: Add CGC disable workaround for Nord PCIe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-nord-v2-3-18bf59d19d6f@oss.qualcomm.com>
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
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
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787906625; l=2355;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5x5TirLtHA0c0Rb9PKOOjbyhhs2shQyZ5pqbvgZXqk0=;
 b=IBotV43TcYpZpOfwsLPTB8XIkHg7+NNwBpXZCCtNFvB6kmG8fHVAB6hp3VkFYdr1DodhCbrZZ
 tHIu15FOJ/MBazQOqF4rdUggYLGaaymlDjGBZ/GECtR7jmRc5KklXoA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=UKLt2ify c=1 sm=1 tr=0 ts=6a914a5b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: itkY_0LT1kyTTyOKLNptretqNT_4yGo9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfX0K8qQ25TjZT5
 V0PRvyjgvQxeejo+Zy1p4E9Nq9vz/xsfhPY2WWAyDRr7sNMv5broGouMRzqjVsiw0HQl8OY/yjO
 ORz/ofsASBr0LY68zZjHKwoDVOxkZuiD2vYnd4QKld2ZSFEp1WqD1HzyzWrbTa9KigIrRVtUAPi
 WCMDl2Hkpa2rqSuj/CUmYgvENGOU6GdWHr56vrqRV9Pggr/iTrs/RBs8ZmgP8vf2JZDCqwP5XRn
 kOM+giKSSJsR35GF1HcSWrimGoVejWS/r9P02iupFkshGWLYELm1tsG2NZbnBWj6GZaw+c0s5Z2
 1cCiLvmPAG4Ob8uxsEvI3lS8jbBSwzeqqVDsOzdwEYDfME7eFsnvs/1hG/iD4JBAAw3kjYSGHnj
 eZf+lI0VDAZhXl9tZI2xc/ZOLTHTmjKhGhDQajdPajKOym1McI8mE/FlygpbSWHjspd0p4GNjab
 A9AsTKLhB5A3/O3H4vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfXwBDFrESfrfFi
 jYzcNy60B7GCrLMIQbJtQDBr9cjBnsnFKVzOO3qLYsv+/ZRCqGZ7Mk3h6ZZq+POihmpN7D8vQAU
 xjzkgQGUAptiHVxLXWENkA4KtV6YSGY=
X-Proofpoint-ORIG-GUID: itkY_0LT1kyTTyOKLNptretqNT_4yGo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280074

Nord requires a workaround to address a timing convergence issue in the
PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.

The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
change adds the remaining required settings as documented in
QCTDD11972446.

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

