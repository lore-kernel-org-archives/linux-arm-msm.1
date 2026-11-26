Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718302;
	b=WyPcoNMWOhn/fOYDEStCpBSMqdtnRhv+2i1oDVxJPYEHQrVFwf+E3+7hcWo/lAqC36iV
	 elPQjb/JUpXNS0sRP3EyvcimQKjzzA29aLfPLg+SToUofNtmHHt6krTVVr78HEKmgPKFK
	 tqNM2rPtpCnMQDCaN5GEnr8XtJWmqs1/C/RcWGz5b8f1q7o2F8qJLhKMaUWLlOw4Uxx9A
	 PhIaU2fYPhgFv7LNWnnSJm1Gbu7S7BzoKYepsAyVaTwNzPevuD4RBqOHbmzWMy0u4DoS4
	 dvHdiGNSUAqH34c7enSNoJW1PPipirGy28gmvFpqTVXclmtrV9m/X5fbn1R+yh9L1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SHsUn0aTWWBo0eohtK1PRk4fIWyn3LhpNOhDPiOgl7I=;
	b=NpA1fG3L68eKCKklqT4KiKnNSu7R2tmZ6SbjYRBttgoPXjxezSZa1Kf4pCawnExqFtJu
	 e1Zh3PWc1h3Nz2M8K47xeMfqJT0Xm+6ekAtGkRSxUp5o0uvlfWczXPB5riZyPrFNqBO7h
	 cEirfvpc5LHCQWowqwRYsz9SH/r5OM5VEU8Fkir3DcTrazgLlmn6H/J3YjnWWEuxN/QtD
	 q9yU+Jnj9x8/zelrLDxmlWFkyQMmtltVntuz8ZrZ+d9G2RKtNTzLbi/ed5oiJN4tIBKKL
	 dOSrVh+DV3oFP+RdW4B5tQ4nxQoxwkjBYmSyzFOvOI4ML9Les96V0WuXKZ6Rrjdrfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxSpMd7x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CnxiPf6q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E47F606A6A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E47F606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxSpMd7x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CnxiPf6q
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu7542835123
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SHsUn0aTWWB
	o0eohtK1PRk4fIWyn3LhpNOhDPiOgl7I=; b=gxSpMd7xOOUubdQAcfiHFP7z1J/
	325j/+8oYEF1W84hFYpkybUL6bkBtNxo5ebc8xo7QZDR19HHpv2oMx2uWAaDWQlS
	1YuoEhbJeSIarpZdeJC4Nh1me3esj7g+PoKjaxJFxZ7Bi3++CDKMc09BaWlAG1FU
	ikdl6dhIkDdeEaf0WNxrsgGQxLpF0UOno3YMUj5laDViWIMuRx1yKHhRKSP9xtL4
	DFJIdfQFmVE+DHV973UlGAwaZjn0TH2P3UUz9Yf+bOX0gGHM0loFImU8Ks0B30l8
	HM6WYf085Fx8a0/60+RVgwywmdm9InEdtUADHKdL9/+3fSSmG1r1JgpGSBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqgsjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-544019b1831so142876021cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718300; x=1796323100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHsUn0aTWWBo0eohtK1PRk4fIWyn3LhpNOhDPiOgl7I=;
        b=CnxiPf6qN4cLSE7s9GKuenKbD4V3yvMMVSRB5Qz/zMpNsrbw3oJh01G1ADdyx/5nJ2
         Vu0ylbVF7T/PjUy3ll5M1P8BvTshaQoLOENdWKC4Zo7KxKUXk0sdo5EQr1uQGRtfaCZr
         HIgiGZv2pvhT0B8cP80ZrguwwBfl/rkQNtGqhqXZGcDe+pZA09WOy10j7H4aIjMuMhyg
         csiSv6MkQikM2TO8y7d8q+FuW52VSs57F/fTm87hJSatC4KiEBvGsfrybCb8BORUYuR1
         Q2YIKhvMWufpXS/S6Uy619nQwtl+/Tucywly3WBXKlsr9nT2Zd4ZBaLE+W7hJKq4ZDkI
         G0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718300; x=1796323100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHsUn0aTWWBo0eohtK1PRk4fIWyn3LhpNOhDPiOgl7I=;
        b=dqjCEWuJbEdu2WF2F9WipzB8g4wYVIDJsMpAH3DgsRW+oIuw86HseqHas6AOyHGBKG
         xQU8XH7azUHYmMTHgHBPcreQXLif3DXCfIYg0rceyJhSZEq0SP3+zkvpqEJ0+M1CMA2U
         sZBwFzh8C3rwGilapBF7D1RZKfGBV4Hx7xNgS93IoEozNa88lM+z0fW6yJwngG4DVQVC
         HCFhePdbdHgSvQRUDcDcNo3GBfPHT85Osw8xe2xFR5wEG/HIO8OlUy3srbF5ywVHwLd0
         nBlcedgDElptRSeHHFTi6cDyf3E8u+2WiMOFPzcPRw/KVbsolXtirF2LV/6TgitgdjY1
         uzcw==
X-Gm-Message-State: APuU4Z8FqbrlpWTvK4XDUva2UCGl0YlP+yzbxmlABZWZsBvBDXu1QULx
	8KadcsmYPCGaBFcu+m8icViguboxXcJr2RqIDNszIpng25tOt+9qR8C61jZ70mG2+ejRRab+m+1
	hBwIwfdJtG+9NpdzBMLZkl3VWIwGlLlCN200T/TdRpgxNnV1aMz/CFfw6ZzMYMnV0wi8w
X-Gm-Gg: AZFdTZfNb5w9jAACJ9A6m/HJ4b5IDW1NIbkCP/KLPeXNzDlScMu3vYSckTVyZFWhdIF
	PBwnp/Z1gvm49Bn/4L1/4mEVNX5bjPYqh3XJ53odxvgI2WoiPelz1oRCVM9pt3yy+86hOkEqBbP
	KW3Z/yrmI4Q+XZAVsmIcVN/u/8cT8q/yJrSRzVRCaV9MMf1Qn+1K76GsOn+ez/lgRMTGq3f7yrY
	i8LCVfFj4c90qhYS49VF3/9U0xGkVEJvNts4rwZTVr8aOYqUJSm8mEG8ZyDR0unkYL1j+lCO9zO
	aDLg3tIL0oDxi2NNIbLm2Q1wPArCuvYxcZ3KrtXojTck26VF7mRVF35BqkSoRQB7o3jG3qGWzT1
	8b/uSre25qUse9cCirlth3KhIOg4t/3QGN327XOJlcjtGf/vCGjLlQfldPTorI3+A
X-Received: by 2002:a05:620a:f04:b0:949:a71b:ec68 with SMTP id af79cd13be357-949ba823b7bmr3934218085a.3.1795718299512;
        Thu, 26 Nov 2026 10:38:19 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:949:a71b:ec68 with SMTP id af79cd13be357-949ba823b7bmr3934214185a.3.1795718299104;
        Thu, 26 Nov 2026 10:38:19 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/7] arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
Date: Thu, 26 Nov 2026 18:38:00 +0000
Message-ID: <20261126183806.172485-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: RWdWYwiSmEq89vDk0aSDSAVrVFEK1D2r
X-Proofpoint-ORIG-GUID: RWdWYwiSmEq89vDk0aSDSAVrVFEK1D2r
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b087c9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=uy-xvz6Cr5JHlQA9vFwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX500zd7x3iMuv
 SHO4ZnzH8WsOwGs56eJ8vp8vi7FhUzzil+zth/wtsD3dG5sijXsMbIxxj15u2og1jVXmBqD3Y8D
 R3JZXRBty8LUpxY8svdczNCrQkS3j78=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX3O86UCpoCG3V
 sS+4pFDx6AD23bSkOlz0RQA6ANUmG7BXXEI6CEnDBZtI96QfM+KwS2aewFvqePgK0r5XhonSLUS
 KB2KuNDk8t4ZvnuDr00Vstp/8vV7dnFH+bVrG8F4BXjb7OeKZ83fsNhMhUi1SUvhMnJRk5J5124
 MRptsbsJHThcXWR5rdBJyi4vgLWFB5ANSuKGBTFnprghFj9A1kQ+4zv192CZLb1uIN/VHyTS3Dp
 kXhsXs9T+ozXpIoaXUye4bLWTjbtLwRlXldcpHM1prOtkM1Wcjv2jJjqP8Hre75OkBoZdANm3+v
 E+5XyVkx1SG+KpUo16gAgwtM79T0rq/avVFJecuNeIE/D082/75AW7MFN5pohVQ5gcRHthZIO8o
 R842pdWbV6TkUFXl3NL0OtqKXjTpd9sUXsHZ+nPx2Gjj4dKqN5S3qFxh8DVrPWqlxsdVenPO0UR
 intBpt4n0i0dmiAcj9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Add the LPASS pieces needed to bring up analog audio on Glymur:
lpass_rxmacro and lpass_txmacro codec nodes, lpass_audiocc and
lpasscc clock controllers for the SoundWire RX/TX CGCR resets, and
the swr1 (RX) and swr2 (TX) SoundWire controllers (disabled by
default).  The swr2 port-shaping arrays describe the WCD9378 slave
topology shared by all Glymur-based laptops.  Boards enable swr1/swr2
and wire the WCD9378 codec on top.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 100 +++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..e3bba14bf36c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
 #include <dt-bindings/clock/qcom,glymur-videocc.h>
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -4669,6 +4670,73 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_rxmacro: codec@6a70000 {
+			compatible = "qcom,glymur-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
+			reg = <0 0x06a70000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@6a80000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0 0x06a80000 0 0x10000>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		lpass_txmacro: codec@6a90000 {
+			compatible = "qcom,glymur-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
+			reg = <0 0x06a90000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@6a94000 {
+			compatible = "qcom,glymur-lpassaudiocc";
+			reg = <0 0x06a94000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lpasscc: clock-controller@7680000 {
+			compatible = "qcom,glymur-lpasscc";
+			reg = <0 0x07680000 0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		swr0: soundwire@6c80000 {
 			compatible = "qcom,soundwire-v3.1.0";
 			reg = <0x0 0x06c80000 0x0 0x10000>;
@@ -4787,6 +4855,38 @@ lpass_vamacro: codec@7660000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr2: soundwire@7630000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0 0x07630000 0 0x10000>;
+			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00 0x03 0x1f 0x1f 0 0 0 0 0 0>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00 0x00 0x00 0x0b 0 0 0 0 0 0>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff 0x00 0x00 0x0b 0 0 0 0 0 0>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x0f 0xff 0xff 0xff 0x0f 0x0f 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x01 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x00 0x01 0xff 0x03 0x02 0x02 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-ch-mask =		/bits/ 8 <0xff 0x01 0xff 0xff 0xff 0x03 0x01 0x03 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		lpass_tlmm: pinctrl@7760000 {
 			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
 			reg = <0x0 0x07760000 0x0 0x20000>;
-- 
2.53.0

