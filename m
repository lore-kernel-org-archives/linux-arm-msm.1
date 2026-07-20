Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3445E41A905
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552985; cv=none; b=KZ1Q+k3+boWLQqzxn+Q1ArbdeXhZQcjMP9CJkX/VutRFlqOTRJMpOscWCruqW86FYiAt1u3kq5WnSgacTt6438O1dg2UITlb0CEndL3BVcy2X5TaDCmZUsihRdEm8YjEkjsLZh1xH+vOz+t+aZ5ddzBViyfmdWJ6voD1botv1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552985; c=relaxed/simple;
	bh=y8U7PcjMhj0Xr6VHKfIEtPrEwt1bvhUDfHBrlhxvgwY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HBMT0OulhXlVB6kx6BlIXQ/z+l3WuDGqM3H7/OcP6P0TqHSodi70b41t0daP0LN91/Tkcs6XYHpCy+RFSSatMWk0Ng9D0o3VrWF5l0w8QGxoKK6J5PxsJTHR1YtjlR9oUKLsogfOGQu9/X/oUNuVu4lBZFDfW2lxFPF1wW0ZzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpoBILxA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpoBILxA"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aec090da14so1036903e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784552982; x=1785157782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VKfNjiRL8GQvLjdsOfTfwXC+qCtnnsPDYaibsMDCkR8=;
        b=dpoBILxAwzv8NMAPr/7ohM5BfFS1BIhzJsP111m78njleixbzzn5mddILaWWq0wMCN
         jlnaPFEXr8U9Wq2Cxd/YTfRn1PxE4yLfb1GKy4LwN3KG+ExtfOm25Uw0+J10zW9iGaqj
         wVi+WV+b++BFYL38ycP6kPensea4Y5w2qXbnWpEjNwg8i8U0eae0FLm7YvVPOJ2mQuS4
         yGG1v/cESrDAY6sUyb5b96eHgVrANcDE9jrGPAMIX8qwzHVGMUx313Fo9YmEKuu6J3rw
         VFjfZu4H97MqmXTLpklPPEQSkxxA18hu2L4XfKSLP2tUdgFBifoSih0VboLyercZG+OJ
         oPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552982; x=1785157782;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKfNjiRL8GQvLjdsOfTfwXC+qCtnnsPDYaibsMDCkR8=;
        b=C55kfTBahXkcsyYDyfuPirywgPq3rCU0msDEJx7q7bD/6s/qie9QNAVGHEvcmQv4Nx
         npoYS5agPL9m1Nfyl48cgHLeafD43a7gW7iuDWQWwJAC2rjFS7am5JLdznMZE7dkiyFQ
         BfWkuBPvafwym3trj10jT6jq/MvkoJ9LJYYGvPc/3nbCU3itsdsvh6WCjLQspXXs/3BJ
         RuaUQK5E+zHnSs0OGLOH5xn1G8dXyHiXt0GEboe95gif7/3cB5pixi/DZKuS5t+U5INb
         19acZgA5l08RVqZ0oYZAzAtIJe4R+dbsJKd50xZKrcYAROOVPOsR9Hp/A+ngV15eFI7Z
         uYTA==
X-Gm-Message-State: AOJu0YzcgpnPeMJ0F9EJ7utIK5HoJv2s/3sujNtbOXeEPy7gLhxAycqH
	Q3XBa9NvT6V+kr4pmU79Iv3IRmpwZVaVLbgOD7Ffb04E0SEBOBXhaIC2+yf9yIRWedE=
X-Gm-Gg: AfdE7ckom2dT+TwHyOYa8UQRaYQ9nQlC0SCF6Z2GMEbZ5GQedYMfcZnfcaKI/8CFM8V
	HL25G9b13stRHvNvRcsvf4+W2ONjLQ35gM98+FnsJqSCGxRz96usW8qGpLPvDNExV7TMK+/pJxs
	QQBjS6QPDnLFVvqieLcjqb7+SXvVFZNN+HIqPKJwDy2I05DW4CuZ6gAFjDkXotrOUKGEc6eWKxF
	spK6aAZLAspN9dOF0Zze45z83hiHyW44pCamik+/YRMJg3chsKvte5OEckRg1KYuyy1KjN2bRoG
	Gp//TT80LV9JJ1uZhTGoUhkHIh4HBFuiCHMLguQ/hsUC8okhjJ3377q6dll0fEdrwagAQjGNJUU
	XXZGOWLxjKmI9HeCUaea1YM4rLD6BWWFVGVmuRiY+Krs/k1+dpy0etf+0zNT0XfrKfUSMShL+tW
	GfEp35Ij2HdF3H38ulvxsLLNaMJKF+/R/fh3/My3cm1LZ5KINsWlers7ASh2AONMFhY3k=
X-Received: by 2002:a05:6512:39c7:b0:5ae:bad9:8a3c with SMTP id 2adb3069b0e04-5b2a24e5286mr124578e87.5.1784552982084;
        Mon, 20 Jul 2026 06:09:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d98301sm2291776e87.25.2026.07.20.06.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 06:09:41 -0700 (PDT)
Message-ID: <3ac214ad-cdfb-4f46-9f27-5d581997f61a@linaro.org>
Date: Mon, 20 Jul 2026 16:09:22 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Val Packett <val@packett.cool>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 03:11, Vladimir Zapolskiy wrote:
> This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
> 
> The commit causes quite severe problems in runtime due to the introduced
> cyclic clock dependency:
> 
> * dsi@ae9400 platform device and its probe depends on dispcc clocks,
> * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
> * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
>    the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
> 
> On RB5 board with no connected display panel on boot I get this error report:
> 
>    DSI PLL(0) lock failed, status=0x00000000
>    PLL(0) lock failed
>    dsi0_phy_pll_out_dsiclk already disabled
>    WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
>    ...
>    dsi0_phy_pll_out_dsiclk already unprepared
>    WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
>    ...
>    Tainted: [W]=WARN
> 
> The problem has been already reported and discussed before [1], the original
> commit was done for "preventing potential stability issues" reason, and this
> time fixing a potential issue introduced the actual one unfortunately.
> 
> [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

I kindly ask to review/comment this pretty trivial fix.

> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index e59cdadd5647..cdfdb2cfb02b 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -578,7 +578,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>   		.name = "disp_cc_mdss_pclk0_clk_src",
>   		.parent_data = disp_cc_parent_data_6,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_pixel_ops,
>   	},
>   };
> @@ -592,7 +592,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>   		.name = "disp_cc_mdss_pclk1_clk_src",
>   		.parent_data = disp_cc_parent_data_6,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_pixel_ops,
>   	},
>   };

-- 
Best wishes,
Vladimir
