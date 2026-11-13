Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604182;
	b=VkiNgXZzfioUIWp3A+2cm2BS6iizudsRyscJuamLiRWD2WWIdUReQnvp3YQEZlwlqnv6
	 sr9xV8N0twtlTsFC2howQj/xaU+zbYeWJRXw97NDaY8r18TAce2LBerbFjNEQ4nc5YJpc
	 EnCjtkp8JXD3N7+EQZoDLvQETTxceBg+msQplB1z75ivX2aBU3W+paKMsLATxnjNWjWlp
	 W/BdtWMNdE8qFvDglY6IdxZB0NFQy70QeA4pfE7pSeZk1u+mFHFzgOU/Si1zmnx3LQ6wP
	 nyGpDO2SeO2LLACws5138VxgC9LBRcAveIE0oZtrqiI3dwfiT8fwBw0ccektVTr9deg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
	b=C/nA+9vBKM1tb8Qy+q4cWS6QlSI9o61EOXJEbkcWGQPQv+NG0i2S4A+OnAG6JlECOtrQ
	 tqqKP+5837GFewffh2cSbznkbXYIkZdLA3Wn6BaVxSX1m2VDhgemfU21qhRfZRjJ8byaT
	 m6fNTm6IILZolSqdf7tHTGgoST1tIKRJVtMxFuOP1xT0CiOELzsrbWuIJUu7P9pUlhKOI
	 EXyiUalBvheodiFh3YpZ6M0tJl1qD+6JPCFTUcRMfR40usLN2mp5sZfSgqZ9RE6U5Ia/Q
	 /qKCqtnDFQs1AaRUmjq0qEX9be+EfuHavrm5sA/lFzlVA9HDNlos9RAOoATNaN0L2MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AF60A3835
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6AF60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37198ed3727so2839867eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604181; x=1795208981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=mL4bWoI1mpeMMgydl8Xi9d2krbL4oJdwH5dCeLzhcLNDqmkJeCUaFBJPwG5csoTBCA
         yQosIHGXgtHK3esf/hwQtiVpDpS+LeYZsaNYU9xQunGvp3H22PUO/6SMho5UbuXCpeCD
         weIZd7D/MGUjs+KEXZMU/C1/MVZILtvH4SRvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604181; x=1795208981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=dN8Ozf9EoHuuMJsBuJNinivU9Csh+WIzIaFSBeM+c4BlQf11Q2g0nZU6JXKzK2QoPk
         lOuQZ8j46R3DfTZPCnTeP+4c0wbsjwRs0xY52rv8xSJofEJM+yVjXA5hfCNrFB0YcKHR
         9nHJryU5Xmfe4L5qLlKTsn7/5/h+nlhdR7pjXpJ9YW8gkOJdgCz5NY+4TquiU9LNxCO3
         LPj0isM+nqdDhAUAl40FhLOtKaJOCnTpoVC6Qg+KDprhl3TWxCq1m+x2RDiunQop/Bnj
         deU8A7STMLQeuDi+92bOFVtGy/ySsBhU964sPZGs5wc6Lbs6Narove7FgwyD1NR0UdkH
         kedw==
X-Gm-Message-State: APuU4Z9UFAcvMEwjAhHmGNYdl7kiukwut0sO18w6mrYi01S8UiTYM66B
	qsJtFximozMxQinUL/8+FTRy5pyZx8cxGo7wydcFHxG+PddHKXMXnNxLd5YIwGV2eg==
X-Gm-Gg: AYBFou2A9ubuotBWsLWH1WVseJtYZWc6OkmfcdZX8QQlzsSK7hVouR31EccryPkQGcp
	kfYimW8ljixqkT6xTKFNz0jytyDCT7D0AWx7Z5xlNriIGYNrYzwBbyy5jqz3oNsdeEw4bRg6S4g
	PC2zYQAKtZR9EAbOQHg5BVW0t64ouQcOHpokGfwRW/LcHK7Qj51V5iyKKCz5lZmojbiiikx4f2H
	CwTsO4rltokr0cJ62P5rqXhJquBqh/J/3b/D5Sc28S3oY1IPGXJcJ/BWBs0CZb9PAUHTPVWL6gG
	KFc/oVKLdVkUd6ykwK3Y8yWCoSwETHJWyhBwjWhbZizn0WnCNn5zRkLNMeEMiiGd+cKKRKm2iob
	DCwk6CM+4uDfpxOIg0J+hMYqbVclC1rqVebARb4JNguQjmCWHRmKNLtfojMRS1FUQVz49qFRzdz
	K8r9ilvM+bUneG3LgfNAzArG1tOZNGmvScwdKSqu8dTS4v4kW/irKutkLyB9wUuoG96trdDEvtJ
	g7S/YlNnZRg9/OaPZ6tL6TqeRmBIMAzTg9RHBbO9E/+TxrUIDvU5ZsY/fK+9zrFNMCE4beFGoFc
	gslf36jPJjVOwLx9fLpZ3oyAWcrRX4AervM8p6bYcAsfaCV2Kw0xWOgkDqNW7wT093Mwe0GF3RH
	R9A8snReS5SHHXR/3Jg2obMu9vtx8Y8gDwA==
X-Received: by 2002:a05:7022:4093:b0:1b3:b455:93c3 with SMTP id a92af1059eb24-1b5030cf269mr3095118c88.22.1794604181056;
        Fri, 13 Nov 2026 13:09:41 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:40 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH v2 4/5] arm64: dts: google: lga: Add lga.fitconfig FIT configuration file
Date: Fri, 13 Nov 2026 13:09:13 -0800
Message-ID: <20261113130858.RFC.v2.4.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a FIT configuration file (`lga.fitconfig`) listing the Google Tensor
G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`, `lga-frankel.dtb`,
and `lga-mustang.dtb`) along with board and SoC ID/revision metadata in
each configuration's `match-1` subnode [1], allowing the LGA FIT image
to be built with:

  make \
    FIT_CONFIG=google/lga.fitconfig \
    FIT_COMPRESSION=none \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

Each configuration carries a `match-1` subnode (`compatible =
"google,board-id"`) with typed `board-id`, `board-rev`, `soc-id`, and
`soc-rev` properties [1] to identify which configuration to use on which
board without polluting the device trees themselves with loader
metadata. Having a structured (and upstream) place to store this data is
part of the motivation for landing this FIT configuration file.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the `soc-id` and `soc-rev` (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the `soc-id` and `soc-rev` in
this FIT configuration in the hopes that we can improve the bootloader
in the future, though.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Replace checked-in lga.its with a compact lga.fitconfig sidecar file
  consumed by scripts/make_fit.py (Simon Glass)
- Move board/SoC matching metadata from the configuration description
  string to a typed match-1 subnode per the proposed FIT spec extension
  (Simon Glass)

 arch/arm64/boot/dts/google/lga.fitconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.fitconfig

diff --git a/arch/arm64/boot/dts/google/lga.fitconfig b/arch/arm64/boot/dts/google/lga.fitconfig
new file mode 100644
index 000000000000..fd90b85c2fb6
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.fitconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+
+[lga-blazer.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070406
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-frankel.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070306
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-mustang.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070506
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
-- 
2.56.0.611.g1030f0b940-goog

