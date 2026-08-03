Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF4401494
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756440; cv=none; b=ZOiq8epYvBfdI7unv/kP6TM4OtafXbXkQoRXelqY5xnRkA/GZ3SfdEsGVcyEQce5qwBZHPtOVvsjn6iuELv4FK0cvVvAo6LPPx5vSlSNsfldpg+lZVLi0GInut4lklhBucXZNtJzU/GXOoDlppgqUoSdqCPdTt6uHEcVT7ea+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756440; c=relaxed/simple;
	bh=ZSLNLHFO7Jhg77ucFKiasYsGyDaqzctpLXxptFW2ECA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZmS/gpSpMX+bHGZWm1jIHeg+38hHuC2jFTEYM02QJXCPhrk/Jk84teNrAv1UMwF2GjlV7kKOKacNsA9wI7fGx/IN2dpnFKkbOHUO+YZeL8uBBHHg3K1662Xze9BHSDfX/T79LcRsNbxCWGqBnJ3XEXQlm6/aW3pY+6Zx6ZwFQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYUbSCW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsEYjpHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYUbSCW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsEYjpHC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737O6db2211223
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 11:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrSMogFbEylz8K281GGh7nRyEeaTHtLfSb1WcVkfZKs=; b=hYUbSCW6qnq/oAq0
	Ltg9X5V/LE2ECywfKd6rwTaE+E3RhVF49hyH51Montt9NMQiof6PJgPfZWy5VKCk
	1eSgq8IZJcV1n5F+2B4LyA1BKm2cLlIy+QueVckNNRo1aLt63QU7NkYBR0mHTbJO
	TKncKxcfcacSbUDEqjpTJkvE8cjTfdAxveU5PHX/XmJvBRfeKCcsAfr+xVIMyMrh
	rBkaS3o/s44/8bkRhN6V1SUnXTTlSOZLsAv2oCfKQzeWGZIG81ew8RuMKQGqq9Z+
	4bXLEH3BS9s88mnTYIuL34gtj5BIz0uf5wCQwZ9yGelzJDwvfn2eiX0UVTrjW2Cx
	spFGfA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxaf6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:27:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3495412a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 04:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756438; x=1786361238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrSMogFbEylz8K281GGh7nRyEeaTHtLfSb1WcVkfZKs=;
        b=PsEYjpHCVUOc/lQ6Uh4+g6K7QwIpLcvZAE7QKPljFbAIohwI3+t4I0nY4sGEyzXLkH
         qWR8HlTQQokF2oogMlX/YNyl7VwhDfuADL/W4SLxaQKhIOdNA5a1Z9KGoAFB0YBbkRtL
         +g/8rKiH+5ePvmKgzr4GiV8ql1aNTMEVVtIRE2DJsUOEP60BKXqQxSdOlt87ugBdl1NW
         72xCFMMs4+ED/TG1iy0sUuWbg5IxyOrRqT7PtlKHCQVVPtSrrw+NFyXbxTPauztg+z2E
         doVvF1UuUyQnT0dkPHll5eYXbgufv78vBNEnyAnXMWA+45MVfEs8xoSE/XsbY+ZTRboP
         y1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756438; x=1786361238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrSMogFbEylz8K281GGh7nRyEeaTHtLfSb1WcVkfZKs=;
        b=YM4htxITqYEj3nl4HrmSdA1IqxwPVTcqert9xBXpfC0XFlG8iTpKlm0Q+Mt0MrpSpl
         YsJz5PiZ/N0yGWxhWODkqvO9DuUIHayyuvxMuznnuX/sY0m5Mo627qks3Ex2Mf8sd/sy
         QRHUqdIV5At9QDuikVtPzAvGImoFzVfDmJ4wi7WIO6Gn+lDTzRxj3y5ZxgakwVfX3a7D
         UabjYqBnqAoOxc5PZkr/VwZ7ji0dXwmJLM4eUxYsuQlXtQiHg2FnGi3kOk+FMvxXOBIh
         NkPt1pn4OCiZXgGf/Kgy0kNIkdqv7LyFb6pV310LZpXmLMYQlZC0NTWjrJwbTGcSvsUF
         rJvg==
X-Gm-Message-State: AOJu0YwicCTGIS92YYFpdpD/5gDisEbkfpRj3Gq6MpaIl5Hi0Zwl7me6
	0rsqkYfzUfbh78AyLmRW5ZWj8Ey+/e5xWhdFv0bjH7wmVScBTR6OKaZzCfI1I6YWO7vFwTjhdh0
	B0BihsrEttg1DA1UJSPRRI8ofpuGozcMSfHZ+qkYAeK58Jqf2GG+CgNPcSLqcOTUyIyfR
X-Gm-Gg: AR+sD10ubTYjIKgTTjzNHrTdFuvT+MOAsTtOhe4DNKXSioZB9ebpGb4sZNWDYgR9Xbn
	MsENFb8IXZXDxxNK6Q/pSYyybvvdqra7n3QcKWgV+3HJjbx3RfOAhFQk+oxALE9JRjWx5K0fsA1
	2HS4Mr1jYqgVq6vMrX90c23pUox4aSllYNAQSGnswhH3aYAdM4L9WQ7t/2hODfJi3ASvy0CQuIF
	a+xlD/AxDtnnNGwWx2yb9MQvj3VZ6wMXGUJakdmCG8mevNEOWVPEJorkHNMB3kPgicvbvh83KwT
	iHmM6KIKtWv9pjE99cOHHfh3UcIRmj0AIXy90zdCB8D2U6M4Z99o5PwW7ObdXfQ3M5/0IisBhrm
	ZSDccxpXcjw492tg=
X-Received: by 2002:a05:6a21:9217:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3c92a598c8fmr9578416637.31.1785756437933;
        Mon, 03 Aug 2026 04:27:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:9217:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3c92a598c8fmr9578371637.31.1785756437457;
        Mon, 03 Aug 2026 04:27:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:27:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:56:34 +0530
Subject: [PATCH RESEND v7 05/10] arm64: dts: qcom: shikra: Add CDSP,
 LPAICP, MPSS remoteproc PAS nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-shikra-dt-m1-v7-5-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
In-Reply-To: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=5353;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=GX7eUKJhnz0wY/ytBwmoxXx40TMd3vY5u1r6Yi60BFM=;
 b=nH3UW47oO2r1Yz1r9KHbVd6quyq+g0waHCXC0/kQch9wyxsU2DMm4A9PhDb2Qm63VPkvxH0vh
 GzgfE5qo8kSDyspWyb/rAzClTxd9GErW04JBHubd5UXvG42GNl7wLqG
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: YmR9NIHWqptGeDqEPLvvRdreYpTjjM17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX33iVzm6l546T
 5frIrrjO50dBsLheaOJ/d6+gvT+s8v6heW/YwSQ9VYIq1/OxV6ARUa2A3TQ33MEy6I79Av2wGYX
 R8GLx1StqLxk2+TicK3xj2Dl/YmdCugQGzn+UgYsVcE8ZHmSCAJtaPPPO7oH1Os341rYC7ZRD9U
 1owiKZ/xozXER5B9AOWUOm08thRgP21Bbb2/pdYu/H5wazX7xgv3zsKY1qYxLyDDHM73s3TX687
 LHaoSe4EzR/yeO+PC9xnJz6Ksptr1T8HolnB9pdokDQM23hEczOD77aIAFX7zym9zlNXyTsz7W0
 A6qTZrV/Tty+jpQadlH+zGVYSlBXTsGYGxY8TLZAdf5RAmNp1cxKquf88zlIc7ZxPumHX2pWRmU
 cQpJCgCCAipGE1XbYVOpNLvXxsCCsPXjPhE4jyVTDzMT9hMJqe46kvLiIleSrNRcrZVCcA2WOBc
 CDDCo31BSXdd0yKX+jA==
X-Proofpoint-ORIG-GUID: YmR9NIHWqptGeDqEPLvvRdreYpTjjM17
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX3i2VuXVCe5hj
 qMsou/K2ka1MxgqNe9UlIUz5XoM3Dj9HYxf3v5zUutUwAu2XYRX2lpJi0AZAyEsrdaNOdoCygms
 2xvzpy0d+8by0Vx24CQQP3vssdM7EcQ=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a707b16 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PL06LPxOd80rETEQ2XQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030102

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 42a17ffc040f..570505c927bb 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1813,6 +1813,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		remoteproc_mpss: remoteproc@6080000 {
+			compatible = "qcom,shikra-mpss-pas";
+			reg = <0x0 0x06080000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING 0>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&mpss_wlan_mem>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 12>;
+				qcom,remote-pid = <1>;
+				label = "mpss";
+			};
+		};
+
+		remoteproc_cdsp: remoteproc@b300000 {
+			compatible = "qcom,shikra-cdsp-pas";
+			reg = <0x0 0x0b300000 0x0 0x100000>;
+
+			interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING 0>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 4>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					label = "cdsp";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0201 0x0000>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0202 0x0000>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0203 0x0000>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0204 0x0000>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0205 0x0000>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0206 0x0000>;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x0209 0x0000>;
+					};
+				};
+			};
+		};
+
+		remoteproc_lpaicp: remoteproc@b800000 {
+			compatible = "qcom,shikra-lpaicp-pas";
+			reg = <0x0 0x0b800000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
+					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
+
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
+
+			qcom,smem-states = <&lmcu_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 9>;
+				qcom,remote-pid = <26>;
+				label = "lpaicp";
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

