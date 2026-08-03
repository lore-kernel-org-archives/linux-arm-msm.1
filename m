Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6795381E98
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750338; cv=none; b=iSt73mP2stByZpiTQYLqGfmntDIOpGkwsGX8Oeh2lwN9cysQT0MCikcVi6yuZAwMdXeeQpaiOklGpJN0+4JGd9lL8akjbA1CE0FdjkJ+9XPp9Dwbhh3ZknqgaNXbG3GKONnUB65Qzrv3PGgxugv9955jX7VfXS0UjM89ZE06Wqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750338; c=relaxed/simple;
	bh=jx181RVT+Xa3QJe2eg0re3HefIe2r4k0bcdeIdeVIYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VnqPIHzyIY+i4y2UEDYG+paQraILCqQzPou1tmx3j1yKV/deON+9kHu2njTFSi21QG3if1wHgK1tJnqXLtBQk57WcoGVVXlJbUGdg/KPaN5/WIo3PIR2CIC5eJ95EKJkNRi+bY34nVPt/sFpDyr/p1fFTDZUMbe2298ElGdMKIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLhBfX3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TmpXWA4Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLhBfX3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TmpXWA4Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736sYI93790798
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yv45iK+EJbGOlrtao0TiTSTpdAWP/+S9LANR6C5Wz5c=; b=CLhBfX3AmtRTNkLt
	iIde/hqO/gts/Wqk2Mg8iV4Yoo4OYdP9JTLto7pabGM7TDY6G33LADCMuTL4TL+K
	9ci8OpngdrQyJqhnkhzlCEOqSyf18HQ5IIwFZhHpcauoSlPNdp4DxX7ntJimVTw7
	/MvxD0bYNzZRCyBbKGvG4A00iUXCUvZ8+gfLpXPn9vG/2eNDeKNzvp0CA0BILxYZ
	totClmRlREic6+ovDIMAluL/Wdz+m/k6pRTSqQdFbYZ8fQhgkekboSazWf2jgw19
	Kfh7oqzMALT82IpI+90f7QKG3KlqdU+mMK/OXk6K/ew3r7fzalDuhBehE+ExBjYL
	BdRiIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r0sfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:45:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so5214093a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750334; x=1786355134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yv45iK+EJbGOlrtao0TiTSTpdAWP/+S9LANR6C5Wz5c=;
        b=TmpXWA4ZRYFg1gRi7rWr/92rV5KsD/rex0wwSlCimiWnofLsyOEGQFgZ90eWrILkzP
         mrIsNpyElcm9o7xyhZcTVYvK0wC71PtJKb4jPDmj8vvY8jeyRTLnLvVTL78yLDvqlwXP
         Xo45e289/nFqXt1EZNyqo+lGZRg8MeA1UPD4qgMNxbs4r+75t1o3/GqITKYwjaxqEjM7
         /QEZSj626VRrLNGzZzTz3Er8ewOG1BRYE/e1pPZkqxdE8PJhBVD4PU83/6A9CTmaHrj7
         6C8azcpj4TDm3tZFTB11FDy29gt6tjls8WUbsHoHeZ/xGczCFMLJLaiT7Z/ng7JlOo8m
         OiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750334; x=1786355134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yv45iK+EJbGOlrtao0TiTSTpdAWP/+S9LANR6C5Wz5c=;
        b=Qt2Scv9mBfxg2WgFbl6HJqPa7bj1mDOasQZO6W1ZvGqDJk1UJ9ml7gBYeChsuw2rlx
         BypA1K06LCKE6Vnj9P3glVdLWgSjkAysQjIyIhqWEFdVW6N+HukGPXXPaq7mg/0/zZdR
         htSxEBrN+HgFP1JcSjPPdYWyzh7rqd3IR13Bg3Ud0V7ybIBqI3VrNGkkpOznt3Dpn23a
         oVLB8q2ZqiCzFikYhiYhMw/FeWNWlyeh9kJL4UOmzKnJATgwxJbtRJVotB34XivBtm52
         uL3Fma+zbTopuD9zlkSX12a2Wb4nItElz0vJFMDje9p4F0fRL7/Ihh1dZoLM6QCFWtxn
         AhqA==
X-Forwarded-Encrypted: i=1; AHgh+RpVqvngZYnSKc7STlsBSP85DGEo/yhSaYCrYpbRL4lU1P1pJEwJFV0GaAuy3PCMgETInMvf/fbYb3cypPFF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn22f+zKZIhg6T2jsubdXIJwIjHH4uUp5umYF++KsSBR+V2J6k
	bgSAUceHsM8yHof9htzA4+KiS41D/bi6yeiBZmZxLk2IvI4Z/UbcVNEkbf3yIg7Lxpb7Y774lq9
	PRx3dH3JB6689UN9rwyOs3q0PePYiOZoYFjuP+4vJ/d8oCGhLUXHgLlq0txLCChkjM73k
X-Gm-Gg: AR+sD12s6OCNeFSVP5eK7Kv0l5ATnLW6O6rZ7VHJ3nfs1aHm8XOJe/HsEYDkorVWqg1
	XY0XuDSdn31L407L34qSFX64s1+PTicvQDTaHV/NyYThWCJhv7350uJ0Tk5UShehzeKeIzMrOg6
	cxq3YNYk3Z3BTbB/pJpEYX3cH/dMU3+eAdvLnE+bM1znu5wW1B+PiDWDlOUvw6kkQBaMmSZADRI
	SZbu98rsan0BKS4gzuSTfw9fsGMhiJuLxqxBsrXEb4SZqJDGJ0BemOifXEg9TLViiWAJA79i0nP
	rzhwErbe0Am+sov1xq1OY9BwvbJxgyEFbOxnkEwhpMHH7fNUEHvklzUR+7QQKDjHyFVDpn4hNWf
	orekcSWViBo8wmX1a45L0fwQwLZ87W+CI6rvv
X-Received: by 2002:a17:90b:3c4a:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38fbc579dd9mr8679795a91.34.1785750334572;
        Mon, 03 Aug 2026 02:45:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4a:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38fbc579dd9mr8679766a91.34.1785750334150;
        Mon, 03 Aug 2026 02:45:34 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:33 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:36 +0530
Subject: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=3217;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jx181RVT+Xa3QJe2eg0re3HefIe2r4k0bcdeIdeVIYk=;
 b=ZUjomEzxGruYUFbeJModicvv9K3qeDt+KCUFH3eB+ladIDrsKzjpKb5KbaPCEB6A/khOSHHtP
 VPUuqmEgLKlAAJBPJ9GFsYbZlfmyR95GIt/pHlobN6539b7mgJz2slj
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a70633f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7Vk81bxoM4tuurpRRsYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: RHk3gueqkZM0Bsqg_V1ueF7FbZAqWykS
X-Proofpoint-GUID: RHk3gueqkZM0Bsqg_V1ueF7FbZAqWykS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX6Zk+5tiNjnVy
 0KmDMV6iUeB8GFj2onmgD3E3TpIiE6I5W3nBOA4xB1zBCOjal8qucV9xEgg7+M4jsgTvClLLXu/
 g4i4tlZ940EXNlgtodqt7dAA2MGaxJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXxPm0tO6aE8Ox
 flCAUieoWWlbxGFHgZwzIBTIzdn+TZ/r8eTswxduZNdldBX0bqprjluAfLiXeMw0tbLQZSM4cwZ
 tnsVne0h2SPOWlm5ALQiQPj7ggHEq5hLDipuMMQnxcE9deqaq//3/vrH/ZT0nMJAfnwQJlkH1mH
 mtR4yGxWo98z/Q+0zCS6x8PlJ/uosRi23jm5zq78Lc7tLIeA0bIS59Z0b44flVi3lWxNypNN9qY
 BDjp4TTpksdhIFLmpdWxf2EtqR/M4ugYRQSe1QWxRcXbSxjUz4ZBGOXfNiWLjn9q8J5IyBM915Q
 9qnjBMuq3vm0oWEDqPQKEPZc2CnurxgODNWMDC12P8qX3IePthUaTgkzJRNTliIKvnAsKLPYgpC
 IAJRHoYOVvhgAUk+qXrbv4IaFdKhnP4jctFjlDhlpoXSIouCKOspVgL12wLZAd42/gI25A8s+ml
 jf0fEDZ+KGWYI50F35w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841..7d6a86690a2e 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,41 @@ properties:
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
+        minItems: 1
+        maxItems: 3
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+          - description: arg3 (cookie_lo in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
+          where:
+          - arg1 is reset_type and must be >= 0x80000000.
+          - In 2-cell form, arg2 is lower 32 bits of cookie.
+          - In 3-cell form, arg2 is high 32 bits of cookie
+            and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +172,15 @@ allOf:
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
 
@@ -260,4 +304,18 @@ examples:
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

