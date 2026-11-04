Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799165;
	b=08dmQjPzsHDWRuf9Njph9c9OsbO2WHAmy50NpgLswUgnRiYkVAPy4I75km9OxAee38El
	 xNWRgqqxYIex9QQKrbrnRzjiGSfbm8VlyURJCY6IcYJGmgAS6T0KvM2l0J7VTyvNnjUXA
	 aG4Hh58bWfm0KqYYLdpNJfZyjMw4AT2xNaIgGAzUYbuBk/fTFmyPgsP89lgg+5wQjX4y4
	 ChAnXR319jRCcjlqn4lt8jusBno8I888OwMY18Mfao7WmEDENU/c5UGVYjmHr8DBua3Ow
	 p2ru7ubsNhxVufwA0W/17M2mMPF/Gh3Z6DrKTMqYhtmoyM5U2gMQ7VVryEj4W7bbWig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
	b=qUEEBiYPM5IEOtk+oN7B+lUhzuwsBUJ8DKk0pOb217bngK0mpgt0pLmAZbPCnSrFPq02
	 t4sI4j4xL6Gs551UwksJFPZ/CtJWsMDXc+Uh29wdDmC3QYLhPOClCn/4JjqUlEIbd7QGF
	 JIHg8xymENLuo0M38h/F6upA/IP6JBfUO/7kBTFt9KJ+JwMp/BhXheFuPIC20s+7zNHzd
	 tfXlJQp923VuQ7xlqfA+Nm550J66FWTaGlwH3ZIWWlTuknEj2Gw33m6xIfJ3lih7l8pxc
	 GgTrCdHBF0YbCcxpMn5yb0oSS2rHE5+/sE4metKzOv/fVkJ+poRusyWM7J5wwLTVwPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="A5Hr/Grc";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29543606A33A
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 13:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29543606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A5Hr/Grc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so6364965e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793799158; x=1794403958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
        b=A5Hr/Grca4g1tu2xiDFXWfMDdZQA55aeOJgwSaJ6U5ZxxQ5n9iJlSwGAZv7GOgnnwu
         6CaKYBsHH2aGLoT9Hz2eKilnRw1+Jps+DZQu0aqUKgr89Yxs4MviaH1ZyBd77Cr97Ygq
         JpGOeHwgNEZHdRo+fB+UTQpUeGl78R5somkITXNM+lHduml1m66zB+84vqPHSVEdNWaw
         RfzPO5RUiOwUckkH6oB6oxXSX+g/6cnkPjUHUb9mmO8lAByOUXv8XsRdgC7KZneB4Hez
         kUfQipZwPz5JrwtXR3A3iHvGRT+lm9E7LZKVxf4/Fyr1SbfdTgmEZoz7k3HlkVrXMK9g
         BjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799158; x=1794403958;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
        b=xsdZKMPmSgFz91Un+ZzgiktpNWqMk8bMSUupuY7Qlrc6sQG/mjGb4kRkW3yAtwPQJK
         9HsCaW6r//NaY0KVF6F27pqSAQ/LDye8ou6DbsM5ysqN7XVnL7lVbeMFm60KNHVhZs6o
         DdZfeBy5EAUZSYPjxn3FVOxKDhzcJzL/uopwvEVrOGCZmJLgfqE/74SkSe8HwsuzB5tD
         ijKv0rL0I6DDMQYI0X5As1sp9h++Gbdi1B0U0ImSq4Z5MvyVIztzclPM+cXTOi55Mh65
         ZRIVVS5otEt8ZOTPZy1hHCJKLMk60yjuuWgZ9cL3WC4hEqempXXcr5XDmh3bxtvOLymH
         Yj/w==
X-Forwarded-Encrypted: i=1; AKwUvByzAoHLlNPI6ahEzljUYtRlOMRt6kyudP1wxi/ZHERdoV3cplx0qZs1+cbFEIqYWh1m64NJUjDWt9/jCpzY@vger.kernel.org
X-Gm-Message-State: APuU4Z/V2za/OQ+AkFC0N8Mxx/u2wV0y9MYeFEOBqpmshEtoYqR8FGsY
	w6OmfSmOKwJjWCzhkisxW+d8U61Hy5Id7aT11o1WDCgZdbqBcu8QqUkkD/c7tpHsTas=
X-Gm-Gg: AYBFou2apk/lH0Iq/xc/5nCoBQsuXw6Y+IpdbfNsuFpra/nVgkbG4jS53g6EtT4JeXk
	qbSvJ9HBwwDft2HEf8CfB146P6j44ioDOgS76BS5Y7vQWPCP+JCuVgawW8mUZoVNt+CBjTXQuh8
	ITsMF6bXrfwRohQrctbO1ziCdJhOJWROwB0O5R5DCzn/MWFju5RF+oTLGFyi/l2CTM6pBpVp/7c
	yDbOG5jNzstqX13XeErZFq+3dOtYIdq2ZRxodWLY9c24bFqLkI9Ir3JEX9Dc5IIl/bTrRfmovKA
	q9QOsgdDZijEjhLY3Cfttc5Kr1hqR9MKRM9EKkKhJftcyYfYCUHs2ugfQTRY3FY5c8SgxmLl1lC
	ia0lZvRViZ5/r4i9TAF1kLq0PgZg/zuVn6P+A4so8pIyP2bK7JzdmokBEc6aqNYD7ZVdJrDVvAV
	5Eey0isye0QrW9ObHVhYX1EdTYCgyBxMGuLTtFNUaxgKGjLTGW8maqdAQW/qBEAa88GLWAH5+Iz
	LfbQhBW9ylYL9UppktIlippBcCN/9KlT/WXpzD4+73RUTf99gBFoBzrI+ctNeXZ/YvbF5OOJ/K1
	vDxFzSh2aG/kENKd7CxpFuAO/TJv8gq2xuJKFgtbFg==
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ac17b2cde9mr422203535e9.7.1793799158430;
        Wed, 04 Nov 2026 05:32:38 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm3825694f8f.48.2026.11.04.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:32:37 -0800 (PST)
Message-ID: <4ebc023d-38fa-42e8-b89c-8febbcb0d7f8@linaro.org>
Date: Wed, 4 Nov 2026 13:32:36 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
 manivannan.sadhasivam@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org>
 <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 01:11, Shuai Liu wrote:
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
> 
> With CONFIG_VIDEO_QCOM_CAMSS=y and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
> 
>    camss-csiphy.c:(.text+0x51d): undefined reference to
>    `phy_mipi_dphy_get_default_config_for_hsclk'
> 
> Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
> which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
> transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
> consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.
> 
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes in v3:
>   - collect Reviewed-by tag
> 
> Changes in v2:
>   - drop the redundant "select GENERIC_PHY", as suggested by Loic
>     Poulain; GENERIC_PHY_MIPI_DPHY selects it transitively
> ---
>   drivers/media/platform/qcom/camss/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index b51745c942c9..e0cef2cdd0a1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,5 +7,5 @@ config VIDEO_QCOM_CAMSS
>   	select VIDEO_V4L2_SUBDEV_API
>   	select VIDEOBUF2_DMA_SG
>   	select V4L2_FWNODE
> -	select GENERIC_PHY
> +	select GENERIC_PHY_MIPI_DPHY
>   	imply PHY_QCOM_MIPI_CSI2
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
