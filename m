Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F325B099
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422022; cv=none; b=aYbEoNfFyjzYTZCK0OaOgjzaM8i+NX898JKtR/U5IGHQCQ/eGHNrcs9mdkFg/X2r/H9/epvtaEntSKqy1enV/t+WIl9TSAagSp7VgRytWJDHXWEaykyESyFFPKWUosuOpSzOXZjqpo/QryENBW0J1Fv1LULLcEQjleSIy1b69HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422022; c=relaxed/simple;
	bh=uC4tlxNT0031iIQM4TBQvwl6KchLCfjKxw65OYMFJmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZD3g276vxhoqXD4S+JSB0n9q5tQkQ7MYje4hqGnG0G+yqX/vtE39kKTyRhgoHGZO/5O8+N8801tqrqb3UUZaiNq30gJOx3DpR0CmIEzIhA6fxFzi96av6YRbVIHn7S7U3e/p2f7YfSUUkf9/G0sBJ3oW0DFcNgJbFCn6LKxVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qlbmce1w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jeoDJNii; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qlbmce1w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jeoDJNii"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lVf53749563
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=; b=Qlbmce1wtdvNKVSP
	IcgfhhATCl1DP93hH9tHXr+RCBZzFK5A64SgP1qOKJpND5SUBi951NP45nWvfkP/
	6zTt0iSHk6zmH8xNqV72WQ2yrINpUXscJVJq+yFU5EXxh1L/K4g11EcKjAqxrsm5
	2XwqwHA7ioijLjmo8hXxYQvLHT7w4YUlwkOii/d2VMtL7HDIaCXA/Cjh9UhovHTg
	cE9uLNlkAsPWchTv7EBgWfvC0xWO0upfqCPbDj4LObgA9dahYwb13mGqJvll+6rZ
	Wri68jmzYFDVS5BecDaGjgVSchfFCVPZ4l4pE9H3hfnpkewJ4HL5O4y7zrAxSb8j
	XtCSnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5uhhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:53:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93975d63ffcso33485585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422019; x=1789026819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=;
        b=jeoDJNiiBSvd+PbyIK1smkwB+ucpBmrDmYAsiLzDxmuin6cQ2tqZ00VgxAnPQqFWjL
         6JSFgDiladGk0b6LLxuZKW4U3xsONndRcbL+VHK9o91EZLe54XMrCaEBuy756BczNCq8
         We2MvE1pAnZCLBf0tMC9wIY3nQTgrCyVz/d/m3hpmzv72ie0x+zR1t2Zm234hTWGMugC
         wlkKjUWTLH1HaKK/W8OAxdd36zxFThhtRdRbYAIoWAoLzeQ6FwUzqGinsgib7pe0jSVZ
         shVCB5k+UyUDkfIQv67B+vWhWeP3RDQkDijp4UArOVaJ1+7Dauvceh0UINHXngsxqFQy
         lMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422019; x=1789026819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=;
        b=fHSsHepJzbxNjqmp6udogFlnCibZ2cjqtoZmP/X7SXD+55veweLipEazNH2210P0Jv
         QBrYwyqN2sPYji6PCBncJ+t5QQ1gmdRRuBSzb1wkR4YCP+rgHnLCV1EraAIyDRXZ5lvD
         X1vX/AG073DidCHZ+rmhl+f8z2PvRnaq8Kcj/heTwNeX7NT6dYEZA1o+lkS0HhfDCoPA
         5xwaVSO92bEX/rP7iJbAAS0MgCOKrtWH8y3efS/Yk3qEwbw2S1w/jA/c8TlC6gQdWiJl
         5VVTPNxxclQ2/QZtVcM2wf60okeDt13WrzegccnQ12dsTeFy53Rlk/4WHYurRjoZMJHR
         JwAw==
X-Forwarded-Encrypted: i=1; AKwUvBxuBNJyUpqDDSMhq5Uj09q4HBmrTsUBZsWu7S5AcpkfhcysD01tC9vxLpHwBR5bxx8nms9DiDq4+0FnCWn4@vger.kernel.org
X-Gm-Message-State: AFuF++nhJ2kWv1uxqIWXCf0m+oqSUbECKE5RVbsjnwEH8BT9mrL/2yIw
	2deXqv3JhXT62gwnVqu6ME7Nvh7hohgwawGPZBZGB5dbPXDECjDSh4q3i98zTKrYQHu2SjGoGta
	oDdd1YNpUZx54ubTIE/F0kk5Enk4jFXOGp+uJIx7M5pY71ebIhQ0jXqJkh3kI5QoSwMfBwT3//3
	O0
X-Gm-Gg: AYBFou13OVr7lo6iGLT//ucaIA10Bbpsb9KLE0m5AMhjUzsc+IjG37Peu/6RCwb3X7M
	oOF4eNQvvDg3SjKk7BN6XJ1Jny/mmsdcV/AYZI2+7flb6LpIGIuoflv0CwnDc36H4Tv3y1FwLr2
	YqO+bcda5D75Qv85KEAxmzLO+Bi2xdKQfS1wrkCMd8c97G5BRjz5vBCm1F/s+tVrSCWZGrY+Shh
	+stV0lkVXopKXTC08S90cf/T4Vxlaur+ncOH6CtPQKdzSN7PRfAC3I9Ft2VfS2tvi/5lFWy7sfy
	UXfLmGMpNylcgSQyGDUPwJyU0tUKapJaelAnXE/+Z0DjSBd/HgncCSCkBgsrLYeMGwE6Dn6Ru5G
	0IG6uHwUwerZUzQ==
X-Received: by 2002:a05:620a:3714:b0:937:19d3:3fda with SMTP id af79cd13be357-93960f2cb1amr1190964685a.28.1788422018822;
        Thu, 03 Sep 2026 00:53:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:937:19d3:3fda with SMTP id af79cd13be357-93960f2cb1amr1190963685a.28.1788422018352;
        Thu, 03 Sep 2026 00:53:38 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12878376f8f.6.2026.09.03.00.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:37 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:52:57 +0200
Subject: [PATCH v2 1/5] dt-bindings: PCI: toshiba,tc9563: document embedded
 GPIO controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-pci-tc9563-aux-v2-1-34c625b542c1@oss.qualcomm.com>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
In-Reply-To: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
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
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a992783 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LEtEptG61Eb6tGkL2-YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KUDGZVOujskOu_HnhjXjvN8J_Ny0FosH
X-Proofpoint-ORIG-GUID: KUDGZVOujskOu_HnhjXjvN8J_Ny0FosH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX5iLinVVtA1pj
 Dp6t2Apl/t7IUZHm4KzfhZOoYhbWR4fykLGAoAN6kV9LAbzdV+43aUja7iSsWP11K7s+TFYc6DT
 sJazApHHNmRhxsg61jaBK1Dut8F225ekkaniCRCFGm/YdqwqBmHvJTuQ1tHP5UMT35W9MMHpFc+
 pCgflOvZddI+qnh8I4F3UTsimjwkSt2TYg+ALWRiPG6b9pwNlNX9vlSt9cm1xoOjNBjsUwYgnTK
 inuvRlG76Oo7X7T3UPLfFhmq+G59r7YQo+xZqMr1mv3pqmiR74pZMWf3RiI0CcDJ5TvJPcopJfM
 VK1NvyFvFO4cwsBpTyaGQ5pqVImRZrhGjpw6AAVoJblfz8LDyMwd4uSReA1QlPVf05xFx5+vC00
 WV4qQCE5L630xTrdj9upu0iqNx57u6Kdb9xdz++hcsJ4VvG/L68+/pgK1XMSx7NmT+nGtf70C1V
 i6CsabKuebhXoQd6tmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX/k0dhD7xTiFl
 lTyCbF6BOCiecjU9asHXIARaVepK39G6fmbrnYaBCWTGn3Zawsckzlf8a25pinrbOlq42OR4mAX
 Oy+Vjxa618chPaCtmW9k9iqnrdUZidE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

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

