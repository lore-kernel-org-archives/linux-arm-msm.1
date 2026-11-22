Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316269;
	b=b6S0/wX9hkmwiNKnVUdyKj9O2BTsMRyN5obaNjJB6EZKrNqU8TZCc4iJ2AYwm+RrIIMp
	 Ttk2kRPfzjkHEHoVqv8QnEmE38xRMTZMuA9Pow9v4aHa5WU3k2bT3Mj2JZXdDkbhlhgrz
	 8eQxOqK7RrDLbXTVQICRJ4uOW8Hv/bbDGIx5LM5jTdb7Bpamu8v7nWngKD6zwpO3oSmbZ
	 HHH/kIDZMZ4H+78fcG+q11+3UylUNuZnaKgpsPWrHWxFrPWsYR0ROr4hyykIV/fESy6bL
	 7S446omERqfuezMTO6oU/XTYhZ9PVhCXPTV/DExkqhXlcDCcI5srSKL1LhmliF3B4Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rWq3ySTalDKPkwh3oIrByTr39DDU253mWckrsIw7QH8=;
	b=VTpGGnVHcDvmbMLUA/bYj1+2E10g+aXEO4OkjKWhSXmV7kmnnJ2X4v4GE/GWvlLdmhtK
	 ldEZs0l/qUATWNkTKi0Jv/lMzaGmgknRdaITSUVtibUKqN09ywiBHAsxlcJlRman3umW9
	 JdImM1zJ8JlfKgjWCOwlOc3Wpds9GcwLH6MqSBQE0k7ZB2k5r7fgPoW8I+tXX1LP3Jm/8
	 o5SvzkB3VfrfHeXxp3lV7BuKJIeAt7CcZm0OIuQSLj91GB2v7MYAXClKt26hroDEIjImt
	 LcWZtPDlzVkMXAI2m0y9bCi8zv0HmU8ox1YWh1EbbeZeYj7fviTWBFIXOERTWc15r0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z05YkG3o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iy6+gmk3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B12F606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B12F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z05YkG3o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iy6+gmk3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM08JQ81942354
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWq3ySTalDKPkwh3oIrByTr39DDU253mWckrsIw7QH8=; b=Z05YkG3oDO4cgTCz
	H9TxvhUP5ZHrq4S8qGOvg5gJgwMO2+lvQC5HrnrQNK+iPpeEToyzgBQ1uModygrj
	jaAHA96qK+BE3bZs8jkywzuv7HIhFrJ63WfBlZDDkOcqmpr6vjxR6KosOcGXD0CV
	IKi40dLVDJyYWDzKq7iGrX5zQg+i420lCjjwqaHlAyJL3/Tf0ie1Ct+h2IRVyI6l
	2Hobb9qLjcz55konlGpMUix6fnaqiwEEsNmBs660epElzwtoq19gZSmQ8XgeJBJP
	g9jl3M/Wql0aX2VBTnYkFUHwVCIeGKe270HSk/tROTYqlYlHOEDjB067YUMfP/8K
	JOjyNw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h32j0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a0f79047so1047066eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316267; x=1795921067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWq3ySTalDKPkwh3oIrByTr39DDU253mWckrsIw7QH8=;
        b=Iy6+gmk3Xi4UXx6zxwO1pmu0tBRhXhJ2RQAIt60SF4uRgqxO7+l8UOHiLv3bEX+/R0
         9sQH2a05WIw1hJw+tvvJPzCTLIqlZFPhh1us7fXFYLOBVxAuQTzgYIkLk8DyFZnrW3va
         /uDM6GSaWndKtB5nC/YD89PtY7fJi+HCyk78StjsrOyv242nWfZIPNsGZjvKl99rlWlj
         +gb+oM2o71lnJwegO668x/dGfis3TeSmm6VusHyY99p0yubthS07Oj3vET1sJ4NVCZZ3
         H+/yENAl6AKZl6FWvsfVFr9XQqz8nwULFMTskqGZYlZDHKiPlMJaQhCjarPdVVpxa6jG
         E2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316267; x=1795921067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWq3ySTalDKPkwh3oIrByTr39DDU253mWckrsIw7QH8=;
        b=OS9ilSkik0Ut7rxnJMBYbOw+roGj0h9RqPuGDxXs6YqkSNUmjbpomWD2tSDukuzIcg
         Ylx0hLA+Ouq2CLdODwxlB3a0XBtLb6Dc+ejQoEGDBeNQELNYV56tIO7bQ3DR5EzBTQ4y
         yZV/GmH8rNth3EFeh3/RZT+HNv+NuAeAp0l1l0uxgg5hv/LKoKtGibcsSh7EXEzZR3k9
         3zWXLYSILRDgGISqn7zYmOgAfcUCWzqJ1JAZvj2wE7CN34WctRBGKtjjcXxzrLT3IER8
         8CAQyTq09QhypS4HumVg3tlVvJ1VEsy2u1+edWbpZSwmy5zeOWP0ZxvCXiMRyu2zR9Va
         WT6g==
X-Forwarded-Encrypted: i=1; AL+hErGrjmi7T0IPXqtvwmN8eWiY7zI5ah8WOp3FOgzjF05txSUPjI8TfxdDBqGZfDK5YBmVOSV0nIZUrwe/zJXo@vger.kernel.org
X-Gm-Message-State: APuU4Z8xELoVx0z0jNDfkiiIEh9B8gxdWcKRy/qs0OAlf1sxmYA+00/j
	+Jiq7YJNafhVL37fxK3xFAGzIYjMaBmPXKbDPOwO4mYO6ZdilnQggFDpJE7d/EQ+S8BNoY5l7Kb
	JIirFX908/D26KmpRw+gX81tkkdlsw7je8aHns/06/pQvwKXMDX/mWqetbCTHGa2UJB0R
X-Gm-Gg: AZFdTZfMcD6wGAkbPBpZ8tG6nehrTIlSS3aN4SWgkVX9hSpNwaOlcK/AmyN293iFt6v
	i/ayWEtrsZeFa12U84cj6SESdRQv9NeCZbSDdPbYMM8/kqbyF2ywZbrLF7EVax0Hh+TloSC8FgU
	+MIFcitrr5d3OnhlvUyIpQm9udsS1BB5tsY1zNk1pvSG1pokiORMWYZWZcRRkz6foDeft5pQYAD
	yvhRsLcSaiHV62ifYprpHcwMIivLCQ2LD86rvR4F8AIhUiax+HaVfT5p0Ndwd1h0ws5TIQPapum
	Pm7VilifuUcQGVJQ54ebo4v+JX3X48rw6Ufa1hut6nUCas7/IebCiSn4JPAr/N+uA5u3z6llpd6
	QNZNIgMfM0pEnpQe+dclJvKIeS9qnW0yuDu7uhH6WLWAmEdwKChRuSNiq/0KjF78MOeZ1zmI+OD
	0KdcIETLQa
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id 5a478bee46e88-38571510675mr8511382eec.33.1795316266839;
        Sat, 21 Nov 2026 18:57:46 -0800 (PST)
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id 5a478bee46e88-38571510675mr8511338eec.33.1795316266249;
        Sat, 21 Nov 2026 18:57:46 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:45 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:24 +0530
Subject: [PATCH 11/11] arm64: dts: qcom: nord: Add PCIe endpoint nodes
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
Message-Id: <20261122-nord_ep-v1-11-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=10622;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YncdoU3BuO22URTVFVNHbxkF5njZqLpS3JrwAvQ7ue4=;
 b=xoybu2sX9tmxeoLH7NRF9vcf6RPUv0/R/VZo77XrHAbQIP5VPF1MCngcd0K6WE00VeUlVnHtt
 BdDa3/fu5DJCKNYSvmZaPmI14X5ru9JTIyjEnR7nUCpSuLfwLulZ8NG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b025a2b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sOLe0Ikwd8dlQSscwYgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: _B0FdK2m_-R-BJDmn0-YvtH0d6AGWjE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX+toiwXK0NJUU
 SlJK+fpT5FT+LtT05l+YvgWHSHCAsYrKWM12AKkvbNJsHNeKfEuEFReQNRkuTFl7Vackx0G4WFQ
 DhKmIAYJlP8pXFNEMRdAzX13l+26C5F6mxEcAoxanRaOrI8iD9b+x/k5YKUpm4HDqdUaM4rhoig
 5SSOXcGob74zDR0btevJ6jSrUvHO3mBHx6ePXOqkNW3qGMgFKFaN7FAkANnrq/gLoefzeBeTzew
 gR4Rc49T8bLM+dpL59L9P2BkHkTQ0Yf4qSzLfNXwsScFVZxCzhIMPz0u+ZI5jmcWOiKmFgpjJhS
 SvLQcMPvDLkAJb8YUkkTcmQf/PWpIDLk9cWXaA5RjkaLXOUDq8kcj8DwJtDGa7nYg8mZ2fR3j2L
 FgHCeLO1LlEaBsRibmTvxyJTbgVzdhlu59S4M8frd04QBh/14/GJKiOoOfy5tlcLWok/RNYLKjF
 U/nUt2YYpallo7qEtBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX/OFRgufueFLo
 nZ58hCwY4qdjOd2049iggCt3rj6Y+fIhQ0Hb+lwXe6RiBT/4/nJfuM2z/7qqTICKZOUJQM3kshB
 yhxw9kjIO7kdH7+eOD8+eEg7FxGKISE=
X-Proofpoint-GUID: _B0FdK2m_-R-BJDmn0-YvtH0d6AGWjE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

Add the pcie0_ep..pcie3_ep endpoint controller nodes for the four Nord
PCIe instances, including their PARF/DBI/ELBI/ATU/MMIO/DMA register
regions, clocks, interrupts (global, doorbell, dma), interconnects,
SMMU, resets, power domains, PHYs and pin control. pcie0_ep additionally
carries the dedicated MSI-X BAR region.

Endpoint mode swaps the PERST#/WAKE# directions relative to root complex
(PERST# is an input, WAKE# an output), so dedicated pcieN_ep_default pin
states are used instead of the root-complex pcieN_default ones. All
nodes are left disabled by default.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 369 ++++++++++++++++++++++++++++
 1 file changed, 369 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index db70631af6f1..d86c78b9640b 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1541,6 +1541,287 @@ pcie_phy: phy@1b00000 {
 		status = "disabled";
 	};
 
+	pcie0_ep: pcie-ep@1b80000 {
+		compatible = "qcom,nord-pcie-ep";
+
+		reg = <0x00 0x01b80000 0x00 0x00004000>,
+		      <0x00 0x40000000 0x00 0x00000f20>,
+		      <0x00 0x40000f20 0x00 0x000000a8>,
+		      <0x00 0x40010000 0x00 0x00020000>,
+		      <0x00 0x40100000 0x00 0x0ff00000>,
+		      <0x00 0x01b84000 0x00 0x00001000>,
+		      <0x00 0x40030000 0x00 0x00010000>,
+		      <0x00 0x40020000 0x00 0x00001400>;
+		reg-names = "parf",
+			    "dbi",
+			    "elbi",
+			    "atu",
+			    "addr_space",
+			    "mmio",
+			    "dma",
+			    "msix";
+
+		clocks = <&gcc GCC_PCIE_A_AUX_CLK>,
+			 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_A_MSTR_AXI_CLK>,
+			 <&gcc GCC_PCIE_A_SLV_AXI_CLK>,
+			 <&gcc GCC_PCIE_A_SLV_Q2A_AXI_CLK>;
+		clock-names = "aux",
+			      "cfg",
+			      "bus_master",
+			      "bus_slave",
+			      "slave_q2a";
+
+		assigned-clocks = <&gcc GCC_PCIE_A_AUX_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		dma-coherent;
+
+		interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "global",
+				  "doorbell",
+				  "dma";
+
+		interconnects = <&pcie_data_inbound MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+				<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+				 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
+		interconnect-names = "pcie-mem",
+				     "cpu-pcie";
+
+		iommus = <&pcie_smmu 0x0>;
+
+		resets = <&gcc GCC_PCIE_A_BCR>;
+		reset-names = "core";
+
+		power-domains = <&gcc GCC_PCIE_A_GDSC>;
+
+		phys = <&pcie_phy 0>;
+		phy-names = "pciephy";
+
+		reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie0_ep_default>;
+		pinctrl-names = "default";
+
+		linux,pci-domain = <0>;
+
+		status = "disabled";
+	};
+
+	pcie1_ep: pcie-ep@1b88000 {
+		compatible = "qcom,nord-pcie-ep";
+
+		reg = <0x00 0x01b88000 0x00 0x00004000>,
+		      <0x00 0x50000000 0x00 0x00000f20>,
+		      <0x00 0x50000f20 0x00 0x000000a8>,
+		      <0x00 0x50010000 0x00 0x00010000>,
+		      <0x00 0x50100000 0x00 0x00100000>,
+		      <0x00 0x01b8c000 0x00 0x00001000>,
+		      <0x00 0x50030000 0x00 0x00010000>;
+		reg-names = "parf",
+			    "dbi",
+			    "elbi",
+			    "atu",
+			    "addr_space",
+			    "mmio",
+			    "dma";
+
+		clocks = <&gcc GCC_PCIE_B_AUX_CLK>,
+			 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_B_MSTR_AXI_CLK>,
+			 <&gcc GCC_PCIE_B_SLV_AXI_CLK>,
+			 <&gcc GCC_PCIE_B_SLV_Q2A_AXI_CLK>;
+		clock-names = "aux",
+			      "cfg",
+			      "bus_master",
+			      "bus_slave",
+			      "slave_q2a";
+
+		assigned-clocks = <&gcc GCC_PCIE_B_AUX_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		dma-coherent;
+
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "global",
+				  "doorbell",
+				  "dma";
+
+		interconnects = <&pcie_data_inbound MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+				<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+				 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
+		interconnect-names = "pcie-mem",
+				     "cpu-pcie";
+
+		iommus = <&pcie_smmu 0x10000>;
+
+		resets = <&gcc GCC_PCIE_B_BCR>;
+		reset-names = "core";
+
+		power-domains = <&gcc GCC_PCIE_B_GDSC>;
+
+		phys = <&pcie_phy 1>;
+		phy-names = "pciephy";
+
+		reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+		wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie1_ep_default>;
+		pinctrl-names = "default";
+
+		num-lanes = <4>;
+		linux,pci-domain = <1>;
+
+		status = "disabled";
+	};
+
+	pcie2_ep: pcie-ep@1b90000 {
+		compatible = "qcom,nord-pcie-ep";
+
+		reg = <0x00 0x01b90000 0x00 0x00004000>,
+		      <0x00 0x60000000 0x00 0x00000f20>,
+		      <0x00 0x60000f20 0x00 0x000000a8>,
+		      <0x00 0x60010000 0x00 0x00010000>,
+		      <0x00 0x60100000 0x00 0x00100000>,
+		      <0x00 0x01b94000 0x00 0x00001000>,
+		      <0x00 0x60030000 0x00 0x00010000>;
+		reg-names = "parf",
+			    "dbi",
+			    "elbi",
+			    "atu",
+			    "addr_space",
+			    "mmio",
+			    "dma";
+
+		clocks = <&gcc GCC_PCIE_C_AUX_CLK>,
+			 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_C_MSTR_AXI_CLK>,
+			 <&gcc GCC_PCIE_C_SLV_AXI_CLK>,
+			 <&gcc GCC_PCIE_C_SLV_Q2A_AXI_CLK>;
+		clock-names = "aux",
+			      "cfg",
+			      "bus_master",
+			      "bus_slave",
+			      "slave_q2a";
+
+		assigned-clocks = <&gcc GCC_PCIE_C_AUX_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		dma-coherent;
+
+		interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "global",
+				  "doorbell",
+				  "dma";
+
+		interconnects = <&pcie_data_inbound MASTER_PCIE_2 QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+				<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+				 &config_noc SLAVE_PCIE_2 QCOM_ICC_TAG_ALWAYS>;
+		interconnect-names = "pcie-mem",
+				     "cpu-pcie";
+
+		iommus = <&pcie_smmu 0x20000>;
+
+		resets = <&gcc GCC_PCIE_C_BCR>;
+		reset-names = "core";
+
+		power-domains = <&gcc GCC_PCIE_C_GDSC>;
+
+		phys = <&pcie_phy 2>;
+		phy-names = "pciephy";
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+		wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie2_ep_default>;
+		pinctrl-names = "default";
+
+		num-lanes = <2>;
+		linux,pci-domain = <2>;
+
+		status = "disabled";
+	};
+
+	pcie3_ep: pcie-ep@1b98000 {
+		compatible = "qcom,nord-pcie-ep";
+
+		reg = <0x00 0x01b98000 0x00 0x00004000>,
+		      <0x00 0x70000000 0x00 0x00000f20>,
+		      <0x00 0x70000f20 0x00 0x000000a8>,
+		      <0x00 0x70010000 0x00 0x00010000>,
+		      <0x00 0x70100000 0x00 0x00100000>,
+		      <0x00 0x01b9c000 0x00 0x00001000>,
+		      <0x00 0x70030000 0x00 0x00010000>;
+		reg-names = "parf",
+			    "dbi",
+			    "elbi",
+			    "atu",
+			    "addr_space",
+			    "mmio",
+			    "dma";
+
+		clocks = <&gcc GCC_PCIE_D_AUX_CLK>,
+			 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_D_MSTR_AXI_CLK>,
+			 <&gcc GCC_PCIE_D_SLV_AXI_CLK>,
+			 <&gcc GCC_PCIE_D_SLV_Q2A_AXI_CLK>;
+		clock-names = "aux",
+			      "cfg",
+			      "bus_master",
+			      "bus_slave",
+			      "slave_q2a";
+
+		assigned-clocks = <&gcc GCC_PCIE_D_AUX_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		dma-coherent;
+
+		interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "global",
+				  "doorbell",
+				  "dma";
+
+		interconnects = <&pcie_data_inbound MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+				<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+				 &config_noc SLAVE_PCIE_3 QCOM_ICC_TAG_ALWAYS>;
+		interconnect-names = "pcie-mem",
+				     "cpu-pcie";
+
+		iommus = <&pcie_smmu 0x30000>;
+
+		resets = <&gcc GCC_PCIE_D_BCR>;
+		reset-names = "core";
+
+		power-domains = <&gcc GCC_PCIE_D_GDSC>;
+
+		phys = <&pcie_phy 3>;
+		phy-names = "pciephy";
+
+		reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+		wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie3_ep_default>;
+		pinctrl-names = "default";
+
+		num-lanes = <2>;
+		linux,pci-domain = <3>;
+
+		status = "disabled";
+	};
+
 	pcie_cfg: interconnect@1ba0000 {
 		compatible = "qcom,nord-pcie-cfg";
 		reg = <0x0 0x01ba0000 0x0 0x7200>;
@@ -1961,6 +2242,94 @@ perst-pins {
 		};
 	};
 
+	pcie0_ep_default: pcie0-ep-default-state {
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie1_ep_default: pcie1-ep-default-state {
+		perst-pins {
+			pins = "gpio5";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio4";
+			function = "pcie1_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio3";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie2_ep_default: pcie2-ep-default-state {
+		perst-pins {
+			pins = "gpio8";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio7";
+			function = "pcie2_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio6";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie3_ep_default: pcie3-ep-default-state {
+		perst-pins {
+			pins = "gpio11";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio10";
+			function = "pcie3_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio9";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";

-- 
2.34.1

