Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405227;
	b=gVgihY+CZ7IetcIwlJIq8IameI14YAq9D0gmT5QkwJX5fR5pEF0rMv0BBJ2k7nnd3Wh3
	 p70SMLGt6wYdfaZkcvYBYSqU7gqu8SRVy30HvpWgla8vJZGkqd2q+PDAvcVljf2R+ajds
	 i7e0K+n8pKnEXDKUfrU1ZE0OYWd1jQuGRtgEgVqYXRei/JZItBmVUsfz8pPZFGjJ8Hqub
	 rymWMJ08pshGgx7OaDzKNEEo4K2y1k3o/NnukG9PuN8ZrWdWVh+iWnutUvRqDwR56SmD3
	 1oblzoYhhK3GGWsXHPWlQ+KQUR67A3uhv2frJrbz1vDWowVMb/JOM1cDb6mGpdGWADA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
	b=1fZLgIihzfvdMeMlE0Yol41+pjnh20oKI/frbmTo7j9CbvLZ08a3xL6bkfBRPzwmqlpd
	 or91F2qsMcIDIMHhS6VNRRi1WgHFaY8PwXwoFIiFaGXnba08mWHtYcmTzp0NJIiVyzgHZ
	 TJPV6p0lsJ1nIetTsepdiv7v2VbwI2wl+aNemnVY+MALMB1xXgnDYYmHFGx9Db/x50/Kw
	 iyhBpKddv87UUtvh3B0UKSXHay684GoB0hqbj9vxo/cd/ziTz/KTOzgo3MvF7CtHTuEt+
	 NjcjBvOdvOd1h8ys2ouyZ5TZtsSwRqDr2R9MKyeBlWZpV8B49T5FDI7qYNeVkO+uwGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dQc6Dc1c;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58641606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58641606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dQc6Dc1c
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab99038afso2483343137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405225; x=1795010025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
        b=dQc6Dc1cFeh3lUkUO2AOXY93vRxDH1gCO1sr2nYNEGrmlq42lk9DvEjZTgunacCbN9
         R9OBXeINCBjqj6PzOxF455p1WhcfMxvU7UcCKP0xVe6L1F5CbEHd1M6nXWvALtYkacTR
         udtl+zMqaMaTqi6JZXjCqRAViAshVdEZnvj+0vXj8FaxN6Fxjq/DY9vrU/0hx9oxG+KP
         mhz8b/xqit94XezaLxvZuhwx2BmtZbdoJr4c+bPoXpfkBIFJklN82HSNUzDx0sBy7lvS
         ES1sMAms0s/oy+n5HwSttmYDwDkTxplIum2uG7S7tlH9RiQe2CpugSPN09uGmP1cYI7l
         W/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405225; x=1795010025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
        b=DiHlEE1r6b6h2An/anpaf+9HrFIM6BTa2GVTC8holKWV/WgL9axt8YsJmxxUMx9vXK
         Iqj2paRjncjkrz9BrtKg1oPFpfk3kiEvjgSxWW0OgKyYWpKAYAaBZSU4oDM1bbLlsbYZ
         S/RhZjE9fHbaHU86HRMFmS4mASaQ36AVg0w3bKJlsDxsQ6uPtDhwaO5fN/wto+9mjZZe
         ZtMhTTm4p1CNkJoDwP47XFl/6QUZyEfV1UEIwn+NaaSWBOQCD89MGU0DnCT5OAtTFGG1
         rmBgypBzpBBREyp2UyvEdaqjhDmiVQp/c03LAEhkO6fkW9QQ4SlDbia0EX4ZVTEPpgsa
         N9Dw==
X-Forwarded-Encrypted: i=1; AL+hErG9w2XQE6XiiD6Ax9Heg90eBjJn0k0RicQ+ZTb+MAJ8HQNzl92e65N/fGkXxvi4biB3nfFc1ZQlnuY4LWLu@vger.kernel.org
X-Gm-Message-State: APuU4Z+xeOh0by780B16U0/de4NCZdyl0TgloXAEpd9n3879bLJT9+rc
	Ez107T6dKplYNNP0/ejxyJnU52KL8hpyb1QTUyfPazglaLmrCocwYT2Vhj0spoKHku0=
X-Gm-Gg: AYBFou28D6t9VnEfLaIWTM4ltuKaRSerDrgrCHLKw1o8aBh3NW5ovvDI38fAAP3W26o
	FIlC6Ou4+JjIgTEnNDe7mr1S0Xvwzoj0PuZIwDMN6wHOdikbEEsEjcqKkeWxaT3K7Pbmq9TKdWN
	LFJo1ipZwumVgxZBR+bZm3sxP33G7nhipoC+mkSQEnWIh8sxaW1NLEyrFvAgwW8Mj9ItmbgHbyE
	unoJWiN2H1BX0EvBlJJsNf7KRkzB0mJAnI75Jx52/GDK19QaniVLACm9DJhOelSoodeo1DypsWp
	+GdzD50ALI+h8t+DUjumrBd0GBP6cjDufSe6QfSnMhw07rudkjKwz3Oetxe5j+zQd4hTxJAwtuM
	BwWDTyubLd8pqFpN8uchKKNPeMZADxeJGz2lYx+KB82CPoNvWk4khrpNcYpw7fMLMdRfpEqcbEu
	v2VG2IIu+cvn7f+yuR/CazhKxYBpcRps2YH8EgO9gx8gJEz1lWqJyQuEFGck7OkiSBifSPCDAhq
	WIUf/bClIlO6qfs5OVT5CgdyEx1chEHVNGT/+WOd0dV5vuePPlF1HtzUhzNvI4UivNCamOLL3Hv
	RnNZ+a5OxuCs+P4efkkzvoYc9CM4YHQOdsGu+NBbub+RhCade3D0BeRIGLMeanuzUDcPe5PkSBH
	u/ONw
X-Received: by 2002:a67:e106:0:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d5061cf3a5mr665976137.27.1794405225039;
        Wed, 11 Nov 2026 05:53:45 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:44 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] media: qcom: camss: contiguous buffers, RDI and CSID1 streaming fixes
Date: Wed, 11 Nov 2026 10:53:34 -0300
Message-Id: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Fixes found while bringing up the CAMSS on MSM8226 (Moto G 2013). The
SoC has an IOMMU in front of the CAMSS, but it is not described in the
upstream DT, so the CAMSS runs without one there today.

1. Loic's patch: use vb2_dma_contig, the write masters take a single
   address per plane.
2. Program the VFE 4.1 write master buffer size in frame based (RDI)
   mode.
3. Do not abort stop_streaming on -ENOIOCTLCMD from a subdev without
   .s_stream().
4. Do not fail CSID power up when there is no VFE with the same index
   (CSID1 on MSM8916/MSM8226).

Build tested (W=1, LLVM, ARM) on next-20261105, each patch on its own.
Runtime tested on MSM8226 with the same patches on a 6.16 based kernel.
Known issue: on the MT9M114 the first frame after STREAMON can still run
128 bytes past sizeimage; later frames are exact.

Changes in v3:
- Patch 2: added Fixes: tag, removed the comments, no clamp on the
  height (Bryan).
- Patch 3: removed the comment (Bryan), added Loic's Reviewed-by.

Changes in v2:
- Patch 1 replaced by Loic's "media: qcom: camss: Use contiguous DMA
  buffers", with his Signed-off-by fixed and Bryan's Reviewed-by.
- Reworded the IOMMU statements (Konrad).
- Patch 3: added Fixes: tag and Bryan's Reviewed-by.

v2: https://lore.kernel.org/all/20261109112611.94010-1-allan@fatecpompeia.edu.br/
v1: https://lore.kernel.org/all/20261104202313.72494-1-allan@fatecpompeia.edu.br/

Allan Siriani (3):
  media: qcom: camss: vfe-4-1: program the RDI write master buffer size
  media: qcom: camss: always stop the pipeline in stop_streaming
  media: qcom: camss: do not fail CSID power up without a matching VFE

Loic Poulain (1):
  media: qcom: camss: Use contiguous DMA buffers

 drivers/media/platform/qcom/camss/Kconfig     |  2 +-
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 23 +++++++++++++++----
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 ++-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 ++-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 ++--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 ++-
 .../media/platform/qcom/camss/camss-video.c   | 22 ++++++------------
 drivers/media/platform/qcom/camss/camss.c     | 17 +++++++-------
 8 files changed, 45 insertions(+), 33 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

