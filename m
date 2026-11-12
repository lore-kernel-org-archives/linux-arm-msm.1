Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458222;
	b=3TvTUHDWBC+zd5K8xPomVIOO2NdqdCdy1CaQZWW8A2EWysHr1jQeOB2dZyYVfWWqNTSM
	 hppwE9NAqEpG1oWbKyW2Jer6Oksq41GIZJgK5Qt22UMUQ/GxRn1DXR7n3liu+GORrNeTE
	 O4So9cuIqbHflBrrvEyGue8HqeVV9JYp4geuo2KfKPBwK6KMFnUAMrNd/UX9vkSYscGrs
	 j6GOB1RNz/x9VZ3FSiUD3tzBOVeb/9OdpASKNfdq7ufesjyk92tAY1vA1k1rqp9a7CKBa
	 T6kvsDwsC+NN4lpYJVwa7bIAi4Zwk9/rZMB0HpfAzPxXfy8YeISNuzuUyLFfHcQrlhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
	b=r95VaW+tNLIs7hLH+/HDnLDKn6hOhssCCn4Cb3uQYltixUAosgrqvrIC0MRbd38/ODUt
	 u2zWYFznHUy+Q3bBhSm1WXXkjovC9i1UXq+s1mPAd/g/5Cu8F2izosHpQaxrIAU4Voc+b
	 7oeqoC0OKOLqoHXuWNwgXUR/dpT3Yts+DXc6brM3JSqR8+a2e1fOlAIpiSUyQvmuoUg4m
	 Cr8TNbwzwtkfzbXN9/RlkqrWc5ciG/qesh1GxWAzaIxN6W/9MKBx2stnpZKFlJF9ZSL6i
	 B1Bcu9Q+Cs+PGfvRoakzfe42Egk9jskAfxjXZwQWXKxZ4PRI8AeZM6LVuiAhWDbddqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DwNYLkRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BscJYipT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A228360A381D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A228360A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DwNYLkRl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BscJYipT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZXxC022514
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=; b=DwNYLkRlsh9N6pXg
	03ewC+yVYp4GxaDSNQKotyQKHLw1ua553XqXCPv0VOFi1D4LI4RmOStx3bmtzTOO
	AjsjG9pEgPMn7LAuaq82A4n6f/1SGI6EouWF7/F/oHWXODUP1rHumCPpU1kfYDzY
	d2oKOy6V5UTs6W6ISrJqC5cIJXvkZvWCTRV3Uzx/i+tJvSdBE5ZPvMiXJbhLPVYm
	hvKT+TcH/G4+8G6RGnkvJLmYTKj0/Tf+o5k8RWijWQwZDAsPHmojWWHLyx9hXSRb
	twbb5CFW4qcHZ0x2A93Ci20fh8KIX1wHdXo6bWSsDqZKceTj7xzYHghOakLC3pxB
	Zx5lSg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdn9yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so7639687eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458220; x=1795063020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
        b=BscJYipTG+/tYjY/U7CFwXAm6C8ZE0yX4EqxKj3hYbDIdyBGeX4t1tru1TgBEf1lFr
         wDJNvfnmsRXuikV4/XtgGHYbAtDZ0wC4GNuFM8BpsvP3NuYJcmWqjwH9y1fMtWFmVknU
         GUvjHI2Nne6smtdjp9YrsWMqdgVa57oPZWE7Q7hOfpbfWbWT2NxSeBQQBiyYvaP/2qUx
         c8s7phplMCEDLMCmj2UwXGvDDPjqQ3fKb2wfslRXTZ/f4kr9AzXza35GpYUHZm5xk43i
         Hiz+EKFtV2yJi+DdlRTbpYEEQQvkCG45wGAcT7MSnn3gLgGgdBTjgBKFgpAbXlmOd7kq
         2lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458220; x=1795063020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
        b=hVdXlB6FDXp4Wx/ybVunc3vKdATaLDr3rCPxGv8Fr0jD0pLtSTicxIpr+vmwZwnDtK
         JqnKTGhDJjBiEE4bFHtcvpbpG6jeOWvmblyjgSTZJbwCdunD5lOLECwwt2ZjfM/WcPcY
         OwdbAGSUDZjWE06ryhC8y2YZfwvu5cdg2GP2QUUkWMUM9U0PMc7SrbDP6+qj0uIJYU95
         mkRmY7x2PwzojRZPuwOqVh8vb2WHI63JG0JA+8RB6Twp8+zneiPvQ/8Lmzb9e7aBmeRd
         26uTFQ5Qyj4eKvIQVlCn33nnuCC7HF4VpZHNsUXRP6qtuKk6jpap22Uxfs9Eb0JlO6FT
         K3aw==
X-Gm-Message-State: APuU4Z9XgFbHq0BtaezAFWO8fwmkULeO9+3PGrVCJB/kzCjCs9vJsPFt
	YxDiSTmN8IOQebUu/8HJVH4yLrn/xtiJQYwwgPgtkY9D4ykfp2XDbqW3ku2vZDoaDAetX7PhhBS
	I/n9CjSaecX3E37WbrxisLHt8rpze8yBTwAbB3Uq5TWcQal61+rPHbZ2dRRmiv1cBV/XNFD1tJs
	O4
X-Gm-Gg: AYBFou32cU+U4C+TmYSZHP6nBnO7M8D1XFeAd1KVqzbuFVqY2k1bWDkH/pLgnGnJ7Sr
	ZRmxarNnGsy+NE6+JMqAnFrhGcQ0uPRIfnAK0rfgGC4JCBb/1imgoZLOmusab3+xHhLHSoBfbH+
	JIP0MCrLAyPFsjOqLtRbL+HED/SAZ/5UrpF1G35rUsAzfLl+777nv2FX+p/Ij5LfChEzjgy/9aB
	WD+oQgjjuMCxadyFOcFdsMUJ8+DzaBwYP1mrJfE/CRIVBYVjUhQdrR3H02Ravb7OEfzdZFs4y+t
	W1dhkD65xsQFkbOzS1k+hILQYks76BqyCb2hhm1pWhspnQ4FjLtVRYo/A8w9pIZ2J3Y11wWudI8
	kQ8KcdxnHXWbtQ6cb1haoImdqbJpxzVtEZiYLgApYg9lg6bzFPwGZGvHpIFzbmNvXtxOzoKjnnD
	tR0tjcHSHZeKNPK6L4GMMwatDoQbl0qY088AhVO898P4PW6lfJmcdiJolPAnHLCQCyLrZEuky0v
	TJPMnY=
X-Received: by 2002:a05:7300:f54a:b0:375:894f:2524 with SMTP id 5a478bee46e88-3768579df96mr4642382eec.12.1794458220342;
        Wed, 11 Nov 2026 20:37:00 -0800 (PST)
X-Received: by 2002:a05:7300:f54a:b0:375:894f:2524 with SMTP id 5a478bee46e88-3768579df96mr4642361eec.12.1794458219611;
        Wed, 11 Nov 2026 20:36:59 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:59 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:27 +0530
Subject: [PATCH v9 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
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
Message-Id: <20261112-08-dts-v9-8-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af5426d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 2K8TxGyVniMYF16qWt3Ki5jfMonY5aUA
X-Proofpoint-GUID: 2K8TxGyVniMYF16qWt3Ki5jfMonY5aUA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXwCbJQ1ILQh2e
 S7D20aTTLnooM0VzlsxG/ocU0kIDMucBeX/RlVKNnPzZt2r2vxdFvUHonROH2T8jlgrsXNA25UV
 2U2/CtH5uZ/zAN2/Yl17KHTft/f0WWDG1L3PEOa/t6HFzzsquMkh4Zo68a+9ENjvV2HtG3IKFG7
 JOZp6Ji6BFa8shTFRgvNq4qu1+zwbIF95utuiQgerqbfXBVcEDyrOLngwMad4zRUB+4QzxcFeNs
 rwBXyZadChTWe69sS/RuDLHNJzi6BTO/2lBmUVBiuNuFTvZHe/LKTfV/taTL1hDjAqnJx/c0zRA
 oEiS4Hz7qAXLNMAv1nPRBWAhHHxZjyzrAEugBohy6dl/wD97SSKyFPK3ZBXRvkSnwuOJLBVxZe2
 yiOMF2qFN9IolrZx/b5yMS9ZYalkGb+Ma/ahvhAs4ybEK1q/lq3QXwm14QXdobz99163DgTQiRw
 n38Dhh6Wc8WAlsP2tug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX3pU7c6bn+pwb
 hRmJ9snuvqjv7JWUKTDFyHerbzweuTHTZd717UzYeJTpX6EYsTsZKZaqAKDCdlTPswUDBjeEb2k
 E5NEucPezbaAm5dkKhEMzCyajb4RxXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 02fb76283f7f..87a7e625a2a4 100644
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
@@ -167,6 +172,13 @@ pcie0_default_state: pcie0-default-state {
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
index aa1045f20ed2..4cb9f399d480 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -431,6 +431,16 @@ tcsr: syscon@1937000 {
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

