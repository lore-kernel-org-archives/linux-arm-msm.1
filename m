Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69447481FCF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398019; cv=none; b=VSoY/mGdPTN5iaXMrJ0L+r/mmv6peMWDjFhAJivfsYBBINW7WWZjDudBGOAqUWpYCG2UG6ViJiA+8LYPdYsOGuTz8A1akvNRr02UT2fNyXkM9wy4dMkCMFoIsWraAtxkIClB4NQFXNQyKWhIvf7CFSSfPIkdb/JTEx85eJmRz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398019; c=relaxed/simple;
	bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAvEWRDsLChci/zrbCqnR//sC2G7BBggkjV32sKLMgy4NIQmvIxxruQXdkyWAd8ycBb9tlODJXMunsuVOHfYE94M7pij0j19BJ0dtwRop6BYJXwVTgAg2xSXJWqBt3iqzx/IxvVIMOFKi9gWDYxdp6hnAaZ5wp8fsmYHTesibvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9nrs0NI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGueaIQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9nrs0NI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGueaIQ2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0gtv135519
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=; b=S9nrs0NII51EzlaS
	oPQDWtpnPaQQRLUIa8BGGsCw6DbMcjf6l2hropH0DVPM361GXEM7Bdfw8uKwdZot
	5dOgiLl6tw+aB+VWElqzrMmfCq1GH88Sa41UbYxNA0bYRzwTWYmxS93DiKmTotia
	mQ54DderMnj43hGaEWqkAwXXi3K/j6rpsGhQRXwbjH04nbzWP0BZhZza/lfcOIMp
	1pNrHYjjo47G5xuwQBxuKPBIzyWyFqSXimgw7Mm5av/gpzxNL3dG3wV6JYUqHGlv
	Nz6KPv8wCjTyjO36EN3wNZEWB3aExOdQV2sjiMZ7alXNteBk+XLP6itFWwR5O76z
	BZFdTQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq95ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3d832827so41687575ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398015; x=1790002815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=KGueaIQ28TLlrCw7oMSBaWfyw1ExxsYSRTlBZuANNKe4KaZZRRMhzrJ/GwSYNwRE6d
         +i6RLRUO608keZsPf+7Aio+XJoglUHTtoDQhqYucHvHElrNnqgbMQpQehIgNP820l8Im
         TCBLhVdBsgvaWsvg1q0Gst+1kRN9qFArcMcdb2gAg7ABcnhOtUtHhov+wHvfwmW0LePe
         7Iz0PxUHJ5gqn7yofX8vTy5TAQTDj8zr6A2wuXihbHGCAEMTDvaabIk/QvvBpxhIE8w4
         iNO73i2Teu+FpfVsmG6/tyXMusOXrWDipJPAvrj6tN3nL6GE6/tAlhun6LA9ApBMqUdj
         +G6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398015; x=1790002815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=D/rDHydV5kjvk1MYtezeu3nTtpU5as92ZZyc77hhD2wUwUc4XjSCHcjbzphsPSo5jS
         n5kDqiv3pxYwcrJqfOTylBrcJuN5REDBFDH8RzcZTr+nPAyuKUuA4rd9lRV+KgRuqK5x
         23pROEbsMTLlSwj68VB2dARsFLvg+NaB1DvVRGenUDSyGFEeQnsUVol8a3I9rKes2fDx
         nwNZi2boAqcG5K592B1h5E0XOflUDfKe4a2JFKrzD+P9vhZjpA+t9RwWh5J70kfPcG9K
         GhVF9tCidfYFzI5RrWL/UQ5BOxmsjo9mmFtYoRrNn5nELu7nfDLI6sjODNRRZqOB3lVq
         Wulg==
X-Forwarded-Encrypted: i=1; AKwUvBxxrc5Xx33MxHZEXXJLRr4aW9cWnKRz5JChCfygE0dt8RVb8BJcAhfx/2BvsqZoaqkLU+SgUpnw3r8d8uGa@vger.kernel.org
X-Gm-Message-State: AFuF++lVqJtSEfo4R0TUu6I223nqxTLu3dX+FJh4XBOVOwSHwKNDtSbK
	ZGd1EBsendIBUN/pklo0AXasTbSeeyl6OPx3FFgdcfTQVjz+hicth/jzKMaXb0IgJq2ey1yRpOA
	+nV5LqA0LaOlPaziLWzpBYNgLTlMJJRmTusSOjQTMf4YGfIchMFkOHFLgEcWAmwS/hsbX
X-Gm-Gg: AYBFou2FvaH5M5MQVTivzyhP35DWEl77PFUKMkWoX67H8+mxotSMKnYJ8u7oH3lTT6o
	X+dX1+ojNFiofC7pEGMkYnqwiDS5EVfyMYNgvQw67MoITKoo3vRM9GYm7iIl9y/SoQOTfTn1SL7
	WDUxFE8PXpUFiZGgW0cDqZbtMcnYqGZl1hXfgl3B6wrqmcwpFUjl4e+GVwuI6tnccp9SuXyEHs0
	2EXvFosZQ87Jba9AHVi2+lWKPnEhqkoWcbiJeCDvJj6ZX+suCkbA+DYsdZRopkK4PlKvbsUrAKj
	YWvgMS0xLLKpA7Udi5afjtPlxMFvFE/uDy2FSDVaGFWB4utmRvLqXOkw/LCcJXTbeeSw0savGph
	Uwt+D3D2Tw7JEriPdgi18MdaVPS7UTRIWHNkO
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64686485ad.21.1789398014856;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64684915ad.21.1789398014250;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:09 +0530
Subject: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=3255;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
 b=9f7VltXLt86w6F9+EGr8WWpUIDOdDKEqN7YWpUaS4nIV6sFJpeL13CNDFTmp4mRqRZO347vQt
 fCuknKj9CbwBQX5SYiQx+DzSwdtAWrzVzAFYgN2Gc7+Nd//a8CWe0qk
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX5AXlFBHkk+Eh
 9KS6aFeOxDvPda4q1YGVB91ENRzRRVVOgD/wDrRk5jOokmRqQ7SHKtdY/aWKgeJOGAuLmmyZFxn
 d37cHmDRQJmJAzXnPrW/aNxjriJyTTOJ+fT3MubzN0DGQajVPv6OC7ieNt74SHNPauT5qlvx2yd
 vb3vkGYbfxILbbU/dPXQHoxqqFADNiYBoxgeHuYGsUMGXYnP8ge+lKidLV4TcHWSRrApsVU1eVv
 A7YfnC2NJSwEoxY9XCZl3GqN3ng0Wal2jvklT6VKEjMUFeodTFJhsa5vigArmEzIwS1qI21SaFM
 DrzUXqMFxPoQiD/BSPUW2p1dLL5CPDUyHRWUn4FazX7w4f5qTtju9q4VNDfvd8UJJ1QPXyZi63S
 dVnVQC3jUcllJynkMDWqlHQAk13HcordKj0mJT5KLT3Y/C/Wo0G0s2znztt6YR2TTQKUoYyEJqk
 3fhHBGKX6wysMH2uVXQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa80bff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VHtpXdJELXZ9Nr0wy4oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: NIywPiR37zqAJ4-KIWAnLUJwDnRsWRZl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXw8AleIfzpruI
 8R2ULnP3Ova+LwVrXwVN6aZdhnS4KhqiqQzOvqQJSH3oAEvE8VznVnoxFpph4TUpOpFmHAKTsCe
 K9MwyulgpTGLCeCMDjGKYpxPt0H3bIE=
X-Proofpoint-GUID: NIywPiR37zqAJ4-KIWAnLUJwDnRsWRZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..8b6a28b81ed7 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,43 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0x80000000
+          - description:
+              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+          - description: arg3 (cookie_lo in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +174,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +306,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1

