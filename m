Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8623F8246
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012478; cv=none; b=MpFftnLNlrMFJPbLdXCLZo0Isu7wmhVFIQ3RnG1CW/G/4y5xOwx8WxhotkFKguai1wVTE4h14CZnUQUJ4mcgWyt+LPhmiwKz1XJmH5V7IYwEXr6O518ztsYVkkUvnkiRbF2cviPtkexIzHkllmaPzd6Hz3CEjmmBHNHy30L8/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012478; c=relaxed/simple;
	bh=YGVvXMXUYLnOZMf8Ms5rV1I/iooKVaJYiXlCUiVTNGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IEIoTh7VqCcqHRtDssjHDFJM0Dd/y32Uqktv8gmDE8U5op3eqwC0uf1dkkTto67ag80rhRMcDKKaagJPQomIsNFX+kZhei3p84sC0QAqTNjCpF8DwUZBUHM/yxDdoqJ8DXGuPsM/XuSGoWMRPJOCP84DUAikUDllv46EoYp+KUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAPh0i8W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVQQLviz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAPh0i8W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVQQLviz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nipU1625877
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=DAPh0i8W3FgR196x
	rOKHkcP37K/wFCxjXlrgZXx5jDZejmVpRP+PoFDOfG4sDlP5srBAipWsf7l7142p
	6RrtNzyjofp4RNs7y1h6jE4h0q88W/oRjRSgBeD4EAeFlnofakahuFZGYV/MrNsW
	eM6mOWA+6hylQWsS1e/5afgpzROFJcxFZqGMqE11bTFaMcgzD2CQNRRO5MgX8iyv
	zE+xqgJs+/aWLDoaenR5ocGg110q6s/B7OQsOLgsycyQYwXPWGQRPJWCLBp/8zOG
	qWhuba8y4VZW52D0MIL6ik4tbZuEobLFVeQuR/q3pHbNbUHrWMrp+RVZMvkQ9SvU
	5NYVDg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntngsn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:34:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e1da97175so2802769b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012476; x=1786617276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=cVQQLvizFxR/Hp2Ig58E3ezs8Xex5HolaUO5VTS7IIVeebbzkvy4XGfsnMJ+mbebTU
         9KIKP9020WweulVbQI+xVfAu8KLoX6EMSk859ReuZAZHmZd1gama3NK32jNHBJmQaLW6
         MOmHfw98HEQcLr39SwG4v1LezprPUSXSqoX71MCnRfUbJBgChMc2TUWROBL+RkrzY2FB
         GKhk5dUoTMiE/NCqpD1YYhDpv1WjGaULBcROTbp1H7pliiPEqQWmFRuHRj1Fg2IZd+Gh
         F8lng/0JCvhfB0EQ3NoBkIGz/t3A1+r2RJWRILeRrKKslY1jc9IrC9VoDjqcmdzhmhb0
         dZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012476; x=1786617276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=MCDL1Z64pVmKX7kzvWOGtGY+DBdKQmMpBxdvViHOI6F/yXJsRMYOBve+L/F2s/JSIU
         nERoiVU6n2jjI2VqeIwV2A1fUBnCw4QaYIIqd8HlDDous5Ajfk3qEJJyB00+pu8BPP8y
         Dqz1oQheqNP+ubUYUYF1l7d1WjHwWeWdUZUXIPmeV3Q+Ym3Vm4dEOw20r7X3j6XYaFgJ
         zHthChA5CX/1sxsTXkNNDzIQK741gw49ulTX9yq5a7OUbcjcCnYcWIycaScqGGADrL0b
         sUSobwYs5C7/7/F3KtySz4IM55KylMY+f1PhL3aUOIhgzkkqepJ5yx1NhTux+JwVcr5c
         ygwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9XA4DEgPCrfKqvgB8/0vHfhuNX7shFvts+m6AJbvoqNlM8eFrX8IrCwX2FX2E/1jIaZJvvy+xs//3fv//@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6iYSGlo0/qb5ELRk4DCpF9Vd6SvDpEL9sLS3OwfSU+PkRJfGg
	vVAc/45t1W02+83+ek/Zib8OQqztBNSKZ7m7oo6rbf+ZZ4XERd25HF27h7S3Onbl0r2eWBmfqNj
	x/T3frgKIQwg3X0Fg9PEonMPeGHwUPj43z0oM1sYwtSSTyPYPT6ZkG6jLTe1AsXF0iFAc
X-Gm-Gg: AR+sD110p/7ZW8truVk+jIuDTu4y/Nzb7vlDp3cvHhuoE8mdiuv9Rv1GJkMK4i8FJp6
	uUAHSVAELRg49bs+BDLxAcWJDPD6ZQO4tZD66c/4MWihjZb5wM5oElYBMOLuwz/PRIjddu7pMIz
	LFZ542Hhe3ZjzsCklDqmljuVLM3efY6s0FBiEcG2u4s65MxEIb4htwumPb8L5iiBTzOORmqq7rF
	V5RBF5I5FB+00x2hmCaBRExh/aEb4fhRPGN5yDstdJeqj5RwDT9w5wSVPN33BSX/vzUHgRmVjkB
	JcmJwRFx1SevtVHRB9HDQbJ6gNZoKUtOzZf2xkCYrXqQKlaiUYgTh+292oPCOhdh3KQuAOXlBU6
	agkeqLZf/8F6dt521ukie2pVX
X-Received: by 2002:a05:6a00:aa0a:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-84f2e0070d8mr16720028b3a.21.1786012476093;
        Thu, 06 Aug 2026 03:34:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa0a:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-84f2e0070d8mr16719942b3a.21.1786012475666;
        Thu, 06 Aug 2026 03:34:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:07 +0530
Subject: [PATCH v10 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-2-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX/iE+z6GodH3v
 y9JsqcDQhdip5hC0M43M7rnMe62PSZe9O6iJxmCcjnwuW6Riv3ow366BVXLLB+d5DE5sUqE9pTV
 Bggrvbf0ttTP61IRRQANWYdZyII60hLxDjHsTUOFTlFLBHgqwuhc2gGVMQcxLJc2Lx7OT9yk5ie
 kXC8FEH4P4TB/kQ9cBWB351JFNI2QDktYNCIqopMUpYbZ0KyqvKHJ7KVJTDCepyzy6zrUUpcMOh
 Rk5OQ9X2uNeB+9XpwUW2sabcf48XrztyR3qwW4PEH70Yg7zF1VPxv4W4X1dMnRI3/6EjdLBGSdj
 nPHqJvxDG7mGkSlCbu96YP9o7mnA4ZHkKJjVVBThpRi3SKtr5oWWShyyM6J7ElPKZBHBPdfdEuJ
 SQRWS3hwL9tHLkt45kTJEzKgsj1uatW87vvgpVqB62/1qR51N4AyFm5PQfWSJ8mghseft5P31YJ
 1OesUE+ahYXBk1Z4shA==
X-Proofpoint-ORIG-GUID: GF1Yrb9dl8ihA8kS-0Lcj4WdUWDk0ACv
X-Proofpoint-GUID: GF1Yrb9dl8ihA8kS-0Lcj4WdUWDk0ACv
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a74633c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX4ed5SQHrW3PO
 5VDUrnT6EmxppyZwiPIPAy9yd7uLy+W96OoBwV7UaJvJMQ6K4GFoo4DfHgXsc8qXEUUXOIEF85/
 J2uybUT2AU+VVCkqmh6ri46uLtRMBEc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

