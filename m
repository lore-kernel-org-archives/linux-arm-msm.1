Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404783;
	b=gwsAa6MztTztJSpU/OPEedIr1Kh9aFla8O2HD0T9Re5CufFP/JxLA3vEDE32Pb05rR3B
	 fQU2nFI2Iyl0YEeOVddA/J/ROJVDCoub9orRfGcBma6qxCsel3aqyVNWubc0Al5hjWbwP
	 Uvz8ObNpNrTykbUVK4A//r+tJt0sZHb9SJvOEjtN3u0CQbe+b4IQUB/+6di5/u9Vz7m1q
	 ifQQST5qqAVFhs8zAy+Z7aKogch5RePMMEMeC21dsaoIpnO1G3Z490MmIfuNiGKDpGkYh
	 5rS3rn9F5W9jOrbYRIfGASnxFTAgRfGm8FFUtIo6MrzMZeAArpQp1Oh8crwKZDndQyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404783;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=GndbZrwUbfBqaKKVhV2AQQy9aDOWXMWk0oUaJ06WoJI=;
	b=TW3JDigxzOycgTmp16fPd8PrO29zXspYKNA4hjOCXKzhmzY9sOsrBNHy/mFr0xXGfOAk
	 rCFHQ4/RhKpLWd6WwmUfxgoHJm5/bmSImNhBw7QUhWRHqCnXeVzEj69pElzTpQUlPFY2J
	 gDW6+QHqjozlJBmuWBvSROYVOT9dZtsF7Bk+CPOsCa8kU2lorPGcuWp0Qr4eonCv0qaMR
	 hVoEbjJrYTSqzd+1Zbo0l0eZ0LANgaqxjVAcZuYPF9ElqrhixHpYcN2iKDj6Zp3PjLbUK
	 6bCHYqJSt+LKpCW+Sd1MJmyCAgtbz+v/RhFmIuauY63mAp8UcKCLLaKrjhFoEwb5jrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQXRs9sh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9587E606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQXRs9sh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E24D1F00A07;
	Wed, 11 Nov 2026 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404783;
	bh=GndbZrwUbfBqaKKVhV2AQQy9aDOWXMWk0oUaJ06WoJI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=jQXRs9shxUR7ARMscLRzhEIL2Dtiazu1tqGnW76tG76EOQIcS0Y7Ia/5wL3ShtC03
	 s6Id7orwVG5sj3M4c8+hHioBPGnpM65Fj7++VEMl4yjFZ/1u3eJE5E6yYUM0Hj0STa
	 qLV8/4xvq78KhMqeFVXgTSKmAMx2gWP8/BZOGkk+zvF+jpSivvFW3jK65CCNQEVo5p
	 6p2RbYgglU1VGdZXoNs2RucP9vfetVkGSX53FJmOLISsf13VOlKCpQmFYWyEDhQzbs
	 5kMySj+3Vh/RbkP9jadK1zpc0CbhhrSBKA/89600x4a+BxR31DqVEjroP3Aspo8glp
	 TgG9rQ7T3bRRw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id D19DA198003A;
	Wed, 11 Nov 2026 08:46:20 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 08:46:20 -0500
X-ME-Sender: <xms:q3H0ahjpwr9W3uh0p7vIGgsEefncwLr1j4xNjQcqEe-OOFv-tADO6Q>
    <xme:q3H0ag2jF1EcLIS5H2vpPZsJRcbELUhJsBZhcV6SILlbtwwnz3NlQpsAxxo1TMRB_
    BO59-Mn1bItgrNzamhmH9q1ouZfKyZtKWp9FewZmXFS76sAw13URvY>
X-ME-Proxy-Cause: dmFkZTGXUnhNKAxQHRMfdjsVivKYFsnQSiOm5Ei1hWmU9E+QjqN6HqgWQ6pU/i4yfMANbF
    2hWvuoja3vCdMHzUGEwHaY0cB2IXw+XfJlUU2apbFHoN5QJWN0SlEPIvlwGN74Pk5cUcDu
    g9xC99eWhq6AbfaxwOb9D+aL7ahRU3XZXLDDeHcBb4nVoB411umga+fU/yQyQAjRttL54K
    RxXcozSHV6tAKuKMERvB5cW/uzPLQj60J+HumErHAt/fPdB7XvwJoOsOb81WcHSqlxdK3f
    E2DWGBNQ4p4kq6AmzB7X6O8ieBYDmiem327cbmt2P2kk1DZI1UCLIddmoyXMh+EEuLjmpb
    RimM+ccQmmupukQjuiCTQSRKAbdRYmh6qP9pZhkErlZhNnm430O3WJZOSDdF+qEHP60FVN
    3rZ4u+GS6ydvFOzbp3FI3lF9v38g/z1w18NG5PmU9+5hFm6Sj0nLvE6azl3cXqZZ9KPMQ1
    +TwjsWe4LBdidE/pA1BgPO8PM3+NNJHMJiAay2ICauUht/DCCS7nv5cy2t8oi2fLMb+yYm
    SMSeV4Lv8ZKqneUHvfMoYDKnB/4DDivKrnM3Kr9JQWUblPnh4NGyfy0qp2BdzFoyFghDFH
    g7u5ys3NGLgNhw3z0dEH0j+15QvGPGo3t2tU2N7664glGOtUsJJ7GwhcY0Pw
X-ME-Proxy: <xmx:rHH0asQuFs41qzfMBZ_FNtiDTeXxQrSe5e_3onmYTyi46NK8V33IXg>
    <xmx:rHH0asXh2fT9Y-xZazi5d0eL3RayXyYBfMCKROb719SGa844cddw2w>
    <xmx:rHH0atfzVYDJCFP__ISm2ZP-0JShdiuyyZYVSGEMn-INPMuMQSgMlQ>
    <xmx:rHH0agKybCf0aOx0qKjB19Z6Hf0TSbvVGbeW_Sneo9HHZxx1HBAw4g>
    <xmx:rHH0aqzGjcii_GqOT4VpJkNR8qz9RpXPf6ij_slu9s_g8s9m0Zem8G2D>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E1090F8008E; Wed, 11 Nov 2026 08:46:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 14:45:58 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Message-Id: <27227279-dcec-4e46-916c-5d65ad8ca086@app.fastmail.com>
In-Reply-To: <71d569ee-a939-4c41-b32f-985d7db4040f@app.fastmail.com>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-11-ardb+git@google.com>
 <t6qm3ktezem4fjeqbo3r3z3ptzjvwlgjuz6kn2sl6z4aj4rkzp@v6mfpglfzixt>
 <71d569ee-a939-4c41-b32f-985d7db4040f@app.fastmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP bridge
 reference clock
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 11 Nov 2026, at 14:15, Ard Biesheuvel wrote:
> On Wed, 11 Nov 2026, at 13:43, Dmitry Baryshkov wrote:
>> On Wed, Nov 11, 2026 at 12:53:06PM +0100, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>> 
>>> The SN65DSI86 eDP bridge on the Yoga C630 is described as being clocked by
>>> an always-on fixed 19.2 MHz reference clock. However, as on the SDM845
>>> reference design (Cheza), its REFCLK appears to be fed by the LN_BB_CLK2
>>> output of the PMIC, which also serves as the master clock of the WCD9340
>>> audio codec.
>>> 
>>> As nothing tells Linux that the bridge depends on LN_BB_CLK2, the clock
>>> only runs when the codec happens to have it enabled, and the WCD934x
>>> driver only enables it on demand. If the bridge is brought up while
>>> LN_BB_CLK2 is off or being toggled, e.g., when the display stack probes
>>> before the codec, or while the codec is being initialized, all AUX
>>> transfers fail and the DP PLL does not lock, leaving the panel dark:
>>> 
>>>   ti_sn65dsi86 10-002c: Can't read lane count (-110); assuming 4
>>>   ti_sn65dsi86 10-002c: Can't read eDP rev (-110), assuming 1.1
>>>   ti_sn65dsi86 10-002c: Can't read max rate (-110); assuming 5.4 GHz
>>>   ti_sn65dsi86 10-002c: DP_PLL_LOCK polling failed (-110)
>>> 
>>> So describe the actual clock instead, so that the bridge driver keeps it
>>> enabled for as long as the bridge is powered up.
>>
>> According to the schematics the actual clock is a divider clock coming
>> from the GPIO16 of the PMIC.
>>
>
> Which is always powered, I suppose?
>
> So I suppose that means just the arbitrary stall resulting from the
> clock enable is sufficient to make this issue go away? Any clue what
> else it might be waiting for?

I've just double checked with the old DT: the system comes up with the
panel dark, but as soon as I do

echo 1 | sudo tee /sys/kernel/debug/clk/ln_bb_clk2/clk_prepare_enable

[on a writable clocks kernel], the panel lights up fine after I blank
and unblank it.

Could it be an error in the schematic?

