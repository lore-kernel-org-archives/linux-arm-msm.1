Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616164;
	b=cd6lNDwSa9RXzMaj9urDYKzS6S2Z6IKpJnVjkl5mhDm438K66/9tVlk73+rEIWd9BTft
	 zk0AEkERBHKY9oDSmU58eDgC7XTM4jF4BFpf08Z65aFokfJJCHcn3ODXjipX6jNWf5OiK
	 cRSYAuH7eLYEVn0IWwY3xN8oq92HUC92rcI7eSJksGlzlCDYCoFLw3bUE1z/WZqy8TRLF
	 A3h+l650U0kLm1ajMFyzMwZmSImQQuHYU6oXR9WcBWRyxy/dAZR3r0iNmLH6yAoToXWCk
	 RSDOX0a4YSg8x4w08S+NzCwqJnwVgeFGKEmNJ4VkSrzUXjRaDQmlzxTM/1LjTUeQ7aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616164;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CTz1OgoZUkpdSCjZoxvn9PqauEJX7ebBIB6VyhSxGwM=;
	b=y7hncokwmVZSVlrrsmb2dE1RWDjAAUhLFQWrVKQ7fXWnfw5WPO3qF7ZSKqfUCZ9DwAx0
	 j7KT718BkuC0MGhYSrDn9ob4IebiwLdoIQOBZ2ItR9bOMFaN/sxR5iUU3SrKWrPHx3xi3
	 MuMZOQeLV4/tld5qnqvvA9C+K02NfdCkdtOXpNMBTAUrI5AmgOAtgiXK/fjWenlcMT6os
	 RDeye6s4MGJcckCdVcT4ofV7sXTQ1i6Z0IMV4rHTemy/V1NtL123zhUmJ3JeHEN63QdJ5
	 5lHAhqFCyZVSsn/z3F/x+sRp1eD0UQP6eGci2hlpgMv182Q6NhfNF1TgV7W41uuP6YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bkcWeQxp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="au+/5G3Y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7611606F754
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7611606F754
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bkcWeQxp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=au+/5G3Y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AaOF2361343
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTz1OgoZUkpdSCjZoxvn9PqauEJX7ebBIB6VyhSxGwM=; b=bkcWeQxpavIVYt/1
	BmrxQgV9R3XBmoC57Q+MwLsxfbdX+Enc2j5u2pZ27vvgH+OMvDbSUGujK8K/MV/L
	x7Oe/v9qkfzXPl8kCSphjN+mql0p2o5u16FJfRyMhCFt9gNeRc0AxRP6uqdRFniw
	WWB3UKKxt9pYbYHm1WZ7HnyVR7Lavk0FgnasFxvQIiNEsX7zsr9WRsgAWcYb+eFq
	UTNqcaSuC8CYybKoc+IwEP80rH5cqx4ZKcGy1avy/ayCxtti9NnN50DBiKWRcZWh
	7PHvATlwkbv0N1VUM3rXr+LywmHePonOLPtqj3llNjJ3gNYtZ0maYEJdzEfkANwD
	2C5qRg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7xe45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:42 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85d502ea62cso1292612a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616162; x=1794220962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTz1OgoZUkpdSCjZoxvn9PqauEJX7ebBIB6VyhSxGwM=;
        b=au+/5G3Y4lZT4d9R0ilZzretkA9JIPoyl0yLUuf8aHCJf59xlTcn+SLEzEvMmRL0tX
         Ke5HJc5dDT4VOOrS4OcRYuO3ghmeM9lT8hKzKyCVzP6Kl36HhjqB8IMyZmckpl9mx7d+
         x4b+0qkAPshsFmkHlf3kXBsPeVsE1l15QZOSoMWq71TtoDzYDEH9+MPJvL9EaaUshsuq
         sUINK303Pb+jxxso34PRRBR1l4+HWhvofu7UsmuMomayBhjdZadZdBL2JCoRx1EPGACm
         +Q8ztaebFaRyoYwuen6b1UyKLAV1MA2xeMY2Qn7VsbeUxrjjvK5+S6+CHaZtDMKN0Ggr
         We1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616162; x=1794220962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTz1OgoZUkpdSCjZoxvn9PqauEJX7ebBIB6VyhSxGwM=;
        b=Hf0N2AEHN91ftq5XTElRweZPrPqkqNKdAcrs33afxI7qHcvZOOLWr0deEIZWySl8Gf
         9QuRJ6+hS8UtXyfuddqTGham2niuN8JX81Q7+XtR0PH55WZey2WHVjvq1nLPT39v1VPB
         n45sYX/4v9nG1/aDfIBgqcm3J/XFBp/sMg5QZrVMQc/Tn6jGnXDEyKpKP75PW5rDYsuh
         6P4CvtSfEjCvBkCYqGjfC/Ps9r4lAyDkXJCdBle2VLHVVPNyrCRlwF8/TFAppmV6MuqQ
         LwyEukjxonztQ0yU7SAdcB92jyVbNdjs0qVbGin4kqVZN/3OQEi1UlsH6smP6b18mvv3
         rLQw==
X-Forwarded-Encrypted: i=1; AKwUvBycwk1eLhb+N0cUlcNlpUdRtpksVzwBK64MU9ZEpUnBq8VxgfIBPfd8Utl0MyjJZIFSrozHifkPfpnw5cm3@vger.kernel.org
X-Gm-Message-State: AFq9FYLdWhw5UaTIItwpVzBPT1a86JMkIESfr3VWRG2rQgOdZQC97ibw
	y6fkcZZuVTNzDOHXlP55/ukq2+Cpivm9IBFu1FotKxmemRcvQXwqEUDzxMHnYzNPYOK6ONMJzBI
	RSjZCfStxYgpf3iQdVynNrvp6CTVH74mdk2BAh1aXMcRo+dM0eOi8Ih0JnE4ZsEO1rfA7xswTpB
	Vb+74=
X-Gm-Gg: AYBFou3PjbAzf3fS96MTSewMLEHdRSbSMwM9vPZuIz8M+ODagMeM4sx7/HzxXK/PzNf
	ARAaQbqrg43RBnIWEu4moIIvZsOjMKBPBWlAaidfUbS5kdw3JCPhSDLwMMS74NnP5BuBcOcYndE
	+HA56mwzXvXKt81fRELaH37p5IPj1xBmFH+lEEcQ0V5lg4T3ARnp2hgkgU+tntevu7ncV7NlqJN
	FfALojs4c7MsZSs+NGmoIurGLJQzhuM9+khLnIUWunLGIOk9HASoEL/0CpeIYnG/Snr64lsDzaH
	jwAWN4c7mIKI4bUjKqYEUDFDbXX38XsssYj3zbqr4wL5QM7VcdEsYf9IufTKYAiP3SWPi/+qbDo
	qAFQylX0wmuZOHI+XS+7fWCoxBQtXRuMNsgX1Bz5zFLtIobYEp5USNAoTeZWxpJhJiYJ7C/2YYN
	uMVP4/nTlFpM/VnfNIO6GZRm4I3H8kmhyDQDxid3yPqABHLybfenQtfafwyl4=
X-Received: by 2002:a05:6808:1244:b0:4d5:27da:a492 with SMTP id 5614622812f47-5640de8d66emr6700464b6e.44.1793616162008;
        Mon, 02 Nov 2026 02:42:42 -0800 (PST)
X-Received: by 2002:a05:6808:1244:b0:4d5:27da:a492 with SMTP id 5614622812f47-5640de8d66emr6700450b6e.44.1793616161539;
        Mon, 02 Nov 2026 02:42:41 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:40 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:21 -0800
Subject: [PATCH v24 13/15] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
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
Message-Id: <20261102-kaanapali-camss-v24-13-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: cl0HThpZTHI8tQzYPlqWNu8bJKSUniFj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX3fyIvPKq4gbJ
 nr7vclZ/1xtRThKKHjMLyTsQXw87lgKKrPnEQ/cBnspPGweCJMUGRZwmNf6JPYxmbmq6MijsmFx
 EctKNNw42rWuqkrfciNAelAPcMfjfF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX//ItzNpXNteZ
 +C+wVnXjY8zXRhu+d9Zi/fLRI+FmPDr0O5FrsOePKubdZQ0LCDCj2sopxIrJeHaVqq0cJdcr+uR
 uzBCJPuz94sVHqFJ+N5UonPHxeBMXGDYaEy9rg32xAKRig9riWFK4GyBK0yPoNybyOVzV0nvdyY
 iCZFm65gBiBFW1okuOt3gphmRZs5/Q9G02hO9cnLY6SRcyJNv3PGjtkYdDxFGtTYfWKql8xGGY9
 PNWuNEdXwfpElXPYPKWpaCOgKOlRfE85OxSuL5d8tEDE5TDVdIKKFEvdAENNXumZoUjd3mF9ydI
 TGE1YPPIf5D7DWNXyHxRXOAXV1WjamkonaGNqtVQVbdBzzMw1JdJICX8YZw+tPxLj1AJfTECQcT
 IbOiWNC33bBnlOsRPSYh/ImS8JXipWLqet/OVOsK9CofrgFvH9SdfFrAGC7SOxHnSGxhgWlN3rd
 jQHF8qhw5fzr14AtGFg==
X-Proofpoint-GUID: cl0HThpZTHI8tQzYPlqWNu8bJKSUniFj
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae86922 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=09nyjJ-fxQ_OzqxZyrIA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e107bcdf0f8e..fbd65c2ad95e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3746,6 +3746,117 @@ camss_csiphy5_in_port: port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1

