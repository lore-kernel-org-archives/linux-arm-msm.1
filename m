Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511766;
	b=Q5isk8wDpk5D3tUuT0Zvw2NXV75TmCPNFy85yixquhUP1bBseCAxBF7tWD9tbN3u0PA5
	 nljZtEBfblTxlrzc6R8rkDD2rO0Cbgd7rXFsbpIXvf+3Q6EmPzW4CEpPaqXAbqonTgVit
	 WCcBYIlSXiO6aCJwtBEypaWzukpc7G0xlWvIruaU7rJshKSuzOk3IVikGMvEWnHOhPSN2
	 N+iTklRhrIiL0J8wC1LeLAsW+0TbVcdMzwS8UHyRRMiJP4lf3cBeq0ziq4d5B7M4QKke/
	 pGdXu9fU24+JoldNNh2Mah31EsgWTpJ4qxc+HRH9dm4JVazZonXTgY5s7pH+eptY1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
	b=b3vD5m0VFB6qjXHBbJoexNpAOzcaGGbXttlHM/LsFLjtTksrnhg3BQcsVddhIyrz5owO
	 Le1eTNMxtqXXV032khrcQmr329HL9Xiu6jg1CJb62Etu/b2snIt+Z4b6VmqrcwZ6VnUgn
	 yh4qNi2PhpeHIBSTRuDGqF3jw8+RV5OMSumky3P1k8CArGq9Uezls2HHffJazz1ebOp1p
	 z821chFuWON/Iy9xHqLruyvPO1upUxVrRh1fYq/i6X5a2P+KpjyysCd0RcsbcZSgrNdKx
	 nGhNYz3pRYiqmKK7Lg+K3BlZIc6zK8+gavzAwHA4B6OHYldkR4caX5a7ieZosO1+APw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avMgDcGh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQTH24cv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456A606A33D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7456A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avMgDcGh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQTH24cv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ntcM1598245
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=; b=avMgDcGhJ9DViWB/
	XYqjFQ4iMAdvCvFoLS4XALfaeIuIqZiJVA6htH31cHhOSzQDOM3JWE93AffBazRu
	zPeEC54i/pa2YX8e3F/1cBN1FQDrovs8ajOdcs6TCx7TqFNE8oifIhD9Y2oh9usy
	lD7uYOo+slnHnFT/zVNkHI0+rAQvejqO7UJKtCIPKNoJrCM/GkB2rSnW9d0o+Heq
	aU8SsGNwSxPjIODdZEaA6Bgf/O/sgrJq/gr8dpAUiimtIPXeSE+jn+TALFFPLw3i
	4j5LeHVdvQs2Fz5/XZCsUwf0TU26D3MYMCAdnLCZe+sX6F2exKWzQOFweA75Dy3E
	ivm65A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqjt98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:16:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2703196a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511764; x=1796116564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
        b=cQTH24cvlaQJ42AyKtFdW26cM7+biAu/e9mccS2UT1vFNsURM2/HNI8KqKMNCM5Byf
         OMOTrqrZ2wbM4MDgPZA3jMp2OzcmY1dL01m/50kCxQvySaB1Xk7ljSVKA9MBsMbwmi0M
         +CxNAPlVyKRqLdyD63egyPXSTidfvtxcQiDaXAfDxQNCIL5eLlZyttE5S1WMobJ1zchO
         fEr9naE2Eu1qCmlScmZXkfU6Zf5LdfvP9+e1XjBUHMv2fafQ1bkauKz/HFpHM0EgfWdM
         /obWuiVL4MPoVzsI59qjOzeoHCA5YRWwhPpKnxV3EsegZZreY+CJVypLFB2W2Hw+pJMz
         Q6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511764; x=1796116564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
        b=gqVv4G+lDV25El99+oMdF2ocQ4T4ztYwyaeW5VhmBMycaeBnvavkjooOPz1XH2SAQ8
         9O0JcKjRPt4ZYwJtHFINADrX+QVReq98G4TeW1YHYICSXWfATKYOL0Q4PoSoIKXUccNi
         /hpdB22+Z10b8o9iGn06VbtW7yLUNeZ6FYiH9yREAEOo5lWQmM5QvyYjqJGYf8FGkubW
         9jZq1Z6CzVqU3TgS+quR17Gn757USrmKbSdNDvUsUZmvR6+/P0pGqPHUkc8f5Q3BHCSS
         +kWEAwcek8zOzFdNxnHvgRydnmGhELgVoSjJn45W9Jw6uE+cYci6Topp3oBgySbE2i91
         ci+A==
X-Forwarded-Encrypted: i=1; AL+hErGlZUBGnjzWaboCAvXehGbm9IOikZMklbQOn0cV47wGtioSuKLADkb+ySDwNe3AMAYbPH0Us41ZJGnxJBY1@vger.kernel.org
X-Gm-Message-State: APuU4Z+GFFXVU6+wDgwGdcCpA8MpGVroBtcPlLsbOKpINO8mxptgfGwt
	sx0y7v9CNNgjil0iWrHSog5Eu0EiJ8NsG+tyn+IEpykm7lRTjxj+XPt9iEMN9vsaKtWrV1LsxuE
	VdQQsyiUtIEQdB2t0Slpy026LZcznWQnn/669hgY2cXGymNfcTD+2IFLvjR0ohewruYlx
X-Gm-Gg: AZFdTZcPkDTJ4SQ5meJRA+84btWaKah7pyujrfB8dDezuw63JSydc/34bdx0khr+eTu
	a63JBO238cwdusmtp2CbzBxhmrHp/vYCfjc6T1pCVka3LziVd5ie2UNb2FvXaypvZv7mG+nsgAe
	8KoGVI/I/hpWRwvf2y4M84J34QFWtokBvs/6c9XDCcD7AH+u6DnOl2keeI9sC+enqkOh7/XdWQx
	ufpEb+LWmO7PUMEa07mq3WdLv8UbhwNg3opldb10RAuLXAzlc5tg7ko3Y+8b3BByklX4yUHsnQv
	7MVscPy4EJlk3H2zCWUtaPo3y+gxzvbgWNfwU3SFh5jai8Uy5CNzNW7q0D/NGJmO3Md1IHsyvN2
	qmWr/WY2bew0hl8yDbxiBq1Z5lXpApRUqRa9lnO0pT8DlO7N2y2nAXPkbtJ9+mqG3yaxk5gS5Bj
	E=
X-Received: by 2002:a17:903:2b0f:b0:2ef:d8e2:8274 with SMTP id d9443c01a7336-2f03f1ae083mr138080865ad.32.1795511764183;
        Tue, 24 Nov 2026 01:16:04 -0800 (PST)
X-Received: by 2002:a17:903:2b0f:b0:2ef:d8e2:8274 with SMTP id d9443c01a7336-2f03f1ae083mr138080385ad.32.1795511763547;
        Tue, 24 Nov 2026 01:16:03 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm66371825ad.54.2026.11.24.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:16:03 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:45:44 +0530
Subject: [PATCH 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
 binding
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
In-Reply-To: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795511753; l=4863;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=JWQ+3UkdjGpMYJ0rMN0scOdLIJkar3ei6FpbBL73/vQ=;
 b=YVgsQ2lUUxYOUccMpu9jCB/zFyf2ltdzmB57JUBFeVhSYc8RuVdjR2p+M57sVKEhcZmX0mqnR
 KwvKYb4ljPEBetYIX2lDymafrSvsHTcCJEehq0ythjJqRB1SReWiq5G
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0555d5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=B20DgfED3MDX--t0QlkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX8gaWW3u1QgF/
 8RUQ8CG3ATaEUNuTrlDTmgPDj8yGmnTOKrYh2KbRMRXSSXpSV7XW0kLJ1bMiMtV6OxYg9/C8rJy
 l8WsDaBKisivpiNSCBdPMh2jHkduKLeAFCE944mI6graf02+4yeMe9Ly/jPPGBBAL+MrvRyggOk
 EV+IJrWR/hTZKB4HOHPJNdtRB07jSUAI4hRS7UwwwktwO0LmZEylc3DTG0pk9/9+XP4wBY+CUnp
 W9Z12yoXdw2kguuhpK7yQ4by/KibouaCVZRqgV7tZDHOKPUosA1LmsItBKamAsY52MzGi/ZHVjM
 51c0Lt8QX1cAieiKSTE6F9pxy14kZ4+s/S6hySBrUbQxWlGc8wjWcaI9cDcF7tI2Q0wasplCN4e
 Jnbj0KLXY5iD2V59qNspKqbGg8zHT425P7Wq9rD4BuA2QPl4RiuzKkxRwTLPsWLFqtgyrh0i/Ap
 m+wjwXGgWLxs+QhRZFg==
X-Proofpoint-GUID: 0Ajkp34NJUowZfwXgwK3aUPyAdLuuzdv
X-Proofpoint-ORIG-GUID: 0Ajkp34NJUowZfwXgwK3aUPyAdLuuzdv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX04NpCX3QYFFG
 PFpzQMpx5812d+/qX7szacwrAtKRWf6QIu6uNWp6itDy4cH6Ko5/AEkJes4szARF6GvRAU30T1f
 +mv4FeE/ZwpjUWUryX2spiEwYFZaTIE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240035

Add YAML devicetree binding for the Qualcomm SMBLite switch-mode
battery charger found on the PM4125 PMIC.

SMBLite is a reduced-feature charger IP sharing a common SPMI
interface with the SMB2 family (PMI8998, PM660) but using separate
SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks.

The binding covers:

  - compatible string: qcom,pm4125-charger
  - reg property for the CHGR peripheral base address
  - Four interrupts: usb-plugin, bat-ov, wdog-bark and
    usbin-icl-change
  - Two IIO channels: usbin_v (USB input voltage via ADC5_USB_IN_V_16)
    and usbin_i (USB input current via ADC5_USB_IN_I)
  - Optional JEITA soft and hard threshold configuration as raw
    16-bit ADC comparator values written to BATIF ADC comparator
    registers
  - Optional monitored-battery phandle for battery parameters such
    as float voltage and charge termination current

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../bindings/power/supply/qcom,pm4125-charger.yaml | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
new file mode 100644
index 000000000000..5651b428b0a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,pm4125-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 SMBLite Switch-Mode Battery Charger
+
+maintainers:
+  - Raj Aryan <raj.aryan@oss.qualcomm.com>
+  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
+
+description: |
+  The Qualcomm SMBLite is a switch-mode battery charger IP found on
+  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
+  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
+  supports USB input current limiting, JEITA temperature protection,
+  battery overvoltage detection and a hardware watchdog.
+
+properties:
+  compatible:
+    const: qcom,pm4125-charger
+
+  reg:
+    maxItems: 1
+    description: Base address of the CHGR SPMI peripheral (e.g. 0x1000).
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: usb-plugin
+      - const: bat-ov
+      - const: wdog-bark
+      - const: usbin-icl-change
+
+  io-channels:
+    minItems: 1
+    maxItems: 2
+    description: |
+      IIO ADC channels used by the charger. usbin_v is the USB input
+      voltage channel (ADC5_USB_IN_V_16). usbin_i is the USB input
+      current channel (ADC5_USB_IN_I).
+
+  io-channel-names:
+    minItems: 1
+    items:
+      - const: usbin_v
+      - const: usbin_i
+
+  monitored-battery: true
+
+  qcom,jeita-soft-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: |
+      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
+
+  qcom,jeita-hard-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: |
+      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+
+allOf:
+  - $ref: power-supply.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+    pm4125_charger: charger@1000 {
+        compatible = "qcom,pm4125-charger";
+        reg = <0x1000>;
+
+        interrupts = <0x0 0x13 0x0 IRQ_TYPE_EDGE_BOTH>,
+                     <0x0 0x12 0x3 IRQ_TYPE_EDGE_BOTH>,
+                     <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+                     <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "usb-plugin",
+                          "bat-ov",
+                          "wdog-bark",
+                          "usbin-icl-change";
+
+        io-channels = <&pm4125_vadc ADC5_USB_IN_V_16>,
+                      <&pm4125_vadc ADC5_USB_IN_I>;
+        io-channel-names = "usbin_v", "usbin_i";
+
+        qcom,jeita-soft-thresholds = <0x5314 0x25e3>; /* COOL, WARM */
+        qcom,jeita-hard-thresholds = <0x58cd 0x20b8>; /* COLD, HOT  */
+    };

-- 
2.34.1

