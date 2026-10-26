Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015096;
	b=UL29dnvEMyQrp84QWEt2ZL4SJVKsHuaO5aamLfow1AEgpYdDXmqDtzzFlPyIR3vchRoO
	 tESLNS+GaSSAiJ/6GcnfiDQR6PJxkTDZzHxF58Q6XGCW+fz3Yk0tdt+PECeb7Y6kJlV2R
	 3NM/VRb0vF+8DWuniI7xLoTPTlbEMqHA+ru4JHZ035E+F54FpX9JJh3prKZJ3JMq1YKPD
	 504GAL/S41NtQv7+QsXspbdYfrTuSrcIgA3eLWlig3lJ8wfBBAwu+J/ivSyjfGyIonQXi
	 IjopzpNDAMWkIsrGfbpS4EZ0MVTqAIGmlom4veWHMv4dq6OA1gLsYrTSBWbkrxQClnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P0WukiBFc+997912KIZRVZRCW9zlZNCxWq+WKVUNL4A=;
	b=aQc9wx+CDOk1xFdL9c1zxvpN367xp+OdB/U15oIr/fIRpAJQmMk+dNEGKfKxx7U2n8kg
	 IicmhO7pRJQJUOF4Gnq6dKvUHKybO38nBn/XGxDC1Daj7J6Hnp7PceEy7TQ8hd4kQoI1W
	 qnb/EvisakthDgTcMLPXsvDWa8BZ+lZOdUHPvgGlTi9Vx5JS7cTo5oJgLUdVcrp11Xc8G
	 d6AhrSioEdjiMNJ15I5m+qpmY/cHPqjjFtbgm3gdrGr/kR17mvFb5i+lkUk9SkIqXYqna
	 1p+jZxeOi4Id9XcfqvfnJSzpfKCFRXTOMmfOIoEMMht/Z17gyVaAF+7Z+nbLN6ridAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBApRwkq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9dLb0j1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89632606A338
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89632606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBApRwkq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9dLb0j1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtFjx4126973
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0WukiBFc+997912KIZRVZRCW9zlZNCxWq+WKVUNL4A=; b=IBApRwkqT4K67zzT
	DgcRsuLsVmZ3P8kMYsUy3XW3a/zG6fIR1zwDsLvEDQTaNrJjdAEDupClZA6VpGpn
	2zimHEwEGTLRuiMsMZF7C0NxU0skm6Rij51dDQT4yNCml2hNXXMRU+mOAIjJaiPr
	s/CBRrUSVQHgrXH9WJFSeutPhn/8TkyA8jNGnrYn+QsrmhNMIEA3rOCi3qPAblk0
	98yKVQGym5UTkPqNgpVWWbTjIX5m+r3nflqjDpNHdBxC7a/Mraje8pf6q4UXZdBz
	4mWzA+kOj41BYJ6ThYljjsr9Otrp1poGfF1o5YJrrovey7PiQ/CjZtSbzR+98sEB
	f/BF8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt7bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:44:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2574788a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015094; x=1793619894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0WukiBFc+997912KIZRVZRCW9zlZNCxWq+WKVUNL4A=;
        b=C9dLb0j1J1ZJ+G++6upw5iXdmw+V4HXNmfJKDL0zrpNqn1bf2d844H7cUgM6K0A6ZO
         FC3/9yNHzb0rK/ETpnD4VsQAukt3fpwcKlu8Kp+LLt9fxHQa6R/Lr4MN3eG6vul8hrFl
         QLGHKfauepqeueHBnswYw6fLGKGH4VkTH5GJueFwpC5ejZUhPDYC53zVt5W+PWDJL5+F
         DcB4WABeDFdLwT9VHZaRf2tbFkW4VIBRBRIdlaatApn0SCjDg8lJnJ9tNNW0Abdq18N5
         s/JVTpTDOLYew4hrb08HhSk30xX4WlJSWt9nE/rNGI+AWK2ahZj5bGIK2cKCadoPagsW
         rfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015094; x=1793619894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0WukiBFc+997912KIZRVZRCW9zlZNCxWq+WKVUNL4A=;
        b=Xnas4KM5YgqKcMKV88wuuNsKiRtbOPy0Zqw9z4DeRoEgKfZFECPKJdzwIG+vHlgT+O
         5zoSI0TX4J9dtihrIUlhRhARssBp+Hegp7LUt69nQGZtlXq9iVAEN7lxDvwHAZLKbGjv
         8KQ3Ts179JLk1Gblh6pz53XVrzb9xCcfRr8nFNRlOMBBvWgCovVNysIaB3fa1s71Q9g6
         uNXczoAL1iLe9cPb5KX/T/xVpwPrIM1NfBf27wcbNYxLMbXBuHdbjFLRS3Tv/KXIvPdM
         6+QFLOcFH3PiKGbnHlHFDaqzHDY49xCEtvf6TLBKxSXvtQ8MlchheSjCiWaOlX79vEQj
         9nEw==
X-Forwarded-Encrypted: i=1; AKwUvBxKUvNq0NCv6MSqTZNUfbmTVJ06glKRGJ5bk0T6NoaqV5GVZQ9vftobWqfoYDK7L3zJ59x1fhAf8k4p6EiK@vger.kernel.org
X-Gm-Message-State: AFq9FYLu+Dzb4rVi5Fltc1VX7X4g0bJ2U8TTAcA63Z8/+4t5wgCOJx6n
	pBEmCT2Qng45t58PgbQR32qgFdjcgxzDm7IdXcZfr/29udgYUVIt7szgCPSI8/nYzH/h3n4Z7g+
	tTQBRNBpysB2Z1+BVkseVrpI5tV71+IWhO7Twy2lrMenQ+kUanoU9sj6TNc9cxorGcVTm
X-Gm-Gg: AYBFou3sehLU5324/tgsS89tjupvIyz4xAwyrRTFGtnsjkj3SNwd99f9YQCD5jTBIV1
	xj8fb7mNaOFVHE8MQmT1fcZeg/Y1Zbfws9rnTxcGUn6x1SIE3UeCNv3SQdCz2DG3/p8JwrbiKYQ
	I5L0I1YdwjCE39uMO0IZ4RVrWLqvfYDbwa9Z4zWVLSKlMsuDTXv3iBlq51OMu3o0W7lfwEuu/rx
	8xoH3/jek2JWI3AA7EPoA7jo5jnmmh5+bLqIInRunX8N7I32o9aqYt7ZdY1kha090/i6Sp/JPtd
	z3RYMddgdbcmTrEwJypIxeZLcTt6mZP2vwLDpubw3kf3AJKyXS94UXdPMZAqhL60KwFTRZqo7Dy
	9o6ED8sTvxWLYpIPLQxm9Ur5pxKQaDhOMmew=
X-Received: by 2002:a17:90b:1804:b0:3ab:4e4:e979 with SMTP id 98e67ed59e1d1-3adead4fb3cmr5111260a91.36.1793015094203;
        Mon, 26 Oct 2026 04:44:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1804:b0:3ab:4e4:e979 with SMTP id 98e67ed59e1d1-3adead4fb3cmr5111229a91.36.1793015093572;
        Mon, 26 Oct 2026 04:44:53 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:44:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:29 +0530
Subject: [PATCH v4 v4 1/7] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-1-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=2341;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=tpB+61RQfNBAVuGYPmC8P8m57QRl8CwOCNsOem43oOw=;
 b=dAGQOkxE43L8l/yjArucWSJ/boK2tpuFw/uw+pt0Ee+16Rx+LaxEDIFjgyaDJDiRQBR/6tSm1
 jLTCfdS/CmtBSU32B9W9uTMUnWFfPxit6qyDsj8LjW3yi9RCRMhbl6e
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX07zHhG1VBhId
 iF693wmUGDcwn+3Neozpb/OuFVp0MrZqTwCO75pxXxWAgbbQUBA5a2Io1Li0lXhexBhw7GzygQx
 +h+gNGrqiU7k71sE/E1Kouw+Mb90fvg=
X-Proofpoint-GUID: Z1XaUMPLLPr9dJG_deXwJfsSSgMrhCJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX20OslS8TPfNL
 W8LzGu4AicJW5MjL6EpbQHe9mEOSAGlg7KAss8Cjbtn4BuhguPG2PJvCfh7brTDN+VTQYJNsu2Y
 u6V092fjRzaql4iybv+fsKXPa47qdpbbYvuIlg31uw/RmLhMbTE2Tgj10sN69Z6cEpVQ8s4lMJ1
 XdzpVuHihVGTgehr2X6//1/s2hV1Gcj4C+9ZZqVjgQQZF2rT/uhibw2dF3QkMLZuLUcsABjZwvC
 v60jOkDDuO5aQandGTBgmFep8mcBcwrx+qMwWggDKewtU99wjt12rdF1C8F3+W1ZlK5SQTYRJV+
 ZCLxw7wZTnVeEV7c4AyWt2TBXqqsi9fGrKLmzEFrl9CNJAThl6h1iGvMayBZUWheAlpA862OcE1
 ZvPLfiBDRoghNODmGxk45ssci+6YQGHDo0y3G/GViYwYyCHm2VCFnKsFG+pxFtyM8dO/sHGjddU
 /X+4sp9h01w0cX84uFg==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf3d36 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SNQ4sQprfOKLKwPE6BEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Z1XaUMPLLPr9dJG_deXwJfsSSgMrhCJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..c010dd7b92cf 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -4007,6 +4008,40 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>;
+			clock-names = "lpass_config",
+				      "lpass_core_axim",
+				      "aud_dma",
+				      "aud_dma_mem",
+				      "bus",
+				      "aif_if0_ibit",
+				      "aif_if1_ibit",
+				      "aif_if2_ibit",
+				      "aif_if3_ibit";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;

-- 
2.34.1

