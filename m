Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA51E3F8EC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227161; cv=none; b=BsdmGrRTculpkRoAPaUgQQgAQUFqcdm2P6akxSV4bcWrXQ1OzZ4UWiCsh+QwT6+BFY2Tbeey+W/mLhd/oD3YDXbk2/9p8pqBtLmieDVF6lFbjzoZVXC9L/gSJQdAqS3nuq6KTvnATbRtBcIKYwfDsYo8wCuPyGWP1P/+AXS1c7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227161; c=relaxed/simple;
	bh=6evu3aesdSZyxyQpr8UnWBSTusJ88s7x832RblxrRpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rBhK0Vs+6f5sLPQYQj7aaPraslO+xBvVmbgXuaZniYBxGHvERXlCLSrkWBqDThkVYwx/5zaxGVrWZEE5hhkLE0n13lcvcSRqJamjk1mXV1hvgMEooWX+K1DKr5GhIRV6rF771njf59BhIXMMWMZCJttHhre0SgKiniIkNPOF+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OapyYx5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1ABVFBo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OapyYx5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1ABVFBo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82AML2358479
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SPz7u/BMzMP
	ZviDAEkDgcv8666LLO11YQMLJEjnTIYI=; b=OapyYx5QpMQ/B9k3Mm1qFF30DU8
	wDcFXCsfZuS2mJl35orLQpfy0iYiHGaVfbIrIekxsZh1nMYPUI2c/RSigfr0J/mJ
	lkGhSLif6FCE1GuKw0U2fMs+5/xh8VRV4/1tlEFLqDfg6JWo/SvF5eoieQZXiYnX
	nq743W+hIA0XJuzE/AIjTDCKHVNyP6mkkBxJ4MGC5ymB2gGezx7ZXAXNJHHoIFmS
	5Nfl33LuvyhhDFPCBhERP7Y0sU8cOotFNQg4SYwEZjtmXOGQEwN8G6kL1hmE1bpV
	1TqOuzu9yEk45l2YRZvXT1Zw0jWPk06k298bJYZibnBk7ESG1BlL0f2G5bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y0xku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:25:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso13289051cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785227158; x=1785831958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPz7u/BMzMPZviDAEkDgcv8666LLO11YQMLJEjnTIYI=;
        b=D1ABVFBobCKxwYS7bC4AK6QbQRB3sSwBJskSSvQzdOOubratft6/KLAbuRInbWE/AE
         tRRQfU2FVwSoBxsDaO9iKNhbXVeOlO/jjw291UjcGnerxQVt2gf1llzxovnV7F496Ao5
         EsuEqqbI5DuJ7BrUsQgDrFgcnlGfi4EBBWM1Nibe08ZHuODtxzFMJM+6VM7BERcuvj1U
         6Z4H2xz5VmNMkz2xsprJzfVVDkrwHoIVnU+YqZHi93kJdbv0pfB5951oGI+fjs7zd+fR
         8ToBgjVw2ITq2UQS5gi3DRSF/j0HTw4lEqSXWLkwllsntoUJSv25kSazuIMYpXKWVXjs
         rh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227158; x=1785831958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPz7u/BMzMPZviDAEkDgcv8666LLO11YQMLJEjnTIYI=;
        b=sS7al+DrCh/MDcHYnZiOTS6OCB16YWiOh3oylzYN/M3pJJcf72EXPpGSgnaPRc0pfK
         M+bfPffIulI/mM3PqOZx4bp6Z9F2B+1DWFvzQVvkXxxZudmrHewcSVNZDLw4pk/7LAzc
         O6M/SzQpDi1wy3tX7jkOi8yrT9TrQcVusV7ATxvmicNuKr+9kOksEyPvHYrOKXyeXxLd
         rOpE55FuJqaRUqM1Xv5K3Re0gh7VYBZTKR++ikoAEpd645QwOE1cL1a7rOB7apWbfr/n
         siS1EloetSFMpuSgXgUGipuMVlBQYiUtYjBkSRcFX+n0Afjzq2cfvcDlEA+HMgYiP32b
         IhWA==
X-Forwarded-Encrypted: i=1; AHgh+RpCL+VpI7bKIEnB2ec9p9T6SZZnma9bo4zMToFWw3CIaQo4wAHMfhb0WE7BACSkkEQWAKlf3a/MCy0Sj3q/@vger.kernel.org
X-Gm-Message-State: AOJu0YyFwNiY0cRHxYLCaxgxzJwqbAS+j0WnCh5Kh+qryej3fudppeUf
	dydyLxS7VEVughc2WGnb5E44e3KNVRQqQZcTkB8L1rbKpZSbEgvDYSZ6I5lsmhd0yABpP20qdYD
	yIiF+OH2RwY5L+TuhtJZc2Dk3psBESqlksvZ792WyYxnkkdgReu3eTbigVeBkLSBRHC4S
X-Gm-Gg: AR+sD11MihqsMM58/atiHyEg/SK27K987nQb+3cdCDwy5Mo3XTS7ytus5PHdCoy8zWp
	O0b4dTvUbknaI9/uBf2G3VnC6BN/qopZB5VGJ6l+dG1f9fuqjYZCZMCQsBX75TQCOPTRDRPWF5P
	Z8GfMBTt0/cq+H7Zul6QyoCXrnEy4mRLBhW/g2tfibxoRNUlFRp+MoiCe6ghWz4uf/vAyf4jQM9
	W7cNaRMj8lOjYvCp+27GOV3KklZ8oC19p521yyL2SSoWWEQxJseDMfiNtSsf57pHA6bwBXsCY5A
	8iVJHVSuqY1/AiFTcvN0dwfJqj2PsM9B8FZp3ae9J9rLnP2rP+cRY1Hk/E+q4F14rzzlCCFT553
	ftkBLJlNTB2I/eMKRGSlNnIGg
X-Received: by 2002:a05:622a:1805:b0:51f:798:cf27 with SMTP id d75a77b69052e-529d714ac4fmr9810111cf.67.1785227157941;
        Tue, 28 Jul 2026 01:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1805:b0:51f:798:cf27 with SMTP id d75a77b69052e-529d714ac4fmr9809781cf.67.1785227157353;
        Tue, 28 Jul 2026 01:25:57 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm3585484a12.15.2026.07.28.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:25:56 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 28 Jul 2026 11:25:46 +0300
Message-Id: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a686796 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfXyFURe4sqiAwT
 v6X0QL+Mrlr1/mFQgLm08cOp06jOXHpa5nd1I7F3oMsB1NjK6gHOTua0oq/V01yrXnjIAO3qvGj
 TbExf+TWx5Sj1/kjVScyB5SIuwKxZrc=
X-Proofpoint-ORIG-GUID: GuecMx6oE-gClCBrGqNXCqP1q_jFN32r
X-Proofpoint-GUID: GuecMx6oE-gClCBrGqNXCqP1q_jFN32r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfX2yhcLSHOzuJf
 fVtOV8XHsTSEY2Suyg+tizoXvj9ULlO2yVpulqESppj36is6cK8nLgYol2LrdPQ/q/LOr/PxfA7
 EqnabfBCWCCLxW/5tdK9NJJ2tTR2KzB91J7u1MxHa4C4MtsCzUrTw8B1JS4IuaqBmSi77d0mXfH
 f9dkbAo8wbMypnXr6tddFECtwFUA132heu11lN8jj3a0g4WKeoX0squ2lCEib1RQD5RLwCEUa/b
 IchUHPMfCqEY7U4Fc9FjIxqm8s/FAaXaqwNIyIFFM6XBw89jvYvlyWwKIY3xUv5vIsOwG95v96O
 tZcgJRhabajqTSu2w41NYMUNQEiIOChdjDmFjeI14ieEmguz7d7vpflhGxuGVQtAVNW4QRk0JIu
 M8ANkkmlWEq5YBfrkK8qr4fYm4A8XJf3kdWMlAkU2bjhAmuQ+KJ6pB7BNoG/XfnS5dlPkXPkNpL
 bambSJfHY6zQq1O+WVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280071

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 000000000000..6aa2613bbf3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+  - Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jpeg-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: hf_axi
+      - const: sf_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cnoc_axi
+      - const: jpeg
+
+  power-domains:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: hf-mnoc
+      - const: sf-mnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
+      for the JPEG core engine on SM8250.
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - interconnects
+  - interconnect-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jpeg-enc";
+        reg = <0x0ac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc TITAN_TOP_GDSC>;
+
+        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "hf_axi",
+                      "sf_axi",
+                      "core_ahb",
+                      "cpas_ahb",
+                      "cnoc_axi",
+                      "jpeg";
+
+        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "hf-mnoc",
+                             "sf-mnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <100000000>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <400000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <480000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <600000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
-- 
2.34.1

