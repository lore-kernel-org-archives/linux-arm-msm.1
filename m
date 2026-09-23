Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016438B7CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179237; cv=none; b=U1CZYlmGt5vSMxid7WB0aU7DNJNe1Z+pGcicaiTHNTUVF+Q/5ihv98diwAaKLwLUhQvXuHz36h/GDoNMTmR6K0WYzm7jZuE56VktgRD85oLrZZ0utbNxyo0WlBkeA83BBsBRLMvrzwZkPIcOdGPBiNzJUDqw8tSjGiWYtICLKcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179237; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G34bB5XtmX7aBfI+eLn5oQPazm558oyjZbDAZbqicoCUhLRkXca2/LsYmvmIUowQ4c1Tg9K3gDJ8AoXTYBz5KzhrjLYuM5OJ+lvzxPKYJaUp/aZf639HzasJ9LBQ0umX+idU5nH2UwBEpCKV6u5PuEC9qFiBS7vEMqeir/DgbAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVMi0vfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJQkZeDl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVMi0vfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJQkZeDl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDM6mI3842962
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=SVMi0vfpY6ftJGib
	Whf6TEHNuVhV8IJYYsM/inzioIIOF7WeZkw7gsOnAjM3iu5C9DKb645316JYMJxO
	kRptwVMxGyUbdqH6YGtSRx9qGZVp+dPYZOPNfgODKXMbM3tSx0vZtOfm0Odxm7Ak
	8XC4pGt5OVLHZSijuDMiIdXjKYtnQXFBSRs8cuh52CGuxQmNo7YLPZ0oyA0qTyMA
	tpoLYwGWAuttawCw71QKwtinjTGZ+0trXXzrUM2KhmZNl81zTBHAcASxfa4h0UwD
	ZSFRYFySCmA5aClXvKC6MvmNXabBZauDxujWonNQUnj1l6+x9bBFdtF2qzyzUPPC
	/WmUIg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbgqh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:00:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c83007a11cso447036e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179234; x=1790784034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=LJQkZeDln5792RIVfy9e38uduykeF6rT5/bgsPcaNUVQa7oMv9+0p6nl6ng3n1+yC1
         La6XhlW9j2trrQZaDZdnAliumARSNm5Uptptju76lXbdOVQbWLoJGBZECS0l77Ofdu+2
         GvIhBJK8jBTDYOyXAs7tv2XvoPaVAIN0xuKLPwl6mBsYoTyyxY50Vx1XGjRd02iL/ylt
         k3LM5dNww4Lcx5E7TOR5shks2w1leFxpUR9y9AejaM41454KcTQt8MAFw6eMuu3/svxd
         w6PJNxbfxnCXyWRDqBBiEh8bbeHx76iqZmRpyqTsMwz5iW2KTmH4wgItSRMZCYEEv1AF
         81zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179234; x=1790784034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=saHxF60+ZxjAa4YrSSi/uuN8EjsCVpSlgg3r3WzzwzrNVBW+IB8/kGfqFV6KumUgNx
         zE3dQS6CTWWzEkaMAp0u8R4Y6A5KbpfC4ERZBAmURWtI+b9apoPa9gptfPaQwWrhY6R4
         j/FJUbHTAJ48QZuRALwQAgxnaI7X/i0eNz9ZSKRo0mEiBouUqYnzGUBfWSxfcxv/IZzG
         4OFN52aInS0XAlgarZ5rYqJE2uabmDQ5oNIuaoJ5rIU9cnl6ml7KoJE7hf0KVaRuKV1s
         4CFwNvyhwyLzcQI74HAHWEIt7ziH24ZSqhKokRYWXWDHiLbRVMvWgjjesMR1PFurCw6W
         B0QA==
X-Forwarded-Encrypted: i=1; AKwUvBxNLmTKIDziuUqOunBLvaoSuh/sJR2Fm04XwiOhhiay5lDV5Ilq8/B0i3XbAwp7JXdDVF0KqBPUD6ZWJCF3@vger.kernel.org
X-Gm-Message-State: AFuF++mAS0sdVjQ1ldUqV9CvMUZ2/AMJg+2QqTsifqb2XzF+muKB3xGY
	mFg9UvMsBFmCPmQv47LJSl3quRTPPOSNzHtUGw2zmfu8DRDX6xZo9e9LpVdVUJ+jcEjonnJN+oo
	eMdDA39XrLJGuRgJwNKCBPROdID/nz7GEryUaPiK0lwR0p8XRw9gye+yo2QDLu4m8cmSs
X-Gm-Gg: AYBFou1wGQzXGjwvXgB22W/3+FN0knfgQm3p4sMCQLoKL/b7iba/SR75GlJgkBH2H9+
	7/mnS1q6GJoyBG/zVfNwNVPZn28OMRnLZ8s04W5vQGJVBt8Fu/t7mVIz0ndWCYC3gByAV4TXUcg
	sTXZozX/NyBTuy7FIMIhWfM9aH1RHJno5DYzUvYCR3Jo9UKJSjz+tQhYzD1tKBQWw6xAMIzTO4v
	JpZbI4u6F5R6THpKlQID3MVDIeUaY9O5uiztssYaH5XnMW49MMw2MXUIrbQOvk9ZFpFeDuifjsv
	CUu37CwLHeycL2T/jH4Bflb/LRYxuiWbhuRX2r2MagsWkBdcsGo0r4+5hrz1cCZ4gOV5QcW+cpd
	Z1Po8Y6v4qSuRDpuFwf4DmejbVGielk1/NePD5JF1eka+Jp1amTLys8xzV3qILfSU/p5cITUJbR
	byvn6E0DnNyrHlWyZjX3mcTu3/8S8O2YIjBbm41qeBtcArF0EfSM4=
X-Received: by 2002:a05:6122:3a14:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5c9f16bb4e2mr3557588e0c.22.1790179233712;
        Wed, 23 Sep 2026 09:00:33 -0700 (PDT)
X-Received: by 2002:a05:6122:3a14:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5c9f16bb4e2mr3557461e0c.22.1790179233095;
        Wed, 23 Sep 2026 09:00:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:23 +0200
Subject: [PATCH v9 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-2-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX0PrM5f4kdWP2
 aFsV6smkKQXnpRdXJdbOadztpw3NHTqGrZ9eHzgrdAOINbHnc96NoGlBCvE0/JMH3UCLTPYReW2
 B4xOj6WrUmgNIZH2wX9miGmLzsnZqPE=
X-Proofpoint-GUID: uaOcoRBa5Ws5YEVUdXpy0s2MUTdIqpxL
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3f7a2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX/JU4wJs4h7LS
 9qn+Yp9S6GzIvBjl+ABguHObM18205moJSo3T4JgaWNtEgudUVWXcO71INBk5UdpwLouFmzrMpM
 m2yhpFR7kfYtByvzEaxBbzlkBrCvz7CjnTQTC4rX6EG0IGWIsGTf+5EudbvCkhJVyWxIaaUpc66
 WTeqB6qh5Cdx/KB45QqIUkoeLBcXsHo2PzGn2B+Yhsw73I+lKPLDYvBJ8U54LG9BtEW6MvITOGH
 0bFyDqm230zmwuMTvqXIhhw7Ugdz33piL6MUWTgsdo7vzwd6RCxva7NxEOJL2pyzzpcMFRG8jWO
 sxRiLBMJ+TnafZWeelwTp1SuUilG666Hj6JhslvSQzqFAEtN8maXeUiCt0VbNCs+OLj1Gwa9E5T
 HAQAVvDDwY7WnxNiP9P9M7gftt1uYk9a8SpbOAIfn2zKSYWHdH66quXcPq2V3Qz7GKawTM0NEGf
 U2dm6HWlkYbWIijFsVA==
X-Proofpoint-ORIG-GUID: uaOcoRBa5Ws5YEVUdXpy0s2MUTdIqpxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063

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

