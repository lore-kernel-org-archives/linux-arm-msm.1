Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C2A46D2C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763767; cv=none; b=k0202FG4pIP6z8/YiQDU5UQ9WCTW7a87wggQNcKU4pqzAQxG30es37T2H6c28b8fXuLtq0+nU4hsOFng7gduQcH45zpZkAPeR4ano5G8/MIwYy8bJ67oyz6iDIUZo/rSdA42zUmoUwJ2gqoK953prBduwQBl+/SOpV/eC1Zivhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763767; c=relaxed/simple;
	bh=pOlNWN/SE7+GOWg3lwO7wBAjUsf1hbmGRPplEOANydw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WU4Lb7FahvqQwi1dts6dul4Mgfa0Ma0+4Pj5kxmHBD6d9rUHDluBNoKqqfH59j3ZhEdv7cOwz2gL5BZ+nwVX6I2BoV9U6+GhpSzl2kgqeLPt199MMefWqY96Sb3MDKpaH0uXAg8U4wQTv1/wrO0+kqw7uKBoDzXC/nvELxHZRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moYpWRxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVjVYExl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moYpWRxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dVjVYExl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnTp72315815
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L12LTqZQ+Uv
	nxuqB4DZoUExrnf4AgkG5KfhXRLi+mUk=; b=moYpWRxqFsJuva115DBLOU9LJbH
	3W9mhpBVHlEZxIIkHnJPlgquNGmlfKoi6X227+jZqBD9SteYUfhtXBgNzX/y3yoW
	jqcUzNq4vcP0g7v2E+FNDtRUY1U6a14mWIxsH3C2bEfBRoQ6H3j5ot/7uB0sB1ZO
	dkEFDR27PrLUF15+qyjTnd/bWk6mUTgakDsGTmGD7mH2iVQ0CADCXZuBBVB5IFxO
	F9NcGLRvur9BQI8sUYd/NiQvbOP7iABWug9oZrB7s0xWdxIQjI29EhYfqxwh5a/Y
	BuAHVV/WnbD0hLKwOTe9JC2lb9k55lUOn269oZFBG6OtM26hWOvIxlqfsLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc0ft6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so489661cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763762; x=1785368562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L12LTqZQ+UvnxuqB4DZoUExrnf4AgkG5KfhXRLi+mUk=;
        b=dVjVYExlMyQeLAkl6em4txps51GPvxoWLvsjX3Tt4BvXEt6o5PmRv3W3I4L9UX8AN+
         zVuXpNpmxyxxbQ0CC8PnmXgZX8H9HuFDBlM3MVMQbkKtoorLuE9X3t1KO9W9XEZPeUUT
         6eiagRNEgpPUOahtuX/RGINa/mBMpeQWQP7yhN91vhacIt1bToo2PJciPK+1De1ghKuw
         aC1VEOW26jJPCm8GA1itAVAG99rvBK+SCCZKOMENReOqdH7qLQE9gIqtI/UF5Xgi1EBr
         N9JWeZXJW7YbJcLnWMTHdWWAf3gzLIFZLFqkua+Oddb/HVSKvQl+ZzwzHJRzTeNp+5Fw
         kecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763762; x=1785368562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L12LTqZQ+UvnxuqB4DZoUExrnf4AgkG5KfhXRLi+mUk=;
        b=jYZxFrV20uNfImGrjyEu2G3E0jiB5hU182yWBcYFz6NXwC/j92kzMySfbJ9/kn7Zjd
         zliQzX6+kQ69V0foeUpbhXTCY97j+D1cZ4sbDe2gj9EijdIDVWPdhvQj7lpIIoh1N28Z
         LMBuoBJjxsQgBkAyNkkhbk6eev6jNo6AMmOrvvFn3FXEZlCYWZtmtU1IPv8ocTIXKDAg
         CH5ZU3+xg3tMoW3ay46OVlqPxUZpe84DN5bGRhRyqsgdR/8NyTzRvXVaEaPUrKdzyZaY
         ZPwJNwK0/mqhBpit1xhrdf9EtNmLBQDnC21Y4lo+/8btuSUylS6WgyFCBI9AOpIoduRN
         n6JQ==
X-Forwarded-Encrypted: i=1; AHgh+RphwsRIfVzHSaQ1qY5m0a1rki96tPHK/4+JSXFBqwt1JBP6k949XNBFuX+eGtD04AbS1eJzHAtskNfjd+X7@vger.kernel.org
X-Gm-Message-State: AOJu0YymVuxxhOH9re5xVA7HkmhLE58AiPsgdT2OiVr8fu63pUKkpD32
	88Zy+auVSyNHAAjGV4XINF2oGExCyzNQpaVusAhPLbtD3g6W5g7IiRM3EcU7M6nQ6s2xXxffEQe
	9wUrNu4jVTfuxR5Hs0vg2djuFmUKGXGNrHln7HxKVL8AdFhww8YQMQQ8JFdA9FWNAfGDC
X-Gm-Gg: AR+sD1325pSM13gyYps1EB8eo5JKLS2S8ZZLYnAgtrGf6YNOF8x5xkov1q1ZVJtHfPH
	q/g7pjYRkRlnGScGSSfBF1TCMu41usU7S9z4ewgTu2cW9tiMr5vi84HEk1Rz9Da6jddEbTNe+d8
	UFmolStahtcxRdzKQRE/b6F0dv4sUYNH3M7V93yjx85/D9cwWBu+ITetD/WfwGe9gX36Ox55R7l
	4pdmEZbEvch/pLwiuGuwuLguqWrRKWdPVVZx4PuAk+IGbWhxIE7NPlLaI+jSGUAY5uMsZ77smLL
	O0Zq+kCiGLDxAE+Tf1+8Jld0W0v4p8psVt334INk0aW0ZNz9BgFkgs5JN8OTjWU2BP4Mwvdav4v
	FJfA61VU2PLFtBg==
X-Received: by 2002:a05:622a:580c:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-5283df4fe14mr6874001cf.65.1784763761792;
        Wed, 22 Jul 2026 16:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:580c:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-5283df4fe14mr6873761cf.65.1784763761209;
        Wed, 22 Jul 2026 16:42:41 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
Date: Thu, 23 Jul 2026 00:42:17 +0100
Message-ID: <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hhxLBSnlmm_sYT8FdO1WBL7g-aMet-SW
X-Proofpoint-GUID: hhxLBSnlmm_sYT8FdO1WBL7g-aMet-SW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX+G4oXnjBkb1B
 fteFJEOKEGByVsg+Xif9EjqoU2uTcKSDCUgPsYai/s1WeaXMVDbWHzIoMRERIP+r+hyJdUKSpKE
 03f94OiZykqx1LLq0/VpBbhUzhZbiCc=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a615572 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=s5uLdfJeeDcd-HM_FJ0A:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfXyPXCzqtYoEfp
 j8asuSJLP+W2gjxpzEWZKSCCTdTYrDLRchlm6PqZmrIYi12sBQjnepDRLVstd+K9xBwJgXsDFS5
 DsyqEmvsz1OHQaEl7X42fikyExpd5BENSefQGS9RMbyYZI/iDASgsu58gkcfZzXaAjeckGa453k
 IBnqUOiuAM7DPvMUyAoAd50n9FtM96gv+dl+EO8yaPAvAfqXRvwodd5lo7Os5p4HeWcDKNhIYQ2
 uhGClhc5+Mk4Gi+g79RS9+wAZl8zthdej2oP7pdTyyAOeMjJB7eaijPflpI5KNmbEw+sXBOk2H2
 BQCucvlMGKh3CL4Msgp7hNkQqrFtPC7tRTCyZqtw6M/bqDseVnH5B26f7l4Yk6xDxAdq0PAotrQ
 8tqG9o2/EL+/Shjf4nVe3xcQ2O1e7I2uU3ZlM7W67/o5kNpIl1CwGBZ9PKk4CSqsMCc27OW2OZc
 sQnuzGxtNBxIqiOnCAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220233

Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
driven by the wcd9378-sdca codec driver for headphone playback, headset
mic capture and jack detection via the SimpleJack SDCA function type.

WCD9378 codec can be wired up in 2 different modes.
"mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
each of which has dedicated control and data lines.
"compute mode" on compute platforms such as Glymur is enumerated as
single standard MIPI SDCA class device.

Both modes share same Device ID, compatible; qcom,compute-mode selects
which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
live on the SoundWire slave node in compute mode and are forbidden in
mobile mode (owned by the top-level codec parent there).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
 1 file changed, 200 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..2ed4ad92958e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,200 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on WCD9378
+
+maintainers:
+  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description: |
+  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
+  class ID sdw20217011000 in both operating modes:
+
+    * mobile mode -- two slave instances sit on separate SoundWire
+      masters carrying data only.  A separate top-level codec node
+      owns the codec's supplies, mic-bias voltages and reset GPIO.
+
+    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
+      master and carries both control and data.  There is no separate
+      top-level codec node, so the SoundWire slave node itself owns
+      supplies, reset GPIO and mic-bias voltage configuration.  It is
+      marked with qcom,compute-mode.
+
+  Codec drivers that match sdw20217011000 use qcom,compute-mode to
+  decide which mode to serve; the presence or absence of this property
+  also gates whether the supply and mic-bias properties on this node
+  are required or forbidden.
+
+properties:
+  compatible:
+    const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,compute-mode:
+    description: |
+      Marks this SoundWire slave as the single aggregated slave that
+      implements the codec in SDCA / compute mode.  Only present when
+      the codec has no separate top-level codec parent; in that case
+      this slave node also owns the codec's supplies, reset GPIO and
+      mic-bias voltage configuration.  Absent in mobile mode.
+    type: boolean
+
+  qcom,port-mapping:
+    description: |
+      Static mapping between codec SoundWire peripheral ports and master
+      ports on the SoundWire bus.  Length and interpretation depend on
+      the slave's role as fixed by the parent codec node:
+
+        mobile (5 entries): the mobile-mode driver derives direction
+            (RX / TX) from its own context (parent phandle from the
+            top-level codec node, or the presence of
+            qcom,tx-port-mapping / qcom,rx-port-mapping on other slaves
+            in that binding).
+        SDCA (7 entries):   DP1..DP7 aggregated on the single slave
+            (index 0 unused).
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 8
+
+  reset-gpios:
+    description: |
+      SDCA / compute mode only.  GPIO used to release the codec from
+      reset.  Active-low.
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: SDCA / compute mode only.  1.8 V analog buck supply.
+
+  vdd-rxtx-supply:
+    description: SDCA / compute mode only.  1.8 V RX/TX supply.
+
+  vdd-io-supply:
+    description: SDCA / compute mode only.  Digital I/O supply.
+
+  vdd-mic-bias-supply:
+    description: SDCA / compute mode only.  Mic bias supply.
+
+  qcom,micbias1-microvolt:
+    description: SDCA / compute mode only.  MICB1 rail voltage in microvolts.
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: |
+      SDCA / compute mode only.  MICB2 rail voltage in microvolts.
+      Used by the SDCA SimpleJack headset-mic input (IT33 / AMIC2).
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: SDCA / compute mode only.  MICB3 rail voltage in microvolts.
+    minimum: 1800000
+    maximum: 2850000
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - qcom,port-mapping
+  - '#sound-dai-cells'
+
+allOf:
+  # qcom,compute-mode gates the standalone-slave shape: supplies, reset
+  # and mic-bias voltages live on this node in compute mode and are
+  # forbidden in mobile mode (owned by the top-level codec parent there).
+  - if:
+      required:
+        - qcom,compute-mode
+    then:
+      required:
+        - vdd-buck-supply
+        - vdd-rxtx-supply
+        - vdd-io-supply
+        - vdd-mic-bias-supply
+        - qcom,micbias1-microvolt
+        - qcom,micbias2-microvolt
+        - qcom,micbias3-microvolt
+    else:
+      properties:
+        vdd-buck-supply: false
+        vdd-rxtx-supply: false
+        vdd-io-supply: false
+        vdd-mic-bias-supply: false
+        qcom,micbias1-microvolt: false
+        qcom,micbias2-microvolt: false
+        qcom,micbias3-microvolt: false
+        reset-gpios: false
+
+additionalProperties: false
+
+examples:
+  # Mobile mode: two SoundWire slaves on separate masters.  Neither
+  # carries supplies or mic-bias -- the top-level codec parent owns
+  # those.
+  - |
+    soundwire@3210000 {
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_rx: audio-codec@0,4 {
+            compatible = "sdw20217011000";
+            reg = <0 4>;
+            qcom,port-mapping = <1 2 3 4 5>;
+            #sound-dai-cells = <1>;
+        };
+    };
+
+    soundwire@33b0000 {
+        reg = <0x033b0000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_tx: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+            qcom,port-mapping = <1 1 1 2 3>;
+            #sound-dai-cells = <1>;
+        };
+    };
+
+  # SDCA / compute mode: single aggregated slave -- owns supplies,
+  # reset GPIO and mic-bias voltages.
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire@7630000 {
+        reg = <0x07630000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378c_sdw: audio-codec@3,0 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,compute-mode;
+            qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+            reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+            vdd-buck-supply = <&vreg_l15b_1p8>;
+            vdd-rxtx-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l18b_1p2>;
+            vdd-mic-bias-supply = <&vreg_bob1>;
+
+            qcom,micbias1-microvolt = <1800000>;
+            qcom,micbias2-microvolt = <2750000>;
+            qcom,micbias3-microvolt = <1800000>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

