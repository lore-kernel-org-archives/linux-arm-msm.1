Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672FF3C1418
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609873; cv=none; b=L7JQBHu2ryW5Iz0CLfVuI6TgSvCLYKda75/yfvTtf1x1OrlqQhpjtbUPQ0e4U8x+rUIctUx12rELMHjpEpYeDHHU7J+03SUP2JlndiuW2sUArnmRUhcxD/yd+3JGKPD4LNnao1c4eBQ9j1tXwrpbvVswiQzMPr4oYk0Z/9W83rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609873; c=relaxed/simple;
	bh=azm1lTSFmx8nsnd4oPySJJpnuLoKg21hqi5VNB3W5Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFigdds3Q/QIL7inXfpgYnZlloHjEVEwlWF8miAExyki9/AliFpk2kNIntQH7sKjUtGyhRasEULb+0LO0ajP8SmhKL1WiYERgzDCVsgOqMkvMt5cnWij6C0n/qa2KuCSOIcNA7cDIAfM5KiO3NTEnsYN6ztCjpz0fUj+wmiz2Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UX+DR1nV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adAYsniU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UX+DR1nV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adAYsniU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDZUp4151725
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxPt1Wh8d82lHdYQc6PKu2MyuydT2NB5IlvUbNP7ikU=; b=UX+DR1nVwpd2yHIw
	2RqyMlIYsUtHi/nCFEGtXznjrSkACHCWJuXT4eM+RhAWPHDlBGLzkLqstKhteB0c
	tlZUF4BH+nKckhSpQrpCyf8GP9zDTK8PtBML8cfPzbYJQjZlDnwHuc3DAz1XOGBn
	234qn7jd13UpKfOU2fdXAQ1AsCnj2vwM7/QVy0d41jNuvoABA/Lvgue+qy0YnqQF
	yJeNhkKFzlDMeSW3Aac5Z0tQ8PhoevlNaiO3ctz0OiE9tCux3tUtUQM67f+FWkJj
	QOIt4pSxSZuP6ZFhcsFPLsF92pqB5a8U/Uv4OxLw3KWDUiNftySe+CoGWnMgp3LG
	oN4Huw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff2hpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso7319151a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609870; x=1785214670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxPt1Wh8d82lHdYQc6PKu2MyuydT2NB5IlvUbNP7ikU=;
        b=adAYsniUfsy2tp3tAmdLlFjT69eCnpJEa7fiJQXpDtQU1KfGzCwc9aPhhP0dZv+yUM
         AEY40RBioqlHYydjK/ayZJ/322RBW/GDPnIavnckaoVOK1oe0kBjdyptarpZvefXH3g/
         pQEAtldcWvcoy1ycoZIEqrTJj6fKKOz8V8rGJds+VhUeWd/HBfbvM0EvbkOnTey5nBzF
         o0PgNCrHxMWaIxMlhLGCGP9WYR5AvTkZ1hiUkRTlUdT2Kya3tqozhaRe772NixDozxR/
         7aSa4t06EbTXyPcc0+FyhQGMNtx9q2Jck35UwB/OUAyBmsl55PWwHZxnACOUbGaXCxZg
         lWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609870; x=1785214670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxPt1Wh8d82lHdYQc6PKu2MyuydT2NB5IlvUbNP7ikU=;
        b=SZfU89IuYHQ7ftc66Rs+gYjuT1T79hqZojRraq/gQsd51qeOH35T9wMsVixG8ntZVv
         1I+3O4VrKXzq5ocRV5Ucw+zPUetfyAhGBD1tNLyIiIhOyXGeNmR9xHvqSigHzNiWgK64
         69urtlVDw00ASjtOj7r9uJ77QqAKSHl4Zknz/XIYVGCM20sZn26TmDXM09VLfxO8ahlV
         9zMOp8iJcKBXofxeZc1M1hRpGEh5/J/rOpkGKfHWp0DdrKY7TJthgTb0Alu4BWER1L8/
         95cHnlehMzOAfy7GTk3FTDrZLqSpkwCbvJXUnYIUB+XjSreyys0GUvuvhsSYcHYK6NNc
         lrXQ==
X-Gm-Message-State: AOJu0YwQPST9KyWX1BL93yPjM1koRalZBhqPHfbjVBtFVMWWVE6HeLY4
	vnL9Lp3VKjlX4gKJLdB6myjfn39oszMmRr8jdJ7m4i03dzEj7+EmGs2Iysuz1EUXw8AZWMcua1q
	+Jx0oaIiHbveHoZj7yUzrKSq+O/mu7fuqK9Pqz3lAZmKWI0kjvaIcNJJ8E2fBERZ6EVOW
X-Gm-Gg: AfdE7cmsV5SOQQJLJRAB+o7HzdzmWJMaklK4y8csh08dwZAZuCEWRUhfdrYZYJ/yj8v
	K96aebk8rngZZWjMXl0wDd48BjRf0WNF/GjA6jerUaKnzDRN8wCq3kzZkfyHkJ77vkgt1HT8RtU
	wZzj88c28fqRojV3pjy3vDJjBw90K2+TRJWJZRmm3J4odl1pcUutpPrU2alFWwYAsT6fJx9wNqp
	ZiumqgHCi19ftUsYgdbK+jYqM5hWPcZASpyTh3GRSmQem9Lsy19CO+OVkd4/mcXnvSaJJCwH8Pa
	9pStdEXgB0Wwod3xfuU5ksn1IXX25jA3lyrERQWrv/4IyyZKVCXWykyc55cVKfItKHAQIdB6xhJ
	UgokebnxcMbVYfzMCCRcSubz8jESZtoC/iGqUM+y0+3fH6FxsjlEXHFY=
X-Received: by 2002:a05:6a21:478c:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3c3ad66b538mr19625920637.5.1784609870209;
        Mon, 20 Jul 2026 21:57:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:478c:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3c3ad66b538mr19625896637.5.1784609869631;
        Mon, 20 Jul 2026 21:57:49 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm42110862eec.24.2026.07.20.21.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:57:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:57:37 -0700
Subject: [PATCH v2 4/4] arm64: dts: qcom: kaanapali-mtp: Add s5kjn5 image
 sensor on CSIPHY2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com>
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
In-Reply-To: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX1+LlbusQITy0
 KCOt3gsGjvXP92sgURiYJSafojs8rbBaY8TcAMDd0trN1Wv/Pg/A/g/cbzlVt2xRg2rsNEfh7Hn
 PZ8mcA87vo8YRkYACEqrT30fQhFhliU=
X-Proofpoint-GUID: aCqEW6VPnmJkzzcxCKjldSoVwNo34t-L
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5efc4f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=G-BVbWbnyFpE7frZav0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX0hOYvVd2PfWZ
 7/V8wMWP/Re0UF4N/RgLtxzp3RYSkMstm6sEIz1xuPWe7dk3NiGuxX4+dLmzoeNPNrh9+YGCOsv
 vukTHUj9JmIefUldG7thtzk/C4N9YZEztefs9y6FTqagqo1BdrH8ZwuU3+VKchO20u7sKciBn+b
 Khqge+wRsPSwZTe5K+i0IrAMYpvaUlBW5iMMOlOR+zBamxYSTYVuNpHEvxoQAKSufu6160T6sC3
 vnIBYSdh2NeQHVr5LIPvqBOk83q0zJyKoDvFhcBVlQPS+fcC4hMnHhG974ZIVfxLos+p6dnd1aB
 FtAMpENpZWuMLeRKKaktWlq9eih11bbSsaaR0g9CLbvwW+wTlbqZweinOJQUorP9bDjA6FgAYJh
 pteQ+g79J5FsnkiFrgy0WYfmcB02jaxVCU4NLxeCfZhUh6kZnRpK//5uESahYvaTZywsCIBFpi9
 xmzgyPy1qEW9b32xXXg==
X-Proofpoint-ORIG-GUID: aCqEW6VPnmJkzzcxCKjldSoVwNo34t-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210048

Enable the S5KJN5 image sensor which connected to cci0_i2c1 on Kaanapali
MTP. The sensor appears on CCI pins connected to the CSIPHY2 interface
in four lane mode.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 90 ++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 7ccff3d03b78..9d68058f8962 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1235,6 +1235,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam2_reset: cam2-reset-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";
@@ -1335,6 +1342,89 @@ wcd_default: wcd-reset-n-active-state {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default &cam2_reset>;
+		pinctrl-names = "default";
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l2n_1p2>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vdda2-supply = <&vreg_l4n_1p8>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_ep: endpoint {
+				link-frequencies = /bits/ 64 <1248000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy3
+		 * port4 => csiphy4
+		 * port5 => csiphy5
+		 */
+		port@2 {
+			camss_csiphy2_inep: endpoint@0 {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy2_out_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csiphy2_in_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				clock-lanes = <7>;
+				remote-endpoint = <&s5kjn5_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy2_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy2_inep>;
+			};
+		};
+	};
+};
+
 &uart7 {
 	status = "okay";
 };

-- 
2.34.1

