Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184452;
	b=NsZaHnt+bAbzrnP4TOyzuTPqoIc4lgjG08YLWIESGq8XcD1vnPzSNXNJWvag/PlQ5NC8
	 503MTPZqdlu7gCLdn6cVJV4dqFIIQT7ruQrJOEvgfyWHSbg9+M9pklo6kiclQbQ0cm4q1
	 lCc4LoeEhRO2+qhms/CdfvlOUoao+qbVQyWze7Gv5kSFrYSpuH2dYuCPOUap4JMDH83Ch
	 pUbn4zi5BU4S8jfTElqQr39s01sDJsuNfM3hRUdnK93r7pyXFfZJYqWC0e8LfAbnn9Dz6
	 vSjzS09KvWJjHpPN8t3zsmDj8XQXQvn4ioWna56DmUCvw5DJND8qpRhRhTlzHeBLKoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
	b=GOjf7QZtHkbgEZcDx8eSFe+fAG+lqOls5FqU55YxTjJ6EakeJCZ/5vDSRO/chE7HuHWJ
	 hyT0yUkU6CmNfSfuqKo9woYcTeA01bB+ni5EGrWjsdMqux4HGnTZXbLzjz1sgUJER1pWT
	 2DOy+f+kUmn2+H/U/7UG8BeokwvSkXWSVAyYHM/a2ypBbhrDW+aECXp0srOIuCbltdMd/
	 yrdB/Zwg0cFLGWoN4D+Ff1ANC/vy9aH1GrLTzTXRvP9t593I30O8n+W8OulilUCcjqH8+
	 DKlqZ9ysM7IG0vSGZ4DVxKBXCicm88BJi5tSS/KWIKIsJp/pNpoasB6AIJRFB+Qapmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULEuYnxb;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0E606EE89
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA0E606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULEuYnxb
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49318428d98so146018f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184439; x=1794789239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=ULEuYnxb9uEPYMVwaCZFAhBSr3XRRf7x47G6eugQCaMON9WlvKKlg8odFviJChKVQz
         L5ivnacejg1JFvAECb3CXO3G4CGlkXkRUf5nvRqM76uVba7f3AbCgFEyfN//93jXlobk
         RRpUD1wxP334PPruCEBCm7XnO4U67yem2Q++cYePF+tA6Ll3cXA7KHUYpVW7bHGXPv3W
         01KWH5s+I/rChWyEAC4I/nugfLSJhWg9sy7NvKigj0oOHHQWEH6RZ1gw31QBj3pWz3YO
         YoqU83BPVVunbYylhg8fGTfC+v6UuQYbRsQ69PfH+mnbpLdKnjMRZknNIjNiF3iaLp2o
         JADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184439; x=1794789239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=ecno5xTuxamKYWYb4AeFJIdsC716MGWeDKZP0HjuSTUo+MhFBP3C0ARc4Tv9yPaMJp
         SKIKHn1qoLmowUDqcP+6ZjC56tXpQup3H0UCKBweLTJSVsKAHDfceAI3YRIQKwZ7mKIn
         HwPsYt3PB3B3mO4Gk9dmgtbn27yaJ021zKFdy/a34YT/W6LPu2g+sgeYSxkwYQACzuxZ
         WtC0MmjUETm80dXFxJsVtkQopv950gG8D5YINgY9Sc0TnUyG/BKIt+vTDldRGkfEtCGc
         H8R2DrBuxnyLZkUGmLFx3omnFil26BLDbQGEpyITtRcIu68RdoCWXRr3FogEw6AdfYse
         KugQ==
X-Gm-Message-State: APuU4Z/lzJ643qqXA8S2b02IN32wr084iG7GLv07OHjnqHD+C1ovvL8N
	/rWJC3kjNn04Q85eCpiscx0dh3oqbVeYtH1h24kZnhh81uQJO0EqCnuH
X-Gm-Gg: AYBFou3MBDy07wlc3uNJLqMR9cEFrocHAn1/53JBPQNu1TLrILJjaoWH6Me8uOz8ly4
	w9M3eQBhQnnp9JaaFg1L1IkSwxKyEr1Pzc6qkxcD2L7fSnnEwSHNEdcNsbpjynn4I3mHQvpOCyv
	+C3HpJPjbvymPhS4DdNNE0n0W/4FG5T82TYgP34ATCAEh8qjbxxM1llLPYDctrTtqaNuJOfbLF+
	OF+v/J54lASqkb1x13ICybHiJA1VmTR1ecxm4I/nDZt7sVKZAT7TI4nOEwWLN4oqcKzrwwUosof
	hbpNbxl6VD0Oee5jQHdZ7ynsdjCielkeYreYpnUHfaak805eYVuiAkYwtf5SdtI4YSSRSwGGWEP
	MnpJW7fG3zk6mj/wtZ4Uw2Ez/MwxN5zkvAWbbi97yc9OCoG9rBbKTujPwL/Ln6h1b1CDqyFyYRI
	b96OE9lnoLqBbRDTtjyuNxlebLkNuNfuJM0fHS3upJf+LKC4qha4rAvTQR0tXp9oJc51AwRo6WK
	7hPJDfGOZUiG/DUY9OBvaqZWUQ93SEoPJUdOx4GPhzJ7gxwnkb2Z/tGyt70awZCaSZawcuXO5W2
	+Zy54JAeRZyj08wtZfqSBQ4ZGQj2zKw7485h+f/2od9LmruKCICKmb+HxZnBBw==
X-Received: by 2002:a05:6000:3c5:b0:493:2376:81b7 with SMTP id ffacd0b85a97d-49588ecc152mr4851434f8f.27.1794184439552;
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:19 +0000
Subject: [PATCH 07/17] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261109-halliday-dts-v1-7-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=HQwzvS1g9UbQKH8v0/XpwTYPPGyIcJ129Y8yti74NjNwgnbgo8LwZJmaOxKeuHMuvgkZ+EP/2
 IP5h1J7SLhzC0/e/TSquB9CwBZEDq02qBgUbIWpMHDatD8Y+sZaCkxU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

