Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807260;
	b=A+A2ykHcvMUMuTVVhyaqUzvAfxQJh81tJgLgwTtStZ3H3PyjcjdFV52MlEBw11gOUc5s
	 ii+++my4ozUl/DB1k6fOPOKhy/5MkA91b1xow7cMIkZQeVxrT2Vuxd2ZieSXeOioGcFDY
	 nCIC+Z85aglV3a685xqvoHVyoYi7CRNxUGH064l1cZAlfwmlBuTcRjZczM4eGFuNLD3SO
	 eyo2SIYWCXyazIlF3a5bNx/OpvmmAJ2yDj/QuYL4DZ25SwsEj1uadS9pIuN6awWcb+VEI
	 rOWoDBXyi1SV7kIG+0e5locwYMPrUXQnof7dJgROksVxNjmYf+6PwXPsMMzM4H1pbpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=spMqGTfvnGebTBmWprGkb0+x7mXa+78W7iVJ0EOMLGA=;
	b=3gJbOtlv1PGunMx0+zP7fbaMx3U1rVqyKfBDPuHxOrn6VpoU1hFS/5l82+7eWRxYBjJo
	 O3PefexwY4O2+SrAjhwqZFEbKw29vkJIy4f1f4AqnqIUwoD53g6vgASeuE3rwCoLzSTTO
	 0kLwyQXzCWQPq7J8GMWW6fWngNkzd/bYZiU8vgrshiZKZ+i/9g+N/hKtxJTUPD44wCJIg
	 K/6qCE73RczBygS5GTIxe1US2lDfH+DEzyjeK2TCABB6fWeFQh4pc47+/5xBLtfqBnXzN
	 pbiwStcO8JooN2NnPouCGNsbVMqNhfi/SzhsGU366X3VBa0do+4f4O9A0UNiKMFOgZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=zpxwhrjq;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B50606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=zpxwhrjq
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso3073067fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795807258; x=1796412058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spMqGTfvnGebTBmWprGkb0+x7mXa+78W7iVJ0EOMLGA=;
        b=zpxwhrjqox6YfuCTWrzRVOWk/4CVM967EA+Cngu4+HkdwOwzD5v5CkTuX26trlmyRz
         cnUAca3Rt+Xic1vR7J4cW8ymBJKXorlJT2fB8tHIUHNIWykz+EvzjlLrta+B2wZjzxnd
         n0MOnfiLYicEwWeVjayTpdmUd5EwFTV7INcfzr1aBCm6Fs7wCL5Ef12OC6ZuN0dQge06
         XnYz1i0+1huzx96eJIdp6bsuYUReBtu323z/4W9JnVJ3PlZ1m35gXvqbbKIKs9P0emlJ
         //KkKxeamwWNRf2xLYSJKMkJ8JZCpPCPz82sNL88rq64bISmxAbq234Hh38fVoTf7pW1
         TsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807258; x=1796412058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spMqGTfvnGebTBmWprGkb0+x7mXa+78W7iVJ0EOMLGA=;
        b=fYoUXJ9nj9Oopmcu3qnzv4z1E4juI6O/djCjHtIkA8UsedKjkwP1deLz+iuW8lN570
         w+OPBbkTEcsM564/AEk448rKIeHjkqbKLxoDB/WCZDHiA192Th1crjs2Mxw123N8l55D
         kcNO8Z0Ee/4SaGQFeGqmixKlMurhc+NM63/kcFEWWc2xaVD2+CmBXovdfGoGR66J7s9W
         8qug82wi1BHCrayLGADXWZ6P4b4wVanorHbllR6Vh+gMcWW8tEclyOwlaQAd5P7FWlya
         JRSulwfexmg+2UmCulas45sqUsD3zlbGJCFd3nAHOai5EZbJ0DSAGMOc+1eeFaevDf19
         //+g==
X-Forwarded-Encrypted: i=1; AL+hErELpU10xAr/evn+dd/ORU+SOKs6QBG1I3LAHFfe1VAmT/ex3EPAicBoPVKNsylaEgcpjPPBwgWpLdhYRVVp@vger.kernel.org
X-Gm-Message-State: APuU4Z9e3iV9Tkah9QfensrjW1Ald97DYXjumVPmJJBpa7D0vHUFar1E
	M05sOrbMZlo0uSvhRJLOlbCkabKmfT6XB4EDZ8RFL0Kl1XcIirsqaDqgHI6w5Cm5NE0=
X-Gm-Gg: AZFdTZcdyFgOdDcyBATBr3jAyXsv8lNLCYz+XGUWHHjYLVu2ydDRjxxQ5VkB571j39/
	ip5ImiAUO/26/kebhABohwTcs2QOy6XPAoRbvK60WMIJ46n2as5U7HVcuhMrgZPscGkNtWDOZ93
	NVnUtMmQ81ir5ro75PL6NLQS2nWvM466tvcYF5MAd6TTKIbtIBdzN1tAIqURdplfmEu1Cnw6nb7
	WeftyiKh6az86WyGwtXf8P11b9kzNiDZ16Qoquz7VpzL9OjDAEJilHOhfIwWuQW5aDBtgcplQyR
	aOy2/zO68pgpw7/ej5sEQ9BfZev9rgFEq28iZRl2XY5mNNvth86kGU9Klw6/cVTzFjoPr8nrlh2
	nvVlDaZGtS8JCqINW3KAuPDguKLf1Tt5ZyD+Iq8lEdjs8z5+hwdel0qGQvYgfNogYZjam3/Pi4l
	CmGPCNqWGB18Wd2Oy8dNEUu9W/R5fPHX9ptMyQngO6aSOLpKzP4e5gwO6vip/OmekH3Jw0Zfnk7
	BYhuLxPYWWQUJ1fJKkPJ0dCgdosub3OLziWe0rKpEynAX82qrJSrOPZeEhoK/Dd5Qes7mM826B6
	/7b7nCyg9Em52Y8Md3U3dRguVRrG8bZK
X-Received: by 2002:a05:6870:6b8b:b0:4ba:35b1:7227 with SMTP id 586e51a60fabf-4bc7782a116mr20876208fac.0.1795807258018;
        Fri, 27 Nov 2026 11:20:58 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm24208446fac.3.2026.11.27.11.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 11:20:57 -0800 (PST)
Message-ID: <5f389412-a036-4792-bdd9-e86377ee7e44@riscstar.com>
Date: Fri, 27 Nov 2026 13:20:56 -0600
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
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
 abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
 marex@nabladev.com, changhuang.liang@starfivetech.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-3-elder@riscstar.com> <awgCFMH6xerE510f@lore-desk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <awgCFMH6xerE510f@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 3:55 AM, Lorenzo Bianconi wrote:
> On Nov 25, Alex Elder wrote:
>> Define a new platform driver that manages clocks and resets implemented
>> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon be)
>> used are defined to be controllable.  There are also 13 resets that can
>> be asserted or deasserted, but support for some of these is omitted as
>> well.
>>
>> Two registers manage the state of the clocks, and two others manage
>> the state of the resets.  All four registers are found in a region
>> mapped for MMIO.  The region is provided via a BAR on one of the PCI
>> functions embedded in the TC9564 SoC.
>>
>> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
>> state should never be changed (and a warning is issued if changing their
>> state is attempted).
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Fixed problems/garbage in the patch header
>>      - The Kconfig option now depends on RESET_CONTROLLER, and can now
>>        be enabled if COMPILE_TEST is enabled
>>      - The generic gate clock controller code is now used rather than
>>        implementing a custom one
>>      - The PLL and internal fixed clocks IDs are no longer available
>>        outside "clk-tc9564.c"
>>      - The PLL is initialialized, followed by all fixed rate clocks,
>>        followed by the gate clocks, to ensure each clock's parent is
>>        initialized before the clock is
>>      - Updating the reset registers (read/modify/write) is now protected
>>        by a spinlock
>>      - "Unnecessary newlines" have been removed

. . .

>> +struct tc9564_clock {
>> +	void __iomem *ioaddr;	/* Mapped clock/reset registers */
>> +	spinlock_t lock;	/* Protects reset register updates */
>> +	struct clk_hw_onecell_data *clk_data;
> 
> I think it would be more readable to have 3 different pointers here:
> - struct clk_hw_onecell_data *clk_pll_data;
> - struct clk_hw_onecell_data *clk_fixed_rate_data;
> - struct clk_hw_onecell_data *clk_gate_data;
> 
> (using the same logic you implemented for fixed_init, gate_init stucts).
> 
> Doing so, I guess the code that is allocating the clock data would be
> easier to manage.

I don't know that it's easier but it would avoid keeping
track of the difference between array indexes and identifiers.
I think I was trying to avoid registering three different
providers, but I think you're right, the result will be
simpler and more readable.

The PLL is a single clock, so it will be more like:

	struct clk_hw *pll_hw;

So I will implement your suggestion.

> 
>> +	struct reset_controller_dev rcdev;
>> +};
>> +
>> +/* Indexes into the fixed_init[] array */
>> +enum fixed_clock {
>> +	CLOCK_62_5M,
>> +	CLOCK_125M,
>> +	CLOCK_250M,
>> +	CLOCK_312_5M,
>> +};

. . .

>> +/* Caller must free the returned pointer if non-null */
>> +static const char *clock_name(struct device *dev, const char *name)
>> +{
>> +	return kasprintf(GFP_KERNEL, "%s-%s", dev_name(dev), name);
>> +}
> 
> nit: clock_name() is running just during probe, I would prefer to use
> dev_kasprintf() instead and get rid of the related kfree(). Moreover,
> clock_name() is just a wrapper around kasprintf(), do we really need it?

I think you mean devm_kasprintf(), but I still don't like keeping
that allocated memory around for every clock for the entire life
of the device.  It's just a waste.

What I'll do, to get rid of what seems like a weird kfree() call,
*and* avoid having the allocated memory hang on longer than needed
is have all the callers do something like this:

         const char *name __free(kfree) = clock_name(dev, "pll");

I do agree it's a simple wrapper but it's used in three places to
create a consistent name, so I prefer to keep it.

>> +/* Initialize the PLL (parent is the input oscillator); called from probe */
>> +static int pll_init(struct device *dev, struct tc9564_clock *clock)
>> +{
>> +	struct clk_hw *hw;
>> +	const char *name;
>> +
>> +	/* Initialize the PLL clock first (input oscillator is parent) */
>> +	name = clock_name(dev, "pll");
>> +	if (!name)
>> +		return -ENOMEM;
>> +
>> +	hw = devm_clk_hw_register_fixed_factor_index(dev, name, 0, 0, 50, 1);
>> +	kfree(name);
>> +	if (IS_ERR(hw))
>> +		return dev_err_probe(dev, PTR_ERR(hw),
>> +				     "failed to register pll\n");
>> +
>> +	clock->clk_data->hws[CLOCK_PLL] = hw;
>> +
>> +	return 0;
>> +}
Thanks for the review.

					-Alex
