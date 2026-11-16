Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864435;
	b=IVR2GZY25IxQKRRzukvqHZIoBn4qU7Dld4Te4UnNzoC+mXUQezTFplEEXvmBnruMbjsR
	 pHBLR46kHcPSTeiUz163G1MRbaHTCCziqTzVg6bFBV0t4xIxFFHLI/swFo1geIKFr8kmk
	 BG7s4Bq0n8XpaJk+kgdU5lufr7z+ABnyYkvhJRhrz7S6bpS9fvonv5aISeQpqK9IgUBv1
	 9JApqCML69J6908joEektCcIstWEadUaCkZAEPUHLZblFMis1hbUw4eKO/8uuA8j3qWt4
	 TYwWsivsBPmMEnXRUj0YwP5HvAJAfjizF4BlMDdvpeal14TfmD/bm3HxNnu2jgioaJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
	b=aQKiaMJz3OylxiEfgfU3oTWKnWl+XD+LMOocQjFV/Cvsyce/C6pVIAhM6RQ+mDF9im2K
	 zj0JAQH7pn8XKvku1pJm9L6Mo+mPg7c3bAOynDTrDKHOv7bO31IeSr9rhmG8fMA+gK2vb
	 it3+pwzeGVN8NqMHjQ7UxeCw0WlTkKlS6Ufbi3HbO23NjSuN1smTerVPoqCwxNJNpffPa
	 CPr7vkZBErxrCysFzwQ4OLrjhXhhMFTd0F+YGUJqpnAxwjzHBveqW2gQxxD5BrjujjZZK
	 8WhC0VEzWH+5WC3CdZf7KLCxCVNPdkamV5J4psbZ4avqq/AtiUSGi5e+tJqHHsRp7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P16DvILv;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B94B606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B94B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P16DvILv
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so2204748f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864433; x=1795469233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=P16DvILvAkJjX6pET/OY1y6yCbL6KHNvFmQ8Vc5ms2Nh4pBtOsH5swOYSMdfoItM4b
         t5MUV5RS8EsfFWLaJSSS5E70h3/UCARtpvqtPXICi2MnbVDPa95XtCUmcFtAYjMi3iD9
         sCZvL8DZRUZv/G7eI4SHBKPuYPPoNAExEKI30EQbOIauyxIQR0kIV/+D532rj4kB4ZjR
         LbaVAAYCUUzAIoRJt6nlQejAo2Qj82puHxbZwDW1Fa8tRWYcjQNNMrBV4t0c64r9Bq5k
         XxoBse3bOdVc5KRCAVJVYP/0nrxUtbAZayRyyja7hKGad0rPdK7UrkQNvPW9f3BimHA9
         xUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864433; x=1795469233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=F7QmG2G9pCZKNla7BOzbFAbKDPii2w7wVFMea0upkxFAYgWBRLu1165rLdn3Y7k7Wj
         tMVRNSFY8Hnb5dshi8TJjNLo5JC+6aMO+WjBQVcQ8CvSmAgll1IeOghuv2zyz0dA2L4r
         DhkEvWhuoz7g1OZkcge10zA0vgq6wHYC5o8Erv0WDi5+Y6dLUZSOkibUPtI+aEiG10nm
         3hRykzpTUSC/dt8OUIqHsjj3ODAu4wJ3IKF6ia65W4tCqX+L++2wP2ZWdd7glEWFIJZB
         okVNyQxMzwM1K+AsHTak41TM7KwJDj/tuYbPvlHprDJJ91HFB6bVE+fLx7lVUE57jXwq
         GO6g==
X-Gm-Message-State: APuU4Z/8It5B3QDt8pNnIK/GAKnb4/k18CPiiDyyN6odvBoMr0Cji+tA
	7ytntqPyUWIQOC7M6rKlpVTvB7qTagdIXN7aJPkmM/wD6CH+rV7fQ55U
X-Gm-Gg: AZFdTZf8uMnW+ahgngL4Ekd0R2+BTFPliHGMY83M1kEk0BGTK5L1BhqtS916Ip5oTSc
	pr2+1vZsXMQp2Rmlo9JRbl0r5bQvl+AKXssJucJlZJHrLNODeYXcR8m/Id22sCl76QNYdBt1rQo
	e41g+3ZeLVp3ErjzhvXNZAb+8H/FjksAQKRt1y46/3j6J4X35AY9q1aaR96jSOFy3oAcRrjnZOQ
	dTvqRGBlO8CJYM2z4hZNJcwnr0gywp4uh7UXAWq7cG/0l8ZVIYu1TA7pycZDnGfqO2Tkoa9MJ16
	4S9msXznzZ+egNDiTgO8uTzMZbBsLXGod9c7YR2GLNEClwrWusSDErnImH4atTTFhtdTynkgbCy
	A9yvaoyaPcD27LM9WH3/rSKsJVTBqTUkmvVRgJrUYeF5NAjzVPSZju0ywQfQFXdeHBiHTxeen5A
	W/7Y6h8TbgYGMXVJd4uLHjp89JnORTrI4f+GuyWj88SDnC+wytmZZkMQFtXt5owNtrDirMEjPA3
	EfK11I1wM1RZwnQiFsUKlkUST2iSe366Q+AjPDjvCRqo42v4GuKRzkPkpNQrVNEse9E1YUXVyog
	ykDTHMYtWEuzvGIrpgHfWb74yNThi4tpPc506ujv
X-Received: by 2002:a05:6000:610:b0:495:5c83:51b9 with SMTP id ffacd0b85a97d-49c7467a893mr27328310f8f.50.1794864433590;
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:22 +0000
Subject: [PATCH v2 06/16] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
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
Message-Id: <20261116-halliday-dts-v2-6-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=XlBnHuuXKSsmwBoy79zd7CM/aQS0V4vz73O5I/ykrhOgY3nFJG4rnY0qnm4zfFTA5sK35VFT6
 GeLVT3WztE2DdDA/hh0iSPFr/rHt5tVJ5B9S1do1YbNU2FqHh/CJpdT
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

