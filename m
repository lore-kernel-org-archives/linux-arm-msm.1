Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578243;
	b=jONZYcxr9QmfBIN0ac1ebNUryoe6OM5fdknfuPn7yXm3z5boU2/fk1C9FiMQv71r6jUi
	 QF25nkFFAE2LXKkZqYMpOaZoPHCfrlfxGSdihXuL4Jg8aXN7e1CkVB7RA4Ir+gBFn9oxo
	 vAKYndWGZfFu7EvCnvk5wxsuaCtPexKdsOsDP/1undQBXPoYmun0517EQyhKzPh6lSVht
	 OwGCZRKylqJQMYnof6x/JU1XOqzFblUvYmW8TT3Cx34tWICIJpkF9SeDFWXUHF1Z5IdO0
	 f2Ze6pVCZ8hq2g1o+eJ+wT/Z4CZeX2jhtg4wqDnakREj3JvIqgXEK9JiqCnow8Mc9uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
	b=w1zHJtNeES4P/7B9/d0p0FiZRVh1x7/XnOh7Az6WyRkwlsJCCvlxjWMMqEosdLziWT8X
	 wv/iVTQFMDP+0r1UCT6YFgWoErh27UhE0I5LJjdm1znuC+r1DORV3/9Vdj28GZG6Td3lf
	 RtJUDf6ZkmeRcjU06CbMXBnq7kTOAANZTZw2rnKRM/QGGjpZLREBHkPUVS6hye9+TXAJ3
	 zZxjGl7PsJymzNemTEpwBQT60wWWn04BiiBRFCJmJu1f0Jkw4/51WieoWwcMjfNrmoEkr
	 X5DOvkEvpNwpB59BYE68KH5Bs1BYZhc5O0BggS3J7pLfnmXyS2G3eWlwr4U+AfcSgeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpr89P2u;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B9A606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B9A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpr89P2u
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so67625645e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578241; x=1796183041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
        b=xpr89P2uVdNEVRU6ZFdn2eBT/t60OkWc0tfbtiVYSzLsut2olIQ8iMmMG03Qu8AXhV
         czmwY8klQILCpnQxdFXqLNpFHHOS3Fz70w915u6j1DQXaPm0RounccIivcFGNkTf7AUu
         Nq+70UK9MfiygohK2bEE6CLN+4jPinKxmEeKqfwkKmoHDDzWt0yNUPXMaIXugfvdARTl
         hp4EfLLqSIbgqR46C0zYggsGERYvEiVipCsnV5Pu0km4Qm/IUdXE9XNzt6Nv3V2YkFQR
         /QVF3UdadDR4/OB3HYNvw6ycaxZMdJnVuqLL/wTu56z1P7BgeqaDw9Eho8qpcwOOcKw7
         MHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578241; x=1796183041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
        b=USVWBeTax5xwOeafNwQ6C22iv/gzFPbyiszV0tPXyG2H/lijjQyRPRuIkn0lvI1M4M
         m808Xz71lIOgmPV5i08ymfGnX82XrfH2ynGNwiB47P96+oQg4SDnn+o+HnoKtlLmvJ8M
         7q9PG/bJaBDagAt7a6eFF5pAubNI+X8l/7xT7481EAWhG0j95C3ei8D85qPDfX67xtEd
         Vi5Yewe9h8Lp8IbwIfL2sq32lapD1asFpgJoVPGZmBEkE2xIup2vogYM5IwVyGQccFKd
         L/9c4pYaVehzPgoP6NF0GADV9xzkwZEwjY502B8s49cPdfv39eD/F8tmLMJ3lnM4Pqgg
         sc7A==
X-Gm-Message-State: APuU4Z8A1Mf/g2p1AGT6SoiFrUaU/GuFfz56f9YyGVLgDwWWwMOH4Vyu
	cfpWtmo1vjfNnYOH3lTs/1mtldv4Ybs+2oaBtPfKjxJHYhfiSObVJafT
X-Gm-Gg: AZFdTZcmEIz+7mDLBXheQSI/0LELF/fnZFuRkqHQTzgj95ahn4hA8D0x5wiv7F/XF5s
	4IuEPiQabIz1QUmBZ9AaAYloamHW52MBZ0CPcdTfsjmgxxSEZya0gIjmcnDSqVyEy5lZDHQdx1M
	cDm4djnNLKuBPZrVxS1xrDh4MGXHXpJpiBxAlD3c0SlYoNFrugJBfHfWhl0ViAyN4qkQSV0+2hv
	E4Av7bePKxI7Do/z8X72KgnKOi9ekz5OTTQFKLku7Xn4OGp4uxJXiI0JldOZBRqlfvTzjEp/Dbx
	kEvsWokFyFgjvCP85hHRdCqgvunuRHulrzXk4lTbYQLtmLB71vQPIDZXD9qzNGaSy5XjvNpwgIZ
	r9bVsdDVRwTADGrwEhtK3eEYXTDvlGThh0SDcPyIDZFSW4ZUH1kZz2GZb1JEj94lISssBE/bb06
	tmAzKie5bt31PYn8lImxrgm9fScb8uD7kEqf5BYe2kJqI3Ri8nHHkJ5E93+nCJXectzU4481o0K
	2DxWQie0Nc74/uU3xfeGjFWG2J9hECl6qE1k3LFlyA7GOj/walXCa7xI/AQI9MzGx2FRaQKIlLe
	7XXKpgMtQ7f0vQx56JdIakj5YwSoMjyouDC5W+5E1Jw5a6u+dRPdNNrP8xsV
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr321134335e9.12.1795578241263;
        Tue, 24 Nov 2026 19:44:01 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:02 +0000
Subject: [PATCH v3 06/14] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
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
Message-Id: <20261125-halliday-dts-v3-6-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1066;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LnBBJKb9fDjzFgKcPxLWG+G1ECrWNheGC13yLk2PP7U=;
 b=AK3HsTIHMWrfVz7oshpUweVMA1RMXUBxsZdz2vUtNRXnyYZuhyvlqRD0igQTo19XNPCP3yBIj
 lrBLDzvfhh3Dy0LccQPBEZwfCNYpwtXoUv7VnuZeXacHd0nFK00aqKC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

