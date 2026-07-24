Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553FF44CAF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917515; cv=none; b=hddK4d15BDUoeF/HIyYPf0TmKVbOfBHBuHTI6mzHG0uac7w9uBZJ3Li0MbYlpYiyDQM140onxBPVNlajmU4uzjaFnD31dxeSHAXr6OeFwaWVcf2awhpbK5VRuxBVltYQyeEEfzxBGF65tyHE3nE/DfaNP6eeXkI8RsDAB5891Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917515; c=relaxed/simple;
	bh=fplq4MhiYbjZ4gR4KmwJS2Gi90zzUaka3YGluovCwTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G3OLp+nu4fVaxlNMTrb30WYFMffdFMaNEYAJYlNZB0RdgZ1nvkzQhASc2tle+60Y/vtchmJSZ37X8pxGgWpJGCBNJwo4p8u51rfucitSIuhSueb+dcr+WUMxpxRgdgeG/ECgqhy7M7JBJ4UiMD8VfyLUbSyhgrD8v15HubePQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4SdRi0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5lcuFEs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4SdRi0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5lcuFEs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqRq93819226
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Boq2riYmih
	qWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=; b=o4SdRi0HVRtn1DQM9PQMXSDDD88
	d1ybj0+92oxGebYkNGXjV93hqAYQVwUNlyTlKiA2kCuDftNDQzd1N1dafNxm2P2W
	DaCWhyErW0czdgxiWTNfF/fFpalP1NYGPXzh35RTWq7KtSL0dmcQyiQvAJBGTHLp
	9yG5TSh7Ft5qOutp/uE2PxzHg3ixmLUSgugRKwmtIzTqo+w5HyEV7i7WJofonK91
	e702KIKKnBktZUX0sK5Sm+mvcq+hasCLiey6Hyf0UGARsQnWAfjsJUBCmXxPzjkB
	iWjtrUShWJbdk0e2/HnRULWV2H1J0ebXBRU2qCqWGwgwuGDuQN1V5eqRUHA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm9pd0vqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:25:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so904790a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917512; x=1785522312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Boq2riYmihqWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=;
        b=X5lcuFEsH6dVeaV6UAxOlUxIx5kPL8vJANpn1bCp1cdvAjihXarW/9IUC75dKOzy85
         brtIdA6p//aqTyYaZRsZVxH5Qhlw/6DyseJJI+c8yepTGNe9kZW7tmMRPPKJV9ZWAQ2U
         7RDFbV7/dTtjwF6OtaCMEkKnHoSIidJQM80xHXW+07Ac/XZXm7REPMboBN3gZjX72Ix2
         RtwZnO5p8DY/jXb4kmYpP23EDKkMHrtbH/9L8pMqVo1mJA9EZG5ExG/cYX5aDpyVkVX8
         A/Adob3YKjeoTKqKi5o/6w6qnYd9oggjMI3YqqQZYvvsKRwBQNtfvHr112o8f35lYsBe
         lKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917512; x=1785522312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Boq2riYmihqWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=;
        b=QwP+cYWlG+PKDR25ne/bXgvLFJokoBhb1UjIuRkR6t7lT2ETLY+9hraxcMMnX1O/mV
         cEP4q3WykIaNVnIGiMkc1CycZCMNTw26ibm6W4bFFmr1LQV3cyxjAH8J4sLZltum/erH
         glIdCLwJ9zK86PV6YFN/syNeh6NOfx3Cudosa/tpawUHDWT2bZ4R2rytcFrVnoCOm1ce
         3TdE1GZm0EOXAGyfrjBIVi95RIFuuDOdqQ7VfoZr5qC68AIdcS/f26TzlkddYz0VSvCl
         XYcBNky1PBhTHe1k+kyERRF8/sWAW254T6br5wT9R0SMOlNuz8TAOupnDjyPyxRI5TgY
         hUpg==
X-Forwarded-Encrypted: i=1; AHgh+RpLXXfFabJ18/sRbyYnW9kw4c8PGAhKpBfUzrz0k0jXlbg5TLGTGOrnKKuMSj/JTpJxx3GhdflbhcjjmhKU@vger.kernel.org
X-Gm-Message-State: AOJu0YyGV4fqF8l7CKvRH4Zx9DDXp7uB1pEQMF7uLGpykjGRP+weKnKJ
	VLGUDTCawtl6ktY0gZjf0e5nOU9BLeEMmPCle0yS5dTzGvmVnTEq7eT4ztIPWI0ynQpSbHyqDL4
	qx98n1HAe0IpqFMgnLtI9l9fgdyeDq6LJUWrENG7j2Mcs0XHnN0j9GPd95HIFAWJNsOt0
X-Gm-Gg: AR+sD11UahfF17+9AkL/PKVwWYPzqWWhs1KFrTwxJaIOWrprouPY4V3BnmpwOPEqb79
	hKW4wv442W44M2LHm2xTSEpuARFG1f4d81e501d+RpWIZLyJx/7nuhH9+xmrotf/JjY0hcgMNIG
	V8n4EQekEfk7gUbyTJsUYI5tABrTxdmdo3AslScd/sLEbFUrAKL/iFhpEXKEzDZfLJvgmKpY3Gn
	pFinbKsTh3CYDSpEgGnmFVALB2S0TnemAj46pI/nHbhyWCn8cVqfSdA9qpPLLJsNBZ/18oHsbTT
	fej2DAzJ76P67nFeXzIjFroKjnvqs/6OyEcaNRMGRE79BqHtkjmsnZV6yMsxIpfXFPPvpjGIf7t
	GFlWxyZ7FR4xTR2FffacyiD8CxlkR5BN7UBDa
X-Received: by 2002:a05:6a21:4613:b0:3b4:b216:2b26 with SMTP id adf61e73a8af0-3c44af76896mr9889588637.5.1784917511920;
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:4613:b0:3b4:b216:2b26 with SMTP id adf61e73a8af0-3c44af76896mr9889571637.5.1784917511518;
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a67f3sm1669324eec.29.2026.07.24.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Fri, 24 Jul 2026 23:54:44 +0530
Message-Id: <20260724182446.1484894-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cveimyuGBvvhbIbJaGomsWLFkNv-2CO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX+/sgQql+vkhf
 X4kO2sP4CEkrR3oSCOKhWWINxg5qJnsIcYW6V4UwPXygeOdY5laotkXLNP7mTOlDHJI82nkJZX7
 WQgYWEGV/WPsACHYVC6gVGgd5n7HCOfC4ttJ6ZHdaadv2Gv6iJ64zdKGFzXyCiXF/d8poNyNWVR
 PXLgOtWxUS7WjujX1gHdCjBTTEs2rvX3n4SsUHR+WGKw+IARviYq3dghhk+J4WiaOYmqHZQlVmb
 HPicGMuVp0flzmZZJ+ayWbmOs8qs5OAGs9rUj4vU4GPv0xLvibPabYIeYntUQR4MojW29KCYLn0
 EmnYpMgxfD4FEtos2UC3piuPpk2XatObyN32UyiW7N8l8gi0veJjQwxlGHc6Pv95qOxa4UYhRqC
 yqQadxgC4IMBAdtYCU0pZ4i4ivUTTBaEzX0YsYbA+vJbJd8N2siUA3M8EjalpBzhyX+Vp0ru2Ko
 j5c67Bb13u9rH2Dfycg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfXzaH3G6LCks5O
 nMkLpqgbjptK+pPcA3hGoocr7owxgly4IYOGd2Z/Cpqrutv2BHTU7S++yhJ9XTNeGi3tBjZWS5Q
 srCOphHMSNU1vKhBl+30KYJY9JYIcEg=
X-Authority-Analysis: v=2.4 cv=DLW/JSNb c=1 sm=1 tr=0 ts=6a63ae09 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3jZq6FF4vXrVA1D6PBYA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: cveimyuGBvvhbIbJaGomsWLFkNv-2CO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240165

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

On platforms such as Monaco and Lemans, third-party codecs are hardware
wired to the SoC and do not always have an in-tree codec driver to manage
their clocks. For these designs, clock line enablement must be driven
from the platform side, and this series provides the necessary support
for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
I2S MCLK and BCLK has moved from the DSP to the kernel. This series
introduces the required device tree binding support to represent and
vote for these clocks from the kernel.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..4878c424ef03 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,43 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9a-f]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - enum: [bclk, mclk]
+          - const: mclk
+
+    dependencies:
+      clocks: [clock-names]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +66,20 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     dais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@10 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "bclk", "mclk";
+        };
     };
-- 
2.34.1

