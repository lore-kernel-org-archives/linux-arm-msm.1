Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669BB33D6F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712504; cv=none; b=gTcLVlxZah6KzMqDtFfL5DnQH+TZqA1HAsi8jjXcg7Swflz4XS/NmCW/RITpo/3MwseL5I/gWBMj4ZUXHgxtvr/85wYoa4eZTuNvBvDIaNgXRQFnyWdN26tXs3UbxbIjJE6AFoznSPc3Q+OTQkLCOpu16NcXERRE8Y8ybGebuL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712504; c=relaxed/simple;
	bh=Pe/0kKGSj6tPOrbCLxXmT9vn/GHSC+v3bJwaT+D5XaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EY1HVY69cVznzlX/QlHtJr8+xbfsrpQYN7xE6wSAom99NLXGQdPpRwLU7ASLmxh3JP0lHIXyLTIvYAqk3R4ZamH5bn9zMGBIYA+n496vklCvAC1U7Lf+GYQVefKJel0D5fkGajMn0/cAeutS7zdujp91BSdEM8BoRzfQMmszWDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=av+TCZNt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="av+TCZNt"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so1351900e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784712501; x=1785317301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6pTpWoTj982WJF6OewBrhQMNLFSx6QlLjAkGnwBa38o=;
        b=av+TCZNtfvHWnN0c9IME/USpuW5QtI2keR02VTZpCWj6a8sdHVkm+Nwmd6x1GDASJm
         fOah0US6mcVFYiSBIkBOwXGgqvCAAsn4zwSFOq0IYlQ9zIbEijRk1PXq55DxVH5pOabe
         RFdUWy2KAoEOgeFT3Ysk+Scz3Al0975p665GqpVLLqE4Va/aUP0sAnHCNGm6QTos3Kpz
         EnRm9UMu2uTB4GGV+usGZdlPbVX8QyHHQ5bHEJJmpoqJWClC5R45cnQhWRayu7WaaRcG
         XTiyfms7Om8oKlSf3zbjvqVyLD6Mr+kgP666jOfqKXdDsFE9EXs/e9TB/8tzbsRE4jsH
         tKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712501; x=1785317301;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pTpWoTj982WJF6OewBrhQMNLFSx6QlLjAkGnwBa38o=;
        b=iN2LJ+PSn82pFZmo3CdhtoS76rPqDviHjAWispdOcjDjMo/8u6Hi/nKlNdZho3n9f1
         7LU6fhws1RWqHNQa4J6817lAwxDXLLBmPthV58X8GbslEgPmqS1HzoXxFidWIeDPy3nA
         PJqWLrBJFDCHomTvf07Tga6mYJaDvS1iUSpVSjNKKEKUfArGnhq6NGJJsUQ9tqg9+2u6
         cph91uVcVs6sgTO8aWIyMn/kAh6dEegtXBMLkta80OSJT0yt14qhFZV1vMszWtG7wMBS
         rgcXeWazHcLr8+Ac1/lk8+Ho3rQSauv8oV/nqDyNP9RqTst14uIoNB60IznbuS7zrEei
         MEhA==
X-Forwarded-Encrypted: i=1; AHgh+RpxFItuA0VTapoU7YK+yQqGMDsq+DwFIty3G+TPYNgRMj0eu+M8uv+ThL7d56+nTqoPml9FDxMoowaVuwjQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fM6AkyMteWEWbhebgx6iWBDi42PL24E42nO1WKk58R1NPjEX
	/An/6B5QA9nCi+TBUrcHlTfFpT2ZjUSYvBoPM0HCAYEnuEiL7nq7fPsPfzk+xcns1o4=
X-Gm-Gg: AR+sD12ZZFoZWKz71obqD+1HsjVC9+yby4vfLgveP3iqxW9C4jlDM9ZWtjTe5txt56n
	4EzS7oZoVlaL9B4qvsOOU4NRHo0SQof/2RhKf3x2SL8uC9j7gFbwWE8rcmGkw72JuT5bKD5DSlb
	FAWbb8F+kH6tR+u3JXAYGOUratY43mxluhA0B0VwLy/rhznrtEaoE50oFIX1Pf2/Y80lTCkZlHn
	Eug7lo0nI9Bn3DPMJ+5Oanq62tI9lsXBTuzvShKeBd45eKNZL/EPp7Vb/Vb3jYqQ+zdm4w9UHYQ
	M56lEoOK2TrAm7JcYiU0qGJjNSatoYqSxgot/oyS4SzaR41iHiqeaXHR98lsW04D8/fCUfSeghr
	PFLQ45BD7F2X7bP9Gw08IFVxYKfZiyC8eRrNp9CBtApxe9jNAwlWpTVxXcxfMvPpLTRpxZmsw70
	BSx36SA2zfl2H/kixrTufc+F3T/++6IroZ91PN876kUcWIiad6UPoP9lKZ
X-Received: by 2002:a05:6512:224e:b0:5b1:4fde:61a with SMTP id 2adb3069b0e04-5b2a49ee6bamr997727e87.2.1784712501236;
        Wed, 22 Jul 2026 02:28:21 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f4a728sm364102e87.75.2026.07.22.02.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 02:28:19 -0700 (PDT)
Message-ID: <d253894c-9400-4c2b-9074-c5f9eead7b21@linaro.org>
Date: Wed, 22 Jul 2026 12:28:18 +0300
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
 <6875d673-4c33-40ed-bec2-d158651194f3@linaro.org>
 <pb554dy6e5ek3ftasgskytydumajnb6tomncbny2me355aaq3h@pazya2moabb5>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <pb554dy6e5ek3ftasgskytydumajnb6tomncbny2me355aaq3h@pazya2moabb5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 02:30, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 01:39:23AM +0300, Vladimir Zapolskiy wrote:
>> On 7/20/26 23:54, Dmitry Baryshkov wrote:
>>> On Mon, Jul 20, 2026 at 09:21:03PM +0300, Vladimir Zapolskiy wrote:
>>>> On 7/20/26 18:00, Dmitry Baryshkov wrote:
>>>>> On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
>>>>>> This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
>>>>>>
>>>>>> The commit causes quite severe problems in runtime due to the introduced
>>>>>> cyclic clock dependency:
>>>>>>
>>>>>> * dsi@ae9400 platform device and its probe depends on dispcc clocks,
>>>>>> * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
>>>>>> * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
>>>>>>      the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
>>>>>>
>>>>>> On RB5 board with no connected display panel on boot I get this error report:
>>>>>>
>>>>>>      DSI PLL(0) lock failed, status=0x00000000
>>>>>>      PLL(0) lock failed
>>>>>
>>>>> Why can't it be locked at this stage? Is it underpowered? Or is the code
>>>>> trying to lock it on some random, unsupported value?
>>>>
>>>> Since there is no display panel attached, I believe DSI PLL clocks should
>>>> not be enabled at all, however the reverted commit requires it to happen.
>>>
>>> If there is no display panel, you can keep DSI hosts and DSI PHYs
>>> disabled. If they are enabled, they can be configured to some
>>> intermediate values (even if for the sake of turning off the GDSC).
>>>
>>>>
>>>> I don't have a panel for RB5 to test, if the PLL clocks can be locked or
>>>> not, when there is an attached panel.
>>>>
>>>> In general I believe the problem is plainly related to the established
>>>> cyclic dependency as it's stated above, and in any case the reverted
>>>> commit is a clear regression for RB5 board with no panel.
>>>
>>> RB5 ships with the lt9611uxc bridge.
>>>
>>> There is no cyclic dependency, AFAIR. It's DSI PHY PLL <- dispcc <- MDSS
>>> pclk clocks.
>>
>> What does '<-' above mean?
>>
>>  From sm8250.dtsi (using labels only):
>>
>> * dispcc is supplied by mdss_dsi[01]_phy,
>> * mdss_dsi[01]_phy are supplied by dispcc,
>> * mdss_dsi[01]_phy are children of mdss,
>> * mdss is supplied by dispcc.
>>
>> After the applied commit, which I advocate to revert for now, the ball
>> of clocks is no longer left untangled and linear.
> 
> The devices have always had a circular dependency. The commit in
> question adds nothing to that.

Unfortunately the devices were in the circular dependency,
the clock controller device driver/registration provided by
the dispcc and mdss_dsiX_phy devices were luckily not cycled.

The reverted commit requests (unprovided) "dsiX_phy_pll_out_dsiclk"
clock to be enabled whilst setting "disp_cc_mdss_pclk0" clock parent
from "bi_tcxo". That's where it breaks, I suppose.

>>
>> If there is a clear regression caused by some commit, it would make
>> sense to revert it first, then reapply it after an alternative fix
>> is ready.
> 
> Unless the commit is correct and just uncovers an issue elsewhere.

So, what is it be to fixed here technically? An advice is welcome.

OTOH If the issue was there before, likely it hasn't been ever
reported before, and now its rate of reproducibility jumped to 100%,
this is still a regression.

>>>>>>      dsi0_phy_pll_out_dsiclk already disabled
>>>>>>      WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
>>>>>>      ...
>>>>>>      dsi0_phy_pll_out_dsiclk already unprepared
>>>>>>      WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
>>>>>>      ...
>>>>>>      Tainted: [W]=WARN
>>>>>>
>>>>>> The problem has been already reported and discussed before [1], the original
>>>>>> commit was done for "preventing potential stability issues" reason, and this
>>>>>> time fixing a potential issue introduced the actual one unfortunately.
>>>>>>
>>>>>> [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
>>>>>>
>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>> ---
>>>>>>     drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Best wishes,
Vladimir

