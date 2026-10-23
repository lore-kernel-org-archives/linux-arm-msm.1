Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768193;
	b=OTUIH4nLbhmrJfXPIQnyg6icBbDJM1Hp/jNn4gI4EGfZhooQHl31TxKprOqfVwLgIadr
	 b2CzpiruTs2kQBgoLwrDNAnb2f7wE6g8OLvISp8Saok5LuaHfCJfxNkGAue5xcQpvVpIp
	 EKeXdRZZbZx3k42lqiGMO6LMEQpxCLUxSFxnVB3uOW6OYNDaa6RZi1IKQEM3nPNMZc9Dy
	 5Ss+03z8NIc+QWWuKBTD2TaVRuAx0ZhG1J7AJT/9oMNTc4Ce/XQX7mzXwVNhi2epCUuhG
	 aDXpE4DuAybuGkvgdWuMx3tn8Z2F01m9nwLPQhn5pKPSCLPWqgZarHBuO+DqooRWxXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=LpWkzteMPZvBeLj8LvBtlV+1KUC0O42FSyMPBP98Lp8gJ7XjLo77Aj9vNSDgfEzqKusf
	 apBGGpFSAwmHB6FE4voMLUerm8Irzz+zT3fymRUR7m+9aiKwa75xhOi+d0YCKG0OQBpnL
	 Dm9cfKyPCyJfDSEn2Z29ZHuHWn2dG1yHsQdrq6ISTUGo9PVPukXZ6WypprKBRqkSZMQV/
	 jWgiBorUn3zfVWPbSkv0Yvan4SNXn4ZPvoghpbsNNJIqYEBvzC8kZhFkwcJR2uz8vvbVZ
	 l6OfJIO9jMmRhG4AmovnsvUXSPz00TQlzDTIeasz+FAfup3o30+uHrqnZ/h8yRZGRRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZGBaYEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e6YrW8XB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B79D606A32F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B79D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZGBaYEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e6YrW8XB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6E8E1955234
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=NZGBaYEIXE0N1yD1
	D2c0Z9sI5DPzXOPxazuibbY3cewSAgRt3Z2XcH8HuLNR9IWzayhD3kYeY1PMNk7x
	rn7G0PMp+Jk2FIUpHSZIx1V2GdfleFpEoRisY7M3Jess6mFtjzA+OVC60ulJ1qMK
	T2mHfIZZNu+Vt+TB80uaW4FZ90aLZZwryB11ZIqUx658pbmKjWSYMrB51pImh9CH
	FiP6ZTqorHJHE4rsVHJX7iDJxhADRvnQB6m7A3bZAlnMu8LPZe0pwmiZJcCUgA9J
	E+OB6rv93zZ0dMyEhTJirgiN4+FOXK2yEmyFV/VIyNnQspqAwArp4VlG71p/MKqw
	//t9Kg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbm99b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so105465085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768178; x=1793372978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=e6YrW8XBLzztTWtNFawQUtE6I5GotyiaTGqKVZUACA2LZrmCBy/pfKBQVsnGSD/7cA
         pIbXVukXwXML/myQ/h1a09nzYgW+rYgtfkphk/9gYn5fiAB58e2f6DRHTrsDWgXmqg+U
         ikWQ0OZmBdjJw50p1NDz5Su6ITCaRs8ttSuddYwHvQLE2HggCPV1P5T+pcKdJzquSzNE
         N0B+HdLwwrcJ253+Jt/jxZzAyJ33jkmOjNc2t7mVdQVbpmIry5K7OLjZS2CYJIkhmAKa
         0HetEB/rWuHym2B8u6yRtCFBzfKsbad9XtyPnFHYf1gz99EzdIxRiWHxa8qFvKmamjhI
         ITBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768178; x=1793372978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=InWGMwt7j220V1k42z3nmGLCPRz7V7rCw8VDiqNepw4OL+SgxkdWsp8WxSA0kHYmri
         jnUeE/8WxeaEmr7SIet/MrApNEPXCpMsZda6dF1nV7nFN0F/d6M/3fuMQFMLAmd+RJC4
         xXA+APN72aXYGOlYPiPc6DHyS7KH0UDVQkQD97+JN78jxRJGBYm5SuRls3Ktv/9V7UPD
         dUhC0k+PIea84lMKC6XsvUTzEPVvTry71nYEMKkKU/TuAfilsqdOWWXjHWu/zMXH8Y3T
         LC5eVCotQ+OrO6A6lrwWnbGbRN10kCfnr6DPgdv4lQ7u6u5BiGdyg1KJJF8xLtoVcl76
         WQzg==
X-Forwarded-Encrypted: i=1; AKwUvBwdCn+7zz2ukF5aJmBUxpXtpk5V+Cy1imLzUJrBbpLxjsEMM3zPmTJOgKmg78FvV1lXljcjvQFhj/LfXQFa@vger.kernel.org
X-Gm-Message-State: AFq9FYIO0CDZjd08w+NmiRpl/NDLT7M//6XUn86aoY9FFH2QdMPloRVE
	JxUtZ9WX0KJ4INF+MUbGt05jwNg4Gd+haM56b9xBzmRBe5neAThEbRF4yoxUDy9TDUd46yUv5Mx
	rAQfRXqroJzAYU/PlQe0FZBVMYs81wBpcyaX9ggqe/WS5FqGxjk2ZWeptDo8xozprfQSl
X-Gm-Gg: AYBFou1a5lmhYnHZcARSSsTfuEIzHgHHwaVh1LWUdkGDG7zzmRfHfPY/4rGVJOQpx3H
	5LDPLM/0lOPOp/1ED8+sv/Gw6FnaTITTayCGuQY07CZ1uGBg9JUewlONOZF0Zang3KriVGceV13
	7eIFsuoiTZlT7C1R4a5E/oIhPJ6HiJZLhwj8rECYDFuvEM3c0JFeA/04/ZOD6uUjp8n2CPIxOM7
	q7GXkpfIXGXI/+YDLE5+x5fiXPZt+pNrNTvFuZc5uRUPcMD1x4FhPuWvxMXZ0zblX/ImPRxNr3o
	zsy3tX1lJSO/CnxhVUwcj114QHfEoI90MGq9N3xADDcku3rgYFE8wAGpbhWuKCv9RVJk80IzPdV
	zf7p0H+hxVjz8gZk65UZn/C1NSkwlylcgBotUomxNnvpd/zXOoNje+EHzybYSKdJcCnS7P89Oi/
	1zGZqEeBhQYqffPzKL/DJgkTMGGwS7iekkeaIkbTY0qUoW+IwJXSo=
X-Received: by 2002:a05:620a:4712:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f6f9a2222mr463350785a.50.1792768178188;
        Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f6f9a2222mr463341585a.50.1792768177528;
        Fri, 23 Oct 2026 08:09:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:13 +0200
Subject: [PATCH v11 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Message-Id: <20261023-camss-isp-ope-v11-2-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX6iPUkn0CV4r2
 Y3UKehReIC6I9Ql4LOcOBK7XaE1kl2gWEWN2IwG5iEDCxTgjddsM1utsPZhlzqhLT/zDeLjh8/D
 x4AcVqEeB+tt33EPcAF1A+uiqoqzSXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXyf/oPAA7zhMM
 +PQHuRBfPZrE2DD8WnJ5U1yuP5KF1JhH+kBtpe9nnXs3VPSandALosbXY8jr/xfxTIbBx7T4sxj
 rVI+G+H56cauuNrq+qDXVTnrYr47bfvTkNXKnikDtv+mcCepTgB661JqL4u0w0PJeP2Z4HohxG3
 hxmKWMRYGbWkzgSTc4A0HqMnSCoX35iXKRadg1RoQjYRH8ebF8Seezpyan6nRRpa1A3RafkysXS
 KfGCwo92BSs6rn7pUSiQ8ZDuMuyM2ALdQTWw1kTYaQ0Ey7rHBwYggsBsAgxkFYddExnzn0Z5352
 4ujWzb4k9W6X3DzjPYCmY9brc0bmeslVREBL4tEPUFL1n7dmcFTgZg2hIl0ESLO11AKpTUhmWiG
 KGD9zbx4w+Nn0aZw4gXb9uFG3ofSkZqmH4Jp5ONPVQmVgdQ09nwy3gRkFoFAFHsZRPMl38Jphlv
 pc0aL90EjSUxn5cHcDA==
X-Proofpoint-ORIG-GUID: mQNzXXrMcPGbJqbQ5QgSnvpdtL992H6L
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb78b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: mQNzXXrMcPGbJqbQ5QgSnvpdtL992H6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

