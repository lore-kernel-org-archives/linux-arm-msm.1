Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6A44CF44
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440099; cv=none; b=gQ8m0EXbUvkUm/E6crBtFtkb7/0WpTWuaSuMbmQxXCMc0R1WVjp9M/QZaCavuWsPE7UujpiAvONTvi7+A3GGDWkrGuHhIFGX4UATPiayGTf9dfSFzpUoEpwTdxZgE8bXoTNiXtSVbUFNF/lYwzXGERu7Foq2GltBcivnYewjFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440099; c=relaxed/simple;
	bh=A9kTsIlpFM9/4kED2Jbar6fygXdSxA4cqWt7xu3coGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsklkTreq7Yka+TVDhZdBm/MrX4hSWw1lfPpHuNc3UDw88Vvce8wosHNxBl6UF0/KDeQum/S9hYtWirMo9jZZGs1sqbfBC4vpG4I4aVJPHiYajSfZUjHd/xXWZZmxlOEmV38BBn3JbQMgDTNmYHzogbaV2WCe7jL0FE3Xq5zVzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVxHl0Vp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zVxHl0Vp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47db714766aso690707f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785440084; x=1786044884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Xwq7roaqwaiY129Ws3twDa5FLFPnW6tapCxowp6w0k=;
        b=zVxHl0Vpw3rsME+vXOLzhu5WVxldB1vgIfkdB7DNp8tVWdkNhoUOSfEG+oMMfGGZrQ
         XvNQA1vEpmyf5XGZ+BSiPU8nIOY3uNK+zneZa485KCLDxkm1UwnI4CMLujhKjXaTbA/U
         2tWR8603j/HtG4+LrFiJChUAVZN/2/Esv/bagEsz/sPWgg96UhDwUhWgo0LqTJFyKUDC
         iiBDVCF2D1wASc+XzNvgmga8BKw7qJlp3XRsqR8Twz+uK1tfLBbvqwidtdJCfLfE/QIj
         HRyzCwywon1nKgrMFhBSiJQpUZbNk4uwlMANQiOf6FJzYO8pQPWHfn67Bslbs4E7QOsj
         DU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785440084; x=1786044884;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Xwq7roaqwaiY129Ws3twDa5FLFPnW6tapCxowp6w0k=;
        b=shTIgNJSeg1ibnEq70+Jv8Ym1IXHFZ2unG0gSocmnJBHISXjryNN8lh5+Lnygr3ZLu
         rl2sScgYfTwjHS0SPC4d4/QmAiU2lR4hCbg7Qq8SU/2bkZnH8VeRaoNE3Ct38H5ldpZM
         GnFlUvp5R0wUD0RE8ZpQnhoqa2aZPJC+i00YY8JrXYZModS2LIxdIpU3629i2fCb4p0S
         2iOunM4tfnFXC+8bPEIl+2u9OZdH9XjcUYkVrh17S/sGPpCwsUO2zsxXpt+HckHijsi7
         2GptnbtHWCQeLEsdC1ksJ2JdI1JAqXY1lRsUdkHdtXPCgbnIqjqFY+UWa4kSD1muHP3y
         O83A==
X-Forwarded-Encrypted: i=1; AHgh+Ro7sx/PosPgwiF/qH0sYtRYXdSFsRX1AplnZNDwpqOrpb6cJOP3o2paZp1yrCjfKZsbpriNAgcK4oEr1vDL@vger.kernel.org
X-Gm-Message-State: AOJu0YxkyY5DKN6KQow5PbbpjwUoDGQcXLeEuSSiiVF7FrIrKGmKLezI
	uunvVS2PoMiKDEjk8LF6VXqFQB4SB8fjN3SQ09ZFvh/EPWQ76CakjlPdHI3LCulXh2c=
X-Gm-Gg: AR+sD10Trzf566Hgmo9UUSpNPFHvN2zCDrOfa+7EOPHpIzQblYuFoDNOoQVxk74tH5d
	Mhy0o7pzdTajbEPRQkEFyix4uAenUAzGW2sVsOK1C6hCjfWIAdQNlYh6Uu74MPgqm+Kc8bgqOuY
	Kd+5gst455uncVmo5d7ZUIXS6s3W8aWCSpXPHUDHPNXq5Mqy94AUBBu9N3/Idl43rTrAqF2Sitl
	ycN9HLsQ2usMtbL2PDKK+zOrNT06f0pgcvyjsLfMxacY+38sQNHlrXHDaPCFL6ZSm4FpBpDKgwv
	PjRMs9QCDgL0diG4MkYGk3oq4sBKuhQYDU7eUl7fcgZOfst+9L1NiBkOyL+ETkJmZ8O+r4nZa+Y
	FS81wpTXzKhup0UcX9THdceUBVgCfze8UVPu2Nv1kyisCFg97iFVaS4ObW6zRwNcinxcoHkP9Hs
	LLooF7urk5jIW/xKUa7EXPtPUyh7Tt7b1MPkGvfzwf5OLqBIdlq7V/AMFtQoppDMaEwOsLlIhx
X-Received: by 2002:adf:f390:0:b0:47f:87f9:6ccc with SMTP id ffacd0b85a97d-47fcbcddac0mr1938150f8f.30.1785440083631;
        Thu, 30 Jul 2026 12:34:43 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.38.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e4721sm6911106f8f.16.2026.07.30.12.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 12:34:43 -0700 (PDT)
Message-ID: <c2636e38-fde8-4ab4-8103-c3c21dee5c1a@linaro.org>
Date: Thu, 30 Jul 2026 20:34:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2026 10:24, Loic Poulain wrote:
> +	ret = camss_init_pm_clks(camss);
> +	if (ret)
> +		goto err_v4l2_device_unregister;
> +

I don't think this makes sense if !CONFIG_PM_CLK

->

I don't think the read routine in patch #4 should happen if 
!CONFIG_PM_CLK either.

Happy to retain the RB with those changes in place.

---
bod
