Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486249;
	b=gArVWicM0WOLAu0ehZ+Lu/oykqZbAru2DKQZyqJekEB0EyuR85JAM6gKuv3hmV9wWDgR
	 o8aswAE/SSXra99H1dfsPbkaYVaJOcDcG8Py3HbJrgOoFZjYTvm5u4FArcEMve3nGzAIn
	 uoA04NEKWF9X7inIjUcZFqpeqSSkx/4wFKRggIxQIW948pRfp/HIUo2luLDMUvN+lshGg
	 +elJRNNPAnwiunByJotdE7NxTkC72/hCWVDRzWzR2oQJdWPRUWIEj8o4EK7daI8XOnZjX
	 6MzpznspeqV4HpQYfd4B9cp3BKyJH42hKz9yFOc1hBM3182t4P6R3r1iLJhrlhwBi1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
	b=SpmgLmpjWrOXXQWoByu22821af5iQZDn4H/TwXSDjukUYXYTn0FQg6Ni+G0J2ywV4ZYZ
	 QFbNuuNwJUPhT4MxxlwpW0Hgy+p+Wlb42L42KSVKKzF0FWvyuj9a3H2C/3s1L7OCA2z2S
	 7CbmphKHWIWc4kJHNu72CZseVv7LT6KIQKL6ELmB7TIx+0eG3dtUgO5QPbY+cW7mrdcJe
	 ZHLWiuxz4TrRWI6lxeYXsJUrRkLeChRLGehS+J3QvETKyTkAU1tu2BY0dxnnwMGNx1xxa
	 Qy2SgqOYw8JTmpFg5KJIcp4V0/hNWiwYxTuUw82pELBoVRAw7DJ47YAhbWyjeDVgirA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Ee+baK;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E77606A331
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E77606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Ee+baK
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so6587493a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486247; x=1795091047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
        b=02Ee+baK1h1XUD6WO/nascEjWrwiuWrZ9E9j2MFQcrZI5K14rA7YSabQFZqCFSvC3N
         ikyw7KKQgOI1ld3nNdFDTDd5OmzNRUttM1oIZghE0ToKxHlOE17aLobyJRitiIoejqNG
         SX3XX8oHBl/GOFBVpjPgVTxjDbSle/WjdqOh3U8OGGI/2vZzio5/iVz5eAVVsJpDRnvM
         eyx92Iw2Ybw9Da1/5/WmCEY9yES7r+L+75EybPosobSiFFqEC9MOqcLtX8lqUVwiDxVi
         4V//JpLYWXeWE0e02nucAt510hEbI43eS7S3Xlwp/s0W1fjuv1UYI6ioe2Sj6ehZ70DD
         nZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486247; x=1795091047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
        b=tF1eChF1UhFpqrWY4BI2IEqjevoGdC/mS6X2nGQnoBRUM463/qT6QwCPrm0nasg6yq
         05iWWaSvkX8/RpQGbTEUfRkqXNdUSB27x7RADetiD1G8vV0Q5fpaRTs0tqE3iHtWo2y5
         siBQ2fMralIr6fbhDuRjr3iLQIhWFvOQNwpjxKVcuGEkR7rYrZ7f3KNSINXVjj0kr4lQ
         6mW70vGqpWBMDF/MQwYMSSbYWKwsEWTWvQkLwZ9SQJRnFDirksZdxFKC02ElFqUget57
         tnGZEMDFh+H8FgVH6cmvnK1FxZizot/MSaLhKA3f0jQ8OcLgB5yjORNvF1BkR6XYnqmF
         nlaw==
X-Gm-Message-State: APuU4Z/uxmoXbkMS7/Jsa/nJFNQ/NC9bqO+sngRWSmO08pm2yho6CrmC
	JFb0E0FvNdI006FpdfgMZFpq99IHZgJHaF6EvbJW66WK/eQc3LTnDBhrI0AgjmAu
X-Gm-Gg: AYBFou3IIQefAAa6Zvh6dRoyxGOspCJaAuTrwrpvDqODKsXIP779elmB2YRCGW9WZU1
	cIzVJZDxLjQIMyhekQ2F/xQJHg8qHOmin0jG890tQBOulIt9sBjpaHvLjJBKD3gNt2j0xU7RPMd
	6VRoo79L+cspk9Tgt9oWN1Y2jpi7+1Uk4McT/ZYxFByP2aYNdefvwcYoX+50SNk+VytrzAfMRPB
	m7WACUJFIfqq21m9iO0u7V2gXhtlsiIcT1toveLpq44mqGHfw5eI6iGA2CFQ3mPVSCBWFwYia0n
	mlsw/76VHWOYLIAGruHjanFQ1mINTyYRfBeXcsBoK94WQ1P730kIzGi0RBYZa0vcAHdlamTolLx
	3FiEufD3TnmbDrRA8wz2W9ry5bXWSe7NZ6JCdtEMgayiQGATAwi+0yH9Q3zQn3RgSMlEypmcCZL
	y3tlLfeLyB2p6zLuiyYyAqhoEarHNguV5rjzb8UBg3aSqAGMA7xfrEaZYXYTV1K4zUioLOiKeNL
	IsnYUfv4khv2vNFY9wriqTJIW5D5bLGLJsiPLayOqIhIU7bOMKKzlpETi3yGBIycpdMAwV0T1ss
	SxTifL1YQpl5K9FNA1Rkyqv//Tvsr53ak1QeZ9/0
X-Received: by 2002:aa7:da59:0:b0:6b3:b10c:40f9 with SMTP id 4fb4d7f45d1cf-6b77770232emr3279335a12.31.1794486246730;
        Thu, 12 Nov 2026 04:24:06 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:06 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sc7180: enable GPI DMA
Date: Thu, 12 Nov 2026 14:23:21 +0200
Message-Id: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5EQBCF4atIrVWiSTSuIhatulCTDNLFZBJxd
 423+xbvP0A5CCs0yQGBf6KyzBEmTYAmN4+M4qMhz/LSxKGSNVWG4yrovw6dtXVZ+JoNEcTTGni
 Q/xNsu9e69x+m7a7AeV78i3zncgAAAA==
X-Change-ID: 20261111-sc7180-gpi-dma-a77963d9e1cc
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

Enable GPI DMA controller for SC7180 SoC. This can be used to
make access to I2C, SPI and UART peripherals faster.

Tested on Samsung Galaxy A72 on an I2C peripheral, in particular the
Samsung S3NRN4V NFC module located in i2c0 0x27. The peripheral driver
is not upstream yet, submission can be found here:
https://lore.kernel.org/all/20260811220135.472380-1-jorijnvdgraaf@catcrafts.net/

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (1):
      dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA

Vitalii Skorkin (1):
      arm64: dts: qcom: sc7180: Add GPI DMA

 .../devicetree/bindings/dma/qcom,gpi.yaml          |   1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 101 +++++++++++++++++++++
 2 files changed, 102 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-sc7180-gpi-dma-a77963d9e1cc

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

