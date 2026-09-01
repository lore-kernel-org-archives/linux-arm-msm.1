Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8036047A89B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258521; cv=none; b=g8QXWxUktvnmwBBthm/WzMAQvVQXu54GNSba+kp3TNpJNA8amzy8eIpD5ubcHX4BxRcA+/x0ekJ6Whfi6wRWACNofFICBF2vP44LKHnrMsBroWTU2aRrMglr5+htGvu1g41GKd3V+b/OOU/tws6uapVi2gdnEKR6zcx3gLChR80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258521; c=relaxed/simple;
	bh=uC4tlxNT0031iIQM4TBQvwl6KchLCfjKxw65OYMFJmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKu6k1bxE6JESccnJYNNRV/bk5rdaK4U770R+aByHKdKY9nHnLnyV9Py1Q4kCwbtOnPplFSeAnPy/c0MP1wrc7QY1llqwALoFt35Bykdi3FcqOljliOds1Zgl9nzR9b+DdUYZpxDvXNJh/LBm9wB6xBmpAnCUESubRMOnJlf+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lO0eEIBe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dko2Pk72; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lO0eEIBe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dko2Pk72"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCGK3406516
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 10:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=; b=lO0eEIBe6OBsLhDq
	oFlfn1bn+3vHER7hJWc1vb0lxk0yt6VfbS7LrYcNxX8mEMrBZCKN/8ufWwKbKGCX
	VqLYMJBjn3W0W29Q7jxVAQIo+7zmqdJlMdZuR3srCZPFER4W4qLDgdm4A57NBkrT
	BLKIgIfU+xx0mNwYo2YfsyJh3rJU3Rin7iEQOuup7OdDFWRVZ1q9QDgay76kl8/T
	0MeUgV0wmStJCxlAPzu/JVfSgOVX1c/v8c0OmvsJN2m2x9IEKUMtCdSX+l+IMUPc
	/wUPsxjFPbglyOfitVOuRgjeeqMwuvC7LFuW1RUe8O1OYGR9WoeTzYaLMpnZVFAp
	PKSOSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0ynr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:28:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso184687085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258519; x=1788863319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=;
        b=Dko2Pk72qDUWt2aUBW/YxN8xBBEXipsh76+A61P8mkMVpoMomHIcBxDjpxwODMKGp+
         yYWlEYb4voKX2h1VHOcsO5ZK1cwJuoR2eeznTvTxaCpb56cfuCTal72LBk+mMTeQINTi
         71zwYLLLK3WZVeolXMJmy4m0hvOx5cBefvoxhbzedDVudoN1nmE3P4fL1dy4huxwKYT3
         v7PoEJ0HB6n04AgP7VhRnOnSBxMYAjcXFbM+RiLLUKkyLR2wCShRPiS+vXvZ6cLE2n4S
         zTEeWfl8rNaG4khm4sn/QAvXQdUpQ8wamwt5Boi38AJ1C+IUS5iOBwihSfF3rrI2Kx7n
         XPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258519; x=1788863319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=;
        b=Od2PePH1dupNNwZ7jhz3lxaLJQl9VrGF89MDGFt5qY3xGCyLwX0ix4M2D5eFkf4j7F
         kts8rzfdtzEkyPzzd6j2DnIZQyzhJzR2sa60VFgag9QiheVG/GWV0Lp/7at/LULf3aeT
         txFuyo+VSNWGv65IvL3mr2RorWxQ2F/ug2jnRWaEPLW+OrLwXhGmUwYPcwN3nlbq07xI
         dxRb4MCEzYxlNF1+Ox1EuN1XA4f4r170MxNv8HkzE8+L8iFvIeztiyqTSA+BXokzxSYv
         gojsB2bzkGepyxL+medMap+y85+FkXViX2XRst0xvfHnrhAr4GGb0WxHG2ea3cg7NApL
         eWDw==
X-Forwarded-Encrypted: i=1; AHgh+RocLHoSoP3R0Rfmn0fZpt54bSHTeJUmqQoe/zKFEi9yLfsZuQoMGANk1J0R/u5F524jN+OX24gCHcJePhc+@vger.kernel.org
X-Gm-Message-State: AFuF++mgX/+pkb6Gq5xL006YqGuhMhOGD/xk6fE3+49Q5b4gCLR4rYw5
	qrUF9tyWlQoj7fPgjyEcC81i1ZXiCCQCiNdZynul6gosaYjvVtI7WmvQ2l1116P7sqTAH77Bhrk
	isS27idx1EWiIvoQed/PUpCf7nMz2sXk3MOfaZJ7oWqiOMO/DeoK5IKepUj+1cuTPH610
X-Gm-Gg: AR+sD13Pd0jOVzEQHnT0o9sBBJYveVrASvDwuhKhaEVNsAnXLvx4LD9BznbaXQDmKtW
	PUUHmu/BfAUs//HZTeP6RXs+USL1ru2izCy/iVFthhqBUaX/DCJPXYT6DayEAShf03QdRrVx/1B
	Y/FMUY/uYk8ZAorKMfqvgRI5WvQAqowSKpUm8tpbV6SIDZ6Rrqa+aR4US6IiRMXelVfzvze5mTs
	4mmfxoaFlRrl1eAxgpVEEKbJcivc4gLx/hk2iI+cUTKq1Kg2TQfODI+cNSOxv0jLgvrzSX0ufRc
	4rs6pb5R/Tm4xrbbjPK9Cd295wiYpvm0uKaLRGOJC0Te3ExIv69ZRR7cOya7iAurbHiSYywKOt5
	Moy64HA898W4qbw==
X-Received: by 2002:a05:620a:2916:b0:939:1786:435c with SMTP id af79cd13be357-93947f8061amr770005785a.6.1788258518802;
        Tue, 01 Sep 2026 03:28:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2916:b0:939:1786:435c with SMTP id af79cd13be357-93947f8061amr770003385a.6.1788258518356;
        Tue, 01 Sep 2026 03:28:38 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce164bcsm55860125e9.7.2026.09.01.03.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:28:37 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 12:27:53 +0200
Subject: [PATCH 1/5] dt-bindings: PCI: toshiba,tc9563: document embedded
 GPIO controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-pci-tc9563-aux-v1-1-dd9b80738e70@oss.qualcomm.com>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX2rAdmwP1AS8H
 +EAA37lFspDtvARFgJ+TryQ1Voqdv6N85sd7qFy0NMUY05PBoEwWtevgqeXO0/gEhXF2dMKp7cw
 icHehuog6H8yaN+ERGpuAq9BDf9awobmC+iGYttx/Di16UiovOFyOzVITRDjqoiOhs/yDCE6yUb
 0I8A+Y7TKx2vg+/8oFVCjzdnBbVcavVeXTIsP0lwlb1fkr5e4EhSRxTa8h46tvUCq7zqZzDtyCS
 03IjbdnrxbchRrV1dyfoezsQQ6Ih7BmPthdB2uTq0Yv/VUx+WeTVpOFl9nuaYxwlL4bm/JQZ1nd
 mUWzg2gFrN4Z0fzhgoeg61FyU4manQFP9VNgaX7PKjBLhtuDAmfdf7i7Oa2fyddNCVVS1G0740B
 FBWB8bG/Jf8IXrSaDJKZQnQY6OoXTVi8kE5VlaoaUhtq9e9v/CPhdKvKJAwNETrrlSkwaNxklf0
 I6CxYMR49eWD1XA7oXg==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96a8d7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LEtEptG61Eb6tGkL2-YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX7qbQ9HKMu/13
 DENyck595llauIaT3JmJn6/yKQu8QlBggVNRy1Nf8FAxACUezbaJdn2R5dTfVnsO6S1o0oFAoAH
 7c7+iW1bqw/rKnlxuuyTM3tSY/aZ/1U=
X-Proofpoint-ORIG-GUID: H43dmhh1saPk0VTDQ4jUYO2xFNleyHUX
X-Proofpoint-GUID: H43dmhh1saPk0VTDQ4jUYO2xFNleyHUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010091

The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines. The controller is not bound by a device tree compatible string
but is registered as an auxiliary device by the TC9563 power controller
and accessed through the same register map, so the GPIO node has no
compatible of its own.

Describe the embedded GPIO controller as a "gpio" child node of the
switch, document the per-port reset-gpios property, and update the
example to reference the controller from the downstream port reset
lines.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index f084830c6d0c..47cd58c14e4a 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -54,6 +54,23 @@ properties:
           - description: I2C slave address
 
 patternProperties:
+  "^gpio(@[0-9a-f]+)?$":
+    description:
+      child node describing the embedded GPIO controller available in TC9563
+      PCIe switch. The controller is registered as an auxiliary device by the
+      TC9563 power controller and accessed through the i2c device.
+    type: object
+    additionalProperties: false
+    properties:
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+    required:
+      - gpio-controller
+      - "#gpio-cells"
+
   "^pcie@[1-2],0$":
     description:
       child nodes describing the internal downstream ports of
@@ -62,6 +79,11 @@ patternProperties:
     allOf:
       - $ref: "#/$defs/tc9563-node"
       - $ref: /schemas/pci/pci-pci-bridge.yaml#
+    properties:
+      reset-gpios:
+        maxItems: 1
+        description:
+          GPIO controlling the PERST# reset of the downstream port.
     unevaluatedProperties: false
 
   "^pcie@[3],0$":
@@ -149,6 +171,11 @@ examples:
 
                 resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 
+                tc9563_gpio: gpio {
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                };
+
                 pcie@1,0 {
                     compatible = "pciclass,0604";
                     reg = <0x20800 0x0 0x0 0x0 0x0>;
@@ -158,6 +185,8 @@ examples:
                     ranges;
                     bus-range = <0x03 0xff>;
 
+                    reset-gpios = <&tc9563_gpio 2 GPIO_ACTIVE_LOW>;
+
                     toshiba,no-dfe-support;
                 };
 
@@ -170,6 +199,8 @@ examples:
                     ranges;
                     bus-range = <0x04 0xff>;
 
+                    reset-gpios = <&tc9563_gpio 3 GPIO_ACTIVE_LOW>;
+
                     toshiba,tx-amplitude-microvolt = <10>;
                 };
 

-- 
2.55.0

