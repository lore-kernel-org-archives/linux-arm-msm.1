Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496350;
	b=OD0hadSPceV4M0stJTDpmeN/3uKAH5hkBsf/+5igxdkk71RsMw18i3qzZC2AahjFVqDg
	 JXc6+k/Hq67Lc99MvQ0i2xa8+wMyTbVwh8S6jkLn6oxEO89wiiICBlq0jGDqSTUHmr+11
	 UBusnTtVAiGaOynm63wt4h3ATYm6p0IfUJyH/EzZhCvdvimyQgb/CzMSC4d53WIhih3ai
	 Tsy1nhuSAv8PT3uox3qLiod+r+ITOs+wWzgWlIyXMN8NjrKL5TeSr+aAGfaB4pLhZKdX6
	 CS9RYxpDUfPtv7IA5w7tEquMTytN/W4GBgHx0Isu5FrOgNQKCchqwM3dn/sxJSuwzSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
	b=p6xJCm+sesdR3yXZ+wqqYeB6ty34uglNj0h7OC9Q47xPuRh3wkTaID3SSdRpLB3LhMMQ
	 82xsZjfZGcEFzBu4v8j1jC//OU+G0IdAv4ixbqKYX9cCNw1te/DcOmK0yVXclkg1RGeJw
	 vF5l2UfVWjjUhIGJNi9HxhsfPtP3sKf9CReo4IZRH+PadDXyYl3tlsREBfq1esqQsU/g3
	 KCn8nN2Fz/FHvtCCdSDRi3AWwNUETe4brUHovPrAD58pZV5NFijZBYaqbNUhdGKoeXKml
	 9tmcXoCq0UPJMLjlm/fPoKdCKlWPdbrqkrflLNbe4RODA7wQgcNIZytSEL/ayGuPbWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=FpXFv9jb;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D043606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D043606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=FpXFv9jb
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4086e892a4so414536266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792496349; x=1793101149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
        b=FpXFv9jb8ZFizFKmibEnGMxt1ygssK0ha5/IxCeaeVWR/9PJUI5neVAVL4ikaUrhPA
         IT+9Y14UHyeMEfNifm70pPX7HZubefMM9Zech/k1MVWOmdyFtg1vlxacV+eT5xn+WAqE
         SKXtIhCXd9lzv3T1zwQeRqoyNvzt+R/H1/eqQMXmwk4+OT9IUvKJ1RbMrYl1el+wDfFn
         Uex2LJn8XgKH4CxLvNY4xwJFpk/ecN1HyscXaE/sVTz1p3U6wYCRPmRiEIHyRbDwOEFn
         bFIDAwu2H1uuchZNYutvD0S80IkKVdGRCpXuqHpJg8KSfpU0QNaP632lfjqb5tvNBEeN
         yLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496349; x=1793101149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
        b=bMuPguzJzvKbGxeZ6WAGfSzOXvF+eHVN5kSm8TCZmrUCyyR6qqD64hB1AUEjKwxYXo
         1UD7nkKRKIRYl6WyVeECaVj4bY7Y5QMboHciiKqfdZbp/3r2stuHpOoGSqQ/tXg8VxHf
         SeTZwi05zXzl5yuJCoCMPfi8Kaz7xPKwzIUXBoBSVLooN2xVA7pThQ21eZfDz/u4QH2C
         3JLiWFM7CnObLo1rIvrB4qKZAohPQT8DZZe7iOQGBKsM5QxUmUVrTLx5G8WKoRnCzUK/
         770o9ia9Gf0/m2SAOtx82wqyQr+66IYf1slhstgB6qRgV3NjHgnAPD9bIn+/WwZZFpJ9
         4hTQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8fQZ8KObZfviupqUwtXHs4Z+YaNFMI3GQDfTl7MibtDrcKXfMLPVuO2QI0UYwFncTAnWCo+CZwHH98w1a@vger.kernel.org
X-Gm-Message-State: AFq9FYLVaRhWXKHCXOMI/PmSomrO1BVFCaLszMRp+EzjKj+AlhizI2Nu
	K24mkxgPCfB0OkDUskodt884rQrW+ETImJlfwrC+WMAOPvFWTHPDoUu0CQUojQh8TgiKhOunhGT
	EFsUxFq0=
X-Gm-Gg: AYBFou0J+qjkPfOxGBcj5sFI0KWDAc7M3ynolUOgX1CyptBNRLs4lDKW8uJT7NLihtt
	cGHa68pvXmAFejV7Hfa2bkygs/CNsxH0gx79JChAoLLZNnLPUvPBo+YtEGEkn/S4RwW8B5o5cb4
	zs2ZobHt3ng0bB4z07q+T36m44OKqohUJS+yHh6omUTH+rDgbt/XcaaRlvPNqtFh84hfF0dao5J
	DlENoR7FsaR5/WS3ObQOPZANblAjsd7W1YG+BIvfSgcKQkIuJT04DiMM6dgYp9Z1zdvIw2SvQkc
	J1FTcF2amonC24aYMAlAsgtF8ngsv0wUKx8MLvV3PgZw2ufosT4PL+Htr3JL3D2FnST40YvabMl
	sjIo+Jlywiwr7MyvOSRI8/Ypkbwx7q8SsQRvJN+2VigPC6pW77xw2kIn5a+sSWwgvoC7NdjlGif
	iVWfnQqxxTXTT2ujiwCxUbNopiEky5xSaJWE9Jxljt4wuoySgCmI2g0xFQibiuIcrIxGdjg9LxR
	+5i5NMpF2Dt0S/KMBUwSZhLHLLev2/QNTIeQy3rrx/RdaOCOXA/WG4CSVEyydKK0KK1UGjP6Q/N
	zDYMDtZlquT2DGmSwwQ9S972/iZNEkUxZYgyHCnkuqpazYTiYX3DEOHepVKIKRpH/NwYFc9Krtq
	vsR2BzoTuEzl/e8pevMwK6ZkSAg==
X-Received: by 2002:a17:907:c008:b0:c3f:c10c:217e with SMTP id a640c23a62f3a-c419ea3897fmr671238166b.23.1792496348368;
        Tue, 20 Oct 2026 04:39:08 -0700 (PDT)
Received: from [192.168.3.32] (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4465eb0c67sm202867166b.12.2026.10.20.04.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:39:07 -0700 (PDT)
Message-ID: <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Date: Tue, 20 Oct 2026 13:39:06 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Julius Bairaktaris <julius@bairaktaris.de>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Vladyslav Andreichykov <vladdrako007@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Language: en-US
From: Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20/10/2026 08:54, Julius Bairaktaris wrote:
> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
>
> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> which takes its AHB and SYS clocks from GCC, so the device tree does not
> pass them back to GCC. With only .fw_name these parents never resolve,
> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
>
> Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
> as gcc-ipq8074 already does.
>
> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---

Hi,

This issue does not exist upstream, as CMN PLL is not yet wired due to 
missing
networking, even then the solution is not to add global name matching.

The required clock inputs should just be passed to GCC directly which I have
just pushed to OpenWrt.

Regards,
Robert

>   drivers/clk/qcom/gcc-ipq6018.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 6943dc511534f..f58000407d015 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -360,7 +360,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
>   
>   static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
>   	{ .fw_name = "xo" },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   	{ .hw = &gpll0.clkr.hw },
>   	{ .hw = &gpll4.clkr.hw },
>   	{ .hw = &nss_crypto_pll.clkr.hw },
> @@ -539,7 +539,7 @@ gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy1_gcc_rx_clk" },
>   	{ .fw_name = "uniphy1_gcc_tx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map
> @@ -594,7 +594,7 @@ gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy1_gcc_tx_clk" },
>   	{ .fw_name = "uniphy1_gcc_rx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map
> @@ -733,7 +733,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy0_gcc_rx_clk" },
>   	{ .fw_name = "uniphy0_gcc_tx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
> @@ -769,7 +769,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy0_gcc_tx_clk" },
>   	{ .fw_name = "uniphy0_gcc_rx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
> @@ -1920,7 +1920,7 @@ static const struct clk_parent_data
>   	{ .fw_name = "xo" },
>   	{ .hw = &gpll0.clkr.hw },
>   	{ .hw = &gpll2.clkr.hw },
> -	{ .fw_name = "bias_pll_nss_noc_clk" },
> +	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk_map[] = {
