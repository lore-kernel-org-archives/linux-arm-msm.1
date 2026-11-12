Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458207;
	b=UWGIbwNYBusBwZMNYXYmDqhvMQPnbLsIP8HXoF9GMLY5HcThXk1A4VEXgt0qGYH6WG2x
	 LL3UPKAMIUp0jSoP6zJMoci/ggd9XyQL5QqhPccHlE6L4b/+MyOaSiuv7N72nRdEtl8qn
	 loTe5vPdYlUKLMmkx4+O5M1BggbehU7GozyxbvDI+44u9VTNm7TFzU14q15xf8AuOx4f/
	 rFDWtfuX8Z/I+/8qFRc+19ltRAJHmpv8Rr9qDOeUIos0j+HG/zmVEc07q3iYF1S+SULWa
	 7522o2BHnmWIAKTthL5sf0i+Ic6bfkrsNjHbi3eMxDd4W+J/ALvv9BWyt/z/80ebnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
	b=HXBh1VTZawrOHPtKNG+UJjMhkCcz8vX456q6Fn49F/yKWO6f1i8AFyHfqiy6NmVvSkON
	 ZYLIq30XIPLO27nB3Z6bpQcab20dhpdZ2SSbsHlNBN+B1CQmxWV2GpEycXjgNiO+Av7o2
	 cNEtBFmo0hEIZj3kbAO3J/qutdw5KS+fswKGqBZ9ihfmSzEIXY1YKYl3OjhwTSHEuWR5u
	 egRTJF9tuIWLGtzgOa+dAKppc8tqstWTTUqkvPWJ/DOoqP8Bg1ghhg9vmp6NvPcNESIWD
	 i2KUGLQMXZiNLXsZ1YvdFaMVN4Z1zv/jbkrMfk+h31wejeDahMnWSPII/TnEDiRZ6mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=haHgWDJk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BN1Qa/tU";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A903606E93C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A903606E93C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=haHgWDJk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BN1Qa/tU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZTNf3158618
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=; b=haHgWDJkNWeyovMM
	x1+9bm/akHpzvlMlvandBQuEx8aj1bJk2RvGjgFv6Rq2mY870NSyozeqW/PCgJtp
	FTnNuVL2gu2kI9njYXhaAPZCQfHtQHiMkiQcuXYn4uRCXO50Wyq8KVgc+/Hmw1il
	Bij++h46yEN3YQU/n58kafaU1riqrcP2zLnNOWLFwREQFfh91pR9LwpB6bOXxbed
	7sHW2cMcdPobiM2nqBahH/fqg5AFXRS0jPF2ZbACelw7exTFFyxDDV0/iOAQKfmS
	Vj03jP/VKYCThI/G3zmHnPrF2bfpp7HEsNibBoGpOA9lSdt2rS0aFu0CtsJ59tr0
	4I7fGQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pvhq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7247586eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458205; x=1795063005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
        b=BN1Qa/tUDs2BDng0YxE7K7/RQXlA6iETsoIFDO2/jGOfLc8WNk1IKT8V4OL6jva1Dh
         3dxj7uJosAHfjh72PIoWj+fDp2H/CT6g5a8aJGXzE7bKjX3Z1lEvVY27WRF83lkavrX2
         hf/1LTawZioQNkhDe1saht5aF/Od0dp/OLKnuEWefx0oIS82qnpl0n2lrt7SVHNA9J2J
         leRrTkFezGf8ve/fmoRdVvLJS3Q3jkhUHc59R+x0ui9Ho//Tid/C9VI3+SogGemGw7k2
         /fW4Y3d6+QP+OuqYcDd8lHL17g38uuA+KMyCpqldvxKweT3mKbUw0b3lkNh8js2KVl4e
         bqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458205; x=1795063005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
        b=ZZGoBjbNKIwNSCrWu+KY926mzG6itBUyAa1OiXaaN6bM30bhAmSl9YKhlx6g3x96Eo
         SpC9CcUBlDOxXlUUm7ziXAcdRyy4T8E2g0ECxZ8Gy6/vTHawuihL5oMe1Y1j/dv/p8yH
         YyO7mJiIWjFWqjYB1m4otOTuLOptY85CH6Or4yYAWU3nqVrg4/Sws+gvOjk8nany9U/9
         Z4gKhH84nhgY3VD+5oTnVJOcvqQ98A+MVLumxrygnmLb6HUmbp8j9WDrzPLWAS6xhVg1
         6F2uy6YQAV9HvKlhr8h23m1d7hRGsJBxgqdqHVC/LyUhk/QSthErW10gs4EKIoQO53ZX
         a4hQ==
X-Gm-Message-State: APuU4Z/3m+pWwDKIbtiTvirG8ZUffcsRAlY0+N0OjhqZrId31qaxyulZ
	FVdvwoFxp/ylkW8LcsmWaRQaP2QgcpSs+v1oXl94ItFVuS8aLp3yGInt9qgEsyZcC0QdoPu0sxh
	Jjhxc0ARP2/7ktChgwHwsoIYhxAKPSVtbZbbl+KltnxqVS0wyclf0YVxO60WSEPNbeO/9
X-Gm-Gg: AYBFou3EgwIOZ2PR3Y64M8xnFINLNnjENJ9RqpyjJZmTXwPfNgWiDHws1lfDdXVoDdy
	8DBzpW/QlXEgM+lKAD8eK8gQnpOuuS75RsVWUyEK5jk6qS6ZTVcfTE4uOANeDskFBPHKHIpU+gV
	GziwD8+TwiZ+XeE5Nm7Dvz8mEylj1Y3+pLrwq76SAAZLzW89acZeUYYjBfuqSUdQdD8NcoyKDQj
	KMdMEZWaHmbR5DTa5FYMIqrLUsSk/E+3S1Q6suM+TVd+uzxdgOQd7Kw541k2JboP+UKqnlpDqMd
	pTERmEPDHpjkDm4m8UD5sjwaQQuLArB1DrPauRJk3XUTkQDyWnSyffblNkt1OmkPOa/fN4RF07/
	Zi5T0TnePs9nU01kYk10SSLqGPuOYuZuGMqWeNn583NdAorc6f8fhS758au8opYtbbzR4fkYYeH
	gtrTzR6gJmuYzqT+9I00vIZnHjio+jeTeXG+klLFP2qjLZDgxzsN8m6x0AVhegrHkUYDAZSr63b
	WPXIoQ=
X-Received: by 2002:a05:7300:d18f:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-376850cefb9mr4226710eec.7.1794458204435;
        Wed, 11 Nov 2026 20:36:44 -0800 (PST)
X-Received: by 2002:a05:7300:d18f:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-376850cefb9mr4226676eec.7.1794458203695;
        Wed, 11 Nov 2026 20:36:43 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:43 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:23 +0530
Subject: [PATCH v9 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
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
Message-Id: <20261112-08-dts-v9-4-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX0Hzk72TufkV/
 GqMpPdzOewmKCOavO2b+XTRnvDLEEgTSD8ZfjyTgn7x9nktDvvScI3pEQf5htphaRc27G9aVd42
 pOKKx2HDv0ZjJMSen6qmZ5ipDY8V/pw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXw9Pv3LMoia/K
 KFTq2kx+IQeIXqwzFgvVYo1dltJHEomQ6ohepUEWda21PGrn/qt0QME5xMLbvp8nP/xX+DVAxV9
 9CGTx57KjezvwFoBPyL0YnSIROQD9O7rd8XX8/MjWvUQOX42LF2M/Knhq5isGrpqjn8jBhL0H8B
 tRwb4qciKNcXDWe2ropgytRISRsBBTTBEzrxoNj1zFXCF8eG6JtdExNHnPU4esNVRYwnDc7rZt/
 0nh2brNfEEMTpJe/H2WX08BXpNef2ZDzQnx+WOTiJ2s325JCVGsGycaLpvs9mMfnHQTWWzExLA8
 Bgf2BxfSe7HQ4hcrFTqkvkeZ+2z5Aehz/wkOKLKu2RRO+2CESQR4gawYzIyIIEy+hhzDf3/yyf0
 /JOUT3mqKSsnSbZ0cNKP6Hlej+bvSSKWN+ky5HhCheKy3binoMj9iiKkjELAyBuK4mEWnxEoIE/
 ps95HrMwyvtUo+LqOTg==
X-Proofpoint-GUID: zCeodhDHNAA0nBlP_iAg3tNXVF82vlvt
X-Proofpoint-ORIG-GUID: zCeodhDHNAA0nBlP_iAg3tNXVF82vlvt
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af5425d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 17daf277edbf..02fb76283f7f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -132,6 +146,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

