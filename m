Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF42385D73
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754011; cv=none; b=pZhRBSDL1+4sLckI/icSFBqLOknbHHyS/pbx8uOjAevsZar/KcvUZa9e0lSQGdYI0tku/b24RaVUjlz25wCsvlq0JDsBAVrOXlXp6sma7GgA6uIFBcaPKsfL0qtkAvA2lRQYv8N4BjMqREzpOfARmqP5rg3L63jtmZYyhZ9IZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754011; c=relaxed/simple;
	bh=RzZzUoksTyLUaZ3HmTPqKhP1G5gdxixi1IK+pyJmlYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoxAmnEtEXox7mJEhRMSJu3zujGRoLr4VhcfjPMdnvdLmsMoiSCH4GalcQkwAvwgNhF5/neX7Rh931DFkxpbgMxWVJoWY0d7aEE66dL04MTRQa8gQWV2W/iUMNmEMdTDXCiPBTvVqa2cvrAtJp0I920dZKR1MqN0ce0wK+rFLOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X42fcuKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bmi6K3Vp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X42fcuKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bmi6K3Vp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736oTBj3960472
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=; b=X42fcuKoMVHItCkJ
	xEZ4XWjq3qW6uAC7zC5hzcx9/K58gvGEVbFFwayE3H9EQ35eloso+8J5xFhqvCH1
	OgEsguML8Zldmv79mec9HGGU1Fow1DCUQzEIdzvu1Zie2GZK4NVnXzyjimoq5IV+
	utX+Im/oXQhYuZmTG0sFD1W/soZ0p13C7WJQxMYEJJfZJvenr4hP0zOeb4oXymRr
	dsvNAh3bOqkt7+yzhU3Ng8ozieoeySMCGrRkEXSDgcuXPjJjtn0PrVGPs2u6JUYb
	q4/nPso/ZOoRbWMX5T20AoCJmMhksCLUHNwiLVlpC2NXbMPJfVLkahLebkrjqD20
	GFz8iQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajses-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:46:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so4268245a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754007; x=1786358807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=;
        b=Bmi6K3VplQkt5eNtse9y8RI17HO10bIBM+XyweVC/yk8logtJaLLMbPuC1b+DIG8Ia
         uJz2rDAqZJDWpduZrerG62ar23oTNFltRhT9LEIMtA1Tkw24mSt3LcvaXSlE89/A9CmN
         ELo4M/ewQiL9B06JcWthGDAu03N2KMQvZ6tnHsK0/D3RbJqu6IAuCvNTnDT0X2SISbeW
         vtaPp8cbOthyRDwNrgl7nyLDozDMMs3lhx0PRBjBdyI7wyhNwNguwO/K77jz0DN3can7
         L8CA0ToVcjXGl9ofiUvK78OG4U5c/n4dhR+CnD+BkmZ/Mxrj6qHcicKL30fjdr3gdCUL
         43qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754007; x=1786358807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=;
        b=Ryvy7j2xk1k4OP2ruMWLczb+/OODsA+X4NUB9OFpTrBDieozO8shJt8cEGCO34l/rZ
         ryBeY2cS4cg1S0q9+2EU5PkiC7ISSsyQBCusuhoPX0zVX/cbvT37HrcCWIc20irNlWij
         6rdnXHmf9zkA9jJrPgyIdEzZo82qB1eHAHREKdAR3oO3HLqT01MPNBAcNEp5qLZQaYq6
         tXEFCbIpkDwokU9i0stUoBRs4xKAFoDuJIk7kKlcH+/GETqJyKIKs9vMCgup64xrEn/t
         qzU+pQWmEvO1IrYh2NbuSilET43WZI5S/JPeVePW1bg8v56bsxA1Ubo0PzN0vQm6w0IC
         NDbg==
X-Gm-Message-State: AOJu0Yyrg1IiIb8npPCNIFXfvzWmVjoGi8Sz4M/3yu2nT4qVR5ZXf//g
	mld90dlW+oY1m4G0bTMMBYF85XyLKqnXx3UaagHqwZKwMHullJ186Tccx0vq9C3fU3dwe7HY/Mw
	fg6LMnwIUTaWr2UxVdJdC+ml0Bm7L3qcWE5L2u/bPoJDiyYcYUBx6DRNigokRKG5XBcjN
X-Gm-Gg: AR+sD11ki86K0K2QWLT67EqbQdrQjK669KoEwwTSpF+kPCXzZsTOVMUjeo93F5jpgPN
	wQeqTGPWyRm/T0UWs2xaTdMXTRyj8qRJCi7NmdqQuCxJtJ0r4h2Mg1fUTlX008UdnieZQaXz6kE
	hMXlHSUdXVc8+QRW4pwzlJr70WxmPbu5ye35q7U3AoGvjTw/0ymQP+SOvU9Cz0vI0kirlJeYDqa
	VCAOVDf0CgmhTemTOac8i3jGMUN2TQDhdoA82cbsFEmnVhlM4uSRKgPM1CGQfBbsSkczOYTFVKK
	jwaOXJ4OA0yJAbVB00CuGQIxvJCe1UChkNkqST6AcuiI9FmhOEaS82creWcviaey3DmppN5jDKM
	uB0pdZy0HwzchVMcxfy+w4wGrf7aeQazK9SztoWboxGd4QkU97UaNSgXdQl4J7tx8lgymCj810C
	p1WhjEYngqoVzp3wsAQaz2YSx4HeFamg==
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr9306677637.50.1785754006399;
        Mon, 03 Aug 2026 03:46:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr9306648637.50.1785754005965;
        Mon, 03 Aug 2026 03:46:45 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:45 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:10 +0530
Subject: [PATCH v14 4/9] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-4-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a707197 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: D83yEVHom1AL0P-bGf_t4nt9QHPamwgs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX4XR8upbQibn1
 j4fJE5DXvKAEG+Yc0rfyv4nDxXV1gXPDgzg6iaSU5PCQsezqO/nwlysHORKyTNUy4nhVUrWG927
 iSLUXPXv5y8CWUFmGsQ6cfEPtDj5ltE=
X-Proofpoint-ORIG-GUID: D83yEVHom1AL0P-bGf_t4nt9QHPamwgs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX/Ev1F1Ax9MdR
 Q5tnT5hb7jOSUqjCijct+Xtpnv6eMAVVxbie0eh/uqVBf5DTaF/uCfyTr7pKPVAg2elonmf95pw
 H248WeM+AEdPeW4HlWHwAdiPY1dEuoMSpI/vjpu5L+gS/4X0D6XlUBem7gNC1wVNbCKmkieSF0d
 bNwiMstTuoQZatZDC91GfyG4Zp0N1IrX0UZqKr3BvQQhywEHSlJTeQghRwA3BvQcu7m8QWEQRBe
 zPZNhqdvmcq5f+ECXgDXTL+ZiQ7DUelOa6wk9lA7ffpkVwv6z4P0QUo+X/GM1SsS/Lup6wOfP/U
 TcpMINw6thfF2VkvuxEPaMZ0dzMAJ0j240c/fO9Xcl8YMQH63NiW33EbqVwTJWJXff4cj0ibfnB
 XMMd8DFyND4qdHXk888R8DzsDYaiwqieg+/bGFR3dqg8Upnw6A+upM5g3ZKwtgN6aMyqg9WCwCw
 nM0D83ojzZVW2af7qkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 66 +++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..82af532bff38 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -734,6 +763,43 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,

-- 
2.34.1

