Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953531;
	b=P/Iy/CgNjp57AZm9rHZzagCeGh1WjIs8P+Ya/HdgtxMN2PbbFV8lyzi92RretVl/L7nq
	 FrNSrZ8EO1pBwt4iMMauNeNAwOOrxJ5rOXDrTmUB7jF5JwVGJawPaAezRPjtp8Y+PB+0x
	 0W+hArVj/3WtFqM5CLi6KuQzThowBGXydBb7sQjc8qTgsr1thymRm5sg9uYDV6gWG9Tb8
	 F5C2LhjpmiF/SLW+I382uj87oxYOGVhLPnnUfGEpTxOFHi2lQ2VDVBdO8QXyVd5oPxNuH
	 5d+ypUGFhB2iRvkDJNosn9f3vkJBZn+uZI2E88K/H24EVaMxZQDXoVcHpS/kawMz2GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
	b=kTPqpoOIkD9vt9wtGAbePIp7Qtie6uZg+9HtIaoh78z96iaO429YmPEMjdOrqNsSD2xc
	 GZZis1CBe8pIA8r6Yk8Hd8pzJ95J1dmZIoBsc5QsAE/fSTUx/W2DXQ7Pp9Ew4pZZjl6Uu
	 ltGuc2owPd5ED3Ms8860pHV3w1f440eGVQRqLtdqygtZysLTYlzMywr2GUQhYdCXCDMH4
	 LuGODmHc9ichWxJUx9hYaXEmL8o7/XEFen/HHpc4gZ61xdS5uDkGmtMVnO5HmwFlM/AZm
	 0wgjuLli8WnhGnyDdta2WRbZAzUbK+cDR3ZOzdjjM71UY0jhj1soFaAytvuOOyKxj1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SnZnrjcJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H9A1NRFN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53A606A335
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F53A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SnZnrjcJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H9A1NRFN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RNSa2933638
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DGUYjHTjpo+
	IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=; b=SnZnrjcJH7gyC98opyIQcuwbE1U
	2CqP1qBUXXbPG+cOUi+67jiswCMjSFDKSyM6p134aUUd8hdQ06lIx6vu+e2370CJ
	sHCuDcPXEJFw7xQYmgJYMCuDcezHhj+ksHHCBttIgJjvxDXN+K/O/fev4Q5VUItR
	YzzVnweXdK/GpLQZiaYlYyCYC5/lCpCFaL4NidksoGCIp+1i/1iLBoLhrs1v7pyC
	Et2S5pUZxVaNUTp3GzzQ/Focl+boHzF3MgLnA6b/iTFLEIHblSHUC+0mEb2+vc8D
	C3WbTql67C1TQmlv3oZWbeBFqEH5Q9Cb+IkEr2HRHqoQC3ucRX01Kt3aXDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1ut0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:25:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso58496585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953528; x=1794558328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
        b=H9A1NRFNsWWmhVRZLJNS+r35fSR1kK4ugsL7Av3iTGpcplGwXa4kdOn01rRPixSqry
         DhHt1v1bJdLQZP0rdS8xyRYniio9DM3cd8ZqTbC+4t3QzlHckmOZ4aX8LhxagnRamVpq
         fkGhP5VKJDGMMszRGRmm1azanQQvJ6v9yejxsuMc+BCcLZduiO2rhKBNPoCT9aKSx5is
         jnj8IGUVzFbKy9Awu6qrhw9oOcGVJdqVV8ft9p5ZtB+lnrLc2WJQZCoMg6IFQDbIXF2Z
         OoR3IHLqJ3A9VWq1Ua+WlPFIbr3jwxpozRaF0xmO5mc3ES3tRofxR9YyGfjJP6BapK/G
         7trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953528; x=1794558328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
        b=GKqpr7fyoyPuFefvi5QPG9adpTJnTqyMWFsfgjjzvZ7s1DHjBJLv9+N1pxLFW1uuwc
         24W81smVVHA6sBX8K8ft2sPN/v7uDTgIHO4ikCSz1dQwGGWOuOrxTo0rO/yKKCypUDBM
         kHfgBgmqv74vsmxvZQ5tcHwCDH9sa1yn77TKU9oLv3eSXPisX6CVYTVCHg7YCxmwWpo+
         MHu4o5eo1GE0Vsk4szZddfFqiBa8lb8FIRe9ycDBQ0ZKv1A4K7A9GQhU4+bfUOm7wk62
         fMp03WlMFytEeyUMjus/+iDHomuZyTRJK5Bl5ZPSnSYdphmaXryXbOww5SdIWw0qAa+8
         J0Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwpoCHmYkJgpZEMjU7272cJdBZn0MRBwrjWiXo+ehYChPCTJuPKYsE8mMqILjyxBLPH1DaMzKGNQxd1RiZH@vger.kernel.org
X-Gm-Message-State: APuU4Z/jUgGXELsAHU8dZjqRA4o+Sega+oiA+HVRNUng6VE4lhtSLfMN
	X+drJSOjXwn2NUnaMqxiGD3xsVc2mJTH1Yvfw4Lr8r4mBtVzRIMG/Bv8eSsvo+RZwX7QisF43DF
	8mIkCGohVzt6pfGzHvttc/lyAF+K+9wPHAWTSI31fHTjiew3kMFT5Qj5n/RCGBmqNIMLd
X-Gm-Gg: AYBFou3uW+jm88fLwKsx4aSAduPiIw0GnlOh1+7WoHPWPyXMvMdd45fwP9P7KagyefD
	epoQeaF3auB7j//31kNv/O2TywFBvdPVrdxQOtBB39GslikVxeBz+2KDwozpoE2JpLdCJHwZTh8
	9cG/9/YZdKO9JVfw6SkBVvgDC/queTBKI7LBUVpa9Ps0W9X4xjxqG/UFbz+Zsjg/wb58CLlYxcJ
	rGXNZUQTT8XSALSmM10sDxTWGVlwWJEtMfuExElj83mgDXQOeyla6rzSTiRXVlatNH/QxPYUN/C
	WvF0KBEWANNKo+SwPX/2pqJpw8L+9rUHgsOVAcNHzfambMroTA8JAIDeYXyaHs/G/27u3RH6hIx
	GEz93pFUtedbQu9jD8oHxoPYb0BxJuesh/WJgANOgAH6VFY17XAHOYeT+80Vqbn/MAWcR9vMDiQ
	==
X-Received: by 2002:a05:620a:800a:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-945f3537d9fmr242644285a.66.1793953528368;
        Fri, 06 Nov 2026 00:25:28 -0800 (PST)
X-Received: by 2002:a05:620a:800a:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-945f3537d9fmr242641685a.66.1793953527874;
        Fri, 06 Nov 2026 00:25:27 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:27 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Fri,  6 Nov 2026 10:25:15 +0200
Message-Id: <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2Z6J1XbczxrRiOLSTruLYf8LXMYgBSeg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXwLwqcKQMcLOf
 85qF5ystEytvM18BAaTAVOLbCuzIZBlUZI0Yk/QCpCZRc/5FRiV6ZEf1r4XFZY+cdO0sRV8Mu+K
 MlZ27Upyutf0OsSRt1qvC4em/NlCsElSfPipXOtL1ODj1JEG1JC2MUNz9O+crO0Lcr+qb8G7kRf
 lUF1Xkw2uZsWrNiZphTly+NCax+GNgLuaAsqVbI5mMBLVH9Atx7822gAwh1pDo+mkq/V86kvxCY
 N1mQqzLmnwy8zoFKkKyNYuruaEE3ot3lG7HD/P/FapeGUo3lgttARYj/BXCwVeck1U/Xy5nw/Ro
 xoyWfMb4tq9Fz9BUvUMqKcIN5ezzZv1jrYGeaH/SCK4nwo3MyGdPnUHovJeLaXrclU0sT1rHkPk
 v8fG17QBLgbQkzC1QuQ84E5gUJQECzyiOO6ILnZLXEc6IGcYQ/svvE91SY4s1eanPbGGLFZPhaO
 DTQC8p8HnrJtsAVIgUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXzTB6/gjuNis3
 9z6JrZarOFIrGbxZ/emw15Rh/Hz/cy7E35kBtVvtNxAWUDFcBBvbpSB8Ck7sq3w/tDD6K/XwF8z
 HGOU2SN1M6Z5X+LI7vJIkYIri6Tb8B8=
X-Proofpoint-ORIG-GUID: 2Z6J1XbczxrRiOLSTruLYf8LXMYgBSeg
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed8ef9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=oIy0nRtpyz8z5AVKuhcA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domains, IOMMU stream, and interconnect path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 0000000000000..86b17575600c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,193 @@
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
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-jpeg-enc
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
+      - const: bus
+      - const: config
+      - const: cpas
+      - const: camnoc_axi
+      - const: camnoc_axi_src
+      - const: core
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    maxItems: 3
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: camnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware.
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
+  - power-domain-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - operating-points-v2
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: MX power domain
+            - description: MMCX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: mx
+            - const: mmcx
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
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
+        power-domains = <&camcc TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "titan_top", "mx", "mmcx";
+
+        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "bus",
+                      "config",
+                      "cpas",
+                      "camnoc_axi",
+                      "camnoc_axi_src",
+                      "core";
+
+        interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+        interconnect-names = "camnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <100000000>;
+                opp-peak-kBps = <262560>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                opp-peak-kBps = <524760>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-peak-kBps = <978600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <480000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };
-- 
2.34.1

