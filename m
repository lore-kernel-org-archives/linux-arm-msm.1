Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE941426694
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538236; cv=none; b=l5XUsfdNpgxMy4+gPf/rLhQsIg2TM7bGJuBxJqMuHaS6Sfwqw4/vdWGKTD6N5Axzj9apQ/5On6alG003ywj3TQxOsqo1wmEE7DLLSNmuAlHDa+WSZKTzSg2MmgxRQ+dhNBt7B7/hGwsGDZRmYSNVkXyhAzAseAxy0FsvqHH0HmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538236; c=relaxed/simple;
	bh=0fZcDdjzml995T9oZE7SVaCVuqTaThJLBP842zH3xww=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IbyIuHd7RQnB+Co56LS7pSOLqRHtrT2lXcPYHC0bJPaMIZPnrCJHHt82bEpZhA3SHLw8faJ9tpv6u9LWIA/JzD6dvaru69StZOBTn9QwMdFbhcyZJgU/KjzK7T5LyKIIcdf8IEXKJfoO3+1locdRUDGmkTcO2QfAROCmBfp/+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WT5YmW+C; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WT5YmW+C"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so32857385e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791538233; x=1792143033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySxG2l0k4bpp/Tb+8P52vg4ThV1MvpjerUMZY+o89W4=;
        b=WT5YmW+CZri0kY3T6LyvGNKYhdk4kRw0luCH+HrEDUL3TcZPuM34HBrW6iX0I+Oide
         JRys8xQCqUPdQJwT0w998GuJFLJHAX+WTEG4aNjjVxeFXJwwHb9ozoc5fRvTHpdQ/9Mk
         91EM40r0e3ShZy4FAiV32Ihl9k7aHOTZhOG08vmb4Tx9uU/5esQnBpBBf+2dFxeOGnLd
         gkkbuO7BfBLE0FOUP96+n7IrLT/Q7M7HlJdeHZ+z73M2ExX5ZPXjHSK0KUEnDO4+3TXZ
         A79XEpizubWC3sm0n4EkJcITztUww0ZWNBNIp2ytYLAQLSj4WGk+tVTcc9RAYT8IXiYp
         gIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538233; x=1792143033;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySxG2l0k4bpp/Tb+8P52vg4ThV1MvpjerUMZY+o89W4=;
        b=V1txLGgxsw3dNYPSQmzLwHANpSEspT0MD6NqX1l6WEhGljsgd5MWgaZ72SeqoktMoJ
         2XyFcc3KVyS0Tgzw1B1g5AdixG36UqKTQO1h4pthjn823h3Kcs/gF/vrOn27ANJ7QGBd
         3+Aqb3JfT3VNCkhf4IhlL4X4EAXBkwKv8pRxcP+uBMOEfXbAOWaEN5ap8eUDFL08ooyE
         IicvSm7NZ2YfSD5B0oo0Ih+fWqlL6WroNltduAU3NMmlNXo7VzSYbJdG6KTpLX3Jbf90
         lVW4eq7Yl7RODjoS1K3PDcBeWLs3KJt1cLlqVgYykkTu1NXVM2nGDGQNSFf7LaRwGN56
         UyZw==
X-Forwarded-Encrypted: i=1; AKwUvBwQryWfx5TQKpI0XwDZEo3sAsRxijFB+ee11xzsF1JbZaP2Aum0gt/RC7XA7FNBCpi61h965D7CIogdF7TO@vger.kernel.org
X-Gm-Message-State: AFuF++knAFwXDbcsdmHDzj4POOVldh29uzna/f2EgGOhqdWZNcCdyH+U
	KybGhO5IPKmuzh3OvXv7GzWcotKhrTC2lCnufJKMHmMnmJ5/tNIP3b33YYqBn7Ag0yc=
X-Gm-Gg: AYBFou01ojRu7hq6RdiuOhPPf+X5oG093KS3S7DTMYguENrp438drxEO5JxfJUkcQAR
	l13GFVp/k0j3woBrSPp1c2knJ209E8r5lrV37N5UZs909uhezqJsyw0ktW97zbnnR9F9hihzAI6
	j73Les9dzvMDeyZ9w2t08y8+EMZbRq8/HAySUHE11SFCZynK0KjnB5XY/WWSLCoMcIkKlnf2BXP
	B9AlyzMLJ3NYx8hNJ62hZIa8VBvydk6wZRqGvRCpYbem726hFaolR/B9YPl8TbnJ/gd6edbzkj4
	aAWbdQn+aMYYbtEdUq0iiw1nh9VEiKoCLv0mp4VwxNJ8NbJwftxo5WPYm9AwHFU3znIieVZrZHA
	6GSqMcMApbceyFic62UezLTi3Moxjx2PQO4GFQTGjUyRGEbsrgvZ45tLLTWtecLs+kk2buRANWa
	5UJqSh6xym0crPQ+96VnX+pd3fmU+sqgMDMA2x6toSSpuRW4QA/sD7xCY2Zpuf/c6YiyjN/oAuv
	dU6akVHW9Vc9JtJRWYhbTTiQIzDPeg=
X-Received: by 2002:a05:600c:46cf:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a18e4d6636mr23240285e9.29.1791538233076;
        Fri, 09 Oct 2026 02:30:33 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm43922135e9.13.2026.10.09.02.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:30:32 -0700 (PDT)
Message-ID: <6b9cdfd7-9f01-4ed9-a4d7-6b2949452b6c@linaro.org>
Date: Fri, 9 Oct 2026 11:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm/bridge: simple: add Chrontel CH7218A
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
 dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
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
In-Reply-To: <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 09:55, Xilin Wu wrote:
> The Chrontel CH7218A automatically boots its embedded firmware and
> operates without host-side configuration.
> 
> Add the CH7218A to the simple bridge driver and expose its output as an
> HDMI Type-A connector.
> 
> Tested-by: Daniele Briguglio <hello@superkali.me>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>   drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 3fba7002322e..fab793fb12b5 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -275,6 +275,11 @@ static const struct of_device_id simple_bridge_match[] = {
>   		.data = &(const struct simple_bridge_info) {
>   			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
>   		},
> +	}, {
> +		.compatible = "chrontel,ch7218a",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},
>   	}, {
>   		.compatible = "mstar,tsumu88adt3-lf-1",
>   		.data = &(const struct simple_bridge_info) {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
