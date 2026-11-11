Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402974;
	b=LpDH+BW31cRqBf7hG8Lgp3VlTKl9TlVuEGvuRx5wYwzAQOlBv/IsX7iGYaYJxlfil/6A
	 FPRVqqxVb1KarahtSAOR8KEtm4tKynpWqhpckiYCcmhfEcOwyBKEQr8SrhyLgDmw+gJ/w
	 +urP4pihGlbOA046DQCraIS0qsRX//y/1kIKmE0SBUMBqYr/uVlRZA8ESm2HoKHanjdBf
	 1fmOqa5sUraTIA46YA2WvEwsEJuTrtqonRaHfRhKxKv15rwkd6HhX+iqtnbhJ+qSQ4b30
	 dLHu8F1oF/klVw/y05yAEMVyhEqfzIl0GVLE3xHO8TH5jl5UNA1J4iaFSHQjMqClrqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402974;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=bK7cdOOnFx/2PymhbxFiGmyvokSNo/ky1iqCvz0rA2U=;
	b=WVWP2rqRlEZg6ubEsh+ZAMDyQr8OB2O4eyxGJnfn7yrcQlqu2e/sjCJBgpB+NST+G3Xg
	 9/mxKC9pIDO+l9YZ4jgGvmznFSDIrKDIAN4A4pA6tKVe9LcXJs9ibNhP8RBwssb7pQZMC
	 PS5WJFDbVUjJwamtklGcLtjxhar2yMftyjpfnUyrms9eFYkYtJ39SEEYNPNCxnqeyL7pe
	 7nl0WP5uKrg2Qpv8rlRjDjZeAjsHVDoR4YvYFsqCSpVw48azd0AO51unRQeHRxAJEtvPJ
	 x0OV6jpcqUNXAd3156sFitZIg6gkG9CRzoL0XYi+7tZQT+Oh4n9XfXNg3WthNkNyn4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzAgydeM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A24606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzAgydeM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD571F00A07;
	Wed, 11 Nov 2026 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402974;
	bh=bK7cdOOnFx/2PymhbxFiGmyvokSNo/ky1iqCvz0rA2U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ZzAgydeM30zoBTIHKks2bbNY2Wcui5iMsfXxDxYGUSnbYSUpl8q7Hr0eBP8oEk5Bx
	 +TUI/QVdw0R2w9WGtw6wbEgkXTHeZdRKfG7m56Forcmr6PSsTSIEx7q+zzhJr/T9M4
	 GHE7UWVzo4AAZIesebnrStgZx3kcBJjTP0gReXJJUphtxNxnVgwjhpcCpA5A83xCce
	 wTIrB4Ita96U5zECi45NudHCwgYthaRqW1izvadFs7fSeZKbdy0iAqvVQVotg/gbIa
	 n9b5vm5mLjAeUr3zOkF3nSN4Y7PeNR9qyuWtz+7LlU8zUiJcWfQ1URIVrXgLorcAaL
	 KI50fe4lB/TsA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id E26FD198003A;
	Wed, 11 Nov 2026 08:16:11 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 08:16:11 -0500
X-ME-Sender: <xms:mmr0agkOpOK-drbUAH4HWnTjn1MrEEFYRqBfLpLYLDiEKWDCsInMXg>
    <xme:mmr0aqrjUH5y7gvm-tr-1BuGwDfL4yEF6Gx9T3mIekLzrK838mOONp1CmoMWYUkoT
    -yuh2zYbJD0Wz90AYHhG4OQclI7-f39JjnPebfm9LZW3Y_2bllZnjM>
X-ME-Proxy-Cause: dmFkZTExZcKeII8UgSAR+8hWTVmAJdJQpdc+/g4k5JmHwUqceTWHYaCvgMIPdb7ADJ+sRt
    CIvsqRYbrIWyI7IwtAaEHNc7fr6iXmk0mWVsykAlZCenHVoDo2JOly2QAbBIqH1XsLjtkQ
    w0OowQon3ndOr6CqHuBFUVwOdXkO8rZvl7P2vVvMvfDVgSUL22CI9Z1xpC4xpl13v7hlUZ
    L6mFzh92EcDrtmup23Wjmed/Cz3wlp08q3wC2+i9HehwU0naDSS5bAiAn4CnH/otEyNxxk
    zfa23jofxg7lmJ64G+o2nzb2Iql7yj563NYbBfvub4HydI/cjnY1j855MIgIdxSw/VtCMN
    arQLWYS6yl3pW5/pmt/5zvEmu3ZEbE7x7az38lCRFSE1JIWZrYo6a/9vatQPzadrjdD7py
    KjS1cXJlExQDf2ZJcdmFCRXaD+dqHA1G/gbHpmN/AFm1O87AapTM7t3OPHW6a+YN325j56
    xSpCiGN/6+qO6RsnBE90HKsafiA8L35bpOjJv515Jf405ZFJUFOVYHtAbrmXI9YDTChCTp
    Qa8BcHN8LPkFAVkXYctpyKf+0Izznrsc8TwWMNdPrIZ/b0cZWRhFFlooyVAumUir7HCbhV
    nQt4PzYRk7s2jHva7TL2172CZ2UwiKuA+mFHOkNhcD7agxrQrxqSw5D1qb3g
X-ME-Proxy: <xmx:m2r0apXDBki9Xsmiur_YFC_iP5L9VEIHUCKi49-lwI7DduFkZufE7Q>
    <xmx:m2r0asIEqXRNc20j_INRVLT1EKBu34if3QNkHZW094ytOBepl7zUZg>
    <xmx:m2r0apAnM6zDze90Dd0htTT0QSi220GvsztLNCJSQqulk1EUk6HSsA>
    <xmx:m2r0asftn61O8jven-3lUahTEkW2C6iakXXWy0alzYtvmjG-Qg9TUw>
    <xmx:m2r0ao03reMPXFwzb86bMRtCZPUb8kCMYYQ5S5Uk_1gaHWg5bGRFIeKI>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id F23F1F80098; Wed, 11 Nov 2026 08:16:09 -0500 (EST)
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
X-ThreadId: Ant3Zsh03RDg
Date: Wed, 11 Nov 2026 14:15:49 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Message-Id: <71d569ee-a939-4c41-b32f-985d7db4040f@app.fastmail.com>
In-Reply-To: 
 <t6qm3ktezem4fjeqbo3r3z3ptzjvwlgjuz6kn2sl6z4aj4rkzp@v6mfpglfzixt>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-11-ardb+git@google.com>
 <t6qm3ktezem4fjeqbo3r3z3ptzjvwlgjuz6kn2sl6z4aj4rkzp@v6mfpglfzixt>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP bridge
 reference clock
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 11 Nov 2026, at 13:43, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 12:53:06PM +0100, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> The SN65DSI86 eDP bridge on the Yoga C630 is described as being clocked by
>> an always-on fixed 19.2 MHz reference clock. However, as on the SDM845
>> reference design (Cheza), its REFCLK appears to be fed by the LN_BB_CLK2
>> output of the PMIC, which also serves as the master clock of the WCD9340
>> audio codec.
>> 
>> As nothing tells Linux that the bridge depends on LN_BB_CLK2, the clock
>> only runs when the codec happens to have it enabled, and the WCD934x
>> driver only enables it on demand. If the bridge is brought up while
>> LN_BB_CLK2 is off or being toggled, e.g., when the display stack probes
>> before the codec, or while the codec is being initialized, all AUX
>> transfers fail and the DP PLL does not lock, leaving the panel dark:
>> 
>>   ti_sn65dsi86 10-002c: Can't read lane count (-110); assuming 4
>>   ti_sn65dsi86 10-002c: Can't read eDP rev (-110), assuming 1.1
>>   ti_sn65dsi86 10-002c: Can't read max rate (-110); assuming 5.4 GHz
>>   ti_sn65dsi86 10-002c: DP_PLL_LOCK polling failed (-110)
>> 
>> So describe the actual clock instead, so that the bridge driver keeps it
>> enabled for as long as the bridge is powered up.
>
> According to the schematics the actual clock is a divider clock coming
> from the GPIO16 of the PMIC.
>

Which is always powered, I suppose?

So I suppose that means just the arbitrary stall resulting from the
clock enable is sufficient to make this issue go away? Any clue what
else it might be waiting for?

