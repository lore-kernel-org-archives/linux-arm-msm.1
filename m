Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316248;
	b=ByQ0S55ZCPZfg57znDzZUIfMzuCCnj2C1jdkYd4FtkHXQwFhU5QkHJxJnZdBQEE2I6bm
	 GhJJUIjMWFjoxmBIo3FwyLgmMJZluJvA3+ZUx4kHOLgRJO01NIwzPykKv5tlKQjtv+fQS
	 ryJdg1js6c9uS38qWIE14TAmkSNdcjCqRAaPS1HQlDKUYjSPf2MRS2+Y7VJbbs5YBpJjS
	 1q8BwYNnT3oEpjyKxf1NOPMJwPXDBkuugByrFjNRbyuBoGb9m8FqCK+b8Evk0OwNgA1NE
	 4pjP/0Ma9YnN20rgG/9ek2YRI3CDK9ss3oRWg+r1SxKv1O11C7fWEV4nLSuedr8poVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
	b=onzVKdhyR3gGBViSKpYUTTKIBHWcf99pBIAFZnSbxB7SLpsry2WJvneHFBXAC8dlIz1m
	 P4/6NJsMjKUTUkQOdRlfURpUTKt4SieGrKce5gm3+sTJQjP4yVgV1k0h5MxgNftQ8W+85
	 KJFMT6SF4w9W2sTDcWpjXqO2SIhTsjVD4XNSM9C+k8ndGJxKIjV0JbYJLeOjIxU9HIiap
	 279lsQQb9GSvVK1skSPBFgCIBHXEpmQJa1W6TASFZcY/cWT85puEK1GZwEe9nRiLYaOCi
	 T2P+89hMoMfMeR9CLHjrhOa9Vmj5Cm0c/UC0bZ+4hWcq3oSvAUnXThH8q6DMbhj+vxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6b0b8HD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YuSSEaGc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364B1606A331
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364B1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6b0b8HD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YuSSEaGc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM0AFsd1500740
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=; b=M6b0b8HD2sPhLeBY
	jXuvp/a/qLxkQ7r5of+7u2ADjaAfbj2b4xwIWqrZ3WpqxtYRwIqQpZuEgBKfcTqf
	uSm5ixUGONwINRwBWAlMJXiXN2BYbwnXLu8+ULDJiejyBkmT8Op2IS7IjD6wBL6/
	oosyd57rRVkf9FUpZSWsfP87yoMQRd8/lPA8hTQau5RLob7TvJ3wjb0ATmrES4gO
	x5eUYBeVST8xAphouK3defcfQts34woq5TEuws+WIC7ri7+fisjY0cUcPGEG2BcJ
	ePpQW9siruXVVnkOW3a4a/21haYCET1Q9SlrsoF/LDvddxOf8ImD7TaEw+NNRiYc
	0Zeblw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342gje1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3056814eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316247; x=1795921047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
        b=YuSSEaGcZjzCG/lVsqMxGIZ2b6l1iga5FOR1KB5kAycWuP6aPt/niKPz2akfiDeU8K
         XJIM/4WI9xyCZm155s6iZe/XhAFcmMIVgaXrjH1sZDaC7RHu13guAf1de+E2u4sD1E7p
         kkHgVKCmXAn2z+foBcEXv9aCLOH8NhBJFcIwo/FDy7Ww35AO+wtHj4S7I1vb/bEVnb0k
         mnZHMVsbKOHMP1NUew03IaAMRZ05/1kYh1V6KavoxnFX/sd6NEbeZF+hslNCGeXgO4jg
         +0eRsp1C6b0BdhoiKJmH3FieGLs1EDMdk/fFP3BVmLUNDyhESzUSY30HE1jmVQZ9kgst
         N/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316247; x=1795921047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
        b=OpCwUU+yqAG2BPFpNfjoUqJAe73a3WDwIelehBVx4Dp+AMfV0+anfj5BQozhU2KaZ9
         eeLPi6eIo61E5gc2iy8aiZkOnyes77SpiRqr7pcubMxe7p82bVSnXoP8Zjz4uBw3jopZ
         pTL0doPj1g1cWmz+fBjZR44cUVoQujLoVIKYK2knwOzKEpNJVr/FF64YLwNtBGeUfXwg
         TffPHB2aYz8Y87J0dRUHungRR91XokDqUjpmBKBlL+DGmnd64cwit4vwYDPxKR+v3Hf9
         HG7cJNCJ3JekhUfns4M6/dc5olzMgpvpZJHezUk/9c/vqn95nospu4o8R3ZVkpw47bp+
         N59w==
X-Forwarded-Encrypted: i=1; AL+hErHzjZviF3TFWMRuYxlQuUKNwBAsPOmWMwkBK8kOHfgIHQEmc5va6ictzWdtdap5sW357Zv+L3pm540ZpLGS@vger.kernel.org
X-Gm-Message-State: APuU4Z9IW2gvPplNCPG1gX8jvvsw/NFZ/uRl4mcM4Avxz3Z/36yREs4Y
	fck+iKLVeU1vUtBHoo02IC6d0isrXQj4UvlWEgyDTITV45x1Gw52zNynf7xgkdto8JtJJC//m4Z
	f8XyI2zkVeo0tEnLmFr+rv0pfztTG6bfcjKq9ENqdJ0i9ZBJjCNA6c8FmF5/oZRaoc5j7
X-Gm-Gg: AZFdTZfQDKWyiUN8M8w00BtUt6djjM6YK02ulzNn8ZP2CCs36+R4VA0fRw3lVok0o6J
	+fDAMzco/iNLoyjA5A0lxJpULf6DlOgFnQEJhxhD0hOqWw4EibS3SuspSeNmQN/ATF9pdK7N2tE
	YvBA4QbqE2utY61LsXBMUBFDqDt9XSYnFW7UBeCsb/hMwQ9f4aTLRhhKHcjayvph7Y/mRzyfriH
	yZjWCpU1vPv9ISYMPrPPROubw1ypTFijQyhG41Uv2vnUVENu0P9BUjD86oXhZ8phoEN/yryiqk3
	Q0UboH7gXnuQQlSOmL5dnCjL96SmIKggneXFBTByn0Oh1a02/ZEk+Tt0Dv9u6Wi5z0XtVCXdFVa
	0XBTvDjYJZ9HWcIn81j8EnjONVwr7KerAkIf6BQOqTawGJnBYTQrbUM76zY99Fk3ifCt18afndY
	8tFcHYTcR5
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr9002383eec.33.1795316246566;
        Sat, 21 Nov 2026 18:57:26 -0800 (PST)
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr9002360eec.33.1795316246085;
        Sat, 21 Nov 2026 18:57:26 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:25 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:21 +0530
Subject: [PATCH 08/11] PCI: qcom-ep: Add Nord PCIe Endpoint controller
 support
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
Message-Id: <20261122-nord_ep-v1-8-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=2371;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8c0qizR+vJDbUelP4aajkaF2bPuI5eYuJiK1wGZgORg=;
 b=eL5h/o95qzrBD5KJbEm5L9/kOS4P75awELLFLbJl7PPCl/p6djtY0NQoswJCEy282rRHN84Rr
 loGzYvTNdqeDDKu6YWBkPsCtU/wYJPe9jTxYfL8UmXHrmhT875SEVdd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b025a17 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v3XsYOnbjY9NYLbxQCcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: T-KDzTp8TqtdKS37i0gPcg3xsSP8oNQx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX1w0xpG/OqHzX
 P971F4PQ5s1pi/7VmXuNfXEN7C1V+JDOw/SoX9+rlJzvNJskI9L9AATjeDwlClKssUfcTo4hN0O
 BEbMB0xpz6QmdQvLuNY5RZMnTWV0sYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXzcrAE7N6XJ6r
 nsYtm+GtfXpt/QJOyQZDeSp4txPS2C9ifg3AWEpnEB99o6hOQ9my1yMX/drakAJT85MXAKY2Jqj
 5VLjZjs8FkTyqVx909Kkj9cXJ+70K2xdqE9/RzftBGf6xzDJOFKIVhonEQjILCbjWs/2taRGrA4
 nsWSLgUhPZiTPV3x9XFNqEcqTBP9IfrwRaQhMX0M2QDygfbL4ddilk0b1TRc0VdtvyPiFcbFMrS
 sTtP4QQG+t1feqTnqk/JbSZcRBw748iVAnlh4taSisDCRuINQTlXip92CItfxKibFziJQhNr4TM
 N65/xrLn78UkNLCpxPWxPIMqjBE4sMD26M/DZ6CgEP0U9mMvDrshqy0EUlUxpaEykV3zb9x0K+N
 Y9hzCkiJV2lKFLSvlljanIgHkKNfUR08XyQNZ6PXweNO6in1xNtc7UYG0dH3s5T6yNA4VixY2u4
 7I1f0D3zPtIhf2pOa9g==
X-Proofpoint-GUID: T-KDzTp8TqtdKS37i0gPcg3xsSP8oNQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

Add support for the PCIe Endpoint controller found on the Nord platform
via the qcom,nord-pcie-ep compatible. It supports HDMA, overrides the
NO_SNOOP attribute and disables the MHI RAM parity check, and is MSI-X
capable.

The Nord HDMA block spaces its per-channel register blocks 4K apart
instead of the dw-edma 256-byte default, so program edma.ch_space_sz
from the SoC config.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index c794a2207df2..661bd8aac7cc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -171,6 +171,8 @@ enum qcom_pcie_ep_link_status {
  * @disable_mhi_ram_parity_check: Disable MHI RAM data parity error check
  * @firmware_managed: Set if the controller is firmware managed
  * @msix_capable: Set if the controller supports MSI-X
+ * @ch_space_sz: HDMA per-channel register space size in bytes. 0 selects the
+ *               dw-edma default (256).
  */
 struct qcom_pcie_ep_cfg {
 	bool hdma_support;
@@ -178,6 +180,7 @@ struct qcom_pcie_ep_cfg {
 	bool disable_mhi_ram_parity_check;
 	bool firmware_managed;
 	bool msix_capable;
+	u32 ch_space_sz;
 };
 
 /**
@@ -903,6 +906,7 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 		pcie_ep->pci.edma.ll_wr_cnt = 8;
 		pcie_ep->pci.edma.ll_rd_cnt = 8;
 		pcie_ep->pci.edma.mf = EDMA_MF_HDMA_NATIVE;
+		pcie_ep->pci.edma.ch_space_sz = pcie_ep->cfg->ch_space_sz;
 	}
 
 	platform_set_drvdata(pdev, pcie_ep);
@@ -984,7 +988,16 @@ static const struct qcom_pcie_ep_cfg cfg_1_34_0_fw_managed = {
 	.firmware_managed = true,
 };
 
+static const struct qcom_pcie_ep_cfg cfg_nord = {
+	.hdma_support = true,
+	.override_no_snoop = true,
+	.disable_mhi_ram_parity_check = true,
+	.msix_capable = true,
+	.ch_space_sz = SZ_4K,
+};
+
 static const struct of_device_id qcom_pcie_ep_match[] = {
+	{ .compatible = "qcom,nord-pcie-ep", .data = &cfg_nord},
 	{ .compatible = "qcom,sa8255p-pcie-ep", .data = &cfg_1_34_0_fw_managed},
 	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },

-- 
2.34.1

