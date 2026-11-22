Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316208;
	b=O1mgUH1T17ggMtSeQJXnEZ8vsl+Gc9ol683VKRwWVUI7Fqxcz7TOMfh9Mg+pljdJHsoc
	 8g7aajHheDat/FhjFrL9WWbm0bOk//geajLIJBFInAffz68ZlqW7bLXCUUTWyLEk+oSiC
	 1xuQLwATtaZF0yPjEuz0nlvF8R2LrBhahZWG5UO+VSn4pCNhQq5xjOkOWekIqD1Ys/uBS
	 aqsM30YRXmjgpZsqAB0rz/Aiw6j19RAkMUgzYfW/AaPU236RptWt7XTkF7zUbh1qs0HpM
	 /ZDE0vbyr2ZgCJac9s58jE6Dg3Gueq78s0SwEuIT6iU/KywURWGWrazyV7ygVFxedJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1clNjBa8Zrj0xBBvYuEZ7pZMKBdACxhX6qQy1sXV/YA=;
	b=q/GBuiO1AwEUmAxQfAGSKOuaMdPyZAeJsTftJEOqNWbHRzZb36UWHGFU6EM31OJ9983W
	 YbvB9ybSUIUM7JkEzbIhG750Dar2rBmfJQ2L1/Itb0ifFwAVjYkRus29tVdLwUoBgHiZ/
	 8y8oSEnezEutOBH2X9DSKcI//EQ30yO+o6AlwQkfTnipSVk6I7vlxF+NH1ODHbhwinwxO
	 bkG3eD16IxJXT9HVtqBp5MK6IszFRC0evjdHnPNqlP2vXYajwMj+qwKQYkJRJsUqv/uQk
	 mgztsC6/kDY9AkdIbb1BRiGyZrzRRZmj/6BMxGidchw0eNID7YnQSGWrrIElPve/nwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAQ3Ynh9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SOavA6NM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C9606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675C9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAQ3Ynh9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SOavA6NM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM0916U3598571
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1clNjBa8Zrj0xBBvYuEZ7pZMKBdACxhX6qQy1sXV/YA=; b=QAQ3Ynh9suMLRRUw
	6CDW4cxFy91GGPGeuB7l3KRUkrtuW+FaEc2t5yxjo++y8DamGXFCVVb+C3htk1gx
	KM45X34DvG9ejTgP7KcKYBumpnUPiGvH+6Xa6FdQpsMmsGkACnCoYgIUEJ7i1NFr
	Bo/EvNmKyOGWTP/14K3tO7OBOoHti+bKhHHoHFjviW70xZzFE10NyYqJAWbaCMH5
	GRMOggSCd6AXnwx0F00Nd5kHWscFTZA7xSPDDTvmo02l3u6CZhULB8MnmSjnhWg2
	SMCqSf4VH66SrFDwB0C8zESSCSHmyid4LoEgWM9Ee9iZNs4lzN2kHzJK/n7aI+z+
	LqaCtA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w02k54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:56:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so3510112eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316206; x=1795921006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1clNjBa8Zrj0xBBvYuEZ7pZMKBdACxhX6qQy1sXV/YA=;
        b=SOavA6NMx+TaptkMJP7CHmg2g3F2bL72vNrmybw+gZZ2b4ZnQOQVvoqwPt8uZRr6Yp
         108ewQ2I04kq9kSSwD4TivvV2+F3+KqbD2H3yaLQJlaASQqSOTdiabqcgcwephJBil0D
         LE5NbGmwlunV3vo7Yh1n0PMpX1q8UprlFvxn7x5v/Pkad9ZW77oABTfqeVKbf3t/w7jg
         r1MYv2UECXlIq/ODiJT/7kcFmZTy0KN9opTbZvTgzjdSutvjbJBuhO8C1ozK3foy1LUR
         15mE18XlkiGyZxRRMyefWvHx+38MCJCtGihjZQngJns36I7RjKaL+4cxeciBixngaPlC
         HyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316206; x=1795921006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1clNjBa8Zrj0xBBvYuEZ7pZMKBdACxhX6qQy1sXV/YA=;
        b=wc2sZ/xYLgLCWyXNLxGD9Va8T3egOp2Nrg+i87IeaOBVc0Vq+JJ7nTqGmd/QsZZFXh
         b+wtjwH4qBbCeAbQ316XooBWRRHYi4+izZ2q9OXaB6PvAaXyefDnyfkQdVbrptUFGCDA
         7isq9D7v5fIQXQ4tXNk9+49+EglrxBdS97TQ4BJCp7KhX7CJdEZneq1eMFv4CLxJN44/
         VK72g528gG96E02SX2trbkWuDOyD7SC3Q1z5ySklXeLMTztncF1MpuG1b0Fqv8K7/L+D
         t/KRqvQFw4d8iPsYp4ZVu4qtUfflxhAXU+d/0JxS1i3kG455phU4hO5eB1dSuKEIJ2ng
         YWPg==
X-Forwarded-Encrypted: i=1; AL+hErF4sahu+ucUY33g7o9DUepNvC0utCQm6InTpzpXeGElXkf5wrOY6LTCgJ1789wsuRKjEaa4ps5VDNiWyEhm@vger.kernel.org
X-Gm-Message-State: APuU4Z+GFSFnSkuJrrlIOJhzRttsyn+zMUMYPJtssrajP5LW2urfoHKe
	jbfq6Wwo/mSkimoBZ6wbfuLNkVlAZeGDW59eP1gnzZ6ne5xFGzkma4nlpn2g6EfKUXtcwE9dWXs
	2Hs2bJnSzB4acEHLTrN3ivV2HyaU9to0Leqk//1gsbLNlwWwi/P6VAl1XN+hXveHOjuJe
X-Gm-Gg: AZFdTZeVmyDbWkSi+wIKTXfrP8KELIQo3V7gEPhqW79gk8GORgskWcF0zYTkHPAWc+1
	iZxXjDsEVImlC3axiZqMtFzEcBFCVtF0Ez0TXA9rnwsW0A8mzhmdNgt1hfBbFsOOFy6JVwN0W3o
	xlH7ORwGlsCfixAHje5zA692ozgPmpsBG+HGyT2GVIdjiHqths/Y1XhSZ54MsjxFH1iJ8A9hj+9
	3OqfvCz5FxOfOQabCL6z/Zlain+M75XfVsRWVbZ7u8m+vuXUb6Kgbbo3qpg7Z9EGsjSM0YFFYbb
	Sav+ODBLbsU0jpTClr1ZpbGssHIf5q6J/fX2q9LcK1Yz7YObjp6nwZ86LQQU5CMwNWh+Aj8+6X+
	xtYq72XwI+kRok/+P+HQ3SSthsjyEZNrj8LSh6avmNMPb4NYkuPDRmwxqgFtyI4/OGsff3gAifM
	wPOWjGhc6N
X-Received: by 2002:a05:7300:50e9:b0:386:9a77:b390 with SMTP id 5a478bee46e88-3869a77c55bmr4571693eec.12.1795316205963;
        Sat, 21 Nov 2026 18:56:45 -0800 (PST)
X-Received: by 2002:a05:7300:50e9:b0:386:9a77:b390 with SMTP id 5a478bee46e88-3869a77c55bmr4571671eec.12.1795316205494;
        Sat, 21 Nov 2026 18:56:45 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:44 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:15 +0530
Subject: [PATCH 02/11] PCI: qcom-ep: Add MSI-X support
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
Message-Id: <20261122-nord_ep-v1-2-6d8839ffa9aa@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Anvita T <anvita.t@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=2569;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mps0dQPLSI1oXXnodqvs4lyheOQWjr7tO9t5zayQPrc=;
 b=MWK9vdASLE0qflk/gtdRDSZdWQXZFXtbdL9B1Q8QY3V+hGuk3FWi/Rrs489ZWn45aX7b+aoCW
 L19aKtF4695AxOdfTdqcsrkRHJ5v3R8Rts4pFIJ8JWUFHK+SGyTZEKU
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXwaZFP7zF4XtW
 FcCP95KrhGbUmEgipsubHWonqpy6Unwd1k+Q3zdYF7RAkmveYSjIDiblp35xlautWIiLvOFIA7c
 FRXUbJGLH/DvfDXv0OS1/XEFItBFtKu/jvAc/U1ExifH7hqBAp+o52OmmCFvS/K6RW08um68lzn
 wTHbvbBu7ASNjykc825fF8m+jFHeqniA2xtLpARJcv7rkUlVyv24O8f75FHE0RoRmOlM9DUYx7o
 42tBNJbIAMCp0xGCT1fgkbNKChvxlk9kNiGsSBk43QseK1nLqZCTuiQrpW8txWZmuiPwj5O8PQJ
 F3YTS/YYBbCJ7DUFNnOQnalUmdik1nxz7cCIl64ezjcuO5TcJFuaLTm8lqFpTMi5+SRM57M6BHH
 iiAlmrmNYlzXhOln2p52G1YFG03z1XsgOLqEYlKiuFNQPJVosf/umZym5bwVC8oKdXtGAq6x60U
 yfLoRE4QkyePQtSWNQA==
X-Proofpoint-ORIG-GUID: shtoiA3brk7xvcJvbHw-y9-z5gH4fBac
X-Proofpoint-GUID: shtoiA3brk7xvcJvbHw-y9-z5gH4fBac
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXzJYeEYGx7IUW
 JH92VBP7GokdfoErS7ZC7+N0ocGsbVaGgoR1DHc9y43PO9iYMzJSZ36voibEbeiFjifyqjWH/S1
 4D3aAehh094WpcjBnMwptmzXvA3dvMU=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b0259ef cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EKRowzD1bsybSWocKwUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

From: Anvita T <anvita.t@oss.qualcomm.com>

The controller can signal interrupts using MSI-X in addition to MSI.
Add an epc_features variant that advertises msix_capable and select it
from ->get_features() for SoC configs that set the new msix_capable
flag. Route PCI_IRQ_MSIX requests in ->raise_irq() to
dw_pcie_ep_raise_msix_irq_doorbell().

No functional change for existing SoCs, which leave msix_capable unset.

Signed-off-by: Anvita T <anvita.t@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2d7ddf8d173f..c794a2207df2 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -170,12 +170,14 @@ enum qcom_pcie_ep_link_status {
  * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache snooping
  * @disable_mhi_ram_parity_check: Disable MHI RAM data parity error check
  * @firmware_managed: Set if the controller is firmware managed
+ * @msix_capable: Set if the controller supports MSI-X
  */
 struct qcom_pcie_ep_cfg {
 	bool hdma_support;
 	bool override_no_snoop;
 	bool disable_mhi_ram_parity_check;
 	bool firmware_managed;
+	bool msix_capable;
 };
 
 /**
@@ -806,6 +808,8 @@ static int qcom_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 		return dw_pcie_ep_raise_intx_irq(ep, func_no);
 	case PCI_IRQ_MSI:
 		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
+	case PCI_IRQ_MSIX:
+		return dw_pcie_ep_raise_msix_irq_doorbell(ep, func_no, interrupt_num);
 	default:
 		dev_err(pci->dev, "Unknown IRQ type\n");
 		return -EINVAL;
@@ -852,9 +856,25 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
 	.bar[BAR_2] = { .only_64bit = true, },
 };
 
+static const struct pci_epc_features qcom_pcie_epc_features_msix = {
+	DWC_EPC_COMMON_FEATURES,
+	.linkup_notifier = true,
+	.msi_capable = true,
+	.msix_capable = true,
+	.align = SZ_4K,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_2] = { .only_64bit = true, },
+};
+
 static const struct pci_epc_features *
 qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
 {
+	struct dw_pcie *pci = to_dw_pcie_from_ep(pci_ep);
+	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
+
+	if (pcie_ep->cfg && pcie_ep->cfg->msix_capable)
+		return &qcom_pcie_epc_features_msix;
+
 	return &qcom_pcie_epc_features;
 }
 

-- 
2.34.1

