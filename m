Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905185;
	b=C+TFjiwLD4h4tww0Fy1KBDsndG30B0+bVQGfHHJ9R762ga4A14lZ8w/QlhsoKbFQYPX3
	 eLggYxnuN0Yt+JIKomli64LVWH+1xuwcvgYfEkFTmMeK71afrO6n45FIK7TX+RzHRG7oy
	 RFvCWz1M/mekmyJgkERyS6WhR/rI1pTgeL+clc8Olz1OpmbZzmTHe/2ye70+CVoRaIITD
	 9DrLFEalJfmGa3lKYWZ1CrodOzha3iBc1NlR764dK0wIj3QpQqDcczFJlYeNlylxHLn22
	 ISAL31s527ICkny8k1445rhjW5iKM/k+inAauTlf2js1Fgp8AscB1XuBabTomyJkNBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
	b=X5LQFI22urcOGZ5BR7PF70tVHmvALNay+2dLLwYR3KbCGHq1i7+udfsUj1F5fT8xtAhM
	 ObAER+hld4jWW6sE/Ip9HUkvu3QSOzXN2fa5glLSFH2jMjT6RhaLG3cyFSoMwhNvfhucD
	 YCa9GkONVSpPVPR6oK+D47jqQeUtfU+kybYiNs7wLJGvNMZdiA7IbU0eyXBTs1W7w2LFA
	 49lRflLHM+lFp6MbaBCnBDLXMwKMiuvaGCCdlSD4zdDAdmrg01/t2H6EwEMqtc0QLl7bE
	 Dg1zvUmQJNdHHABNT6dg7dIo66SQKuKoYhFZrnwPLrE4Ku0Dy4pyeQ7CeeUHPlqv/eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyplU1dA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jed2xX2c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109AF606A8A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109AF606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyplU1dA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jed2xX2c
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH444F81699233
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=; b=IyplU1dAU8whWxwY
	15GN8SqxkDSjAlPmXp2m+6+oGJ1jjHOdBBEypHzq+BySvPA9zN9YAYNVH+8hvrZw
	iyrkn4SIXCqMTCKLX2Dsiq+J6oFlDt7SFxNl9432m8DTRHMdsO23O6eFgOTyaFd+
	ndP51GqFQD0g1xkUgHrvpHjlu0uG5jJ34gBS4GohoACtcOSHdwMKquKTtN9QkoCy
	HiIy7/9VmUwm2mSL09SeIB9GqKIFHjB49EXGWzkPmDdd2javXqY5zA1g+IgFzkJ8
	feHpcFax8BRKxbkvIKnyoP3CoOqDJ/LZkXZnZpiM104qSOvxGSHHvs2BDWOZ1WjB
	p6qLGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugymh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so5005407a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905180; x=1795509980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
        b=Jed2xX2cQ7crAuNxLV07iZOjmovpn/Iy/v9GT7nsSYP8ZykKmaohiOFHI5JuNs67ZC
         zdCGOaQVaDRZZ3+aMBB1nmlyLECoTsTX6pg0n8xBA9Irtus12rWh1s7aHdmSKZySTaS9
         mD9jKvB/klJX3EdC3GVwZS/anYAFAWD0wrbYz8VJPYtMz69ss2Xrr1qx7WTvExXfRfUy
         GKE2HGtU7ULlYWcdMFW/M8UKjZ7JhN7YHtyRyWbWx8RqSIgRXuqI6NLRdQBNBiDJQ6QU
         BO5520+uI75k17MbEM9oe/1CzEve7SEMOX7E1K2+qhLA+3HQ0o5yzlNVsaAEPtoFgmlE
         16sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905180; x=1795509980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
        b=S3xn7SQFkOgmgrI5Zk0CvaJa6uw54OOxn42WbyswovQLyvwsQlmOZ8Jl4dgxSZV6Rr
         EjLAydud0bvAs+U1G9JCbNgq7dZ6GZi1wjsEyrZ2VxTn9Q9Q4hKn5M5P5+nrN2Bv3cQC
         2RWQJuNaPMtxb338gRdNHBWX/iEj2Ev0bPMQlppwIBJYkUqJw2ve9GFsnBY0xmxAlOmN
         dK3UNbqOJgtzbafaHadnk4AH1QxsOudDvzlqT0jc7TVP28mpj9iInjsTJssz6JGAQCbo
         9iyCfLSbK8LURVfx7jqKm0iUTYvhZEJnQ7TdbOx7nX3HRddzr5dauBIQmcZj4O6YV6SX
         rq2Q==
X-Forwarded-Encrypted: i=1; AL+hErGtQKuusY0hbqZqElnug8XrFvSdxATT6FFMVXyQub0vfl+cjv+YIJ1XQ4PfsAVvK/CPymmXOLggx7qO2PwS@vger.kernel.org
X-Gm-Message-State: APuU4Z80vu65wKuxUN045u9jUYoSu0GxSMUxsUQ/u1ktMZM9fnJ47jLx
	AXCglWaMjRd1AqQ2/JNRezzOiRAw7kh8vCUAMwP+WuQJsEj7Ij9rAtphzioYKKGx+FMo8WGbVZ5
	kGWJ8hRW7taAkkzDypZXA3rRP1I/sqvIwxbrdUA3J6dlJjoGeMF3ahQYP1KD2OhT+lVRF
X-Gm-Gg: AZFdTZer3y7Pr42OAwGtFd4sQKl6MhluSzIWI7W4ptxy94QI/tyynEbz9IsC4q06puu
	SOSXW3WCBxXmk/tNLrV+eLjv6oELY8UYn2nMtXRoUBWj8U0f1fDuib1z2OQJMMUNOBFuSJ/AJDt
	sYr9mJN3Mc1+hJYAstkjLCV9mWHt8tpR3QLkT8l3rUOzpmjRPRDzH9VpLYZc/YiXhis5Xhdo3Qe
	SwVcAhEXYhDMtdL3PznHKOIL7jSvf2qrgg+gfa65eGBQayGek79PwPex8o7TPNBxUf9P5RKWMEt
	nLyAYfSj7OZvRZEufeNiQBFDwnX8Z8TYof+Lat/Xf3zRKX9GcEFjbpsuYB33lX9VFApjePdZ0zu
	FSVTQjz37TofUS/B4vgGIDdZHjpYj32ilB1SSzCFYxJASQXBdBF8IpHPXagyhsEEZ87NIVYK10S
	e9Ag==
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13585180a91.63.1794905179664;
        Tue, 17 Nov 2026 00:46:19 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13585149a91.63.1794905179060;
        Tue, 17 Nov 2026 00:46:19 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:18 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:23 +0530
Subject: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
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
Message-Id: <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4189;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=GRQtM/wcadv7R+zn5eLlwrFMFCKwmZZnZ+Dq1EyLMP0=;
 b=vXb7kOSstG43o/q3shWkjmBlZAzBQVH15p6eBFVgAtPSKoZkFBlueCr7u5Z34ABx7iod2hFj5
 ZEVlUNAb9IpCpN3w6nDQ5+dEskZeeF5E3loNHtTG+i15xoo7wywUdzB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX0sBEcy0pXdKN
 SH+pwMh44Q95F/GwiD0SIoybuSUApfH+J/1OvUHRbRHq/+m1Xf3cVFWoY/dJGnYTpPosvpt8xaC
 jqvlhlfAhiyVyWftTUD05DSXUiShxe5lWgHcJFhEz7EDk9D/cd/0CYdSHWzB2FIH66wVIvoA7y4
 Z6MaPfDBCaq8+oobODzRyqa3NRNJfS4+JWXn1ONVe6qK+qnX+5V/WMg7/OQvMF5N0DsnloC2EFD
 XQ8wit3eLDqDEw7+Y5Eoy7Xh1VgrJSsBt7Kxf8db+gL9+OMukdn3pvbExpDzprb7fuA5lFlmD0B
 h+/oV7n11Bxs4KI+ryBYKDpsZgmMgFD2IZO9/f9G5/4/ZzIfcYkMzJDkMQW6oFM/0BSEX/3+JoM
 ue/DZgJ0TkQZ92PzRNLwnoYeGRbvcLz3j6Lftq4AePG0d2Lde1SDRgbZgZoMPVE/7guTC78BAZb
 xbp3KynyPv4/tNO8mNQ==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc145c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iZY8vWlYZPOy4iMPn4IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: q6ZVH9MT9ZfN_myzdcTOiraWseOjoF1M
X-Proofpoint-GUID: q6ZVH9MT9ZfN_myzdcTOiraWseOjoF1M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX/6Q1cJqRyyeN
 Y/p9+XLfzDLv0eAqILikQUpw8S0TcaL9Oqfl1eohjP03wNcKs/0QbKlSaskSvxsI5Lt3W1I+1J4
 +zOucFJXlFnv+aS2QI2VXRtiHauOlsI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Shikra's EMAC requires two additional clocks for NOC interconnect
access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
are enabled.

Add qcom,shikra-ethqos to the compatible enum and use an if/else
block to constrain Shikra to exactly six clocks and require
operating-points-v2 and power-domains, while leaving existing
compatibles unchanged.

Add the relevant compatible to the binding document for snps,dwmac as
well.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: moved operating-points description to the top-level, and added
power-domains as a required property for Shikra.
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index ef520f810577..6bd4bded650a 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -14,9 +14,6 @@ description:
   dwmmac based Qualcomm ethernet devices which support Gigabit
   ethernet (version v2.3.0 and onwards).
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -32,6 +29,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,9 +55,11 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: stmmaceth
       - const: pclk
@@ -67,6 +67,8 @@ properties:
       - enum:
           - rgmii
           - phyaux
+      - const: axi-noc
+      - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1
@@ -81,6 +83,14 @@ properties:
       - const: cpu-mac
       - const: mac-mem
 
+  operating-points-v2:
+    description: |
+      For Shikra, the OPP table specifies the rates for the NOC access
+      clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc" order.
+
+  opp-table:
+    type: object
+
   phys: true
 
   phy-names:
@@ -95,6 +105,42 @@ required:
   - clock-names
   - reg-names
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - const: rgmii
+            - const: axi-noc
+            - const: pcie-tile-axi-noc
+      required:
+        - operating-points-v2
+        - power-domains
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - enum:
+                - rgmii
+                - phyaux
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddfc32ba29cb..b6555ada21da 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -76,6 +76,7 @@ properties:
         - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -568,6 +569,7 @@ allOf:
                 - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1

