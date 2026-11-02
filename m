Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626845;
	b=GQvD6B8A45X3gzgDeDQAVasQjzjzZGLAUeuLgjPOOPqDGtlE/3+C2holFX5/cGi7wq96
	 Zq+O64TzSnC+5ppc/qmpB80t501MlhNj6qoV13JDfbaVamZPbF2Fv0+wJ5bQKFE+uosi/
	 RUOgEyxUjZBIENmy5ZmXUpljtBC8lhgEXhGBG10vEdDcdrYIXxLI2GG282H9kOWVDRc7T
	 ElzD2dH5rSU+HaVXQpRyGQE1l5uD7+qNITCsYNwSHUjVLkkKm0b0/IYT1DQjhpRikhA4O
	 YbUIsiamn4bUTKSDZTjbaJbChCUabDa1gbQUAYy3abD+3tqqvulJN+6Lm53ABVe253w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
	b=D0p9wczQY7wAfu6dqRggw2busetulERpTP4JRwUuxt0wx0XX9N0xLVYrgmOJMBfRnJth
	 2E5HHeIphOaCpfekTjdZGlMGz5Xksc8J8UbbVD+XU0R0PpCfcGYE6DevinXmEpkIzRclC
	 +z43OtUBV5kLSSICdxUSxzRpmrnKeR0EDjiba8jM1dhuUdq/eLK0UEKfT6QXQ5OmMX+Uo
	 4pcJtdowq8Q6qb+yawIHqRyFsnhLFQQ4Kv1VYUDr1SyRpGZ1laLLtbV+tCYzSnkK9B/qx
	 ydCfQxH2uH9fBvHFZc+5ceJ+Ry0Gst/gqjtyzc5T9e7P/qO/aidas/1/OL6nIspCHeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6MyQrtd;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B160A3828
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452B160A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6MyQrtd
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so31966605e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626844; x=1794231644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
        b=L6MyQrtdRgTojq4Da8UNcdHLYgW40/lqqyejq6Ba2wWQQ77JV/8AbrZFrQQilEQG52
         vp0IXvOuuYFNG6czey/PnETBySbY0jG2C0kEDXfvy9AsvFKyHAzaSAKV9FaByaa926Sj
         vWLwz4YpVQIxjiN31GSXSeLGpxjrmvDyooV/8VnRgRLXGknMkeqFGI6WpmvHHbniWyuB
         4doj3edxKYyVA9z+hde5r8T9w3n7J2mtRiMiu3hLPt+Z2ZFUQrkPAhvigbEk9z8n9xUg
         AS4Tug3xzuDf4E5+IuuVWsnj5ZlSaa9Tz1PVw04MbkJCEcDRTnoixavrXvzI5VgVthkl
         JGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626844; x=1794231644;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
        b=yQr0MYU5o4xyhmVE6KVvNQHYniHwWRB4xN5RvSmnIGZmgpXc5J9nGyFFJaCaJxn8lm
         IdD0dh1LD2ZXhlT/S0WvTM/lXKSRpFbYB4mvOnvHcj2ooAAivmK5bOXI7HL7CZe94IA+
         N3iIUzJBK8dXY5gYn5fPUYREoxBJWNr2Hia6eEnvHCMg95mmim9crVqeRgZJ88BiHXQN
         k8COTPb3mZXRp6UnKU2hhlRzbW5ckKFeEFoXDbq0x5OkjKiK0ACAQbtbNivmK2wKaIed
         ZPCAD0VfJcYJG3l3YCCdrfeDq3+ttGEXU4DtC0OO8pWN4hn4CUbYgMPvieXaYPIbRRmx
         CZMA==
X-Gm-Message-State: AFq9FYLC4arL2DE5cUbHfOVrzYe0eG0II4MwhFE7B7wqBEfSvzqxEhrG
	qg0SQrm5aZgQsn3pKSAmh2KDzdqz2DZ8SNEakqnX77k8IDlsvMYKD8cunGcg0u5NBMs=
X-Gm-Gg: AYBFou0MiXpGq6hSirJBTrR0qqCxDj9Dld2zual9sI2BqXkV+qei/4a3OErAuu3GhZi
	UNQsH/AHju+ZDw33Vm7bDx2FdXOrW4M7zEDmSkZHBhmNFAt+Z3BO4eP6lTIRd7Di45O6aQ/nxl2
	4P4wPgQV7GLFhjGLQVm94S7K9DKQbYcGBuNw+5l+4s842QYYLGGx0SOHGMn7s62ztecBg0WgSHE
	ZndznE/bo0c9aH2sSCQ6xmhjAkBJ3N7yTnci3huwfOXRWd7GIhbaEipMdTIrc5WQqgW76HKSvEr
	4d/f19YVMuIH2XeahLfGYSOL6LiqbafmJcz+kgF42PCLCA/YN4nU94CqhfCpokqLX0EXnqus+BD
	Ij7txJZsdtWjJdOkUdBOxknDJ8p5xAvsp+NwYt+1SM1GMYf0jIvY8UaLQzz3GamCjyL9ov0Gq8l
	2v0TG2KR9VfIobegO1qvsm3Rs5ZkJG6zKY6y3C3fKbDOqGHBrtck95UmR6NaS5+HjYhaJlwU3mc
	LF4CAcj/uzJOZBV0RrBnns451pny+GPBaTmDTplsPD1YYv2g6MhBtRcCpV0OqIwjXDR55QtTTMe
	UuAKEclpNVlSX/bJQfS1V1Q1EODFKIX7KTOC6n0K+mekseodgA==
X-Received: by 2002:a05:600c:6214:b0:4a2:9cda:57cb with SMTP id 5b1f17b1804b1-4ac151a9077mr246967155e9.1.1793626843602;
        Mon, 02 Nov 2026 05:40:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] arm64: dts: qcom: support SDM845 HDK
Message-Id: <179362684245.3310106.2514816704767701626.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:42 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Mon, 19 Oct 2026 12:18:02 +0300, Dmitry Baryshkov wrote:
> Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
> for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
> version of the chip (SDA845) and provides a rich set of the peripherals
> and connectors. The DSI panel is an optional addon, so it is being split
> to a separate overlay. To (hopefully) ease merging, the overlay is split
> to a separate patch as it depends on the panel. The base DT doesn't have
> external dependencies.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: display: panel: add Truly NT36850 WQHD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/79e6e49d681714aec69bdc24a4d1cb592aea4adf
[2/5] drm/panel: add Novatek NT36850 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cf022beccbd43c27b1e9a4b03ace28bd39504d7d

-- 
Neil

