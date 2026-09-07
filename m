Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02984ACC83
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812655; cv=none; b=OmzX81EAeDNFsPhzBtTdXkBL1swkNiHEpitAISGSFVnnz7ILLCgRzZPzivxOGJe8DXKBb1aqBpiMY+mkZ3JOQowsBi/Xm5lo4A3g25ji+6Hjd05zgvoIoN+8twtcQOxoRMmcd75DpQJdasYk+nUSNqponjznaFF/ByTnBBAvjDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812655; c=relaxed/simple;
	bh=1tqS6Dvk6HqdQruGW7WjMOOIlEWgJQuXPAL9e/OSA7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rT3U/reMD6TMFX3D83g/wOqCNqk4f7QdQvlwUAFei3mNocRNwiAjusizZitgEgsRvl2zUmJA3G6uUO0xlZX14RRDdEAXDkvQkO7s53Z3mrePueCvSj7tw/XpSmyHNFg5Awm7WfRS68D4AXITByk3ZJ61F+k22QtDbzDoym2lNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ly8bzrqQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kanuK5ES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ly8bzrqQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kanuK5ES"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H8XPu1050245
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 20:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=; b=ly8bzrqQLmKCfTbk
	Dgegf9qo1/QceiD70j29Iro/J0WLlveKFwBBuAHrPaUkrs/qS4/cWBw2RsOzkZ5V
	vBpPYorrbAJe8yLF/6x8Czso1h2DkzgxkgoAaEt/mrIOwrW4iKSAuXNTi3Fg8U8V
	qEjMSYrUlgnNFYgOIrBBNzEjh8JF3jhfJ563iRCbirj4F+5AmqTjLmmlqp4jn+mw
	zduDJUZufrm1BFlD+PYz1M3orc2+DYiFyF005X0kfDmUUTrl/af4GLpJjisdSzYJ
	xM8KfmiGeBe4tQG6dkXVOx20PkPrSRW4l6osrnSXCaEnu8fhVvrDlSOFgmBfwc2p
	ZfBWUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqj91s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 20:24:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc435388657so1827383a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812650; x=1789417450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=kanuK5EScl3tMQrOz87s8yUbw6ueHKAZMZscebNdZsoUfSmukqRaII3NWR12B7bnJ7
         RjwclfS3OBHmN+BSW4NM9RlknCh+PBYR5Cj/vQ/ya5GQ1ahHOTN0mIyYsh1Q94rmiqEw
         wBaUqF36G/YuZXYti3uQk4TMQq7iAxiYFgRtJBWuGzqm9QSB5XAGybncQlRTFxz2GflV
         Vn+sqD9h3DHvlHhygMnbKqEAFQIZEzZ5gXeP8twMiA2mSwh/vLyEl6oTAssHX6uAqyeK
         iRs8g7ig2bhAYddFsHFX8rnhXVFfTtiy3EEYyX0MKNGIR0H7BVJbYMQlRH7VS/g1+d6x
         NJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812650; x=1789417450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=AU8EmMUGOC58ouxubVpZBmrHPcJ0BMpXuXtTjTP9y4ydGVKCKg/639c3SGVZHoQkuv
         Ff06EotxNNg5mr22gtrI/zb37FhQENI37MTVc9dF406CF1pVzywz3DaVXk+SQ61tRJv8
         OzPaCxr75/sIxn/Otq6u7nWD99S5dk6EZvCIIt5sdJUXH+3sjp5KKE3smp3IN44Bby9b
         /bAoiykunWmDbSRipYK9FGMbvKasJKXSaD9YP5t89qtCXR/+OiIhKWjq7Nhwwk0LVxTd
         zcOFdw/lNTRhSJWjPY9EFktlqnHf3vy6dX9+GmexFCh9HR/GLwWtiHUjU9kyCtW+Ms9b
         XD6g==
X-Forwarded-Encrypted: i=1; AKwUvBwqcrrrMPj0PcdIPktV/UVz9L9ecw/tYE/bGBLx3KVH5BrcL7T5cA85xdM/qVSt9ZbemCz8nUDUU78LcoDo@vger.kernel.org
X-Gm-Message-State: AFuF++kUkj6+MxabTALgkm0Vw5sLihEkuMTM6v2HdRdTENEygHzauh3C
	n8lU4SNNERhIldr2k7jCeb6aHOtOuLOSescu6GbluqoqXxRmGoeuGupxJOEbbAYIvdbK4Iq620G
	TWycvnYU6RQHcxU3V70WKplwtQ26i0ChNqQp8zTalKq4fddE4iBhTbPehFRFE+R2kpd9q
X-Gm-Gg: AYBFou3jQeLgfsyvMA+Jb19tT8IhkKD3+7XA000Lv/t9ldZZ+gfdaz8Uzbg+a42r8l6
	S4Y6Tzqj7D+7zX6NG9MMOFEWtSAknONr3f/IPq9XROBsOK6eMJuczYYFVgi46rx3YJbjq7TADPe
	aFoTiz7gjv14eAk/woRuzjMAUgzXUoFGibV6WsRB8mXjEjVlsOyQwvbOuWwsTwCc7OtWU6UafnM
	zYbAg0opAEsFAVQKSH+kRDewwegTNVqdf+JH9zY3GLAqmVodL8G84MphaTo1YxNUNTjw+sE9Dpw
	pMl1QnIDfnuBJZfuYL8s0jjHtIbWlT8mePRFR74z6cK0p8BEzIN5BSAKuse1fuIRFoBv/Vt8ixq
	yRWhwODDXooQnRCUoq7Kj3h/s9B1f8Q==
X-Received: by 2002:a05:6a20:1441:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3da39cffff0mr39040590637.3.1788812650414;
        Mon, 07 Sep 2026 13:24:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:1441:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3da39cffff0mr39040530637.3.1788812649993;
        Mon, 07 Sep 2026 13:24:09 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:09 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:15 +0530
Subject: [PATCH net-next v2 3/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-3-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=3972;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=1tqS6Dvk6HqdQruGW7WjMOOIlEWgJQuXPAL9e/OSA7c=;
 b=CrUJsHdZ6c2FYOwXEPMoV00IX+6Ep99Hv0mU9sSCTtavP+7P0xPU00RHkfInYorGHLTw+7fko
 6sEW89emChQDJtjxcn+QfkPpX09AxlVlDL6j/LdQlY8piS4N+gGFkCq
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX05J95NvsOtvI
 UEl29RBlZGxJQQ9+RppWT0bUaJQP9AxIjFkAgc1MKVwFKh6O1rNMPykHP0u1Z9FUNgp/IjubM7R
 8ek96yxqgjTpgEgmaxPBCi74TgOpDgpWFGFzWVq8kD9WbxcdYW8EQMipsT5bON0aRikuavCtJUp
 t1g+iAZZY1urlZ4YZ+Yomsx0AfkzD17nNew2ZQPnVdS1DGdIxqEumH/r8AGPwUwcNdszWDqwREU
 05aQRVWeLAcoCcLT3CxUM49CR0ro4KP0mQgdIlJbFB9aKLbhaJkwf0jKooEEoiGyvuoq6hLOVLE
 mUDkdTsNaOtCKZRT/1lTZpcBUcJzjVLDWk9C9dAJNnhMYpCfgZ4tFczlthfxr+1VuF1RiZrA/Ks
 cLapQIY7KT5L3CnLRcWxq+q6AfZtPOzos5xO/RjoWFjbpQZTPyIDomy/hkfwDGpdm5h5VjXieIv
 Qnkis0USkprigpAP4TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX5Yf4CgZung/C
 Ry8ByMoUpKarcfTvPOht4sZupFougpidAAL5YwnRgWZpeR9NYPYy34v7WI79MAleD4yEtpvoPbF
 nyXFgfReemTRg9v0qXrQQxMjoTWetJ4=
X-Proofpoint-ORIG-GUID: wVcoLsh7yxDX5ulA2rTE-QzGpjlffycS
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9f1d6b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DJPLBmofjJW9p3Fp6mMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: wVcoLsh7yxDX5ulA2rTE-QzGpjlffycS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070224

Shikra's EMAC requires two additional clocks for NOC interconnect
access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
are enabled.

Add qcom,shikra-ethqos to the compatible enum and use an if/else
block to constrain Shikra to exactly six clocks and require
operating-points-v2, while leaving existing compatibles unchanged.

Add the relevant compatible to the binding document for snps,dwmac as
well.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 50 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..ad2cc706fa74041486cd90c3d0eb1dde0acaa27c 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -14,9 +14,6 @@ description:
   dwmmac based Qualcomm ethernet devices which support Gigabit
   ethernet (version v2.3.0 and onwards).
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -32,6 +29,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,9 +55,11 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: stmmaceth
       - const: pclk
@@ -67,6 +67,8 @@ properties:
       - enum:
           - rgmii
           - phyaux
+      - const: axi-noc
+      - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1
@@ -81,6 +83,11 @@ properties:
       - const: cpu-mac
       - const: mac-mem
 
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
   phys: true
 
   phy-names:
@@ -92,6 +99,41 @@ required:
   - clock-names
   - reg-names
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - const: rgmii
+            - const: axi-noc
+            - const: pcie-tile-axi-noc
+      required:
+        - operating-points-v2
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - enum:
+                - rgmii
+                - phyaux
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2449311c6d28ed3fbf8c92526ce8b872900653f4..6a1aea371c0b42ef71f90d89276e15159c3b3277 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -74,6 +74,7 @@ properties:
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -632,6 +633,7 @@ allOf:
                 - qcom,qcs404-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1

