Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578272;
	b=YAlJNfwfzmhMI+cjn0yJhWN+9vhdOA2rpmIrRsIpXgK5cNudXd7tZsSFOuY+fg+EPk6F
	 gl3h5m0b7vDKHEwqC6wuGrPB0YUnBX3jSgtNfyD5tDAKKUvIIvCa6BvKHVQd1N4jRhIPW
	 Xo0Kmptq26lfasgkSQG9fMkyGATb7b20ieJrpc+1611+d6s6fxsts16Ts0+3lpGWIwuZQ
	 qoIB+odejA9dWd0ExrxGLk03q2zq/wCnNh8fmU8IAQAqrK4BI7oCSfD4TtthZNQkvUxep
	 nzWx4EyhzZI1RMnJlh98DOutGj6TejTm4txeR2R9l7RguxHMacFHeUZRYZsPfy7oxuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MoC1SgO2w8DUrhMh2AG+uVa1qSo1fqq7KKacDb9Yle0=;
	b=k4dWBdrrUGgRAddMptdHRFZFRfb2Y/RpaurrlAh8b3d6S1AUL9jbkClTt4eYXmNmMTIt
	 qXoFjL9aWeKLjQqbC9Eergi4TxoGAQqOa5HwdLWSsnWr8Pl5Ztx8vEfO/vC2SGauw/cUp
	 bhgNqTTg9WZr5Kt9ZhNusrQgJEo0D41tGUVsmW7MYeutJp64Wc8ojDsbtGFTJiIQz9CmA
	 +Lpa3BiH2MD9ZJVBH/DT1uJKvp9o0r4LkQ/e81ONkYEzQ9Lrk1E9ad9+FBEFAivPI0Xm+
	 TdKbC8U/DXfHNrndB8E1/F+QzynsE0yF3XwKdatrEQiGCijmkzBbzs/bd14HXQbsK1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cd/CwUIr";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457E606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C457E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cd/CwUIr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso50199345e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578270; x=1796183070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoC1SgO2w8DUrhMh2AG+uVa1qSo1fqq7KKacDb9Yle0=;
        b=cd/CwUIrjbcOE1jcXgRaYEIJDQYsFOTCJ5iMNwUDr+K/29VkIZmyHTaJpvjyoplwUt
         opHj+vOiMs4TceBGSSSXLJKXZ1kG/6/jRyut2IruE/5mr1cSY2NcKw8Jvv5l2hE3jtvg
         /SaanOhh4Bs57LI5zBeU+S0ijGpmAA5qhzuFVDanm14lBFNKgrbjTtOOQjIF44Crw928
         iippPScspNB6PFL3psxMHXTiJBBL+rnUbRzqvW1LfJkTHxqFrtexgvScZv3F80oBetbs
         uYQhg+uMXBE+sTplkymU+bfIBxVEGZbnnmeuMfGBLK/BTUKwkKbKbFK/tBjJ6JR+/jmW
         XyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578270; x=1796183070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoC1SgO2w8DUrhMh2AG+uVa1qSo1fqq7KKacDb9Yle0=;
        b=17z7n9JN9l62WlXYuRMs5SShLcG+WBASbjP8d8GdIrvUjM3G1VkV7r6Qng8jW2x4k2
         OfE3eMf3UU1mmbAge1rDPZt9VIQ5ewofJAkJ32VqRdm1yWQiYw+0wbce0GMNvbi+3p6n
         0x/Vp5Vg67icEV/6+GIyq+RhOD/9T9qOKEgJAMWSQfZFyKkguNTM1M/mfjzV9/3+pTqf
         ANU5k/+nLTrKFY9H0IscA99pc6I4BLknlCLixsQ4iabiJR1DZrBUJYANNdEMdAgBgCqq
         J3rPgT6oJ8F62gDGiAz8zCStpkquq+6ELqmlapCcsrCHNocBqtC7gcvcn05cDA/ePn13
         oTLw==
X-Gm-Message-State: APuU4Z+sY4DE+7Hw+5lz7t0MQd6qA4uBexJBHfk4A/kmH+LPF0SDEdUs
	oM7UD8psEbRhyap5mE/ZhddBdqLYR3LgyW7ewJvHfN4t6oeHw2qZqpPu
X-Gm-Gg: AZFdTZc9Me0UaCW0gYFJfxRMjBGjf8Ayzl0N+NOYDwU++suGkNRsQlpLp/25TUpL3Tb
	q4r8SWpGvl3CM5Varu0MRadM8kTg+If/BQDtdTxQKzjKgXzK4909MPU5SwEccM9RZ0I9blPCgMb
	WVpedMticG3brbz8YvGirqWCBxY9WWhGe5ARfwSg0+KZVt3HTQZ2GlfXNt65p7qscwkNpbnB3z4
	JAESiXAO9RUVt/lqr7DoqDz6STlAQy2VHz2Y+p/fkgBuUZ8TEIf2kfPd2zrHnO88uIm5ksHzYpz
	8mywKkyGqcKG+sTTUb9jFXcIaYpte1jNDOHDOWZWjXDySppB6FrvNmsNb9Ob/mwi7DhV/oVpTYW
	pj5B+1BjB4XEf4eEvyktFItjx5eWzI/cZ8eHZDBa4amQe+F3U+iIXDkwjJnM07R57BzAPImtmwa
	4rJMtQihLA8BcoZGQTLLFkA/P5NSAuyVpxn3AU5Eu/fsC74ij+oUHiPeO1DADWvQFpX3ZExvAvd
	2mV9L5L1FwRcayGRrL0bvWI0JI9VvNezmeOfe8XSC+7QHYwFDsYgnc5+IkLk6TvEWWU6R4OFsmQ
	SbeXKpXb/iYCOZCAuzU854uKIT2rZ9zURTrLMw==
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr355855285e9.4.1795578270210;
        Tue, 24 Nov 2026 19:44:30 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:07 +0000
Subject: [PATCH v3 11/14] dt-bindings: arm: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261125-halliday-dts-v3-11-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=2338;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sc7hCO/9FV03CpZVdvB2YU0dNTyFNg8IPFIk+Pz2HvA=;
 b=SvON30lBvsLRrioVjQpTeOXmqm/qci7ViucRjmCDuG3VaQjW0xP9BFS6pOQsd/zJ4swyXRt58
 s7+MR2lL/c8C4SsgOWqG1Sju1syf3BxGFRuDPua+ActSxncjvLjBfNQ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P), and register the "halliday" codename in the
SoC naming convention schema.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..9d392329d437 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7157795870c..4d5e335ce065 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -107,6 +107,11 @@ properties:
               - qcom,glymur-sip-crd
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0

