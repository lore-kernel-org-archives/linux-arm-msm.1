Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C46474258
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199221; cv=none; b=K6auBQtUQnjDRExg8c7VXmCSm2CCwmZxrq79cDUs6cnSzNQL//xetpb+4v9CvQeTrbvimP+n72si18RK1SWuRryq3w6BUKpLMpZ0yz1r9ByO7KU3g+5Aio6il5PGxRPKykczjDtOGf/M/lOzbRlPOTyReA/rbZ9FyjE/BP3qYaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199221; c=relaxed/simple;
	bh=AIosAjl/qfQ0+4SRj6KraAsMA9o8Ij1Mh3Om3uxMQ5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhdSsvG4dLZRqqP4OE6cbRLJ0v2K4eYu/WWbGGLyThJ8/2UY9quPx2eNhAABhdR9amhBRu4yY+AO6T7Q52iFL5LLW9mYUky7wHWvG1ZmwYT52SHyiC0vGF6XPG/jrfK9eNCiUE+84tkmyvn7oi0nrTmrE93YqBzTV0hy13gUeh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jd3c43c7; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jd3c43c7"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-530fa0716f6so15900701cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 14:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790199218; x=1790804018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJzkV1wEUwUk4mOjqXcbC0Tz78XuSDZNKDr6Z/EZbvA=;
        b=jd3c43c7nauj+yMvirxC4UfGyRphA/GxL/+2BJnU9jziqab/ma0IjDy9juAzUTwhnM
         ga5RRcAOzSI8z05NWeZgmUyHrhukQNW2ztBRDGTNni1MpDSI1ko51SXAsXpzxsmGyg5l
         qaPL9/OxYvoxZYTiC8w/8d1qANNb6Y51PuTWFSeQNLErFwVg6MUQETBt8fw3r+EIscYM
         d5OJ5eB3Z0bhbaHP14KevkHQ7SBAiYLoeknr4BQKoBKYLA/V3vua3fFCRQNw+aLpckLq
         iJiPsW77MEzSsHPiOza9/C3bNRYXZFR+l5hZVHQOs3WMmVuLUe1pShMwyjWfiUf2qwCR
         mFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790199218; x=1790804018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJzkV1wEUwUk4mOjqXcbC0Tz78XuSDZNKDr6Z/EZbvA=;
        b=vowPrNb25pFHNcQ1MfvzoXigQZQ8hT4IDYeC+20jhPjsnbSA9KaeJukc00eDGduhmU
         WZ8eWiQHLGedYmYvIF38nNvdmWCyWdpOAwSRmwp77f7Q5U2FttZFAlfGQwMjRlAp2fQ7
         MExulQALafauIMzPOownUHpvZxF5EyN0uXot9u1t4a/cPS3bLeqrZiBYFa9w165C5JG0
         3Fvfcgec6VXtojJ4ZRG2fqZ4UZeneC2IlGpfyyXYdloQNOLqWSArTFJNozcsC2mgU3DD
         isbUQb0YelooHVkU7ZgLtFIJws6cR7WpwXJuZsHUlRTltx8+EOOca61wdQLaIVSolo5y
         oWdw==
X-Forwarded-Encrypted: i=1; AKwUvBx2oWsZyRzwpSa06+gqv+w76HojXj65rIp2baiVkRg99LS0MmSnsFnfcIeIITOYpMhCQ3XTGjfy+MZrfm7a@vger.kernel.org
X-Gm-Message-State: AFuF++nfOjgUEDtE0ig6+EVfAVAm8JxdOmyIipBRD/szmf/extmC2cYN
	XomgrL3GmYzvN2P9htWjznoYIb1+emuTxrBkX8GFHTstN1HNp+vnBaGErCNo15dKXGY=
X-Gm-Gg: AYBFou1UIa22Y48W2LefeVm4A6Q+8zZsNgXY2Cti9dfy0KQHFpbIN/sfC72pMInfSL+
	+nA6E1fmlAewjFqAM6dnCrm4EWghq9U+4cDb/m2sEWPCDvpnYySodpoSpIWBa83NzCMuBEnGAka
	yZjNpIWbLrN2Esqbawzb1VGFw4Yllm61ph9ZulzWlJReEoffmeV8PXzkEM+aJpTJZA7ZAV3v1XZ
	b4G5sXZnjEHwKO7we0zvvKwkcnY1hypbha3Fp2Nbc4mZhRA6mmqpmJF41PpbsKwMAR6MYjHatvC
	nt0Apewr8/CC3/fiahrT8LEb+jhyVsGwfj9Jt3rTUy1QOfBTWZCj7E7r6+Ukzxmpjrz0cEAfFpj
	pyLX15ia63wG8tNgJ7ZsGDC1YrTTMrsdETovzFvkMrML43Gw8WHyGl38NYaB3jG80iQ/9/DlccZ
	KGt40W1kww+04vmiLnoPSlHihcHb86wHq5TTyFue7+2HZCeFgjJXg+wumbMlOhv7l/3IOI5f4=
X-Received: by 2002:a05:622a:1806:b0:531:d7d:64ea with SMTP id d75a77b69052e-532fb63b162mr8219331cf.26.1790199218185;
        Wed, 23 Sep 2026 14:33:38 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532fb287d92sm3634361cf.20.2026.09.23.14.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 14:33:37 -0700 (PDT)
Message-ID: <7147ce22-fc6d-4cff-9470-98e341da0a87@riscstar.com>
Date: Wed, 23 Sep 2026 16:33:35 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
To: Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <bmasney@redhat.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com> <arG238GS8bMB6DkW@redhat.com>
 <0785235b-de06-44d4-9068-ec706eeba848@riscstar.com>
 <1jcxu3adn6.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1jcxu3adn6.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 3:58 PM, Jerome Brunet wrote:
>>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>>> index f9592fd9ec2bb..50efa10d48450 100644
>>>> --- a/drivers/clk/Kconfig
>>>> +++ b/drivers/clk/Kconfig
>>>> @@ -292,6 +292,17 @@ config COMMON_CLK_S2MPS11
>>>>    	  clock. These multi-function devices have two (S2MPS14) or three
>>>>    	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
>>>>    
>>>> +config COMMON_CLK_TC9564
>>>> +	tristate "Toshiba TC9564 clock support"
>>>> +	depends on TC9564_PCI
>>> select RESET_CONTROLLER
>> Thank you.  The reset and clock drivers were previously separate
>> and the reset only became available if RESET_CONTROLLER was enabled.
>> Combining them means I need this.  I will add it.
> Why did you combine them ?
> 
> it would be a lot better if the reset were handled in
> drivers/reset rather than in clock. There has already been some work to
> move reset from clock back to reset. This often involve auxiliary drivers.
To be honest, I got a suggestion from someone to combine them, but
I said "no, I got feedback last year that separating them was
better."  But then a second person told me that these are often
combined, so I took that as "two against one" and decided to
merge them.

The other reason is that four registers are used:
   #define CLK_CTRL0_OFFSET	0x1004
   #define RST_CTRL0_OFFSET	0x1008
   #define CLK_CTRL1_OFFSET	0x100c
   define RST_CTRL1_OFFSET	0x1010

They alternate between clock and reset.  The previous separated
drivers specified the two offsets for each driver in the reg
property.  But somehow these interleaved registers seemed a
little off, so I thought the combined driver cleaned that up
a little.

I don't have any strong preference one way or another.  If you
think they're better separate, I don't mind separating them
again.  The two drivers are extremely simple.

					-Alex
