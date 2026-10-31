Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445745;
	b=lme3VBIoSvsfbYkpioRUK3WUoX2vbcAo313HzgsCm+us4xNngoAh9JhOny5VrXEhaJNm
	 X8Rire/DJq3I9eceKgSotw7fc7nOPGs9ZXIujmZkRCHaa9Ywz7JeK1ArP7htzYuNBhEJu
	 22uEVvm8wb9J7V8fFFNVXIK7EtKbIpi57gVRn+3i8XhzpYYXFR6m2ahAz2C6fuuhi1xCl
	 yEQVpbvCpm/d2gc0QVio6TQqlPHs/gRhe/jVpZqoILI5IB81ZDeUKy/xfyK7eohN41SrD
	 /l4n/YGhJ1SVoTEDsGWvAVl5K/gIx87b609cbEFKZDMPo+1iBqeyg1dt/9MJZB7lVgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
	b=oO358aID72fogw5mGBJFEK+Mv7dDH7BdNThIOCK2RwPM6MKv3Mf3aGCHj40ABusx8hns
	 VVvBUw+US0XQKXeeRSQ2UzLOpqlNhaLZPN6w8/gO+juDt/khI2dZe/i9ZOKZnT7EB/d8n
	 U+GBsXgy1IzWK0t4+VGzEyqvxdfNK2qrgABOss2wApcHUtCZ5BQNc24X/tyXLa5danJOm
	 QWzW50o6hxg5pP7JkpbbZqkAgslKpfsw5kcaAGeHL3spCE7nJuQcSpZ05pd5Vngi0TjVP
	 vvbT9XKRYcCpSFkzX3ttv8saeHX+lEldsIhWOZ70GPxVDcVhTcgrM0BwAM/QUSvydhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AqOcTPdY;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED62A606A329
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED62A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AqOcTPdY
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so1924281fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445743; x=1794050543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
        b=AqOcTPdYZdma3eVNjAMT5wVBeHEVso2q9jo9OwECNfbZwWef4Faxk0Vs9eBR5D1J/z
         nLFPKfrbkgryICxai3SYb3R3tJBdFt9btFy258q3e0aw0epd9STu8m/LyT8ptdoXxiiD
         3Pa9vGqPRUCvRnjx6UCX/CkFNS9c5aZLV+Gh+LQArFv4BTclbED3Oojzvi5u1wkNzMoS
         9y3r0yBnaxHqSyGN4qL1dcP7m/sULP+ArmAIK6MJbRDwnFVgLD1Fu+LuSMKbEbYeZcJC
         jytEc+Y0cb2Ws6RentPhiZLKN50lAvtVWFEGmiqN+s1tYkshVYDoadV7mBnXKupwQ/bc
         nhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445743; x=1794050543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
        b=y2zdAX6iaaEE/ShvkxZq8FcikjyNqcNkQnNrsvIgnaxzV2Pf4R2PMKS1ZtymnG8ZTd
         mfLqqAPZv1RGOF6YznTQZXEIyyo1eT1785xJA5/i/OsfgxpbGPDNnget0A6Qe2cAk1Wx
         dv3xZFrenvuZPsjY7y3oupuaezpkw9pwhjOmn4szjyS5ojULd79mMLFtnFC+DxhePRK1
         Av5A3qRmz7m/ch1GBfWKFKG9jvulF1eTL3f1dulyFVxa9hVJGilJaxqem0HaJhj1yfx2
         MLjuFDg0A8PkmOarIwY4D7Rt+Kn5sdltMfY2b0RUxS1v6ew2VeuXRnNDHAGkjt6yEOJ6
         LdYA==
X-Forwarded-Encrypted: i=1; AKwUvBzo9/89NtDuNoGJI5xQNGajGBWnOxa/sdK1g52ZDPeubsTcr/4mNvL++IEEp4a+TV0+nqQzsFMKDJLKFknC@vger.kernel.org
X-Gm-Message-State: AFq9FYKInpYg1WkcdRu5HRqNULpWYEgOUwS957KLVKMlPU7SCc6ipIAU
	/VbngPyOmvXnikOhGbFcimnzVOm4POIk9+l0gOqw0dKXpDQoFirMO42xdsjGWrgm0rw=
X-Gm-Gg: AYBFou1/RsEjdETFq4aCBeyx4zoMRBR7UGOWP4hTGb2vK6+jY2yGpIKZRU3mhpDMy3Z
	LCTt0H/t5FLgtGQ2yFRAudL+3qxdGBZqg3ec+KcBfFZ0AItGcZMhZaQO1aYA+LPzUPKa2YXJW+2
	kUlmZBwy82xv17gISaHNW0ui4JIxLm0OvMTo6jjVOvBjzB3qT356f47ZcfR78+PN+QgXLRN4+j7
	vYjKm+m1C6gSccO+Is5sp4Qu+clRcg2E5KRhDK1SOVMaf2XBzgjji4eCJGFa3I0fKYfDJOUe6RK
	20qSyzrfB1EIbpEUPgVfFGNgg2voqAgLIQWEuPuPPyE4XpdOs9rfDTTHK6+iuax08n6k/EqY94W
	QuotmTwq2egLEDg3Ci67XTbSdH0aT0gbGSHUJL0kGJA95vHThY5W6AxZVstcbad+BZ+q4mpc9P5
	1ZO/W+B58c4FON9A+M6X2sXhisMumly4IapAIdwoyNe8zHKqKQu/a6lgfy3yHx9obg7mrQsX0Lo
	aWv7Ep8dLv+YpElXhwQfn38YEGsIT3v2qJkoKBNJ7Eq6jA1F4sPmBIhck9sUoqfSWodHP7b/sAv
	GdPZ4RfGViO4z0xEdTgRIlxIvnBKLtHlT97n2/kw6nt3XuF+0oU9g+6sGAv8yRU8SdEaeg==
X-Received: by 2002:ac2:4bd5:0:b0:5bf:e4e3:3df9 with SMTP id 2adb3069b0e04-5bfe4e342admr90635e87.2.1793445743107;
        Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:22 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test pattern generators
Date: Sat, 31 Oct 2026 13:21:58 +0200
Message-ID: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
Describe their register spaces and the non-real time CAMNOC AXI clock,
which is required to get TPG output frames passed to VFE.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
index 9c8de722601e..50ae30cdcb82 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
@@ -17,7 +17,7 @@ properties:
     const: qcom,sm8650-camss
 
   reg:
-    maxItems: 17
+    maxItems: 20
 
   reg-names:
     items:
@@ -38,9 +38,12 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
 
   clocks:
-    maxItems: 33
+    maxItems: 34
 
   clock-names:
     items:
@@ -77,6 +80,7 @@ properties:
       - const: vfe_lite_ahb
       - const: vfe_lite_cphy_rx
       - const: vfe_lite_csid
+      - const: camnoc_nrt_axi
 
   interrupts:
     maxItems: 16
@@ -226,7 +230,10 @@ examples:
                   <0 0x0ac71000 0 0xf000>,
                   <0 0x0ac80000 0 0xf000>,
                   <0 0x0accc000 0 0x2000>,
-                  <0 0x0acd1000 0 0x2000>;
+                  <0 0x0acd1000 0 0x2000>,
+                  <0 0x0acf6000 0 0x400>,
+                  <0 0x0acf7000 0 0x400>,
+                  <0 0x0acf8000 0 0x400>;
             reg-names = "csid_wrapper",
                         "csid0",
                         "csid1",
@@ -243,7 +250,10 @@ examples:
                         "vfe1",
                         "vfe2",
                         "vfe_lite0",
-                        "vfe_lite1";
+                        "vfe_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2";
             clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
                      <&camcc CAM_CC_CPAS_AHB_CLK>,
                      <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
@@ -276,7 +286,8 @@ examples:
                      <&camcc CAM_CC_IFE_LITE_CLK>,
                      <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
                      <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
-                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
             clock-names = "camnoc_axi",
                           "cpas_ahb",
                           "cpas_fast_ahb",
@@ -309,7 +320,8 @@ examples:
                           "vfe_lite",
                           "vfe_lite_ahb",
                           "vfe_lite_cphy_rx",
-                          "vfe_lite_csid";
+                          "vfe_lite_csid",
+                          "camnoc_nrt_axi";
             interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
                          <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
                          <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
-- 
2.53.0

