Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793752129;
	b=2u2mkt2AyH92E7tarKTkOvFsvJZffJ6+1bUArCcj7hYW3gL1X+qaikCswvuU0frYeuju
	 MUX+DgCZj6APQexEoN6qLM0ulBfBQrkKoMa9vXz3SJKhVjMeYJwpV5EM/GYeq+cl4zurt
	 przqB6wqy+IX+7haZWHNcOXlI5Aa3FOvs0iFk64SpzGPgFxQ0zKC5DToVg21ACmChFIIC
	 /CHP19MBVlu0Wa5rtpW7rmuO1OwOQ1scbkEbOWB5BbBDa2OUirP9G9H10wkNIV/cpJAzH
	 4bTFf5n4XnhsSRBsENFwy1FT15IMK9SDBBfAc59EZkTRUH5dcs10sg5TCtabrAefqJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
	b=tomcvZ3c8yPL89LR1vBzssDF8n1HBKsEM/dci7HGlmiU7SoELJgG5s/qsMbugmq1W0Dz
	 NJOlCV/XhzeRVUvxPY7qoQ4rZ+IiygJmAJQG+Q7TssEwxBPrLhDB+Qt120vb0/MunNOR/
	 IZmNnjW4ybHPDr91pxklFgsWAn9XgtSDDxUsaR5xRHygVioOjuE8/JJvfZ8M2jgNsWb/N
	 ex7apoSObsfX/wqgWIuY7ChHxbewYerxdDZmYQigKc/+Y7vcXZQRWxstzYfrwEz926hhH
	 xCvaXLSp7qycELnfhFxJwmaKzy5K5mq+iz+l4xlHC6wm7qWZp8dlzJFjVyeu6Yq7njw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TGsmBkKL;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CFA606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 00:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CFA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TGsmBkKL
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab1cb6eb70so503921fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 16:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793752127; x=1794356927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
        b=TGsmBkKLz1TDbJ3HJ/Y+7unQZOZXwF6ZCda4Iz+qLp+2tMQzBg5Zu9A3hs4Phqsr30
         E6BE1XqfjyioV0JC9dsqwTYQPD9UvuiLKiJVUQmfWORbP3nyv5W+7DcI1aUbl8L8RU0V
         SZybREBo7gKJXMceRZRrrkDIemqSjb+6pH4pMrMngl6oOeiAS96qG6IRT9LoHb2Vd5y1
         GjE9A8+OVpBTCQVff5YIYms+ehQaZ9uXtUUm+INf3unP5YPr4ZwbEQTVrnd2cUhTC+Q4
         S+jZFPWmds8hCqNOsBSSi3UQ/x1nJrdDw0m4cl42pSxZDQKj3jlscyuOewDEjo9q8W9t
         aLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752127; x=1794356927;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
        b=BlQFt3mgj55fuMKtnfihJ31zyqAINSjYGMgpZ6Wlt+h3s7IYZi4urvnGt84n3Mv9Ve
         ZLtX1S8pJRqko2+hUKJjk7B6uyOy/YKOdL9VVcjWHSBQzG1Ra/Wj3LHXG6Ov56u2K3iJ
         5gd2ViAEosmKMn4etyC5ut6ipWB85MBO7yw5d1UlK6WPONq3zFDinQXVnmxyoMHV+NiM
         hAnhRKEJb+rf7YedvBsSO7zFmj4QmeOSDLopHiN0/5nNSgCrYRu0MQLYjxr7mh6iDQvH
         VBTZ0GARE9xV+ifiM3+PINEcJog/INyN2SnWfyje9R6EMeO0pKuakZobyLbCC6qZQXhp
         up3A==
X-Forwarded-Encrypted: i=1; AKwUvByJhoB1KmljTAS2HRKmlBnjvg9rnsn0sCLXsz+grkP+jucD6yFl73lXuT6lI+8kf5KOx9BGwqCw1xoJBe5v@vger.kernel.org
X-Gm-Message-State: APuU4Z/T/FCp3CInmpaOGAS/b4Q9rFW1/3p5bESOLQwccJ13n6x6xApW
	wdEGKVO3izAWEiKg3GfI+AQZ+7ZZnTp+rkEqPy35NAfvY+Tfpgv4oioQu4CepsCLKTY=
X-Gm-Gg: AYBFou2iNUOymvYDQ0zvfpPVKUV7iOsdbNWLbeama3E9gjehAy0jZ00016y8yqMxzFd
	MI4nSyU/kYqbjhUN2aKNuCgAQq1oYLOLZwFJ3XclH1Ps0czA+trw2UjTb/06cN+pUQs4dKOvd2D
	88ix8VEQ1H91tfOvKEzF2tTLN7H5TxWhDRohBflm4IMr05EPKNCW/Yev/gNA1xBPzHj/W2Q9V5B
	Ri+Tc/IOx4Wd5+8FZiMjELWPBr42UQ/RuqAzR3exT86B/aZsBn19XZtO+qqbSQhyYoMKa3zec4M
	GEVnVSpsE9jkDLcsAgBi4aYobkdg4A77QchqoxrYScy4JjetV1a2uABY/ZmLcUpcLqRCtSiDjir
	Z4xLUa6yvD/J2bHoImZqT/iBSQqoePUS3vXXM53F6CT6pahwvvoDUHbyJnEJL+UbEO+YPmFDReq
	TfXngskB080GM3yaLZODZ8HCQeeVwvIykvEt9WMzkyD4Kndoet9GJkuumh7J3/yV/LkpnZhESm8
	tyws7fBZ2mvVmsJxtPoM2vJICrSXqXNfb2N68oVfjrP68HEPDR4MdrbnsiOLjxUjVKWXkT7/ohF
	YeEqopfr76cBHaFuNVlEtqXchXGou0S9XsIblr4w9zPH/YEU65625RlWkvtK403CT5TSlA8Dz7G
	owF6UxQ==
X-Received: by 2002:a05:6512:4041:b0:5bf:ce24:38c8 with SMTP id 2adb3069b0e04-5bfd95add38mr4540761e87.4.1793752126952;
        Tue, 03 Nov 2026 16:28:46 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38d11dasm142334e87.74.2026.11.03.16.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:28:46 -0800 (PST)
Message-ID: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org>
Date: Wed, 4 Nov 2026 02:28:23 +0200
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
Subject: Re: [PATCH v2] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org,
 manivannan.sadhasivam@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
 <tencent_964D3CB9DF49E7B244CADB34F5E05A8BE10A@qq.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <tencent_964D3CB9DF49E7B244CADB34F5E05A8BE10A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 11:20, Shuai Liu wrote:
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
