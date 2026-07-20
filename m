Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B16B3D301A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784587168; cv=none; b=rII5NUBf4lLutF752mUfWAJx0OHck1613fo+IKqYG13ozq6nHOurJZ+/BiQbRFKxR022gSvY12rqs8OjKK3dlw9eUn15fZl5CHy33r2ZS/DcWASt9oJyKzgWv3SuQeBwxIlTjE12vigWSB8vpDBaceRsxwwI/IsO6dCK/QeKykQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784587168; c=relaxed/simple;
	bh=xfUE2DZgn0yvt/8dxChfStSQkvAhF7YKlC2IIEi58Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uL4mhStRequNt5q8BmGdPkXoE/AgxXmsTbfP9zMpJqMCTGOUkHKFLrkqVKlMyURQroWmk2P+g2FqsvvGWZTDOOzImBOiyuPkz375Gyo5LJg339wMPGO04223uP0LaEdaguZF3bRiYJdmDTA8n/tvjj/goxEV0nPXMQkij1Nlxjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5j7dMDy; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5j7dMDy"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39dba1ea83bso3282501fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784587164; x=1785191964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Zu0ELU6pmpUM1jgcMzfCc0cxC2PBXB9BxIZy3tNZzI=;
        b=q5j7dMDyRmYtKLvaV9M1Jq3qNsV1YG6Ss13QidFcgvZuzqJ1PqGPfATwaFjOaTYPRR
         RW4usBzhT4ue5+b8kbISIrDj+Tf1PGPXvb+9Yk4+DC/M5poswD28VtI5HVk/Sjq23Jqe
         E3eh7wViD/abOagvigf6kDiBsLVv2hBRkOTW2PgAOLPmDmo1CehQRZhjDB5FCtm19Nz7
         IKGxYo7yqppMqJXFskUgbzd0V4bcQr1J7gezfBJfKZAP8MaVBLq2t0dSeR/ed1M6BkKE
         OVFZjHuNBn7YlwHUWSfz5p8hv7W8Tebmrae5uPI9Cup3krWf9Myi3ZbfY49n+vtgEVQr
         iLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784587164; x=1785191964;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Zu0ELU6pmpUM1jgcMzfCc0cxC2PBXB9BxIZy3tNZzI=;
        b=eqjKPy8b83hoRW8kuyHCQ/BpTeTQ7ftAIn36cSgKAtwGzXop9XftswdJJuuhg4LVSf
         ylyGyIDOJOhdXqR1hPn1S2KQF1HEvl3er6V8HHLQBJvblekg4oE05EzRJIfQ9QtMJ6dL
         A7u+p5Wf4Z2fkrMAjuzHSnLMSySTeJmk+Hl1eFHcDoefbPXyl3cVRQGGNmpyK/C073mt
         e03Cg6vB0q/Sod0o+inz+wRjBvvR6cV93aIDnpnZfMn7ljK28fnrgqPbUYUtY1Qs3RZw
         VHabsVQB7+EIoGeHpmM8/z15pSdnfmhBOXzFuS5NrqwdR2kNvBEh5qh/i3erzzmGPkUo
         PBoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOURwQQMGngg/J42zbm1WvDzRBTJsBkbhxK+GXviHXNq6/12qIctXcIZKkASQJy3c1czRKPHTvEUtdkHN2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+HVyPhZYZKHAPDRzFfqRHLh/2EIm8XE5C3twMYDAmBQFqRlpq
	wyEkIFiEQ2aFs8Z+IzaH3I9x7Pqv3XXCICjlO0+FpvOSxuTh4tDsrutEMq1qTNN1kkeZGJRHaxg
	JOe4hiQm9gw==
X-Gm-Gg: AR+sD11KCS+buce5e6yW8esLYFytIakue439XmX6y3oecN4PxS61t4LWHoMjFLHHXV6
	BFlrrfErrsOLdfiOojtXrcVkZFG3+Y9A4hvxz/rbHIYwQgVMr/gw4flvW2RY57u7ZK4NCEKmKxA
	U0SeUWOOLICtseb9bI7Qvd+y8SODYnqxPhZ6JDftpssic8SaYJhGX4X6nD18eqZLH99p0ashAky
	JpJOSlOiU5ZZopdkeudtdckIhYuISXvQyg/QCxNeTNCxpkVLkM+knI7u2ha+SD6rxZ1fl+szFS6
	DS6SEw0s+dASTNasdtbmGs7PoJ//xQIykvPzlp4WlUEBDwQnwhofQ7bOsxuCofFXMokC/1qpkDm
	iXd58zb0joPsKC3xzeDAHLEC1hh1H0JbaMnMfX9D1sYFg+dv07WiGf6lfLGQX8HMSSShuvhWuMs
	HUVFwtu8d1Nrs7ulXsx0kfoLD58R+ahD4ZFaCvzEKHthF1BeJgmTDN3tR3Lggjnpz/R4Y=
X-Received: by 2002:a05:6512:2524:b0:5b0:1f1b:854 with SMTP id 2adb3069b0e04-5b28f88030cmr1824187e87.1.1784587164458;
        Mon, 20 Jul 2026 15:39:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e187e5sm2548462e87.56.2026.07.20.15.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 15:39:23 -0700 (PDT)
Message-ID: <6875d673-4c33-40ed-bec2-d158651194f3@linaro.org>
Date: Tue, 21 Jul 2026 01:39:23 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Val Packett <val@packett.cool>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
 <bjgad2qs6pt2cn5pr353qaelxa3gtpaqfoxjnrwfhwbty4g75f@ngu4ddk5jeyf>
 <31d1ac01-ccd2-4abc-9828-be120f095de4@linaro.org>
 <wd5rytfnsj5vppnimpemocstsaaqhmt4xmie4qnppdh45vsnml@2xne3khyalnc>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <wd5rytfnsj5vppnimpemocstsaaqhmt4xmie4qnppdh45vsnml@2xne3khyalnc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 23:54, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 09:21:03PM +0300, Vladimir Zapolskiy wrote:
>> On 7/20/26 18:00, Dmitry Baryshkov wrote:
>>> On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
>>>> This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
>>>>
>>>> The commit causes quite severe problems in runtime due to the introduced
>>>> cyclic clock dependency:
>>>>
>>>> * dsi@ae9400 platform device and its probe depends on dispcc clocks,
>>>> * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
>>>> * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
>>>>     the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
>>>>
>>>> On RB5 board with no connected display panel on boot I get this error report:
>>>>
>>>>     DSI PLL(0) lock failed, status=0x00000000
>>>>     PLL(0) lock failed
>>>
>>> Why can't it be locked at this stage? Is it underpowered? Or is the code
>>> trying to lock it on some random, unsupported value?
>>
>> Since there is no display panel attached, I believe DSI PLL clocks should
>> not be enabled at all, however the reverted commit requires it to happen.
> 
> If there is no display panel, you can keep DSI hosts and DSI PHYs
> disabled. If they are enabled, they can be configured to some
> intermediate values (even if for the sake of turning off the GDSC).
> 
>>
>> I don't have a panel for RB5 to test, if the PLL clocks can be locked or
>> not, when there is an attached panel.
>>
>> In general I believe the problem is plainly related to the established
>> cyclic dependency as it's stated above, and in any case the reverted
>> commit is a clear regression for RB5 board with no panel.
> 
> RB5 ships with the lt9611uxc bridge.
> 
> There is no cyclic dependency, AFAIR. It's DSI PHY PLL <- dispcc <- MDSS
> pclk clocks.

What does '<-' above mean?

 From sm8250.dtsi (using labels only):

* dispcc is supplied by mdss_dsi[01]_phy,
* mdss_dsi[01]_phy are supplied by dispcc,
* mdss_dsi[01]_phy are children of mdss,
* mdss is supplied by dispcc.

After the applied commit, which I advocate to revert for now, the ball
of clocks is no longer left untangled and linear.

If there is a clear regression caused by some commit, it would make
sense to revert it first, then reapply it after an alternative fix
is ready.

>>>>     dsi0_phy_pll_out_dsiclk already disabled
>>>>     WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
>>>>     ...
>>>>     dsi0_phy_pll_out_dsiclk already unprepared
>>>>     WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
>>>>     ...
>>>>     Tainted: [W]=WARN
>>>>
>>>> The problem has been already reported and discussed before [1], the original
>>>> commit was done for "preventing potential stability issues" reason, and this
>>>> time fixing a potential issue introduced the actual one unfortunately.
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>>>    drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>

-- 
Best wishes,
Vladimir
