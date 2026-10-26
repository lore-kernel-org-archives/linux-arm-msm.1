Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015104;
	b=4QvvNGTQkG0sOkmARGUOEGGAqj50Ahf5jLk6FYovY8NKQtD85NADnS6SE1f5fwOt2Xbr
	 Nansm+6su2ds32qkhn5kkxAjoxBdSh9UDxW1d8qdBgg7Nr219RlvJm83k3f+tHy0ojtzt
	 fQKxnW2xsZC35GKXvADuYsDTUNPXZcAGnFxdMB6caRNLbDbMMvV88e978mhdHRgpE6kiU
	 AhMoVP9tSUtotgKy+eiqu59cYYhu00L2/OlpIP6kWXrLc1awuFh8uMOwOd4f1Noxc/fgX
	 ZN4DnXzRUPN+ZzyplKJG0+D3cG7wc950ahYeT2Jf4ECMKXQOjxT1eYSjolfUb402L6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZAF9uxrJdgXMQIPtYox1qnLFPHrNdYWSb2lkp636Cbg=;
	b=RI+avEJnU2cyZy7PrcP8a9dszyYJwH9dFLeRj9E7QPItDS2HCVF2SEbt8Acz1SWhN2sg
	 c8mnFaed024OEgHXtAyGLda/RxEmBnIyA6fClEl0CS0an0Q7pGLGQX2VPEXJpKiEIW8sA
	 1MgllYoHkhC9freaovHMFMF9aD9AVpeRtRHh5e0hLWSILB8oJexFaunthzS/UioBhgeII
	 k9eVkSe8uk5CEYL0L7++iZ0WIU1D1hQlk4oFIiFn4HHweOM6fS/xBY1cDaZQkx4068J/o
	 lljJlgwrXyxlTGhH324J4W2CbxTJ0pxoT0mDEyy5Zx54aM3bSLUg72ZOf45QwbgZflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wwh9QgAl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnhdvwV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49244606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49244606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wwh9QgAl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnhdvwV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0172732751
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAF9uxrJdgXMQIPtYox1qnLFPHrNdYWSb2lkp636Cbg=; b=Wwh9QgAlV7OK+lpz
	y9Xu6eK7uZqP6qchjqNVs3WZKvLgV/76uA61VHt4ycw7kNW0syadJ5UMUump5ZZy
	yEqWOfhEdNyd2ocklgdP4PUKrn2sso9JosnMFZ9gSCk4QMxkxNWPmf1eN4/J+UEQ
	5ylmO/K1ke5S9dnjH8jL8exNM4GiDYK+6GSaHkOT66IN+lbJwfFE2yYmtcm6F3ET
	Wkqo0rBIPn7BAIKU7B/ZQUnRUqnFH2b8KEFtybIaHea9vsQXcZKy/8E7MRkKAePu
	p0waL2BoxfruMPpXVwqB+Wt//KKQuspMbJS00SPDDs7KdFl4egxYCDj8mnW+0xXu
	A29qeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8f37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:45:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so2913959a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015102; x=1793619902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAF9uxrJdgXMQIPtYox1qnLFPHrNdYWSb2lkp636Cbg=;
        b=TJnhdvwVCOf/M+0sYu4mZ0xf0gwJcK+cwbR+mSlvevqyXny2KM7Oz94PZZsG1wrjdQ
         vSJcVuJWZKTZUvo0CLlfulhiqHR06E2SfonRmUHX2djFn0e+55YrUJ/Kliky61dhCaH2
         yy6slNFJIIe6nH3kyZew8UwHuqBnXQ+FyJZ1jxdBckhF1QGVOeQO+8qn+BS0f037Asxz
         8TaTSMP9tPzrDZVgKKOkJ8fnoK81TJL+KOFzGEp2c51vR60B4O+tpFKIVEUKS9nOSBbB
         BhxuNmGSb0UJygXcucDd+ZpTLJXpSwzolsEzqzOMSGVi26s4MgZtu/g9wXLG9ruV2xaY
         r/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015102; x=1793619902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAF9uxrJdgXMQIPtYox1qnLFPHrNdYWSb2lkp636Cbg=;
        b=TTrPnqUpbY8A0pfdcD4mlmYV3/PGBNkrqN7m7fpiRgbiRPTo7PaXP0apSQpTvXyAKE
         mylQTHhPW2V4Foad2NgNCaL2sWAaStkmYt6CLFc6a+K9BGAFY+hGoBSpl0dOOncXOYpq
         nQeZNalWY5fCmyChV9/GuETEzCXqepjjCr6t3GxZ25UXh69JSQr4cmuvFcpOIUeqkVP+
         OinYzJ11Hy+RUHq3/QdpWOcneataTqSWGklq1NSXdEKh/dJU2w6k0MrJkY+auIQHLqml
         WtrG2RmovEGGw9ofcVL0XpIWo4hljqi64LeGtbqZtxgU+UyiGw7Emd6K9C7DIWeHI34l
         LYWg==
X-Forwarded-Encrypted: i=1; AKwUvBxcbo01R592vLvSIVR5R49TJ7ZaknZBtexF78JiVM8aPYdfxvJ1RznCP9A7tktJpzhYK+r74QtiBi3K7CAx@vger.kernel.org
X-Gm-Message-State: AFq9FYKxmAHm9yEUPOHRPXe56/fWT+AyWsIGLhRfPy7mKT4/mBA+8/gH
	wPsm6TayO21lC747TwCNx8YlX0U6vOzGEPTmaaNwDvVQnyMP2ag/0S5T+g1K72YKvEoXI5SaxdP
	RSYCeondUinW0aVBiJsR+/wn7vnUucYq2NIBu4OqmMLQzmWxnK5HQA3RrRK6sz/+CTLyl
X-Gm-Gg: AYBFou0+7sStraVNvQDIhesXC5fZCo8cZYOQzNN7fFP2jj5W835OjOQyYu7dnDSWaf3
	3fY+R94ZmCCCZV7JI/PXNiFNPbnh60Yrr1eTolYAXzVVR1BdFi28heZbS9ShwHfkofyRcfmEtFo
	qHkixKVkJ+0iCjWvhjS72eIjcpHEP+VZaiT+yoG5Z1kpEFXBx1LVTjmXv4x2ZOP0J1XUZgbezab
	2LKjFNRxRxIC2mzhCtxU6QUOxcRUs3/xw9QXPrbr+arD775Z/QeOcet6cwLS2d9ATh//nppofYU
	OK4eesclydjQ8CmEWp8hQWVg2sugPQuMmHWOAnTK2S4G+DGHQR6WmaMmeOWW8ZGj6Y5JrojjKOU
	rzZXHlpU4Rg3CBD6L4RH9LQlkAIBZ3JQCjJI=
X-Received: by 2002:a17:90b:4fc9:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3adeb0fb875mr4997797a91.40.1793015102083;
        Mon, 26 Oct 2026 04:45:02 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc9:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3adeb0fb875mr4997763a91.40.1793015101346;
        Mon, 26 Oct 2026 04:45:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:01 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:31 +0530
Subject: [PATCH v4 v4 3/7] arm64: dts: qcom: shikra: Add soundwire and
 macro nodes
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-3-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=5498;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=58Tj0Ycl7vKxEl+OiHQY4tbzXcRQxQwdd+T15JQr414=;
 b=8YL30zabkUPBog0iVlzvs/MUs/0c6grCNE2JujspA4iJYvSVrg6TPimKrWrctzPgNB0nhW53r
 E+l0o1jbhoeBXUTa5mCnGJ/Yf1paCEUPW+kH4LIWbQwX2tRtS0sU/t4
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX+RmGrsvBRHFg
 IyLJfv4ZtIF4YwFiHkiSFOGe/lKApKhs+00TpE/Dh6nhlX9oUs3tZAbkNTQ4SlyY+cPOQ0GUOw2
 p3DzdbWm+zj0zKA2VYi4ganq1rTu5S2JX5C9DO46LXjitfWrzV8rYaaoxGjMSXNfpe824a5aq5x
 byULWyx5aVSuX/vzI3D/0nlrU6L6EgLsqXPehCNi/0ObSPi9wnN/WbH2bc4z+XuH8FmaoaegY/c
 ZUd2V/W0hazwLkWYYA+ONjLdEEm4rOg0/5AKmsE4PRVBiAIX2WigwOx3bGY9ifWCiL59IjadXIP
 IQbn2GnfIeHtpnEuVuwWK73FgyaJ2+2k/BFe+xyZWnQICJ+cB8mhGtkfQztj1Tq8DJlTMZH23KG
 Scxlxe7DZDaqLnKwClDtSMbi1ngUVSqpZ7kZR2eROsSROIp/yQOC8IhNA691Che/PwxF7MXzsa2
 /spvLmvx89abnGIfiMw==
X-Proofpoint-GUID: PrmapAJTi-_aJrQtQe_MnJdDZBSrYND0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX9oEV+23NT2m6
 ssv5wD1iCMvoc0qwcrgd5abT4grJ8Gn4kHIPW8zKqgcprASlIijsmAVJLQ69Eu2RbNpM3NoCV6f
 2tXV1b0rhlrU1hRyxvQyx9ylXkrTsf0=
X-Proofpoint-ORIG-GUID: PrmapAJTi-_aJrQtQe_MnJdDZBSrYND0
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf3d3f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SBFx_aHcOOkmsUdThYYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260046

Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
DMIC and SWR pinctrl states required by the audio data path.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 172 +++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 67ad6c3e34db..f234dcdb9785 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1060,6 +1060,70 @@ sdc2_card_det_n: sd-card-det-n-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio96";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio97";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio98";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio99";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio105";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio106";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio107";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio108", "gpio109";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		pmu@c91000 {
@@ -4089,6 +4153,114 @@ qaif_cpu: audio@a000000 {
 			status = "disabled";
 		};
 
+		rxmacro: codec@a040000 {
+			compatible = "qcom,shikra-lpass-rx-macro";
+			reg = <0x0 0x0a040000 0x0 0x1000>;
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr0: soundwire@a060000 {
+			compatible = "qcom,shikra-soundwire";
+			reg = <0x0 0x0a060000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			resets = <&audiocore_csr AUDIO_CORE_CSR_RX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		vamacro: codec@a078000 {
+			compatible = "qcom,shikra-lpass-va-macro";
+			reg = <0x0 0x0a078000 0x0 0x2000>;
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_TX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_TX_MCLK_2X_CLK>;
+			clock-names = "mclk",
+				      "npl";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr1: soundwire@a080000 {
+			compatible = "qcom,shikra-soundwire";
+			reg = <0x0 0x0a080000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "core", "wakeup";
+
+			clocks = <&vamacro>;
+			clock-names = "iface";
+			label = "VA_TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			resets = <&audiocore_csr AUDIO_CORE_CSR_TX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
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

