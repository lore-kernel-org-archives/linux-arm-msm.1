Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779642;
	b=K9D6gix9Ix5w7B+WUli5amBnl/HcyuAVwL0IqjlmKaUvAqwHjxF3wNM9UFdJt3qowTvI
	 z6p5tkUbxqCuKnd7vqkqRWloKlXeipTFmsN1SM+9ZNILzXVEmCXVugDGHCqd04XffKKW2
	 p3LGLGF0HIizNw5NmKkHZilww1baxregFANF7VNmCCy0y7WmRKB7qbhrTiSwXlc0ujOWD
	 MxBohI3MOf9jnqwRAN2D+rPgHwk1z+zlZVzclbHSJW7a510vMLKdQI1QnWOxH9o7zwFCT
	 1uMNEargp4sW0HpKSwekYipljdJjXl3nmxVRw77Xux1Xhn1FSwJn6pC5Al6wDWOqmQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=o8EZjWxTXRcbyoEOqIHRMz+zl1HnNBukS9h+Zm+DoZE=;
	b=emd55Brr3AwhxnTynxSWSbtxevSKym3+JQ9pakd6d9NTPbEoMDY9yyHnNHf35ynsdA1K
	 fgb9LWIL7CSeUMgZxCUTy9Bqgw7UiSlwkK2duw429HVRiYLN/3AdPchQXkIi9xQ9PQxcZ
	 qLRe8KrRgAfyz4OfRr5uCtxZ5KrCKN3GBZPWxFDxI+TtiPokwrGmxnP/6jMhDhqq5jATk
	 NYMcr17JWK/mu9gOFnb2h1HeUVLp0bfqg6PtCI9aJLKzQ4clVUgLaJiGSaukn7IrrAelx
	 WgSlYNt6PNn73qc9sDo2OpwKHbuR/HBjP9ZKNmriWqICZ4pbW73V+Muggu/zSJTV9ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ygnNNrYj;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB156606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB156606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ygnNNrYj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so56348635e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795779640; x=1796384440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8EZjWxTXRcbyoEOqIHRMz+zl1HnNBukS9h+Zm+DoZE=;
        b=ygnNNrYjECMONs5ImETaNDap3ahwaqQ/ApDKpPoyDE73kISxX4kXZO/n987uZ9zpZD
         DlFG9P4DHKAW+1R3FTUBokWg5G2vHzaZ0aF7JTKvmbA4JDVSZflB0lFoQahZeB/VHK7/
         +Tm0D6RPNLEHhJXoodnHX0QTaiqKt3D1utEJGtu45UEAvZ3MNrv2j/s1gVMnML8eYMx4
         T67LcvyrPoKjlVuTt79XlyPcZfyfPsGALwL9SKb70cAxv3ObWo0zdU4UQUmk00u7+ZV5
         nMRp5EjIfxUAzCTzB/heUzRZOidhnY/+xL0Kgg4KRLSkhQvMkF5TCyOFuEVVaq1KJQXD
         LXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779640; x=1796384440;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8EZjWxTXRcbyoEOqIHRMz+zl1HnNBukS9h+Zm+DoZE=;
        b=lHIHRRL26NWHdrigSx2c43reePQsSRIKqtTlGr8RUbPKKXriACtGKFEDKANUrbbVOL
         0vBo1RPfYKaYxho5OckvGYcKTXnLwZ1742Kqc0w5yYPvWGv6u13/91RN7NRkI8dVJS/c
         b0f0xDlEmBXDt4VSGj4vmrXvE08LBkesTyxWCdndjuLQUlexNFkeUkxVXqj3k4IDnjxg
         l+gxq9+jPPoafdzag0N3rgUDijplx4BHpci90cQEPdguFzQ9ry9Jf0SaGDyoaFA6y7Pv
         yL6czHqORk5Ctsbq8iFKWKy9i4X+WF7nOgZAaw1rJ8aIGoGWKtz/x8vGp4H1gfdnpJ0k
         V4pA==
X-Forwarded-Encrypted: i=1; AL+hErGG5oxJwNKhOC3SZb+ldceuVnDyi10FA14Z1g1MDAjnnXNn8q6cQqB16gtQzGyEJlWVeNvCAC11SznuvVSZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+npHja67QQcdt2TAYHUjA9LsEhRnPsD9/rkFrbFc4DqyULAvdQ
	XpjMX0+CWU8aT770XiKg+16/nMwPUvitcnMDhkSQyrCxo5bihgBe6Z0AexB6TEckezk=
X-Gm-Gg: AZFdTZeNfOAm0ofZ9Cm1TlHcigJq3/T9C9Pk6VJgfb6all8JkV82zMAkosCUhcsYAOh
	7k7OX8dX7yLPRcs3KnauLz/lvhlEKfmP8lJB3Ze9wLO4JR6QD/VF53O8jQ+hVOY5MRP0dE8GDwy
	/nTsA5dkzwUZXN+cTxrysGE/XZcAMfS8TyIPRK4kPZlhdHBqSiuqC4W8V+MQeNSU+iMNSQ/Rlw9
	dCmUty4XFYzyvfKNK4dfOiFCQGLtOEQIPBXKSGtSNJHH7S1Yq2hJIejJNhkziIyZprCtWV8alWb
	tQruDN/8J//YUGJfDoXIQ4TqLH6pVt+RS3SnhAWxvdLewSIUi/qWRyV145E1xg6444xU4S8aeZV
	7Ol7FygRYCSSiDbQPT9TrR6mzu2uhB3iNOeOkDjdvoffawrrNyoSI3d8z5F62hcKSsTmnVDb6+B
	fMqKVQNaRtRJBpbUTU19Q31Mikq1Iq8Fp95bG4+nKnCeW3SScMbLB4OY1Mx4M8VafJUKfebMWVn
	uKR76tGoawaXGVwX9FrQ5fZqZ2Aa1pHfdIFriuVU52SDlcXLhIEB8imva3qMWsrSZiLmRcD+kj6
	18xUx63QxiCiX5yPxfdQ44WyVQrA02ueeOO3ycTB
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr527719505e9.22.1795779640144;
        Fri, 27 Nov 2026 03:40:40 -0800 (PST)
Received: from [192.168.0.167] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm330037855e9.3.2026.11.27.03.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:40:39 -0800 (PST)
Message-ID: <19724121-c02f-4ad5-a6da-eb01b6c63006@linaro.org>
Date: Fri, 27 Nov 2026 11:40:38 +0000
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
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sc8280xp: Add sentinels to post
 divider tables
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-2-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261125213433.1438537-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2026 21:34, Vladimir Zapolskiy wrote:
> The PLL post divider tables are passed to divider_determine_rate() from
> .determine_rate of clk_alpha_pll_postdiv_lucid_ops, and the generic
> clock divider helpers iterate over a table until they find an entry with
> a zero divider, however the tables are not terminated by an empty entry.
> 
> This may lead to the out-of-bounds access by setting a rate of a clock,
> which is supplied by a PLL post divider, for instance a rate change of
> IFE, BPS or IPE clocks propagates to camcc_pll{0,3,4,5,6}_out_even
> clocks, since the RCGs and post dividers have CLK_SET_RATE_PARENT flag.
> 
> Adding the missing sentinels to all post divider tables fixes the issue.
> 
> Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
