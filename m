Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452189;
	b=0oJu/8VGLkq4Z/uOwv9rh13YEIOtgEyXG0CZjut4iCxRveiRCE4uDNsEux3ckcb1P5W2
	 30FGOV+nQUXhpslX/izaJlEizcPf+EIf6gcVcTEWE8a8Eh5M4Wy5DNls0hK1q+t3rhIah
	 1jWg03k+SP5YW5bJiIUZah8Hs9Yn4IBYQDKYLeJ9K7eFXJpgbuudijbI9IgdXjM/W5wO1
	 HkikXHz8kjcrs+TroLwIp1PV7xahDY8H89UjMzxcT0Dpfpae5uyqk3VN5VlR48sIVHEXx
	 TKi1jn5bT7vJ5f9dtbqcmLl124DdkklHTn3ufog4tLa5bW+zK3PKF1r1zlTV0LJLogQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
	b=Mm302cIVfCpLzn+IXc6a8DaL6DjjxHG0ZCe+RwUOCTmwKtMGDdHsf+vFSK9JQ8UPQU3A
	 zrmBqDCCXvi1x1cpLc3Y19ceK6i0VWEsxIr3CEs8H+TSWTYwrThsUaeFCDuSIgzayy6Mt
	 wWJrbDkT1LR1P/4NpNQVZJNhNdgqnxMfvFh2qax1bfwB1iLqich6gxvrkVcnro714ZNWf
	 LhdrmTfmyiHVjzsrakUWOudxv5inOn/+HEjWEhDb5V/7V3N7seKA/S95n/6VO9HDdohI1
	 Ssf1H88Hw6PSt3LzskTSULFrnz2PGvDGFivwlu8vCOGirZeXMStnewnmKS0R9TsnYag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ez+CYzI/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qr1cLOQa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83679606A687
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83679606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ez+CYzI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qr1cLOQa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH5EM2340472
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=; b=Ez+CYzI/AUVa4MJu
	y/N7F9NT+XsRTH0kSoS8+h5QK821aBadbEBGWlRawp6Bk45sbGMe9DPnagRw9CKe
	XR568NtA5Qtjgc3QofGiriwHfOS4AeGXVHZLVEhjmW2iP9lRQS6Um+noIY4gwAVQ
	wH5TmFKT/CXq6dbmUC4QMT+e+kImzZqVw1b5ueKm7T655IgkVGRJdkN7dnhidJWJ
	Op7iQI1J9NgCa2PjgShKS01BoY509R+s7q+NTafMHx4rveVHQb0uSZih9OnyxTlD
	xVmTXhrlFGpOaPddUh8dS+yMaBfj+EFLIjxlU/ILw/CT31mX8XMon3RpCjn2sXgm
	yPufXQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2m9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e6e78e025so1878725241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452188; x=1796056988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
        b=Qr1cLOQagWRRghXoXdukbKBnL0X8gDYMLIaKfcjoa/FyRlE2F2aUlbIOx5rZR0PQ/8
         oPo+ryT/sZd2wNpT8Lhjfxp5MfCALb+93SUgswLveurkWqr4EQ6bbYd6+J+ccdrHWl0m
         k/6LnhLMcaYI0QjqM29xViRgH36lrKPEBNeLcAGpLudniCuyg2Z9aSOvm6ymPMjzHHIB
         T6kn96d/eBl5jueBvqphw16VEHYvDhSXh2fchW3z5qFaGYQ+Ws0ExBbxkeS1IZnoro8W
         zZtqyq220IadLbCNPucgwNHVNzEure5XhO5Hf3CkZcuBpaf041D5CnnqB3is2FcaxNd+
         ZvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452188; x=1796056988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
        b=wGepCncW7rkZ3OSt5teBescNZ0DO2rfRGNPOZVfN5yzrAFHDIsrZEOPnnBfZFTxIsL
         YAeH1sx3RG5cX2F5q8N2vbPmi4E+fSqrF3Ma+ZHx0co2+6NcBne75ye89ca7r2v/FkcJ
         sQ9Gx4klyNCo4kpUxYM71ae9S4Ym7xe9E+JYUCW+nLFgOdAV5mKV5bugE8jsKoZfdN8q
         NYguM+Or4JkLM/W99fib0H9JNxTfl6Oqm4BzTW7lUFNBEQrY5DYPOoFKW8NREuNjN7FV
         rN9TOMlw6+/zqoqBQNc7pvSJJCAJLFVc8p6hvDne1njJnTDxle2+MD4zNoO2yD9KbzH9
         VdWA==
X-Gm-Message-State: APuU4Z+J08+Toyfup4cYrhh/9oJVG95IcjOJc6mWXgxePJVmDLJJ5qHp
	d9BLTYlWQacVdueQoMkDqhQwyxU3XJFRUDEZG+2CCeTxUjpVkm5W0mNVYr980YFwmxNi5OAPemW
	9V3gA2KWPrt16tvoJJ4oBYQhUazVDDuJNOOHZd32/ZMVJGuvIUH3Pgy3BgwzCeRsneK0h
X-Gm-Gg: AZFdTZfIB4TWZX/g2/1AmNsfLDBQ8GHlfPqUywTuq+7uABZ4BmfGN+1qOiTD6/Do5nh
	ZbBv8rk76ydMceyQv/oSmvEHD8wcxgmPo4PwHOZ3IVQenbDPlvXMLccwh7kXXTErMg4f+R6uw9N
	iy00aaZ2r7hby3mjDycedn/5SyHQlbmsnkH96sPoa5gEvuEZKLksP6IJjFY1gKbGVoHn3LwTjdZ
	RFShgRUfV00gfjGUnlL1qUoCZydGOO3uBT5dzzJA/7fjpIum1NV66KX+ia98X85vwVDR4535w3F
	tsETW5E6I5QbvnPVFmMrSrqnKs+wvVkCXcSGSHOkIhtr+fGOfpjdF0s36/9IOWprGr2Ta7K5kBA
	gR9CLZSBoFIjha8J9z8eNTxvDWfGkKf2EgHrAzi5+bqbuiOVFE+jmc4N6XXma+OGkVXBtIdLnmt
	2lgD4PzpUcruNa
X-Received: by 2002:a05:6123:6:b0:5ee:9000:106b with SMTP id 71dfb90a1353d-5ee90001d62mr3741337e0c.18.1795452187845;
        Mon, 23 Nov 2026 08:43:07 -0800 (PST)
X-Received: by 2002:a05:6123:6:b0:5ee:9000:106b with SMTP id 71dfb90a1353d-5ee90001d62mr3741307e0c.18.1795452187438;
        Mon, 23 Nov 2026 08:43:07 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:06 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:57 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261123-qcm2290-eud-v2-2-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b046d1c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GBRnKKbz5W7R9ATGUUsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 0UeQuSPjXcVP3Ineywqh54lmABhCttrJ
X-Proofpoint-GUID: 0UeQuSPjXcVP3Ineywqh54lmABhCttrJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX1+r2WyDrJNbW
 12gSOQLa0gnxXNM2/zQbBYHtCSCZgEKDcqZMkRo2Nn9azrMo8HNuBAa5bc2YjFME2/cWOYp+Vjy
 VqE8U0I4vrvLcE0Z5cQXdl5GBq/fANw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX7fWxR63K7YVL
 3neF5MEFLwCJ7z+70+NG7A2+a269TA/dqnNdcVYpydruvoDt/0JYQxPUT3kQErKFDU3WuYjybSS
 PvBF3A5urKIPzxUTLmSKDMR5fKp5kqm3QcsAygdvo3xrvzGOnPYtaCNj0Sde3ye4LWxaXA+jXZj
 DryxTE8w2hGJyTXt1DzjX/VA20OnYnFfUUOQTz1nuBwCH0PXl6HkC5TSOcVYAn6Nrx1+2kq5ZxY
 P2ZAx0G7q+tUhrQoKasEq36wSCBoCQGBomhm9DKcVYkO5brWM6HwLcTSbDs0NYKoDEvmgHI2DbC
 pggmf0rkxGbpHnYt7auDM4iGn5EkIYfLmd5oeDL+XCFunBy9ImiPNNRGJe5AgGV6WLp/gFxnfjb
 2u5eR5P1Kilb2K2dSkoOl0vd8Cfc5EAsytorBScP/eWs80BtqMfrsMw1bOa6OvnCkI/wmxQgdiI
 Uiux2xNJ/bct6P6k1cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver.

On QCM2290 the mode manager additionally ignores the enable unless the
TCSR register TCSR_APSS_SPARE_REG1 is set first. The boot firmware does
the same before it enables the EUD, and the register is written through
the same secure IO service.

Add the compatible and a "qcom,tcsr-reg" property that points to that
register in the TCSR syscon. It is required on QCM2290 and not allowed
on the other EUDs.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..bea03468a499 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
@@ -29,6 +30,17 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the TCSR syscon
+          - description: offset of the register that has to be set before
+              the mode manager accepts the enable
+    description:
+      TCSR register that gates the EUD enable. It is written through the
+      secure world, like the mode manager register.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
@@ -50,6 +62,19 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      required:
+        - qcom,tcsr-reg
+    else:
+      properties:
+        qcom,tcsr-reg: false
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

