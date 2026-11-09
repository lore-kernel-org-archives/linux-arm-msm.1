Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184467;
	b=jSL39D7UXOiXJMeI2SHBAmPDn0GCRWomuQHwXcAJgrGk6TQRjvAWtIU4n4yg3ev1dVeD
	 1QeXuHl6nbKHr3bFzIsMPWIui37lZQjTiLnkKNv0FsWNETuiG12QQaobKWJxpev0EVDQJ
	 aqr2pQkNJktPhZlt4MIEGcfjX1zRBtYk3ni7XnUtVVT71REJIiJM1yIA4eK9oxTlKaXNx
	 OgZJuz5WzExry/G7iiWTSe66SieAm/d4EMp3p5bIzlLgkKboWa+VkMGaWOsX2BU34EBUO
	 DnrMRx1wOR6bBookkQqRQQu5TV3H1tFVKm2aMwJOl5UOiOZZaAEpD1Xn+b0isl7slNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=d7upodus8zfJ6UE5eFI6Nx6bQUZ5n4OBObyxUkpRv1hE64XWLTVTwPhVf3GZXpBcCfLP
	 Dkcddqw99JgO0e/hI3tKd1/Iv37v0mFybs979/m1YgQSrbYEoTdD4d+zNyxw1HmOVYCHg
	 eJVTJp8cR39ZXlmLS+XWfuZKDhPSvf9zpk114f1HeWT4vpxhpr8jAj+n8k+/EBCI4Yy/H
	 DW445oJQRjL6/IivWCYJnqC0DXS8p6GL5UNkwViJi+ZwFvQtyATuMQ1IrZ0IT+XHuAmRU
	 uckY8crbIoVk3WO54PVlIqRANCs0z/c1xqbShevqKcZ5Fqdd6X2NJJ9jlELzEaeJwDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXTbJrRO;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092BC606EEB5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 092BC606EEB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXTbJrRO
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4918c2d727fso134315f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184464; x=1794789264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=qXTbJrROM77jrmCM9vSlEIFFKfBcarGsiF17Y6oDUL7SOkdiBhgFQr0+YixFQkWEIf
         bYD8oFTkhS58HuFfPLn9H6mX4m0ZZAxM4XzrERkTjpzB3SJLNHOSvSsV8AC/tEppq8Bt
         MGZppWqXbepkL7pMczc33p3cmiQFuRy5MYtLQQte/3bTxKRjI831KG5f3FDqNUryqnyB
         eEKohYIZ4FVRnbdpdXsFLSKFtCHd8jPmqTgGo4qq2x89oY5DmmCjomsXCqHjt6mhmPGl
         Xat49iJQqtdDJ/TsXzGZbMNuKHaq5TRzEMhuqi9PKjPqnxRIxqbDKnE/ZWsFJw1NO6tJ
         UnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184464; x=1794789264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=tI8Qqc37JiuqQcz2NWBMVLMag7SDJPj+PvLkARSRM5F2JtZv81J8L+tBM+0p7Ieymn
         t1RRfSDeEJS+0vZpJVlWa47QI2l7Pq00dLSLV5DlLTvtcw4Q9W63ubl02CpKJGMCMVLd
         2rxhP7kvwt8k6j/awqM68EXCRD/kN5nNLVoIiBcV+ReCJha59r5XoT+gzoIKdhGUpgsA
         47Sb4QyQwquMw4r3nAFF0gZHPKYD8kpMnxMXkG+7dwE37BQWooOW6QWJ/dhEhqZ+DZ6b
         5azmPy1ZF8Ustaq7+QEeUzBilatskicn4irtl4AmIMeMq8BvNvyLb6qxD3XS5EFPHY9V
         V/Eg==
X-Gm-Message-State: APuU4Z86YcB8VCAThqodh9Y2FwYdRZT1Hk4q66UiSN7f5ghsBi1pQJ1u
	SZd+TaR/KZit0uNBwlJ/W1GGzhQG3Pou5iX0iqIOEgri0GUlqbwmH48t
X-Gm-Gg: AYBFou3bV9oi8Hvrau1ACADCKK2na8o44Tw/Tc3uIsamI9dYiDDUN7gNegxWh3ei+Nz
	ygO/KPmkUY1edHMnPQdJvMcZyZBjSAjIg5J14BjWm/WyT0Zo3EXuylwPgOAhGKqkuqaqusNOcR5
	iIRv0Pf9UIUkV29ASj8oRSW+KUkTixblnj/7JEIJyWEnq4CiVGNILJpfm372L1AK48ljzqXJWDe
	N6PQBD3US/BeNWTyseyG1UaIySJY/W6rqmgtvQOR2G/a5EUmc/ZahebIh6ArF3MAPIXaLVdaj7v
	qfGGOoiWeB7lcb5nMonzRZKnexhTwoLiprBMe79rB6um5wcJ7lk35gchlO1BDaB7AB1Bt/+9nVc
	UyJmk3hKpi4JAaQH3udFK5t+7Ew5BaDXewVcj26jPypgyf6AA3cVEiPOIeIoBHUAmTG6/qgJUmK
	Nri7Hw10JFbYVXJ0NQNrDbZpVs+RxNyq/S588inAqYPlcpYJgRXawSfyjpb1HxLEZqRYpYtM+pK
	oA4sugwqVnFH5MX1mUxqSKHlR7tI4WFCE23XXv2cmVGpSO8ulpELXJGAAlZqzGJff2f2XlT/fW9
	Vv8rb6Rnos0V0iX4Ypp/kLspQkul0U1pEAIT38Kc
X-Received: by 2002:adf:e19e:0:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49588ce1818mr4774036f8f.25.1794184464442;
        Sun, 08 Nov 2026 16:34:24 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:23 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:23 +0000
Subject: [PATCH 11/17] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Halliday
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
Message-Id: <20261109-halliday-dts-v1-11-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=/dOrZ5kbZXiJ0bcfGwkBHl7a+YAKGn1bUTdYux1Y38RVDKws5L13g0SU1+8SFR4l0gLQgTvYS
 wprUB1wAKuOCKc4gs9aCLEB0eoMZXLaWUvR2Qma/3ofWIp9EDkckTFe
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

