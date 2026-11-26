Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697998;
	b=3W/F3gFKr5Rp2BdaTUKZqnJyTHbobMw1XsI4ZGJDSR3lyNvVgnfFJMoSziH79tohhgS7
	 oIM8lOhXqsBxZFVQCDR65GKBKJWbzHlntIKyOxB1o+0zU6JRu7WMyStbqffHTMmi/zhJT
	 z/V68Eg1Dg/PB75WSDFujqFoHdU1yVFiq8rKNcpCfbU9+SlVxwUT3fGI3d6AylcS1DIc7
	 jzqkOcsaPXMzBwzKXcHQyZLvHv0LRvKwMIoNk//kup+i9lwYopUgjbUhWy9dcUuaqZ0qR
	 ydt0LeyE1yIURjTonVWJzGL2NOupH+cP/J7ubVGS7/nMkRwD2w5d04uNulheHxG290Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
	b=xuSZlwbrC6Z0IkP/bJ9AGoyBSaEz/kY4RZf9VpuJuAbfCsxxlpYMCQ+BwVru0zGxvdz9
	 nBq3roMj7YZs31WSiPsSQoJb+uvtFBA7UXjcr1SykEeZYEdcdSgLJDK3E3NPbHQn1bxOc
	 Ohui91i7B9Viy3RPhUmYPFUNci/EZz5B6JxCpBXjqmjsVNgsDPvCdKI7UR2Yz7eRdZnqK
	 St36PvlEIZFRI/c4xQLw+yRFSzESWW4UOFLCOimDt7XbaeMdMHnm7qOWtfLf+c2nwZ+1j
	 wbTpw9+7SOR6vxFSmPFMc2xUFxedjrrClW0ra+4Ycwtub6NCCFV6wc2KD+zp92sV+Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=Ni5icM2E;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D0606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0D0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=Ni5icM2E
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8470d7d430fso3463445a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795697997; x=1796302797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
        b=Ni5icM2E74nNCK1kkhfleyOOlHVlks2ELVDV8SF+XLnFb2IkGSG86FphXdWme0o72F
         Ee5/PKGCxCll00Nx4gF6NK3jsUFm8/g2R6kV0CBuFOR9+qyfXgzICNnocGA1YS2vOBoe
         vWTxmTShzmkVYayLKrpWJ/z+XJW7tJ85GBfdGNgYWt+pd/IwgecaLttZfz8qHQtNN62s
         fmWP5SvnQIC65/yZKKAeKbBDKCINV1ANPBHCIAZheOe1ulVuoDIanWFoIxaie5fJpTTd
         PI7NMFULQDRzaOzLQawMaDir7XHQL0E1oFHvzTtUBcQ6WZzRcDNRP/GV3rtV5oHBPwBM
         CnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697997; x=1796302797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
        b=N7IwgBu5LpnoOStLHivE6bD2n84U4o9El4voOSfmzG3CQdTfebdX2MnyoADf4oMnJA
         ewC9K8zh8dKKEiIPjEYUadf1/Z2ke1lFlJ3XsVGzDOmf8vfQ8yaB0qqb9/K5Da9pt8Ir
         o1MzUxDi7+aXFvyEpaon6YwUmcXPdhKdoEte8EptkXvj5kEdRCQab8m0GlzyBCjI4R3H
         aK0JWCp6UtHuG7I9vRzH6QDlsswajleDuOOCaz071nqF0bY1EZfWCl5sYFZY/Ks0oJna
         OipNK37mBtDzjcKN8/h8Z57AvwDGemNnnolE/7TdYn4HhPK3tTNnvZpOBR44IST0gOhx
         KYuA==
X-Forwarded-Encrypted: i=1; AL+hErGLTqxAr9GtKzh7T7kFhlS9Dxiv5TGmgmW22y2KedPCCOxxHiVCZ8EElqAgjbKQjF/a1M1+W8/yYzS1L3Tt@vger.kernel.org
X-Gm-Message-State: APuU4Z8fgTe+QVeUx6LJaiK9vsQJAEFmSZy+X9BymXMhk7dwZeN6/tAS
	59T1Rzo7KVldrGuHfcpZqS1GzrqBVM0u76tF7mPPDGati9Xoajc5GqE6HUQ50PJTHr8=
X-Gm-Gg: AZFdTZdjT4NlGfZeLvOp+NH5+x0LH7GjTzpg6bdeSaCosQe8zyPRCle4cqqlT31MTLM
	yaoeMgKQd7qNG2XXjCNQti3zKjbdU1A/6j0YKvFPEfF8MTH5ND1ijz6gSUg9ySuhcFjrlTUmxZ+
	sWsPmH1etAJqy+dGqFvmD3YePiXpDDn+4QS4IjvyH7Hhoe0naWMtUEs1KkLfremcVzCYu5eWYs2
	pJCiMfOgaWvroMx7wzSPDEBVdL7LMVsOOKYCob6ntKpBE+eaoCCIvFiM0gRRlQWR+JNcrEdMJaF
	Xmffg/L7MAiEDHpG0nGZnioMQKrU5VorY07zY5Vi/bHlhQhCaJYiw92w935fEs/uFBe4zM2j24b
	9vzATE6Qf904Ar7+sm2dfNm0I212sNuPFnIiD8esvMKcuw4WNERtONxQQcFb3BrYyTVMeNr3itP
	6O+94+1jiFEvYWsZEEGIz7kPPS11z0UnTFW4GFIEYL2s/J8y7FR8ibXWtXCO5lKrmylzWv/HE86
	KQZRLY6q2rghNx2LcG+QU/Z2NtqO221DsY1kXv8CW6c2D46Uo6t2iaY10mI29YQHYY4ID4zO8H/
	qVPCrRKdBa0+lCeK91KWLGpdDZ4OUN5A
X-Received: by 2002:a05:6820:809:b0:71b:40c:9d86 with SMTP id 006d021491bc7-71b394b3c12mr14780581eaf.44.1795697996937;
        Thu, 26 Nov 2026 04:59:56 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380c6815sm13831517eaf.12.2026.11.26.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:59:56 -0800 (PST)
Message-ID: <e20fde6a-3389-4084-a2de-fee5426a74e6@riscstar.com>
Date: Thu, 26 Nov 2026 06:59:54 -0600
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
To: Philipp Zabel <p.zabel@pengutronix.de>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, abelvesa@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-3-elder@riscstar.com>
 <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 3:42 AM, Philipp Zabel wrote:
> On Mi, 2026-11-25 at 14:21 -0600, Alex Elder wrote:
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
>>
>>   MAINTAINERS              |   1 +
>>   drivers/clk/Kconfig      |   9 +
>>   drivers/clk/Makefile     |   1 +
>>   drivers/clk/clk-tc9564.c | 456 +++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 467 insertions(+)
>>   create mode 100644 drivers/clk/clk-tc9564.c
>>
> [...]
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 0000000000000..306781e2f7b4f
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
>> @@ -0,0 +1,456 @@
> [...]
>> +
>> +static int reset_update(struct reset_controller_dev *rcdev,
>> +			unsigned long id, bool assert)
>> +{
>> +	const struct reset_init *reset;
>> +	struct tc9564_clock *clock;
>> +	unsigned long flags;
>> +	void __iomem *reg;
>> +	u32 mask;
>> +	u32 val;
>> +
>> +	/* Warn on any attempt to change state of a critical reset */
>> +	if (WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE))
>> +		return 0;
> 
> Can't this be checked at reset_control_get() time (in fwnode_xlate) so
> that critical reset controls aren't given out to consumers in the first
> place?

So I'd pass in a slightly modified fwnode_reset_simple_xlate()
as the fwnode_xlate pointer?  I hadn't thought about that, but
it's a good suggestion.

>> +	clock = dev_get_drvdata(rcdev->dev);
>> +	reset = &reset_init[id];
>> +	reg = clock->ioaddr + reset->offset;
>> +	mask = BIT(reset->bit);
>> +
>> +	spin_lock_irqsave(&clock->lock, flags);
> 
> Consider using guard(spinlock).

OK I'll do that.  This will be the first time I've used this...

Thanks.

					-Alex

> regards
> Philipp

