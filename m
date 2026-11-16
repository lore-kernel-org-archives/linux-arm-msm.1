Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864471;
	b=tonDzVSF7mr0vdI2HYKxvjhhyo40AeMLYuNVsw8Fk7zBk9ty9j87N2N4w3bICXj5nm2r
	 ewgZ/pPSYl7KShfHgZT9XnZHX0+1VJn1HU5QF1YsIYZGtoMtSjESpSjCbHxVlA90SEft+
	 HvLa12NaynmU2udLBpDVVWWKBRRRVudBpXRidnDQ5z14JZ/7KEYOBbb8pSEvU4JbgxTd3
	 tHDuOb7JMMib6Y5plbzoPH3n41kras2nE2itpvJURqT8U4+uGkGFA5w2E1/prHjb8aYk0
	 cbJcvCXKTEpWnL8cVtmnZ321Y6ytLtGUcnMh3FcItrPBurBZzqB2DVNJ6uXdhprTPRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
	b=ui3cljC4Tjgj/yTionAx71rVzTVpQz0T+7k4Y9MX1+tXNqZOPsoFmJCjIQHSoEqdb1Re
	 tgsOYeASpA7y3kR7Ff2xgMyuARoycru/ITmX03hQhmd7MRdQ7AcU826dFR2n9jzN1geYH
	 OCEddMdwlUDSkM9UmsRbaYbRLQ/oZhwhXNXNSaBT08OSmbJ70ex3KLZnIiHIuKyFG0UGN
	 kHkgRQQh8MFuOgTuroxGcSdoo3XGtNlkXJRiFwTVvrqGEaIXlzk/xTfKdBxn529UsVgA8
	 pvlpPD+FwXG8ZAfwJUo32GgEwLZP8h9KTxdUhJ8E23eENefH7K1PcMrRSXJr4auPahA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtED5PjB;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A0606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtED5PjB
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a32576da88so278597f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864469; x=1795469269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
        b=MtED5PjBAUUX1nqVGeH4O2AqQAjGqMw2pZItkYtDZ5VuJIZvXrHDLRfGKUVRSYLhp7
         SadZH7H7v/4qecL7/xx2hxUwP5FH2yzEb4U1goYIN1px1JLPzYcbJc7lIrXIsf/wUUr9
         ldEtI2Kct9DtBpn9tXWr/qn5WDybofiIEEv8VD4ie80R2GT3qTq7ODRV/NuWeMXgnwb3
         PiMDYdzQuEcQdcwInEl7C5imlPaeMrmHswtQT14y31JumH5ZADHni9BebTh0lCs7FRak
         9U2NHqnAUtq8m5l+s2JJLL/33S6lQDYaM8x7ZoOjmFVDpE/S52nepPydk4iJbkjH5CDk
         UlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864469; x=1795469269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
        b=DGyzJSS7sR6wYutMLZ6cbsXxxqc6ScUz7+gQBGvVWZbrCP3IVHKTpUTWWqDnJF1eHc
         H/fp6elXYqvX4cVwQ3D6Q0VYwzt0x7bVWvu22ZucaLba24v3doFWqs46qLqQKdFlzoAF
         zpgXaspHMhlbIlXFYANAPoXLsB1I/Mfp1mjgUCcKWnNhpS+naYVGsupuiLc4hygCFcm+
         XEd0/tfZ5EYET7tm9/8uwEJeqLr9JITmvXHgL/aywSyp07UG+YBHK26am2JGnuElmAMh
         uFHJ5lEt2eONyhUXNYFMCpWWQX2iIgbEg52uMVffYJU0j1p9WCOOzCYwW1LNP/j7UBZs
         Y/hw==
X-Gm-Message-State: APuU4Z9I5rvLjS0eZa5riw/ax1jxgLLqw2pwnL6joOP3R0om+HzkCXp+
	7Uvgiasy4aCmsiVCSjL8mka5wHHKefaaK0Ixz430bBlGoMc7QeLsWOQo
X-Gm-Gg: AZFdTZd55bkc2l0IMDEhKY6gllRvsyzKYNQF/IpVWtlyNBdEF1ZiESyJdbCFNmaVhWs
	IzTn9qzjUq7zWWAlnA7lIXIfX0zMfyiaQs50bOmuJEu8gyCgR3wclH6aHjwRwdlOfBrhsxNk2+6
	gKL4gZMAMv95SApocg099tzr7d5HQDBrKwJHGOLx7Dt1VA6YSMsSdzvj1LkwmTOhcXSoyv6Iamg
	O7rGtQ1BRBEPKEaH5ZYJu6Z/8ZoBMLqQQZaLRUbidd7oHfPn+spD/RI1Ff2e8m6AJsc0WAMpghD
	lztKKNkUZlaB8vK/DY9DoXve+V9gvWCSWbjf0TvN+7uvnYtufrpH+NYdFPg1aaxrpG/T5anXhGs
	CnvwzOI0UcxKqmaYHq84qaduqsM6F/ASH7MninKxkMUCw0CQX/0k03mdDPR81BRsWO1V11TkAXo
	0ym6pKcQzY4geYmj7k8zetYxKOXvLTT8v6Cwa1v4n8viKaNvllmxujiyesZkjbnEfVHPzJI4/Kv
	e0wOvM6B0Gao9kCHPUP3gpt5LSFe2lueK38/TQS9fefWr72SQyaykPUHGLX7jwFxzKcT0+OexTt
	L04NA1qzmAGuHc5+DygqQfAIhkqwZ5b5tLL7YBzd
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr24445384f8f.13.1794864469242;
        Mon, 16 Nov 2026 13:27:49 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:48 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:28 +0000
Subject: [PATCH v2 12/16] dt-bindings: arm: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=2338;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=8VdPKIubIS5rrskEMQXxsc4CH/xmK2NlYtvs6kfcSuc=;
 b=t9apGIuBdbCgnaj0/1UJjnpEZvArnjOHWwiMxnYe/9rnq7pKBOWl7S4p0La1YJLjWlXweFSEs
 dlcpSLrFw/hDB74P8wfi7SGdvZuxbRKq1frXt0fWIbXohJzyyH4p/WF
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
index 7ffa4f69987f..2a77382a9f25 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -106,6 +106,11 @@ properties:
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

