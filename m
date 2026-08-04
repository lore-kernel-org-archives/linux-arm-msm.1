Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057544908C9
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865883; cv=none; b=RYVWicvAf6Df79Igys3XVgyJsjwvKgni67iRJ8Z5zYhIs3O0ll/s14s8bxtfwpyzKQ3e6N5PQsAa+gR9GqGct9Tsnv7D6n/12wi+QFXedcyr0LAIlMluP93by9MrrrMajuGH5+y3uOwer+Gyz9xeBNfYg5w4FPPwh/O9QvgZqfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865883; c=relaxed/simple;
	bh=B3TLsDqArP03LQKcA8ngy2MaXdpHgeOMi+R6ynsdPHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuU65koz9C3a0sG2cglyj5MOA+y1FsdLVx4G++OTcItBVhLug42yWu36iFR2tJmNdCPx9KuOet9ILiRyh+5TwIqqLy9N8IKXs6F8I9Y9zdecplK3gSutks+hdHadiaAZnMlSLVD1GMwCSr2Rjqf8qGQ0yaN/pp5UxlsMr4E6QqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtZro+Pp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=habErOrY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtZro+Pp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="habErOrY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfSOp4057061
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 17:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=MtZro+PpmfRPxLfO
	TZQXNmFeTsF5cAnr3iwhnaLiFQNPciKWQRCWB6jTh0OGF4p0l3T/iaBE3pqcueMp
	f63KZ8vtN9c4Xi/Dm9fm+sbXX0bkkMSPp9FqzAZvtJpMoS1rIG+H/fUIqxy9ajWB
	OBXOEw6xK2TAguWvusbjyGhIXuz21jblHHtyJ8XyPotdhvTSavkTzSN0FPlA9wRM
	T3tOmYjUjsLi/P05CHzIfFLBkNlHld54MtljCxpc8nMmdu+MWXp7DiA6/zyJ9l7y
	jRGYT25mWjiT7L4phTC2XgGjRsshtPL3K9iPAidy3KXY3jdvhYWh80xSmbsy3wq3
	3pL/1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmgheav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 17:51:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d004f13426so1178985ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865860; x=1786470660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=habErOrYe6dXKYYolOHW2KRa3EbHG6xsZHvRaWwerW2fyiqWf+Dwo6eJXynmyzzY/I
         Lk65HSrk2f0kxyOIMI4V6P1HQIQww4ybETHKOqld/SIPSBbDIMNiRce76aBvQNJGRn3u
         FFb4c8NUGMX2amy/lnx1/5JFjPQc2z3kDFBdXNqNS/tmJdAW6X2KQvifggGoJmna5y8m
         axadePPY+fZQlRLrKyuVsx22WVYbxlIyR4zIogz52eVxA1StPoCN/zlhaJDwL4LkuMtN
         Tmn5w0dO7wrI0l1W5VV9Dlg3x1M6svoCUX37LjO4OyBr+PJwv6Qu9JCz7/AccXai/F5u
         qY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865860; x=1786470660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=gqHjUPyLxXn4GG+GPqg+1tMeyoXwe5aLPSxMVzkrnKJrZ0Gxa7c4QIFzQoPyFWrdRg
         PcNQIxwFTTPWU+nGquBRe3GzFGiB33qY1DqoEpMj6Z+wUPjQhOmTFxlbEJuY5CAgyCEd
         oBwnk/vfHk4JRrJh0TkiYz/sL/0SHcpspcByLpGLKQdlO8uGFW9Tlo0MGQlDB2g8MiHx
         znFi8KV0z6apWC0e8LUhM5qIhGm5V3oK921QA7+RUAHM9DL0ucnNPPQ9RS6EuSevbQ0q
         VoVwX26HmfVucf7yqZ1OxafATHblVRzXNtpDZ4pzk8zsrLqIWXH1OJu+A7ZjLZ7zpgMc
         PwyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKni+4O17eel5hkh5u+v2QeVJivoIl5zdRqsZP/mnOt+Umn+roC8ZTu7n0vZZ9QOZpd8f1n+dxGed7nfWM@vger.kernel.org
X-Gm-Message-State: AOJu0YztfA381eC8J0kQYw+eTxB1FAqG9JCum1EtNq0mez5XHM8V/vCj
	/APnMblPUBiXBJa14BFw/RwLCYT5VSx/hHr58LjTExrA6LHohEIvN8DoWM3+maGllXCoxnpq/E/
	BgMX+pOY35f9IxDFLNIV1tvWlkhqSqCwCwwFr7COAixWJz7B/a8D7hphHQXU0JdFpqcRl
X-Gm-Gg: AR+sD12ob97W9qdCtF454WFoAoURY+mCWG+7hPOd+wDwtD4PWnbyT6EYMsXdN3mwnxB
	Xk8ucQ8NapWzP42FHgycLoHh1rxQHxavZscbAuS1w/5YANXm8IIVT13cvQ52V1XMOGg3/OERyvD
	JLLn0KxXWXqQwOVJTrljCPNG6JN/UvS6/2VhH5suZK/Gb9/lz9vldG+cJTIrbWCIkWnxofb5NOa
	qxk2tZIi1x7vce6/UQQepQSMHA9/XeXEXno4g1t+NPPdNrJcMe8w18oHtmH2e1Lm9OYHLB+JUOg
	C5tleVXOXZvkp9iB9rYU8k6YK3EDsVNyd6gZtRIUhtQriLtTDNO+sfRAqJwLG2RmgeZc24fINaB
	DF+iyMxZp/f8LIRcEMJqUbjls
X-Received: by 2002:a17:903:26cb:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d0ca9620cbmr5665825ad.24.1785865860193;
        Tue, 04 Aug 2026 10:51:00 -0700 (PDT)
X-Received: by 2002:a17:903:26cb:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d0ca9620cbmr5665185ad.24.1785865859768;
        Tue, 04 Aug 2026 10:50:59 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:17 +0530
Subject: [PATCH v9 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-4-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX8LbhWt+q2P9E
 H9Rg1InNlS3KbvuCxdWHx1UwxJiRBDAwPgBvP47uMsqT1M0JoXXzakSIxaV591iY+RUQw80ExFG
 SyRJ674Kvp2mhwkIX1LDev1YdhDQGI8YQCuWYX6hNayLDaNxRU5C5OoNfSSt/AJJi1ZtUiyPWmB
 NLJzFt3V4mpI+/8jp4uykysucC/Oghg8zBqfoenF5KqL7scMK5rnJCpvT5dfcSWmh1BfaSvBSL8
 KTP4bbZCEDpcoSGkyDcSCeqSw+Bwge1ihFec0RL8RX/kfp2HIgebTRN5Xibn/4GXGmsnHk+vbpj
 v+kQS0PXihD+yyl0L1JRHVlAzORppOYl4P++VX7aTV3mY80rPETnkcbpYJodyMtPFrBE6qfQBLt
 MUzIm+TB4nyQ17kaqjvQLEUaEPN9mUMNoyoCwY8/pnAoohI9tnDdtoPly3hKbKhdmpie6u0tnUd
 zRnp8oH9JOfPjndglAw==
X-Proofpoint-GUID: 4BkBaoMYrFlVBkgQfuRSpLBKegePYNke
X-Proofpoint-ORIG-GUID: 4BkBaoMYrFlVBkgQfuRSpLBKegePYNke
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXzjPnSxGYbP3c
 jboPFtOyWdvjp6DVXjArmT2KkMfG1sOa4xss8lfE2uT6T/V2L5A/ReGYaSZnw94zohl6BvyT1oG
 NS6c8Rk3WVazu0sEFn/JXur1FjP2ejg=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a722690 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

