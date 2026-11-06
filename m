Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956904;
	b=ahnadCGWoIxOVPkP2zpgg7lpkrTsBDLeWCzsCYXL9C5a+f0Ql5HcFOS+YqoK1YQdEkEx
	 ocnm9X38QUNg8tL/NymepwZmpiF94aJD2ARk1cfEBrKlaroOx8kzBYvmaXIw8F/MM3j1V
	 AR8wyRneT5g/9H/N6z2ButeRo17M4Con4TCeHyiJI0+7VTjrII0V+YHXKjPtFz5lM4w/Y
	 zcwig31eXId+sPd0+X7ijs2iSqN04U/v8kkBm3wHDhG1zM91jQFArPhW9ALxPCFTMZBq9
	 xjEw3EAvqT7ewjlC06GbM8FXpHPaYCH7ddPNkMgBSqpiERiRx3Mc0EpBLInWTyc1B4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
	b=NxL3neS9IAQnHkBfZtI4OfqUnZ9WGUQtfZEVoU50+/5OihbScaZLP7JctC99r7sCu1zi
	 FHVJMZha30npgSSkjJ0e2qwCndRCEdMq2idE+okOBSpgppJlB8uoZJFO9upich/OgJRIZ
	 FA22C6u0Xdz7qlIAiZTQSyJnDLUPJ24qdCPtWGZKs4qAwLEnQbyTkq8W1vWLrp6rgCHUB
	 iro8BQTFZU7OFCr09jd7rYt77/jWju5ACjBg16/cJQJS3eEXr/axApInuAsoYQDtGoxN+
	 MG8GErg18uI5gqm3XCY+09dOrmHE116nExj69sBb3OGdd0we2ZCc5a2vWcWB97u4h6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBUCcxMr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dQrslJm/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A58606A333
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A58606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBUCcxMr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQrslJm/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RBvI045291
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=; b=KBUCcxMr5OIIdkyL
	/+gwZfiQPxczSmrKTVYd4jUbWYwCac5YWycGO4cvjD+PuLQ19Atkn1xOi6pOuPG3
	6mgJKf3ZWejknQ6JOgiHqDurVEqE/WxzYORaEBS1B93o+ArbJkn0uxtumzJlXJEl
	8qLdHU6NCBWtdV4zs2B1z2qHbGBk9klVVbCkiP36J4TIT9wGV6uRNySYd0kvQYYb
	SnB7E9pFzSSno6osfRgg0ejhvTOrGKq2k9MFlB4xroB5kKYuEIRSM7EBmHGxEe5C
	WIhzLvOCHQ5jesi7BVEvlfWD3LwM0zfe4Aa2OZGKweSi93bqsxdd6KnFAVoX1IYI
	2kAaGQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t45v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so856685eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956903; x=1794561703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
        b=dQrslJm/IfQRtFCCrngErIp+B+jB1LwBTFSS12mQMeoPPf1bHXEr3Z/eq1OtuCklAB
         O15Pq+ZjamokzU/H++IhxFZw9EcMZsxGrffBpDO5f3AdoQINSXmssYwxnR2pA7S7XWRT
         P1ZMx987OT3V8wGD0hOOt4rKWQTAiS8yBXzzs/gXNHV7ZQET+B85wiiIK/b0fvC8uBOc
         FhhtYURmnJcj/Y74wamUJ5YLADV+GDVbl26bUk4o7OZO/OvsrmNcFW0aGLiAh1tdi52E
         /6iVaN0Mqb5QirsqWHr89S+yhtW5OqnBxi+zrVS6ovGh6CohOE4Nw1sdeyEMWkSOuxcB
         zCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956903; x=1794561703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
        b=tNxIlqMsLmTmZQL+Mj2oLwdSSMYfIky6jySDIdsr01aPMYvViOaaS57dMxNNXfvoDY
         1DtrjFMR0lV1cDTx9puqgGnHFRhDbWgvAbB4qN289AbpKJR/mwPTJnZu0afKp6nCmF9x
         0GTRQJseGlgEv+KXZkSLPAwdBUtu9zL9lJV8ovWU1BMGtR2Ey6dQLNYs1zCkNfeXMGJR
         q6ctJzVZoXS89bjp/inofI9gY0PzRF8pgffn2ruAgIBLNjFX2ONDH7yhBExdjUwAvN/4
         41FZfiDGbb9SeckxHUkQEKiq+qFzw/QLrYZ7U875QoSYC/E2I3vnIcp3L8lPloBG/WO7
         U+oA==
X-Gm-Message-State: APuU4Z/5xjsE/MO0U89yDGD0b1TqLA7tU9LUFVaH1sOaP/zJjpMgp1u5
	BYCmraOE4ppeVSz67p/G1n++VykSnSnDLGp7OvLIaCCSUIYCbBv2NSZsEV4hxqWoM0e7mY+8wtr
	JQZomPECjfy49ydqQ04DSticxuQwzH5iPg5uy6yOUetPFSyqkmY2Le0Lv1725ld3FFyIt
X-Gm-Gg: AYBFou3sR+tmWFRSbYYQo3gWLSAZ1XgVUsoa31ivYEw7YIgORWwobmrVKPraAgMjKvF
	eXgAGWfrI7i5zQBZ1JbG8DJJbQge63kANs48+IRySVP49qDC5uy6Ai6g+6yQvTcYig7FMNCzscA
	TV0UjwSz3bSgD03g14/Ydw/KSAhL2PMT1fK9Ft0fUIqoNAN2C8sg8bBo4LqpXvQ/qhyOADPsnuh
	BpmrKqebTKOPZVpAhR68IbdbyTQcZ3FHMObrgYxaCsdXXx/LnlrayJqwVDmy2DScwUbwOT1s9nf
	hF/AlyF0car35NLuJU/t3Obq7Q4+QHZfx6trdNYbgRNYT7A/nBpU+u4e7ZhQJ44eUsekp0nUoea
	5+igL4qYGCAPkrYWhcYo1E1V9JhbRZ/ZeQEqVVZ7SW4lFnOQ+qVZ9SuY3coal3jx82ZdGv4YlQk
	LTDoNpYjSLbdY8wkLMDCOxFjimaiQIX4bUaTZ7eA32vwNGwhvsj04buxR0KfUVtk3/qvRR8IWJy
	W64sg==
X-Received: by 2002:a05:693c:66cc:20b0:36a:1452:8dad with SMTP id 5a478bee46e88-36f7612b26dmr2490542eec.20.1793956902791;
        Fri, 06 Nov 2026 01:21:42 -0800 (PST)
X-Received: by 2002:a05:693c:66cc:20b0:36a:1452:8dad with SMTP id 5a478bee46e88-36f7612b26dmr2490514eec.20.1793956902256;
        Fri, 06 Nov 2026 01:21:42 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:41 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:57 +0530
Subject: [PATCH v8 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
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
Message-Id: <20261106-08-dts-v8-8-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX9kO3rX7Tzidd
 10+PVxYHDrSKQryG4tY/PBw1/r7CLKlnj9aJCXj8/xtU8k7jQ90y4eOL6iNU1MgMPMRcvXphi9K
 W1phlr78Z844voH5sFP/ItNfBLwq9QM=
X-Proofpoint-GUID: pkwnlxX6IeZQhx7VYs-KgnVyikACMjtq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX+z8kxjvqPoIX
 HiqiLy0bE0DlTeQ6u95OHN6QqREY544qYopuDonu6C7RQdfc+beV8Xjfd0waHx1SPIHZRZMrTMh
 ITLdpXINTxDoWo9xdnVZ+wjAUha5EWyk3P1xN/0X3XmFCQcrgvgyh/YgmOA27xeL6CAQia7wlM5
 UhOMReYw48oTA+QzJay2Gc2JI5RVX7RJvQiwGUuQ3SzYfDuvpUppRlKCEv3z5uRjOwMzDJEjnWv
 +71n8ZCWlZzhs8HFeDwZSNnqoobxyoj92560/oPMxiXRYqp69zihDB0lAdef61b3/dyIwkZrjtU
 GJJ7Uw5VpailXQpTZEce4Ydz//UEP2cn5aYkZpPTfIpEwE0LNeYS78oTxdFzMetbj0iaV7Tt9l1
 6UTKz4iG1HR9keUGRu4io4SeyBt3HQ9ijBRkDCN/MXjuEkBisCSOHTVVHiSWVpNUt4DDsEv9Va6
 SoU5Xdq++Bovhu9zAyg==
X-Proofpoint-ORIG-GUID: pkwnlxX6IeZQhx7VYs-KgnVyikACMjtq
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed9c27 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 422e2766478a..b32daa7c1559 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,11 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+};
+
 &qpic_nand {
 	pinctrl-0 = <&qpic_snand_default_state>;
 	pinctrl-names = "default";
@@ -156,6 +161,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index de3504395c48..e4a696a65e55 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -406,6 +406,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "okay";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

