Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF4F3B8944
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787137423; cv=none; b=p+/nc0Mes9XDwthK/jMLfA1LWBpRznffDP7gJ0LSWzDgBMWSsCynq/ydD2/63QfdPPSadnIZ1SygIwvGGylUhtFS5B3fQJ4vw9I3I0g7WbeM7LAuwvGtBu+NGzIhXDznSabjy2VkcpvQTOwOjlKdqx7N6LFXGBA60NRCGabmsEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787137423; c=relaxed/simple;
	bh=QBojQsi8wY+kAhHZS4n4dE92YBUTLKJtOxmkrL4V4pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVO98LmU0KysYSEBLWDR07xIZeoWmHRyC2vOLdGx+ylys18pWq7FHppj+24ySQwdihm+19sk2sSN4+86IGUUnlpxGSFDbt2Uq8zF2Wo4ohQRGh2WV0kSi01Ts0rmCUAmTPyeimf8Hv1x7JCaxH4nhUJof+dSER9PC3m3B7oWUd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pg2z3eWx; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pg2z3eWx"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so131546e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787137420; x=1787742220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A4ELa6x+Yb5HCgORI6eX8lid0seyZkrG1l18lRvxugE=;
        b=pg2z3eWxK7eWErztV+PPmYVcQa3PCKvlEAE+KVuS6Hw9VpalQcpiPtIr9ueHzNZHZc
         zeeoDDcITYKYRILPgfe82rXRMvcULtYKFMaNIo8I1NE7xdOwFQ7x3D85S2mSNM1q3lzK
         nBFoG9hjmH9xFG8M8UAbW0I2tZuNYXp3+nB6ooO9M8ypah5QQ1FYDx+fTALdkkCRdUtg
         tzCkAkS8yz1ZzK6ZjU0177qb0yY2o/SVP2BgWlkhNmHDpcNEx2ShiAPynA218hLpq26h
         wb8s2m2bU8+bdK7Rc7I8fQufXbvHKpp91sqzoQONqLERsAvBX4mVTZp4FLetUw7Y3qox
         KFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787137420; x=1787742220;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4ELa6x+Yb5HCgORI6eX8lid0seyZkrG1l18lRvxugE=;
        b=mug3AGhe4+VAyTLlKCEHMOoGNNQDCj2qXu29GJV+x+kZsMnHGATtv0VXaisl/HzVpC
         5JTaJRwnI/bxU+vHMWb4bkxCgD4v5ao84rbOPg5UU29Ii1rO+F1wrUsj0dD45KmpG9ZN
         XSGSvuxQnsifE1746hfe9GBoQBJ9TTE6NDg+3nKgGIcV3R5PynLIqjM9jQQ0V6KqUfqq
         11oXtt8wSLRwCRaU8kKeaOMZS8ZrycuN5dqHj5Bd+u/lTIdV0jT05efEwbOsnpbV7PkP
         5QLxkL7WQXHKHlCZucnAqynoAEQpeGWNcSkwPwcbGXe6bhymHIWkkNmtJdemZT8GvH6q
         JE9A==
X-Forwarded-Encrypted: i=1; AHgh+RqeYFDPAWTAcoBZl+QlDQlMfUNJjet6dDngfhExP0y+HygHFCe7JUySptkStmzIi9H7Wq/mNOpDwIGUlAwt@vger.kernel.org
X-Gm-Message-State: AOJu0YxOL5158+BXbsxCcvcVvBJXI+QhsmhqJEwssVJhdSIKQImKIf7O
	rgMByYkLrwfmmILRDO1/oIamJSy9IZvvUV36mXcttjz6q3qYt4wT+kHuBGtTRErfg1k=
X-Gm-Gg: AR+sD13iGwPA4tfMun41nknEeCR5zlzYH3h367DX/+sq0/Me44hy2YcUbDOZXC3JjQo
	3P+VnyksLfU4nzO+fu5Dbh6NFRlQSP9md4CEHuNh9P3jO+sPCdQZzmBb7VAff/UjjPQFZToSjlC
	6EngAU97k93fDBfnBZ7KXxRcska6gs89NVCn02IwqCboPxagFKJQT7MqOg9W6C66WPcrVSongEI
	D+57X5IPZapOOueonHHaTEANf2zg9hQqRGLs9uR0fIIilcGHlT4XYbnMWMOIxf8L44rNdkmS/cQ
	UIWErtfVd9cM8zXGHyP9ZFGB7XaVGwANY8LysgBYpmurh/Yvpg3d2I/S37amXpXVAQmPn5VIcjo
	slisLwUTmm0fB65ZsuFLREgiwsmRVfJFWwoIxtwv5+57YyKJBrCrBls9+79h7ecywColdMzK5Qa
	8kdLeLK1KnIGELofqqimgXzWH1xKfv6Sro8/LTlXIgvfXp8LDGB0nad6aRAaxBMhuuwpg+uCYQg
	YI2V2S3pPJ83i+i0mqhd90yw54+Mh1BxXy2Hnjolw==
X-Received: by 2002:a05:6512:3c8f:b0:5ae:b2df:c11a with SMTP id 2adb3069b0e04-5b4788fa611mr702473e87.0.1787137420382;
        Wed, 19 Aug 2026 04:03:40 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788eb02csm430814e87.68.2026.08.19.04.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:03:39 -0700 (PDT)
Message-ID: <440f21a9-4564-4f89-bbef-4095414e486e@linaro.org>
Date: Wed, 19 Aug 2026 14:03:38 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-cci: fix autosuspend cleanup
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260812094425.3515179-1-lgs201920130244@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260812094425.3515179-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 12:44, Guangshuo Li wrote:
> cci_probe() calls pm_runtime_use_autosuspend(), but the remove path
> does not call the matching pm_runtime_dont_use_autosuspend() before
> disabling runtime PM.
> 
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without undoing the autosuspend setting during
> teardown, this reference is not dropped and usage_count remains
> unbalanced.
> 
> Use devm_pm_runtime_set_active_enabled() to manage the runtime PM
> state. Its managed cleanup disables autosuspend and runtime PM and
> restores the suspended state on probe failure and driver removal.
> Remove the now redundant manual runtime PM cleanup.
> 
> This issue was found by manual code inspection.
> 
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
