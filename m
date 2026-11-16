Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864401;
	b=O4bczqvEJgZc7EUdXghr3vKvi/xMX7YPi0Lnloa085SQEuTrPo0CJr1hZQ7SW4YsgBZ/
	 cgTWCjAV9aF4JydznGOYwNtn8l7WiOhsNGgPLQZmTwGOppEZ+d2rLwUcLeCE2Fpv182M2
	 XhB5XUvqCg/k1MZvHL1joo/LiwDOH+M00/A1k7xLYE76DeDv4f9MbiwJ/K9pXUBgR2EZj
	 XZmgHE4r/s3LowYtv0M7jAUSU2GuPib38o3HHbaGmC7saJjaXIp+v2TLmM2Sd+Bg4h1MH
	 ffplyIKDAwcK7azd96xTWwsJGrcPtxl5gnFHa5yk8q5FeIWwBbfIBOwbq0Ma95zgzdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
	b=1zvoFqVbueI6XjaFtIB0aHGNvscKWeGgcvpTQuYs/vG4/WXOjEtPw6dNKWpRlef8au2E
	 lDT4PNi4/8UT6xGdsCoS7opEEFxyhnvUplIDzFJV+cAlk+2ESU0IjwOE2etHnfHQOhMPv
	 UOUxgX3GNtuauDZnM6cVjDDaXmFOcJ6Z0a/uFuQI23iGGXjfSRQjkfifjekN8gqAClcoq
	 kJiaenTGhmmOzlMN+9phawLAMyQvnP/YwmAWkeC6314OgBhCigAVPT34bwhYsdKP+fhRB
	 FIEBnEcF7HtWFQRDVeLwLGoFLNHGWjIoO/h44ccYiDZ9cQ+uFpv4J89rQfxBKwA4l8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3jIIAKb;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD00606A33B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD00606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3jIIAKb
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso27226385e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864399; x=1795469199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=y3jIIAKbbbSqQMJBSkJHyd7OrigIp9VoXLj5TrsVjC1P5SJK1+6GfH/CwfjSUDChdp
         aSUwKzVMSzcpqSu+dYj881QSy5uTr/mR1OuilOAa2PvT9ykPWZFupXWFXDJUWg+Evv7+
         YMfIN375w4C+9j10ZwuEeWRYPJesN+qvcukrs197w5O55lUuxshj1qTYZTKsY4pTkB8q
         AmWVhst/9ZLMgOWXi9rzj5DYH6Nkhc6djSlUphB9PtYcVDNyHJItRCJ/2xhCROn2FZJc
         u07Cqgc9tSSpuyxqc+gXNYk6FMS5PVUI7wsv9LBks2s6FQbonvj25Ul9GhnE9u2M+hED
         rhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864399; x=1795469199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=MqC44RQCOe3+9LRL9eRdsVC8p75Va6k+TV8LY1a5yTcX09pe3EV/QhuO4kVNve1Rya
         1ah0QHw3HdDcy19PhI0XHD8tbuLjWLm3TDiTRgXFrVhuxKnYMFjrm7fdfR5ybBxzCaD1
         Ppvg5Hx0qEC+wAFhMMtRsCmChsDYCLHipmawAYxi3okGBzJFQWWapS/8X1y0SzC+xVU1
         Mm7bAvUL9E11wv0mWN3waEjlAtRqRul45mcx+6WFpJUapIfacP6QVIPm88und4kG65/g
         J2byXklGxAC4esgfV4/Lwc4wrQLoyDSBbh/RiN/1LTzHoTL/felmAXWhvV3SC6VwMo7C
         6mHw==
X-Gm-Message-State: APuU4Z/C4TYFj/iK4zTVciQ8nYGs02a71TK8Fp5a22M4V3tMIBe0R/Nw
	HYDBo8HO+tAua0e6Qr0QGWI1jw9RwGvw4UJfl5nSF2ELbZSxKIH6oF+y
X-Gm-Gg: AYBFou1IpOgmqWy5bCQ3Ju8ftKtGwnLDK2Z0J++lZi3VK+RcP/8ZdLMhFLBs7zSAOiD
	3yrDCCoeiNXRrbuPPjjAtUwMn8KoQQRgTjZc33HuS3k0kyJsX6hdn+AYrI9FxlSiMApUDpxRorb
	TEBp2MmFnIbFPmwLxmbUePnUsA96/vORZIsB2zfANnekCP36137VsF+2PFcc16STG7OCXCZl+1C
	Oc5ewtDB3DGk5Dl5aBNM2Z6zMGyLspz5jBpKCX0YjITHJCpIq5lYTf5dZl/pRxZTwQkMtWcCN/T
	Lp20ZEJ/JSBttSPmb13MXWjYecKfsz8SLofT5GbmBPvqB/8UhZ0jXyGtWnr0nzr3aV5znts68XX
	zMifqjxnPncOmEPMaKw4O1S8g+O3mGtbqR8fN19Rkd2ix6Bd1WPG0Wdm165LYsr/U0cVkIxAnwt
	EyrU4tlYgTZoo+H8YQ0RIfrx8Oo2q581E8CaoX0LOhEHbfsovGR/nbcWLmFjfBnwzsr/Yxi+mfK
	fibU9N90r8p3Zhq7abCcmEflDbKjLl4dgxqh8g0h130ya4gJJlgusy/JIQtlDvZyJhvWzOvMZgx
	xwUJWb1glDxs5GVEKrM377bwOclctFAboRDIi96N
X-Received: by 2002:a05:600c:3509:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4bb559f3633mr229913355e9.1.1794864399079;
        Mon, 16 Nov 2026 13:26:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:17 +0000
Subject: [PATCH v2 01/16] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
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
Message-Id: <20261116-halliday-dts-v2-1-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=910;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=TIEe9N/cyAzKgpuoZBtDZhrBfZnBIMsVZBId/jMf7sU=;
 b=dpF7p0w+OJpIxiGvX34+YlsXwN/di/jZgfYFaXfY2LGvx7anrS9naa9DX6XaW0R3KAm0CLz0p
 0yoxibSkrgQC5/lkQjgDmvTXyvnDrKaMbIZimtpZ/81OcVIj7o3EQjp
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..cf20041e86c8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,halliday-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,kuno-pdc

-- 
2.55.0

