Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9947F2EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327402; cv=none; b=DdBGC15CV3KKRz5Ryad/e42F9CL6NsbTEVhl+a9zi4b5vaO7X7Cq9a5jicS22kizv3zPHIyF/2aO5pw1f77h64WBOQcUf1amSp4CH83yBO+GF0ywR23hqaSNLrDXTq2NA8OrcmdSFYbSLifop2lhVdiaNzT3VIjxAE8zd/RSLG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327402; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbmXWlr0fqPWaDPkyXW4eVFPb6gCdD5BTO5iUxXpB7dL7DnptrbOCYiJ5aXDmrzYQs847VS8/Yl77xlttCR7OSsB+komWnfwx353ZQwwMjTcHxR6cJBj2CzerIikEgQ7inMKJ9YHnfWHCozHWojm4Mig2XtQ46uD5Tx2E/b6Ohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W50s/3to; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8ma6WjG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W50s/3to";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8ma6WjG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JSbd3628345
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=W50s/3toqVcpZ5Ad
	9LvlZgFauYpjQzpDm7D7Y0sdy9A2Cs8FzD4i59NAvmxV5dBLX84bQ0AL2WxeqSkj
	ZkgWnS4/960Qcd1T+OwYv6K1Q/OLbydaRx0x38D08NbeP+/j5cMpbdpwT7V8B53R
	jscgHTt2CDueZx8HquauNx7GPrjbNVZAcCGNT01aE8nQ1963/2h3AhRaslz92KoZ
	iNaoE3sP5hqWvQDpk+EXNwxTIUb7CtV+Pe+VNNfc/ntjJ5BghWa8RPkBr/p4Pq25
	rzjVkHKxIdxcTo1hq/LhZqgSNY7gaGEBqYyU3bKEE9+FRv+6jS2gTR5HrI4ZpwSJ
	NxktIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq38pcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:09:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so195689985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327396; x=1790932196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=I8ma6WjG2HgpnvxSc0uEB3SJLUN31itF/TRAl4tECFH3ei1mjyEqOYf39p5WjZvP4T
         MPYhx97FdcHX1LGq337w8OspIV6hnJ1uyTNRDEp+37viZ/H4loFwe6YUeL3aKi4sKGOg
         8/0PuiEB30vMBz0ZMTZZ/dw8ktirIvW/fH1Xj0/+Xqse2LePkM+bKw07qf//CpfkOIIJ
         yaxsEChDXUXZrkMuhkc/6ShMqQCn56vSleiVfqS+uOLR8AJNVaHxmr1MRd7cKu3Q9lHY
         nXPf+MR9sMtM8xSlp5nHjmPiA4oG3lVKtlS6EfTYRa4gNphNauu7E3TTRCkjvnXVVBuy
         Dtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327396; x=1790932196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=FRKk//z1JVA9NZ377HedxyoZdNtcXMwmOovTkjE2PP6k5+w5p9hwhBoP8wai8aYYq+
         cuLuykldqjoamvCfu7qHfNnV8+7LVzCh3QKthC5+VqxLv3OIqsMqfiR1ZFLmct3v+XjJ
         L3NgOtTZTL4XdndZwh/74+wsPoTgHYwiu6WrlRGAdMCus1vertag7fE7nx452MY5LQ+D
         nk5bykNDkUDc4VlTYVWoYwOtDPl/R4GtkrqNiRSxbg5B8h7J/SamNs5iwQln1OySzwGb
         K+CU7ILpNC6yqyzZFK5nsORFcvtApxj3/VfebKpTfw6JA0bfOCewnMbzPADfGgtszoLs
         ruVA==
X-Forwarded-Encrypted: i=1; AKwUvBzrMRnVKDOl5mN/9sEV8/P2t9uAtgOiZqGudGDWWxFTaWRUWJNoEWjRutgz1U+vEXW8ltAbQ8iFBXZcisg9@vger.kernel.org
X-Gm-Message-State: AFuF++lNaKFNx0fhvZS2lOq5HMs/NPW1x2ROjO8YVLvzDoVeVgoCy6sJ
	+tpQXK4cl3ppZgfUfy3MIXqRM7ZQ8ZnwNbUxSRmNZ3lJUr8teqBd1YXgRGu7rn7SgdmadY9Erh+
	hoA+AKM6GTaBtucjLTsVOVHmYhxdmqDr4lGYtmykYD4cP8mWEKfY9E7ku3qBqEdvmqH4v
X-Gm-Gg: AYBFou1QlQ6jsw7kcMzieK9m0Lee2jsInSaTJ3HeEy3YfSIlfDi6oyrb//8i8BLS8/w
	LAiDbqvxuN3RCFd8OTX2jUTHNzvkq+IyQrSiZ56M7sVxOceq1nLoXdTY61Jco+fLYLd+ruKwsIS
	ExK58c/+Y//yzzkxV0m1UutvH/ITUZvoRRVThpGx3pbXJkAV3iiHoB0b5w4IvQFVHAng7wWNOa7
	0jv0sKjzC1jQnGN+9lipST1h2ODql4KBYuYQFmuPzYKxCjlKr7/gVLxytLUDrVu7Sx18BjAZ78Q
	rmZxHphKYTTPqOvkCv4XKdf3HXyADNVzG/Bqs7LYbmUV6qzwgHTUTOSNWAGy6sNgpcjqu68wyE+
	3Ey0wSoFLOGoBn7ey+iXF1gGyF4Hdu2nDnjXP0dMERKRqmCn6CBXY4en1ElEwHBwqBvIKhee8lC
	k2Lh5+83iKzdMO/5YmGGaNvegty/sKsldxxqg3mO6Dr8ODWgEzqXg=
X-Received: by 2002:a05:620a:1d05:b0:93c:739:dd5c with SMTP id af79cd13be357-93c4738b2e3mr205796085a.25.1790327396026;
        Fri, 25 Sep 2026 02:09:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1d05:b0:93c:739:dd5c with SMTP id af79cd13be357-93c4738b2e3mr205791985a.25.1790327395548;
        Fri, 25 Sep 2026 02:09:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:54 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:49 +0200
Subject: [PATCH v10 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-2-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfXzM0Wj94BfDOy
 1Wwy8MhkH4QE2ycv3kEq1k4kxG8lk6Hic0S79MGffXK0AozcbXp4xVFVs4d7akJwMHxiqOXdAJ1
 fSKKjUCagfSv2dkn1JNFukcA+C0AN2M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfXwoheS6GhO1/c
 Oq4QrOsDCo0/4rgHpwr1T7/7lXU1FaKhtpAH50LQMH8noL9nJRRTYtCWYJdXn/mu3RFz8J5V1Iu
 SaitWuNZr2tSSzRINoueZ5GHdhbIPaZwLZzqm0ghdBsDX3xXZdGpq8tK5yg0Fb8pP+I3gR2iglZ
 4Jer+V1i9R5pQBbdbjnF11xSqh3TDSOLTiwSRgiq/0qnqHyyJvNEpvemS2/GVtnO3/+cYG4EYuY
 L4zvyBFIFBzXzIiv/rkTSepgG7M7gBbIC1rdor356XWvhQE1w6/TP+Ai+pFkrbq6prvwBHgU0F1
 LCaSCbPmEBS2Mt3Li/DdmZzm/E1u82tiNoJBqIoK/015jVaX1S4TBwqxcRsjdbhqMpKv31iDkB5
 O0x8JO0PiBprSlhFbJmdjacyrba6Mq/VJ00k6s1DEzKxO3GlWJFI2XefXMk4lRjkJSRPLk8b+2g
 LEShSFF2GYDThPWQ/UA==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab63a64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: AmAOlOCdFTu97I4WX9E-2gtnU4wBUwjl
X-Proofpoint-ORIG-GUID: AmAOlOCdFTu97I4WX9E-2gtnU4wBUwjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250036

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

