Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE23B6C14
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745090; cv=none; b=KUjA+AP58y7lyrHutqlroibL2yW9PgcXgC5mBMeGcredNfHS0/vRmD9kl/95H9rmUVfSldWQy3NEDTnmpN76b3AtGLLorR5IAQHfi3dTfIQn0RBQNt6zS/D1yZ8cifjUI4fG16gMeT9ROVQdqJA8zBGfBZE2j56SM6Le8KFvsVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745090; c=relaxed/simple;
	bh=TMgzhfA6PsgFJ4xKZjYrRORTao9np//36yRwgxqBe6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qv/n0zrtTor/EPsLrs3pg7LXq8CryiL3H3PRxEddu5yLthogc0Rl8V5W1iRRMJmcfFNC4dr0+Ofw40jzr4zhZe2lDrkNFEKq+zmUGIecQN7z4j4uKP4F488Z+qNYj1rMG70aCZQjfTK/NlfUJwfgirgx/jQ1cw2JExey8AJV8uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdgVzV/Y; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdgVzV/Y"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a1fc6213cdso881571fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787745087; x=1788349887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zIShJsGoYPa4OpgS/MwEXN7JPhbie6s6p1LvxsQUCpU=;
        b=jdgVzV/YKcTII9pZZJAW18v65jXLN2AaAW4A0og/fB0OhNml/woJKIZcrjjaCmmNdb
         gVW3WtY8lu1lXJhniZx3/lIequWO9whjB9bX/Lvyut/oR/X6rouS9Sen8KTzgLTsqeNU
         00XLUyPlsGXNaT1vN8LHbZmUGr2OSWPC5JN2TyWQ68jDKjB5oqvq+qgE/kztyii4LAcw
         nqX+/piZUFk2g7kYhyTwGPz7hdHInutO007qMPAHjDXMxBLw0gfl2s3OqwMQFVesy5f5
         Qy7HzhiH+oV8GMganVIav8CEKF4Qe31rKWpZVRf7JpreIr5IJ4gFPb8tkoTkInf7or9u
         yzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745087; x=1788349887;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIShJsGoYPa4OpgS/MwEXN7JPhbie6s6p1LvxsQUCpU=;
        b=cUeXfaHeZqgrQt2BIC4mtRqD3DZNGQ39V0GzXic7HVHcUCWWdCQooQek5I4wkO/kXY
         L7MRw+Hal4W+AeEHy1w07sr6325ZwfI6yMsMXcbQ+/D1L2aLFFDemo8+s9JM0P9SXiZU
         Ms/IMldwGfGI/6j4mGP3TGWHOOKxXMY4hMnYM34+jOGokc4V0KiCgpOjH5zZ+B/s5b/n
         lgRUJ5ujAd9MM6iInthmoBcB+FErhxB1rJ5db980QpsVQEXhePOeFfZU5TpqpENM/WYv
         9FC+UMIStXMf1ubZlXFruIl9A0nkNad0zP46m11We6Q6SbnWw8lSugwXoCyNOAXpQoDF
         ck0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr/DfoiHDia+C4hbSCDi3a3h5K/6TUamiIiwC6OHqcZpPBOaRzz22Bp//qtYimVMYK796SEXCIraBgsoris@vger.kernel.org
X-Gm-Message-State: AFuF++nL1WsqXCfHXrROZE9YiLpRCJ978K6oYqij/lSBAIgU/ym55njA
	Q7YusI/hKgUT8MXPj4WwXmkGOERMemrfB3Agqm7h8KzZqGUNrigBikELa8+SMespsgFTLk93kpU
	g/wwh8k1alQ==
X-Gm-Gg: AR+sD12CmR+sPbpaMPiEy7w8F1cp+J3mj2KcxhYMyT1Ct5ODviWsbY0hDq5+YfTf7BS
	SixccZwNYwVbMoB9axEtDOwPDJIPeUgoUdLyFUjelyUJcf9Lj8u1a0ygkbxXcXKO5qYDx8jmPhF
	Dp0ZCia4u93Di9X8KtJACEEv9xZpfbesbAREl0iyfm9TG6yRWJpHjqETe7OTHL3yii8JP2ShlXB
	WmPEY9vD++DhPcbsFv40qY/jA29uAX8touTeVvulrvc930Pvs7G0oia5HzHZXzETYWi1d6NVv3Z
	CmQQnbYemd75UJ1UOJ5LhbgNG1yIPax7kLh5ObdfiafMM0vlAev7yVGI3I+hWAaUkj1mFcEl1eU
	+soXCkdNaur5ABbS9phDkrcYOcdN28BaHlEAS9lsEJ4OZupwUWaV3fkuEy4z7HYdnTsjBhvXX4t
	LmMfPJQ4rJXeVmPPf3lGVm8ugqSgNHO7RcCnpsNiu8ai9aWq9uhLpKZ/049XnbKLI2N+inQbbGP
	Oql3TBK2sbsU0gNNV/Db7PvKYXrelaOwOFIR/JYFg==
X-Received: by 2002:a05:651c:a333:b0:3a1:b658:fedf with SMTP id 38308e7fff4ca-3a1fd62072amr5620641fa.2.1787745086731;
        Wed, 26 Aug 2026 04:51:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1fcd4a7ecsm5289231fa.17.2026.08.26.04.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:51:26 -0700 (PDT)
Message-ID: <7e1bd92a-e4ca-49e5-b445-65f5d029c7e1@linaro.org>
Date: Wed, 26 Aug 2026 14:51:25 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Remove .use_rpm property from Qualcomm
 clock controller drivers
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <lo34nwtha2kcvlipz6csphxhfgswiphion6yf4clulwf5dtk6j@mdsidldaqd5j>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <lo34nwtha2kcvlipz6csphxhfgswiphion6yf4clulwf5dtk6j@mdsidldaqd5j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 14:44, Abel Vesa wrote:
> On 26-08-26 14:20:19, Vladimir Zapolskiy wrote:
>> A clock controller driver is expected to be embedded into runtime
>> PM framework iff there are specified power domains to supply the clock
>> controller. If there is no power domain, then it's a noop to add
>> the driver into the runtime PM framework, and if there is a power domain,
>> the dependency can be considered using this fact rather than relying on
>> a probably stale data from a particular clock controller device driver.
>>
>> Since the decision on connecting a clock controller driver to runtime PM
>> framework is done independently on the supplied platform data, the outdated
>> property can be removed from all Qualcomm clock controller drivers in a bulk.
> 
> Please use get_maintainer script. This bypasess both linux-clk mailing
> list and CCF maintainers (which might provide some input to this as well).

Right, my fault not sending it to linux-clk, I'll resend it after getting
review comments/tags.

Thank you for noticing it.

-- 
Best wishes,
Vladimir
