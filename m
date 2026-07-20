Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D654C400967
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563390; cv=none; b=lI/BNfMkuGHUAI6ev306uOsrPYNAlJ41J3gAAx3aRdNOrAfhnM2vAlAzPcabJyCvbGZPYjTv4ktKcHKfjecOmnXek/N9yh3dCf80e6TbCywYoqK+ErKcXMHibAiSokYqNxB1d65CZWWQOVpVlwjsZY2CBkWDTejRxK39/YusvAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563390; c=relaxed/simple;
	bh=x5pIpQTqT43aoADx2ozOgXrGhd1juh0zKdMcgoIzjUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kEcLbqpe+iTk8djfenREDifcuoD55O4gc67Jdr9lUr169WEA/5A8H0s2PsXG27ZlgWKGcR67v71/tnUwyQQ4VGrrJNidbwgkmpSYKWT6IsWcLao7NAm0ztih7qr2AbxXQ0puIgiwO+yGCemasB4zNXEEo++nwZmzIV1kLXTEi0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4yHN37X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOd1oNGs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4yHN37X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOd1oNGs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFxGtw2880386
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 16:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZnLw6LJTmjD
	6gqEe5yuLzfxaduC43i/V6PDPyqb3vo4=; b=A4yHN37XyEY1mIITfTlyOMJM7pO
	wuLNbXxEHq3DcQ/YGhOAmMGwqhmiR0LwzTl1CqOt2a36sdrC88ZmfJd2YUwdZ3zu
	2U1aItouHONfB/aFeWWF6qGHMqbmktAZluC5ndd/cfw+AUg7pBxvyNhQbjSVaIB6
	uwvCuGSqdUDA6qO6ZvBqPaKx01V5JVoJc6JvPqmEeTOcY6b6E2pQF/frGexxl5Zc
	sREgsDZpYSfA22dqKlT8qaUtryf4/9lEPXd/Dm116mfYCKMYq71rRrW1M9iDqJf5
	SI5atJAnVRF0phJd9BpcQvPZuRU9vLulhYpm9SNHsQinC+hs+Qsc9rTdEsg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs01sda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 16:03:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3229627a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784563385; x=1785168185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnLw6LJTmjD6gqEe5yuLzfxaduC43i/V6PDPyqb3vo4=;
        b=hOd1oNGsTlOPot0aMiPHHc0Ryk1hMokJ9p22x6hrsgHre2nFYKz8/sVNIhxxHrHCCa
         RpbenDAJyPzCT6Qc57HTLr8v10BDHZHldnemONgPV+aFU8pbxCacc8bLw2y8A4LiEs9F
         oH5WxP93W6ONiZYNY3Hyjl/3MUELCs0Gn7RQXK55la74+On7jE2x9i5XRgD06XqL4u92
         vq4SbcTFQ4dLPQMrfSnOkh+UBM5yatGITEZfSRRz1H1Dd5jgtnhENrDhZ/d7CKW0h0kD
         /wjIcWz5Hrv3PTF3uJyTaBAUL1iYBN5d58sADQmE+TI+grP5JUy9BRdXp8Z+lHHo63uG
         1qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563385; x=1785168185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnLw6LJTmjD6gqEe5yuLzfxaduC43i/V6PDPyqb3vo4=;
        b=WqHyXhLxvr7QXuFyigfG2k1ceKzsCNFgpADm2khOGZ7pJ68J1VFa1wAYqNB1nCNAkK
         Q5QVohrh2Jyra26SbaiLxkd9vZyoDMgJk76UlRv2oHoHkd6FFIXsnURVz/CcBnF46CwR
         MOdw5zC89NQ+iQv+7vFdJSxrWJAnWAqdwQkCXQGVR5ElePspnobu8trtS4Y13cyOcjoY
         t1RxVLTuHj/eSe5HQ1IcM+/Snnu5Dafz2QwEWQOAjZeRV8JkuJD3Rzbal83PD1XjsL1p
         dS6K403AWC7hpO33xxHnlit98WlQ1QLQosjnrcDBcG73KTtcUl3VJVQehZBdR9Kn5pSv
         0I/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr3NhWtb656NhFEifpSLrqJyzRbXHkUIwDX1MYlaHXxk4zdPVKr+apgaTETmBOzKJwly9UVx61JB7fXsG3u@vger.kernel.org
X-Gm-Message-State: AOJu0YylwnMKn1D6E+z1xgpxXSrdJFWOjzHQZYoNiGvP5B/VR/9J+jIr
	4IaC57UPvirGcxXSHPDYCJg0DW2rDJG/nijPnADg/Xa24L+pthB4dLyJl+88DGOHITTTwUSM4M4
	C+NcAh0KXJ4WrzlWWF5hwJd0NqKXQgrB2PX4Cmmfb/prLrf+6CgtSxZ19wfO3Fea67W50
X-Gm-Gg: AR+sD12H7Y1klj0/CYJrhmmoYKn/IgsEay7i3iUt2N0XI4ryAzVtoX3QxaKyBN7YSRZ
	Kha4+UNDVoMcWTqZ8Qj5REU5cSC0NwJSb4HcUo6a3a4wXETv9nQxn9ghtLVUUe1ivLnE9jt3HBh
	EA2Lf301hlGBdiyqUj31Q48cT/12nfSJoER+PO5HCsUeObD2lW2KaSrXUduaTHKmdpZyYgJlXVd
	dsfwOr5fx9k6zOiEsjyzE7UqJsXcQ9FlhDv0zXNFSyAwzFhZXFZ+yW6XV62FWFW13Kt9S7NSCIj
	CtRvD2TdpaqW1JXbc3329B/bYMa6hE1wIvU9+luZmY7MV0bdUas8hT2agnIzVt2E3Bj+WU7AHSi
	1AJcDPZgQ61+GTZOLqasyZ4qUvPxPP2waYPMN
X-Received: by 2002:a17:90b:1345:b0:37f:fda5:8d9a with SMTP id 98e67ed59e1d1-38e4b56dd52mr14740766a91.25.1784563384517;
        Mon, 20 Jul 2026 09:03:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1345:b0:37f:fda5:8d9a with SMTP id 98e67ed59e1d1-38e4b56dd52mr14740698a91.25.1784563383862;
        Mon, 20 Jul 2026 09:03:03 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm37616115eec.7.2026.07.20.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:03:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon, 20 Jul 2026 21:32:24 +0530
Message-Id: <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NyBTYWx0ZWRfX3q05BcErbejU
 j4bImmmqrhbFsMst4aWzvYoS5rhAQ5jh/WyDWB1YHNOjda182ZfKCEL2swgyDh9vL+6wH5hqKw1
 3nVBEoOFPIt8u2L3JUKitwvvW8Rexhc=
X-Proofpoint-ORIG-GUID: hRBAfoYQ5C_BdagLnZMYSoDL-h-dBcvX
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5e46b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=NrbrONOL4QpDeGKfLFoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: hRBAfoYQ5C_BdagLnZMYSoDL-h-dBcvX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NyBTYWx0ZWRfX2yeJsfXRtm5c
 sNy7pMFHgROYfV87AtZD812a2TO8ueSCT7RwXYabFn7ulclP5SYoqKL2fO3R3i+8oeJWjF/tDqH
 eR9C9tIgZh+FZOFQpRdwyxSm/ITxZJ8TT7pDHTbHLy/c8NS0xKU2OirjQR2sDf+qbhLaGJaQiK2
 HB+ZtwdqLelOD2eO/RE9IJuhFEoy32V2VreL50eay99wadCufgL1L07qGdY0fyM7q0QEtvSGNpQ
 6FRRzRXUQrKoQsOco9Iimn9tz2E+SFulSWiTzV2QlJpza8aY4YYQwE2F8d3voAeo+nkDnzk80Ka
 E/lTpyaNctJCXYPPyob3jsJNJxg8AV1QhYW7pUhjCgHm1cQT2s/LJuwSWkj2abtJceLqv1luHnq
 5yb9FsouU9m3M28MQLbLLBV2zDxx6OdT/lk4HtLIhOY3NZV9LzETCTLvKxKgIZUv8zXI8fIY+wO
 +0QSAnBJCOmn/qrfu2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200177

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

On platforms such as Monaco and Lemans, third-party codecs are hardware
wired to the SoC and do not always have an in-tree codec driver to manage
their clocks. For these designs, clock line enablement must be driven
from the platform side, and this series provides the necessary support
for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
I2S MCLK and BCLK has moved from the DSP to the kernel. This series
introduces the required device tree binding support to represent and
vote for these clocks from the kernel.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..cde52c6f6761 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,46 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9a-f]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        items:
+          - description: MI2S bit clock
+          - description: MI2S external bit clock
+          - description: MI2S master clock
+
+      clock-names:
+        minItems: 1
+        items:
+          - enum: [bclk, eclk, mclk]
+          - const: mclk
+
+    dependencies:
+      clocks: [clock-names]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +69,20 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     dais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@10 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "bclk", "mclk";
+        };
     };
-- 
2.34.1

