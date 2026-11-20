Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166464;
	b=FY+cE+tzrJiBF6xfEBxoPq3OP9ZM3xTBK0uHAv0X1P0aLYq1cAiTlJ9XI7k6bOcjD7oT
	 WxeJXoCI2VKXT8KK3NjRUitgh9ymhWiTpETejF7VYWi3CJM7rUcxs55rsbUc6LeFAfuiw
	 T+CBiC59t0n6zTF6Fir/a+BU33tf5rwXk2iLGPKpoN0Kek2n+uNAVbtfOQUBufjgTNUKU
	 hkRlPbLaczLOgrSKqt46gmLZRUD43BmeDpF9KwGWx7u2vcrrPRIX/FvsRgZLvWFa/i9Gf
	 FFASkkQv+NarwoVnQ0MKu4s09EcEnPq/LL90XIDuEey77+GFxQuB7Drj1mPENts2GNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9jmDqQKbdKbuuwlFuxkB7P2vGSDTGNTn40QGhbp90II=;
	b=fPPn9I1Q9JQp8ya+339vNNnqV0ljshfcKb7KVWjhs2y3G5QpmtbNirvT76skLoKjNFti
	 PnZt62LCtq4RHDkBqqcXgAeygiwLANxn2GokKdyOdLLyi4MCnNiH8q63+ppeyybGvXpw7
	 RVeJTIBxviQY/RXsz79FzCNpXCWpnZV2JbQthNEy74WUl9QAgp+RStt3G5RXPUOKd3cy0
	 KoB+a0i3m1e3Rzaxc7/rvi3MKq+1md/DtdpHFzv2qYwbf5mAgguP7vNNyS1uqjoAtbyGr
	 zQf0cn5DECd8GM6goUKnPvjxeNGE8F6QuBUJEOPoEfewV3Xv4PwTBO4gypT4LFHzLew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aE2pDPUX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bt0DwWO2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742D606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6742D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aE2pDPUX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bt0DwWO2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewRU605905
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jmDqQKbdKbuuwlFuxkB7P2vGSDTGNTn40QGhbp90II=; b=aE2pDPUXlqO+Oz6x
	yzS/xTSHO0LVFt/yqNt2LrMq44EcBF/ZXaYzPtqnSH0FyWVgBm3xvNJPtDEHCWWW
	1h/W8xuzIEmnPkvOvJancEsjw4RAeNHAvsOlamnEFMMZZwpUvnaA82JL5gyUvt40
	WZBEB9MubdewplZQowkCAVm9GlIYhGSuI3N47vwCSbAHwCQY5qF9XADP+Q6ZfxSN
	kuheeNpATD2Ik/AWNj29erPiY3tksDJwO5NtOnV9AZJh47GIdiyjbb/SwJJmcWzn
	NBmSC0M9PfQvBVSxtUgBcbce6Dsdp995Gf6WMppWK2/RppesCc7pDzB+W/tscO3n
	4xDJmg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrt50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:21:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so739033b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166462; x=1795771262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jmDqQKbdKbuuwlFuxkB7P2vGSDTGNTn40QGhbp90II=;
        b=Bt0DwWO2tGm3A6jqAD77qY/0Z7JsjYPvUkbLNej8EhBmCK+h7eyYjlBbMIbS64j/B2
         w5y0AZMHvi9jTmUSEYAu+9F3by2L4ey6w8b1l7ZbZI1s4wbLk9yXyhu9eKmZXsGzX53W
         xb3RkGsVx3s0fmZ8dPv2uskSxHbLgbHfEIsdSh3ODoMOGMesRTdghCuqgaOmEYpDfAal
         dH5Z6lS9TL+IlkLQaUuHakcARKTknCfNp+9xQdQFPvFe6kkJqRMOY1uZbKZPslTU34bx
         z57PCr28QQ5ijfdf8sZuE5aHbVoIiijOsvpnvNrQrrX/6Um1kFzjCwIkGtMjqS5PhuDG
         ///A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166462; x=1795771262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jmDqQKbdKbuuwlFuxkB7P2vGSDTGNTn40QGhbp90II=;
        b=sid6uyLYJuxqqddoFSK8ht9zPDqBMaJkeGSqTwyKSyUtk0tf1rr7RZX2l0AnwdPKGY
         UQri2hWD7TbpQJ0Ded0XkY6Haz1Zw0OPyihog/knm9iBK/QrGTnZr4ePZgbkjLdl9gaZ
         iNNBDroAZuULqqWxqcMvFB6UzlAlq6OrgCToaAguBlExCXsCafeWKG2sbZTuufHqZsgZ
         HT0MSN8R68w6M66G2UxrqZztL1davbzLVERHfe5gtG08gS5rb3lf9/+sC4TudSpjuaha
         wJexBCsus6piityd7rt2rZ17IUA1FufvbePJZHBpj4Zu3n6843l3CrW1tB8lp/r06yi9
         DQbQ==
X-Forwarded-Encrypted: i=1; AL+hErFATP4uTQxsUkJ+sycC4mGp4QrYdglhvSLZMXHLWPFxED1NUK5bvZ+qCe+YZwfNGAeqPJblwkPExfg3vPAk@vger.kernel.org
X-Gm-Message-State: APuU4Z8aCdZ2RC48/Qb/P8I36Sy48al2yHALFSnaBonewY+pDy7rziWO
	tG6AXoqjBGXd/f8PrPIV3FRTn2qFUeKoDCi5shdlAUIT3g4Y0wWQvZqZDAjtH9ctcKVAQpJ6+YH
	ZzFcgxSh8jteAreonFd+raJFOGQbKdXuDPmqTBMPadBSCh+cQdeuj0qrNPLmOG2PRruq5
X-Gm-Gg: AZFdTZd+hBBCoJPy435IdYtTQsKkK3y1iR9A7pn7QknZJJnyaPgxqDDX3Gbecy9pHRk
	LRypKzr56IdydX32enz86jIYZJbg/+NWOf+GIEK5dCXrF6wgLdR1pe5MkBJ+GelEtdr5dQlsdqZ
	zdS6AqQeMJtHZfa8/zcVsA8UX/MA4iG2BC121QWHTtDvCzjsLznsiCwqugw/hBuEVcUW8uchC7K
	FXFgBK64jP6U1Fk+VGHFifuBqsa3vOAcdPLxSoDKc5ArNgba8g7DSJj7cZ8sFjDo+35XsaaW/ta
	9tJVr79x6KH2IH+o2re5werRbZDTG27g+cwqOP+WZvG1Z4Pbtgsx+6BbHS+u5Fliud3186woaoc
	EnxYLadOMHc8WWx/B2u0SGnBwvxRJ/akhH9aGLGNUkL/HDEOI1+SQkNoFCQti1sy1sg7g
X-Received: by 2002:a05:6a00:9283:b0:8c4:c54c:b022 with SMTP id d2e1a72fcca58-8c87ca5239emr1948836b3a.39.1795166461990;
        Fri, 20 Nov 2026 01:21:01 -0800 (PST)
X-Received: by 2002:a05:6a00:9283:b0:8c4:c54c:b022 with SMTP id d2e1a72fcca58-8c87ca5239emr1948790b3a.39.1795166461477;
        Fri, 20 Nov 2026 01:21:01 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:21:01 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:46 +0530
Subject: [PATCH v2 6/7] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen4 ADC
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-pmic5_gen4_adc-v2-6-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=2796;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=yGXT1VgeLdECGLb+xY5wOq99nT1qmtpthGF+gAwNvWM=;
 b=y2a/GgXPHSLNPKtNuv12foWMhp7Ja2oBb2oMoKSlqC/O7BVKQmldgD1CiA/TdQCtW0VkfJylG
 OPubhuTjVniB+GvLQlGuiyWF/opvzKbvFugJ2Ajo+6Yp0dyr3aQzuBb
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX5dI3z7BphvW6
 KWm5/RL8MApBjq4B82xqzyH9r3J74aHOJIbDkILuWp6ZlXZsNQ4DqssEbFanur6btdKR6NSwOtS
 VS/JAB3areyUimfVyZF/MnnkDn4cdo3vZZbnk6WKsO1zTVRoxQWOMlDIoRzpfTOUEBixqvXPSPM
 LnWhng6eMj08imoM/8Sax2xidbVMUt1v7rvR2dH4Q3TTtD/BUdLeISVosjJ/X1oEgNmyMOOapS8
 hlZeBYil0cMsLEIiD1h+pf7RZ9v+Nl4JKi3eZe+C0jj1+AziWMXPQ58kYtXyUaPrMbW9SpF0rox
 OSMIpu1ridFFQWw2j+helG3XGyg+N8LjuV24lp8woh9xrzeb7M99lEi4PgVMDoLFRQIZeEPQXRX
 x5yYoB2y/FB9UpKctzL74ptKQ4u+LkkDwEHb5OJ9sXKzCkQWXDCGVFi0VraAGcsxo+PrAzuRW0S
 lZT8a68wteTXzSbinMg==
X-Proofpoint-GUID: vNhfagyxPvsG2icGbRI75SuwJ-KFyQnD
X-Proofpoint-ORIG-GUID: vNhfagyxPvsG2icGbRI75SuwJ-KFyQnD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX2J8o1ouA4z/c
 Y95wqH10i0R9S6BqPvbCL+mT+mwzwPzy9nkBAeVIynUoobaP6uy6q/tLdB4LTnGlHt1//YwW+Zo
 ZEIl2JHHIP0w7nEsP27/CnOhH/i/QlE=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0010fe cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r-B89w4kQ6UFD_XIchQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200037

At present, support is present for Gen4 ADC channels under a master PMIC
with Gen3 ADC. Add a compatible string "qcom,spmi-adc5-gen4" to support a
master PMIC with Gen4 ADC. ADC channels under such a device can be
considered to be of type Gen4 ADC by default.

To support any exceptions (Gen3 ADC channels under a Gen4 master), add the
"qcom,adc5-gen3" ADC channel property, analogous to "qcom,adc5-gen4", to
indicate that a channel is of type Gen3 ADC.

Add constraints to ensure that "qcom,adc5-gen4" and "qcom,adc5-gen3"
channel properties are only valid if the top-level compatible string is
of the opposite type. A channel without either of these properties can be
assumed to be of the same type indicated by the master PMIC's compatible
string.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml      | 39 +++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
index 065b82c41e86..e79ddc2acca0 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
@@ -21,9 +21,14 @@ description: |
   All boards using a particular (SOC + master PMIC) combination will have the
   same number of ADC SDAMs supported on that PMIC.
 
+  PMIC5 Gen4 ADC is similar to Gen3 ADC, with some differences such as
+  improved ratiometric conversion resolution.
+
 properties:
   compatible:
-    const: qcom,spmi-adc5-gen3
+    enum:
+      - qcom,spmi-adc5-gen3
+      - qcom,spmi-adc5-gen4
 
   reg:
     items:
@@ -91,6 +96,38 @@ patternProperties:
           need to be marked as Gen4 to ensure their conversions are handled correctly.
         type: boolean
 
+      qcom,adc5-gen3:
+        description:
+          Indicates channel is of type ADC5 Gen3. This may be needed in cases where the
+          master PMIC has an ADC peripheral of type Gen4, but some of the other PMICs
+          under it have ADC peripherals of type Gen3.
+        type: boolean
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,spmi-adc5-gen4
+
+    then:
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            qcom,adc5-gen4: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,spmi-adc5-gen3
+
+    then:
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            qcom,adc5-gen3: false
+
 required:
   - compatible
   - reg

-- 
2.43.0

