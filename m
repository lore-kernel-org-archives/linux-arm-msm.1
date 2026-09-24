Received: from mail-wr2-f31.google.com (mail-wr2-f31.google.com [74.125.225.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604F34825CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256501; cv=none; b=HUEkh+iiUz5NZpZeW23w/QRzztIV5HpCoshw6qCm1UHlYtgdwbmIJ6Xy0owHcUY6ceQMIE8HDzjrwpoERZFxsPezZqPM1ErU4e/cdz0hT8SgkoCerd3juMVMrXdPuFLzDYjAXAnXc7OBGCXUAjeam3qHHmcw7mtdLZQOzWQaF1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256501; c=relaxed/simple;
	bh=MdgPczoNoNMCkrjEiikVz4RwVL+WmQkIgnq7wNJbwIc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nLReAtg92cMKkqleg46a+YWcNw15FSzhon4R0XSDMXDzRteoIbpyWR03D6C5n2T0LW/Lnaeuhbw2rjf/GWe0CKgs9bjaZUA3p4OjYy9p59+q+NJwTVAe0tQ0n6dhwlgI+meKYVNzp8405v5PQ9VQImtfj1JaXfXLe7pA1WprSOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9RyAumt; arc=none smtp.client-ip=74.125.225.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9RyAumt"
Received: by mail-wr2-f31.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1362242f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256490; x=1790861290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KufIearRKYFQh9ElqR70cpFACtmBDPR2ZlFhi0r1RQg=;
        b=u9RyAumta75b0S2k/Sgewdx6FE3sa/lumjgoZcDJ9ZZYxmxw0v0pB3wAapD8jOUVXf
         cYOL/vdDWcNGCy0my+YRpCmfFPjXyLR4kZPwPZNA0bijhxBz0UzVWwzno5RQR+6dF/ft
         u2jZXls4oP1QLrbeb2YU2XJbaf4U03j06UujzrsFNvuhmvXWBTCxoXEwze9ai7+f54aK
         jmged2THyJ/hT4JatMewh7g60nQv68DJQnCLfVXovw7bNxJ9ps3JQtaS4T1r9n5ogJCr
         T8HGIF80S3FLDZgxIPQymsV2xkFtPVw4DepmCurxZ8gGVhxLsc8JXfSLTi0lddtJKJgh
         LREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256490; x=1790861290;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KufIearRKYFQh9ElqR70cpFACtmBDPR2ZlFhi0r1RQg=;
        b=BmI4Y+5YkI6mlC2doxWRqmm4+3lmZ1x331W36T8TMl9YR+iz8IVCDZhZO8QEgv4fIs
         P0tyEKGG0j+VPzO/T22i4YoL13gufTkc8paNfaN8G/4JYgFTAvVOmst/eeOIHocJxcsw
         GBw2Ujocc/BlczqLf85HRrD4jQvLptoMt5SsJRui6sI4VObTw++bkn2fj236yMrc4200
         RjQzwvkEwApvr5qTm3aD0UrzYgAY21/VOqXOsHJ6FYJQvPASrR33iDCFRjERzXmlP3RI
         CdV/8R2dVEw4ofiBy5kanBcr4eCHmtPB1aw1and8uPD97xN9b7zveKF6M1G6dAQIf8mA
         JlfA==
X-Forwarded-Encrypted: i=1; AKwUvBwEND6FrK2kf4nVo2UrU2u7BLR3wHJBCtiNCSugy2YwPtb0z7xVhBiiKbL8ZGGSu5qc+d5AWWz8VanSxV6B@vger.kernel.org
X-Gm-Message-State: AFuF++nlzssVwLOMSkzohI5mqpOn8KES/QMmercRGKop5Pyt5v1w9zJK
	XeS/aQ9hBvvLI9mNR1Wv6pPOdPUT7VYqVhdCR/h1s42rExZ3KWMAA/1An8XFzx2XloI=
X-Gm-Gg: AYBFou3tebVFiVcfRAjnkWLrV5Dkb5c5F79NWs9M8p5tXiZvLJ9Id9x6ngZLT2eYOhf
	3HE1J3T1kkvEIroi9XpLOK/uIFCRjlIeBDtG3/FA05Fv9rEqLLeKa2W/L08PRZcTUkr42pE0Oh+
	CtkLlzc4LFRh4DKRKtLaIpleOzWGV9AoFiXeFz8UgOYchH/j0X408mskpLXkAIgJPbtvBpC9wCo
	F4RoVPmZ+6r5Y8iFDkSk2qTc074YGl9SbQtsREiMPRrBS8i/I43zKanZ8xo/6bVqD1YiTqjvDSD
	KMzyP3CsEQHUs3hGuX/dnv6Wp4a42/ny4gNH+xjETUktB/QWVHHXcEXZccXYLHws+kA8uObjhSo
	ZYk/zTTRKMNzzNjz668pTfOisrpf0flonf8zsl2uU9LiqBOmhQok/tuC0dYYT0PSxkaOyj0k5mj
	hWRSG6NETilBx7zJxRDDgzSqOAjTdpC5/4+Za+5FpC/7cPEz7+Gwyeh0b8qTtnehekiR2gpP5CN
	tZx2QDsXBnn9dZLELZauYyFM65F3KfryGRrn7dOtKT5ihqAxR42hw==
X-Received: by 2002:a05:600c:4e14:b0:49f:ce78:3563 with SMTP id 5b1f17b1804b1-49fe66f1a7bmr38166695e9.20.1790256489617;
        Thu, 24 Sep 2026 06:28:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm66309875e9.13.2026.09.24.06.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:28:09 -0700 (PDT)
Message-ID: <2abce34e-4969-4ce1-9c3d-ec130245bcf7@linaro.org>
Date: Thu, 24 Sep 2026 15:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 08/11] drm/panel: s6e3ha8: add Samsung AMB630QY01 (Google
 Pixel 3 XL) panel
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
 <20260920-crosshatch-panel-v1-8-de6e9512da96@ixit.cz>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260920-crosshatch-panel-v1-8-de6e9512da96@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 13:05, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Google Pixel 3 XL (crosshatch) uses a Samsung AMB630QY01 6.3"
> 1440x2960 flexible AMOLED panel, driven by the same S6E3HA8 DDIC as
> the Galaxy S9 panel this driver already supports.
> 
> The init/teardown sequences and timings are taken from the downstream
> dsi-panel-s6e3ha8-dsc-wqhd-cmd.dtsi (Google bluecross kernel). The
> downstream DSI host neither appends EOT packets nor keeps the clock
> lane in HS, so mirror that with the corresponding mode flags, and set
> the RAM window explicitly since the kernel DSI host never sends the
> column/page addresses the downstream one does.
> 
> Unlike the S9 panel, brightness is controlled with standard DCS
> commands (10-bit), so register a backlight device for it. Brightness
> readback is intentionally not implemented: DCS reads wedge the DSI
> host command engine and take the display pipeline down with it.
> 
> Cosmtetics: update Copyright header and add myself.

=> Cosmetics

> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 173 +++++++++++++++++++++++++-
>   1 file changed, 168 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 2591b8c1a7753..e02f1d9f0dcd0 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -1,36 +1,42 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -//
> -// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> -//	Copyright (c) 2013, The Linux Foundation. All rights reserved.
> -// Copyright (c) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
> -
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *	Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
> + * Copyright David Heidelberg
> + */
> +
> +#include <linux/backlight.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/property.h>
>   #include <linux/regulator/consumer.h>
>   
> +#include <video/mipi_display.h>
> +
>   #include <drm/display/drm_dsc.h>
>   #include <drm/display/drm_dsc_helper.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_panel.h>
>   
>   #include "panel-samsung-dsi.h"
>   
>   struct s6e3ha8_desc {
>   	const struct drm_panel_funcs *funcs;
>   	const struct drm_display_mode *mode;
>   	unsigned long mode_flags;
>   	const struct regulator_bulk_data *supplies;
>   	unsigned int num_supplies;
>   	bool broken_reset_polarity;
> +	bool has_backlight;
>   };
>   
>   struct s6e3ha8 {
>   	struct drm_panel panel;
>   	struct mipi_dsi_device *dsi;
>   	const struct s6e3ha8_desc *desc;
>   	struct drm_dsc_config dsc;
>   	struct gpio_desc *reset_gpio;
> @@ -38,16 +44,23 @@ struct s6e3ha8 {
>   };
>   
>   static const struct regulator_bulk_data s6e3ha8_vddr_supplies[] = {
>   	{ .supply = "vdd3" },
>   	{ .supply = "vci" },
>   	{ .supply = "vddr" },
>   };
>   
> +static const struct regulator_bulk_data s6e3ha8_boost_supplies[] = {
> +	{ .supply = "vdd3" },
> +	{ .supply = "vci" },
> +	{ .supply = "vddpos" },
> +	{ .supply = "vddneg" },
> +};
> +
>   static inline struct s6e3ha8 *to_s6e3ha8(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct s6e3ha8, panel);
>   }
>   
>   #define s6e3ha8_afc_off(ctx) \
>   	mipi_dsi_dcs_write_seq_multi(ctx, 0xe2, 0x00, 0x00)
>   
> @@ -72,16 +85,26 @@ static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *priv)
>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>   	usleep_range(5000, 6000);
>   	gpiod_set_value_cansleep(priv->reset_gpio, 1);
>   	usleep_range(5000, 6000);
>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>   	usleep_range(5000, 6000);
>   }
>   
> +static void s6e3ha8_amb630qy01_reset(struct s6e3ha8 *priv)
> +{
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(5000, 6000);
> +}
> +
>   static int s6e3ha8_amb577px01_wqhd_on(struct s6e3ha8 *priv)
>   {
>   	struct mipi_dsi_device *dsi = priv->dsi;
>   	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
>   	samsung_dsi_test_key_on_lvl1(&ctx);
> @@ -266,16 +289,146 @@ static const struct s6e3ha8_desc s6e3ha8_amb577px01_wqhd_desc = {
>   	.mode = &s6e3ha8_amb577px01_wqhd_mode,
>   	.mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
>   		MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
>   		MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET,
>   	.supplies = s6e3ha8_vddr_supplies,
>   	.num_supplies = ARRAY_SIZE(s6e3ha8_vddr_supplies),
>   };
>   
> +static int s6e3ha8_amb630qy01_prepare(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *priv = to_s6e3ha8(panel);
> +	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(priv->desc->num_supplies, priv->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	s6e3ha8_amb630qy01_reset(priv);
> +
> +	mipi_dsi_compression_mode_multi(&ctx, true);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_set_tear_on_multi(&ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	/*
> +	 * Unlike the downstream DSI host, the kernel one never sends the
> +	 * column/page addresses, so set the RAM window explicitly.
> +	 */
> +	mipi_dsi_dcs_set_column_address_multi(&ctx, 0, 1440 - 1);
> +	mipi_dsi_dcs_set_page_address_multi(&ctx, 0, 2960 - 1);
> +
> +	samsung_dsi_test_key_on_lvl2(&ctx);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9,
> +				     0x01, 0xb0, 0x81, 0x09, 0x00, 0x00, 0x00,
> +				     0x11, 0x03); /* TSP HSYNC Setting */
> +	samsung_dsi_test_key_off_lvl2(&ctx);
> +
> +	drm_dsc_pps_payload_pack(&pps, &priv->dsc);
> +	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
> +
> +	if (ctx.accum_err) {
> +		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +		regulator_bulk_disable(priv->desc->num_supplies, priv->supplies);
> +	}
> +
> +	return ctx.accum_err;
> +}
> +
> +static int s6e3ha8_amb630qy01_enable(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *priv = to_s6e3ha8(panel);
> +	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
> +
> +	mipi_dsi_dcs_set_display_on_multi(&ctx);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int s6e3ha8_amb630qy01_disable(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *priv = to_s6e3ha8(panel);
> +	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 10);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	return ctx.accum_err;
> +}
> +
> +static const struct drm_display_mode s6e3ha8_amb630qy01_mode = {
> +	.clock = (1440 + 116 + 44 + 116) * (2960 + 124 + 120 + 80) * 60 / 1000,
> +	.hdisplay = 1440,
> +	.hsync_start = 1440 + 116,
> +	.hsync_end = 1440 + 116 + 44,
> +	.htotal = 1440 + 116 + 44 + 116,
> +	.vdisplay = 2960,
> +	.vsync_start = 2960 + 124,
> +	.vsync_end = 2960 + 124 + 120,
> +	.vtotal = 2960 + 124 + 120 + 80,
> +	.width_mm = 70,
> +	.height_mm = 144,
> +};
> +
> +static const struct drm_panel_funcs s6e3ha8_amb630qy01_panel_funcs = {
> +	.prepare = s6e3ha8_amb630qy01_prepare,
> +	.unprepare = s6e3ha8_unprepare,
> +	.get_modes = s6e3ha8_get_modes,
> +	.enable = s6e3ha8_amb630qy01_enable,
> +	.disable = s6e3ha8_amb630qy01_disable,
> +};
> +
> +static const struct s6e3ha8_desc s6e3ha8_amb630qy01_desc = {
> +	.funcs = &s6e3ha8_amb630qy01_panel_funcs,
> +	.mode = &s6e3ha8_amb630qy01_mode,
> +	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +		      MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.supplies = s6e3ha8_boost_supplies,
> +	.num_supplies = ARRAY_SIZE(s6e3ha8_boost_supplies),
> +	.has_backlight = true,
> +};
> +
> +static int s6e3ha8_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +
> +	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +}
> +
> +/*
> + * No .get_brightness: DCS reads wedge the DSI host command engine and
> + * take the whole display pipeline down with it.
> + */
> +static const struct backlight_ops s6e3ha8_bl_ops = {
> +	.update_status = s6e3ha8_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +s6e3ha8_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 512,
> +		.max_brightness = 1023,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &s6e3ha8_bl_ops, &props);
> +}
> +
>   static int s6e3ha8_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
>   	const struct s6e3ha8_desc *desc;
>   	struct s6e3ha8 *priv;
>   	int ret;
>   
>   	desc = device_get_match_data(dev);
> @@ -308,16 +461,23 @@ static int s6e3ha8_probe(struct mipi_dsi_device *dsi)
>   	mipi_dsi_set_drvdata(dsi, priv);
>   
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = priv->desc->mode_flags;
>   
>   	priv->panel.prepare_prev_first = true;
>   
> +	if (priv->desc->has_backlight) {
> +		priv->panel.backlight = s6e3ha8_create_backlight(dsi);
> +		if (IS_ERR(priv->panel.backlight))
> +			return dev_err_probe(dev, PTR_ERR(priv->panel.backlight),
> +					     "Failed to create backlight\n");
> +	}
> +
>   	ret = devm_drm_panel_add(dev, &priv->panel);
>   	if (ret)
>   		return ret;
>   
>   	/* This panel only supports DSC; unconditionally enable it */
>   	dsi->dsc = &priv->dsc;
>   
>   	priv->dsc.dsc_version_major = 1;
> @@ -343,16 +503,19 @@ static int s6e3ha8_probe(struct mipi_dsi_device *dsi)
>   static const struct of_device_id s6e3ha8_of_match[] = {
>   	{
>   		/* deprecated */
>   		.compatible = "samsung,s6e3ha8",
>   		.data = &s6e3ha8_amb577px01_wqhd_desc_legacy,
>   	}, {
>   		.compatible = "samsung,s6e3ha8-amb577px01",
>   		.data = &s6e3ha8_amb577px01_wqhd_desc,
> +	}, {
> +		.compatible = "samsung,s6e3ha8-amb630qy01",
> +		.data = &s6e3ha8_amb630qy01_desc,
>   	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, s6e3ha8_of_match);
>   
>   static struct mipi_dsi_driver s6e3ha8_driver = {
>   	.probe = s6e3ha8_probe,
>   	.driver = {
> 

With typo fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
