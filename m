Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E26543FD06
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571669; cv=none; b=rG9UQVL6Dda4/B/WUdewadYhGLlfPQj1v0vxJ2RHtq928WYlgPPHwclQC6YXydT7cZPAbx4GsfmLnfi6UF4Uj3c35ToeejvteGsTL2ri8YQr41Kj83v1u3b52Kpgcw3jOTnYId/qvgntllAsQd2Jkbr+hQIhdYZX5QVmsFJv9Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571669; c=relaxed/simple;
	bh=XMd3sEOcys3Vu0MdNcn9ys1I6mi8D9cyAa9CgFb6twU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWfTdQ3WIcsswmJueNFZ8aj+Sdz7dAoFNFcvzXmnO0fSxkSgpj+D8sy1LC+CbnNiBY0dgt4HBXr8hAjwDXNftPrIfbAXXCXKcPvlMoE6U44Ee6DwmBrJXNzhjBlXENIDtlA7fZdGgJDpLzu1cLR5VQ2BNBgyKi0L5/Pa2021rgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZMyPplQ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZMyPplQ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0190a62beso1405968e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784571665; x=1785176465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hTJV0pPYmMbuc3tZB0ad0zAOH+VYr3RluLhAKiqC04E=;
        b=IZMyPplQpoURVNRAueXnBvUpekeda3Z8pU6OSUpfyCS8wP2Qnhfu8BVvSXCUT7r5a+
         +Sdg3510pb3f72uozmwGo7yMTWPuRJ31g79Fyr0ryUFdG4aBqK5VHRrjBOclsAWleYo2
         3czguux0Rmvzb3Q/VTxgQBefKhArT6GtnDVU+Kn0YNTMYbYc+xWybukEEp3DhPfw+Zrp
         5bDsLIfvip/7x5qxKdNkf08+/VzY+HK8KspskoZXt7o1KbjnhAyCsuzofVTG2uDOs2Z4
         k97KPhoMP9el8JoB9DUwy24VmkWi+Ytd94+AwcFvNZ4mIRDcqGMJhz5EuyPOC7dx+so/
         c63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571665; x=1785176465;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTJV0pPYmMbuc3tZB0ad0zAOH+VYr3RluLhAKiqC04E=;
        b=Mn1kmnuAefvempfOo0yelkf64EDhhn3nNXUVIcsIdOGFVOBQSVGZ03Rmo7901uEcrI
         XV5tYG8RPZt0fq5Vzmno+p4Oe7+tIrB3Sc2nxEno3RJ4owwxzKz8MJclaFpTk2TICkPI
         4q4i1MpDXRMEBSNnWIgCWFMUdTA8NHeeFlCH/9b+/vV4XiD4fPUcv7GZ8HLzrVy/jVYS
         EmLn4y93AgSsWiXRBt95T9lwuLXD1xqixToUIpMoLfh7c5n2x/Jp4f5NnGCEbOKntAc7
         tS5Oh/mVqhjO1VBEVyO4ViES5nex+rwYR/AQj5tW1Wc9UT4nfGFGK89NzoEW3TOuuhSw
         Igog==
X-Forwarded-Encrypted: i=1; AHgh+Rp4DQffOI2d0D1m3JBuoUyyHSOJ9oUzeP29yvUpYRtVUNu5R410Pf7dBOu6WxByUJX/VbDq0o7sb30gZM+2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fqzV62V11Pvys37P968NRVkesaVzPfMjsWPNvLdEKE3XHmMZ
	8aoGXv5LTOsn7uLCfP2FzATVsBZiLzL9TCz82yxAqJrJRtdorjakObiJ7QYgBVNqyeE=
X-Gm-Gg: AfdE7cmgrEkCyM7OerL2iqZrl0gRuqjKGlNzHCD4EGaWbYiJGdtM6euLtmT3YP9q1r1
	iP+Do01E0ElcXDjwQLzMkX2MmZigaN9cghiY6R5zFAtQmiAbuj2y2YtGU9+4A9YLMI9xgcz34S2
	6tS4VAjtUOW3fvTu9bD6JIFMUc7qA2LkJH8rMJGfTtCwqMzkVA2riHtpmhQk6e1/r9bCueQ+0cO
	IVabAEsoGO8HmXFopNIVFzMB1OrZi4tmvzRBfNRmy0fTcKseckj3rzvq9iq0FJMEU/Cy728YhHU
	oPylzPnJVG4UACKjPBhdJ2EbZ8aqIoUTtQmaJ/ugYh/5AZlxbv7QMDbdS0HW5UyGL6p9KWLsFsI
	uHjfP8d4QOfyvKdZr8js+f/OmjbyJnUmg8zTC9M/4HGPTkB2OiqAUiFGsU5fxsJyGKET01kQZS+
	FWq7HnocdJJ/URRid47YNvSrsFsa4Aov5GVfkwocNFQVCxhSwETRRsxKFpkQSRBoGkQgfgxOsI8
	dSOqA==
X-Received: by 2002:a05:6512:3a93:b0:5b1:5dd0:7134 with SMTP id 2adb3069b0e04-5b28fdc6ccbmr2173230e87.8.1784571665303;
        Mon, 20 Jul 2026 11:21:05 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e1cb2esm2472508e87.68.2026.07.20.11.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 11:21:04 -0700 (PDT)
Message-ID: <31d1ac01-ccd2-4abc-9828-be120f095de4@linaro.org>
Date: Mon, 20 Jul 2026 21:21:03 +0300
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bjgad2qs6pt2cn5pr353qaelxa3gtpaqfoxjnrwfhwbty4g75f@ngu4ddk5jeyf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 18:00, Dmitry Baryshkov wrote:
> On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
>> This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
>>
>> The commit causes quite severe problems in runtime due to the introduced
>> cyclic clock dependency:
>>
>> * dsi@ae9400 platform device and its probe depends on dispcc clocks,
>> * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
>> * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
>>    the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
>>
>> On RB5 board with no connected display panel on boot I get this error report:
>>
>>    DSI PLL(0) lock failed, status=0x00000000
>>    PLL(0) lock failed
> 
> Why can't it be locked at this stage? Is it underpowered? Or is the code
> trying to lock it on some random, unsupported value?

Since there is no display panel attached, I believe DSI PLL clocks should
not be enabled at all, however the reverted commit requires it to happen.

I don't have a panel for RB5 to test, if the PLL clocks can be locked or
not, when there is an attached panel.

In general I believe the problem is plainly related to the established
cyclic dependency as it's stated above, and in any case the reverted
commit is a clear regression for RB5 board with no panel.

>>    dsi0_phy_pll_out_dsiclk already disabled
>>    WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
>>    ...
>>    dsi0_phy_pll_out_dsiclk already unprepared
>>    WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
>>    ...
>>    Tainted: [W]=WARN
>>
>> The problem has been already reported and discussed before [1], the original
>> commit was done for "preventing potential stability issues" reason, and this
>> time fixing a potential issue introduced the actual one unfortunately.
>>
>> [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>

-- 
Best wishes,
Vladimir
