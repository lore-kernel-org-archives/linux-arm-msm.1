Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6EF386C31
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754015; cv=none; b=JnrS30eGx7yqg9DyhBOFIgrKQfuKWWvosnNSlul5ZD4JWjZnduRAsQ/JJavNbGijR7Xgc414fzXppzprUM/fDMTFHd3bTAwfXIyeuD6LLrMbIHm6fOUKk+fOlL/2LJyKpz1OCLbPDCtMQBNcqxnpuB9gWQjha5iYBizutKR3Tek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754015; c=relaxed/simple;
	bh=XCvaMn/BiBzti0wPpaL73Jx30FbdaxydfZr55+KLm90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGhpmcIQvVk//u6ob9uJAYZ+ExY+ml50/N+e5K81YpRRSgY0BcwwU2mjZ49FlQWlN8VX4OUxCDEarvFPXpPs6P8Pa4SvPdgc7MdgholkNYlKCJ1qIDG9LM4XIPUzml9xThj9hyCSyxtF7vsmJGEtBtTJ1dNihfPY9f50TjiV/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWCBUlW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ps6F/7Yl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWCBUlW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ps6F/7Yl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736kqSJ4123749
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMassRYYwmWKjJ9TG9ty96NoXco+IZPC6jouhE5M+mc=; b=HWCBUlW0Cov2Zv1j
	ZXRbLlKOTArDrX/qpmTZXAlBxJyK5kaSJA7UZjJIn08jeTsWGVpeQsI2JDg2OsFo
	RaJGH6dH4h3Y5o3zd0LWYsd4EFuakldzDxIMcR/+3pP+7EWFpAkuKoSDH+8Lhh4i
	A6L4iZWis4QMr0lzUWGaDlQrnNRnb+K9Qy9ETG4XGNuKZ4fH7m+b6QNh7ZsftaHf
	i3Aakahw+m5JHoJP/ZNfUaeZ/DDGi/tr9jg3jcehNiAHVtlgTc6gbjuxqy0E7FsU
	mC5wu8z+yzyjyeh6uPhO9l11zLyRgaD1YgInQNILG+7M3/KMY8qATSDOCusaDWij
	7yhlYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp16912t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:46:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3670090a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754012; x=1786358812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMassRYYwmWKjJ9TG9ty96NoXco+IZPC6jouhE5M+mc=;
        b=Ps6F/7Ylyd/OlFOnDU13cCOEXu5qKc3SvcHu1T1hAcESnTDe4FaqSLxx7eOmML6j/q
         ktzJYZmj7UuU4BYMl4N62lcWp0pjkXiYL9YdvrcHbOlNDvEy6PMUzPgHN3/3siB3bik2
         vCnfLkRF4f3AdEbD+Kpzqx7fsNu7bEddo+2KUhBZh/nbkwcexLx9F9KejkePyhE1DQc0
         KCahFjiro4QW2aLie6eV1mhwK/1bvuGMRz05et3M98y7bWhCLXDV6b/Mm+cjwhuYIMyE
         sciAPZy0SCmQl4NgK8JwZtZp5HJk0tapGa1S1jO15bJGTsNR25Iv0dDWI8BFbvf//x6V
         jBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754012; x=1786358812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMassRYYwmWKjJ9TG9ty96NoXco+IZPC6jouhE5M+mc=;
        b=f029k0a8BYHOJQYLZm+y6pmJpsPufEHK70SiAGjdWXzYsK4hJCdB2YoxOqvBEWrsVt
         KbDH5bRZ5Kn6K7/FLhkENa6ZLB1rpjvn7PrMC/gmlhweh9c0Xvni/dlyG4k0UPdT1T8e
         1MLQELT95g1NbrEDFYwSyLj783QySnhdABVuZ+PRm2/JMb9Cbu60tCvUyly2hhr5c6DN
         zHsV7W4RaXU+FJ5gPwKXwM0UuAYGd14nJpdWlbwmRQUgP2UsSq14ZVdTo+OT7HT4pJJW
         oAz59/itliyt4qU5VBl0tb7vfwqDqJOgrhy+83IzAUriYNwiIU4g7QtgxXXvOBBHrjvL
         JdRA==
X-Gm-Message-State: AOJu0Ywe80paZe9oo/Ppv/I58XdPjXCCXneFnXZZIoGQOQicnVX3E9f4
	hAJUGagMm8m0j823Cp/7LzIEal6RICl//azS5ZEUvoczWPpSmvsdeeoimQPdy4T5jbAMdsKqfzH
	+53Utyf5NfeT4/5Ip7G2yRYeBnJBuDCeN6qWbf+bb0A3p5HWuS9BUxEJ6D8top8Z0GMoj
X-Gm-Gg: AR+sD12l2OTuSkuznqtxaYAUVXzFTDzC419bO31JnXSWLIbIQxgSqlCBM7uEZKsLKZn
	NNX2wt5Mf8O+/TFeMQH3+3qXa9Rr5dKKmgLM3hWMMrCi79Sb6tb6ITLFRO9ZwIEC6UdPjm1LhTx
	KQtHQ8hczMLkMObVC9lO8Et7eHUcyYUWwofjUNOJ8bKWKnWG+beAUoB4ua/+wHuEw4dynvzNuFH
	FWN+AzuRlJx3dV3je8sLEZDNJ+tRUxbvYaujGD7LbYBTwSNZg3OKo8b97r+LkEB8DnLey42+oK/
	dE0M8GLc4L71g9dZoxxoDBVla8FlGBCADqkWgEJP9ZSjwcrxBA8VYZwqz9ArbNajkMmFnyWrsyB
	ljJTJgzvWMrLWROmMZLoS0oYHhqeFMcFnM1OJQQxuLVALmT1U13q1mMTTGMDzQBReU9UeMsCuez
	qV+W138QT9+w20GNCbW9M4V0eZdpkHfQ==
X-Received: by 2002:a17:90b:2e8b:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-38fbc42584dmr8325750a91.10.1785754011870;
        Mon, 03 Aug 2026 03:46:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8b:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-38fbc42584dmr8325730a91.10.1785754011453;
        Mon, 03 Aug 2026 03:46:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:11 +0530
Subject: [PATCH v14 5/9] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-5-a1f87b0b0ad2@oss.qualcomm.com>
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
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX1bWZk7VpRfef
 pMWsRtDZ4it9rlu7lt7V0hJOidHY2P2P0fDXKNeNsX1TtxlBLAVLwPd1kPfuiZdEL5w0ov3Bts1
 tMe30gZr5URvRYnVBzoTg+cllUtv4BzqS9N5q7hVihQNazVKbWGZrbNhdTeIJnkjHspBtoX47dT
 wJtgQke5QsAvT5ukvxfmDWJwKSUkiI1mdeaZP/weinCEEvqJE06/UEdKHeYvP25IXRPxfq+ZujY
 Ubm4bIP+sS8TkMnRZFTciJk3VZqMkNZDr0Nkc/e/i+bncVzhDImaovM1bY4zubkfEev1PKVS8fJ
 gmWgNoglz1SKhmP5hiIikax8jnRACiHxmr9Ui7SOlkUkoITvDmWtc6iPx2bT+Iv4bo4wj5jJGFe
 P/zMU32HPcyaZYpl7dBDMxFZw0PsprmxKIlb0r2nHO9IKz7jmonHh85ByRLkBERSkMjw5TEV8Nu
 5r4Ag+BhncP0RxZxcyw==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a70719c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX1fb3m7QK6ucl
 aH1egUruFYe8JSS7o3X8vWnoa0L18HKrfGgruedxgLDnUwDyBr5K9T0qxpQ0Sfu7Np6o0HolO44
 UpdjiBZ/b+lmNEHroBJIdkD63nHf/wI=
X-Proofpoint-ORIG-GUID: iPvAtt8sK-modeFE6DuQWh59VssEPwzm
X-Proofpoint-GUID: iPvAtt8sK-modeFE6DuQWh59VssEPwzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..ff4187fb7fba 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -159,6 +159,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
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
 
 	soc@0 {
@@ -656,6 +685,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
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
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
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
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,

-- 
2.34.1

