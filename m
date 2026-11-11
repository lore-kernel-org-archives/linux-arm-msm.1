Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399780;
	b=UvBBD3CZ6hi3EmthtFfzUBKVspsaJ5glOoikYxsgY54yqkSrgr5fQpAb1cbFmRxyXFaR
	 rFHFKJEjPFI85oHTTvtZl+1rDeuhuNiIlFbXFd3pj6+gF02xZsMQBZonsom6AW25vm183
	 aB4UEWKgeaRPulYvFJrxjf3QFM9YwW2/RmMLfo6lrd7H5DXlVVkphQme5wxa7L0dOhs2s
	 Qj1XCgG8sYjK4oAY+ajJJIiNh35CNfzYePMiv0ixLsdGsluHvMZLi5qK6+MteLa1oHt7g
	 ZCmMdK5pZG+2yYIsZD8WjcOgWWJXhFYPmWsWTbT5U0OeAA6CUZZTKbx/thuiad+xHoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399780;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=CAh+nvPJ+yDa0Qg7FRZRxpBHhGJqqeDvRRq0OEzlQqA=;
	b=1Zz9d4YfZ2pJoX2Zx2Oo5xfcZN7z6YrBiTjPg+hO5Mj5cB/TI2X/AsQJSqIchC7buGLG
	 b2RH+F+I5bFXZaQytMuDKAxxcfWdTkl4lGnYcOel/r8NmESarJNOLuRfo1piRMEn66t9L
	 bWbZSTPdwM68D0rUDEQTItq3EKuCTZp6BLWD6lzgpz4IYzLnjUNuMHB0UoK2m40GtNuSr
	 hC3ylzswjGo4NuxVRx5z9Oz/v8YnqFxtWIj/hIkIFrHU8U4YfMeumLUiDtdIZhhu+2p4i
	 NKP+ylDc7ayARSethOh6pFMZeX/PtZCSIH7owThYPCwt8imCXLTXPLs2+6i4unba/Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbXQbBz6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF399606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbXQbBz6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C19C1F00A06;
	Wed, 11 Nov 2026 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399780;
	bh=CAh+nvPJ+yDa0Qg7FRZRxpBHhGJqqeDvRRq0OEzlQqA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=bbXQbBz6f5SdkwClp5bFyGE7f7ueHz+SIq6/l60Rbw9xM9ngDJ1TwV5Q7zTv3WkTn
	 TOf/Cf5a3SVCzdb/oY0lBuVOH25+wG1EI2D9dFA06rAbmyPLo9s4cz4+A+loNdoDDP
	 k4WkWxSycMQLFw89uiDkPXIKosVfkiayw1HGGOhwec1KgSbRaImrrBlr1/mEIMYle0
	 8yrm6aeTfDJwxanJsncJt3P4172SRq+sN7eq36hGZc6mTEbw3y66bQSCJ4juKFuPqV
	 c6kV05y11eltFXBr4fOBQVusOiDmwyXKbJsj/MNr4tGSNM74UIq4EmLPm/p1Cyn2Q+
	 +1UZZ9pFVanmQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id C4D0B198003A;
	Wed, 11 Nov 2026 07:22:57 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 07:22:57 -0500
X-ME-Sender: <xms:IF70alb-Rwk_AIRKiOc5jVxLRIiV12D2Pt0coxInkaxT5pLERDKrUA>
    <xme:IF70anNi_4iDjSCNLA0hxVavhSgdy_jDg3VI9yD-1MST299UPaEdN680_y27UE6ew
    OdgRlyt4RQS98eXsB487Y4L46tIQqZnrJ6KPmuC0R3Ij5OD0vNvV9A>
X-ME-Proxy-Cause: dmFkZTGuiQUX0LNbcVd8j21W+23DiEwALIKvNLNcj6KOS3HRBh0oe0ltdiyn19y5qwkgP8
    WZsl2dEbJyDMs8/HlT6JBBFWsvQ1NQX+18DKvDP1t3Ua1YOI/xNqIWeBVSOznrxZ9P2p33
    Lmc3n7aSzjVGjsa4dMnb6mULdi8kpZdEB7wJetXNqASdqjwlX6Om4fqO34duMBYyRoHFm9
    4xfnB5/jbpBXUdDrQLC6sUcK8UvEX4/y3YOheR/F24igDPIdeJlwwo4tpxFxCHVw3POx/j
    2H0dcfCk+Kci/xvA8aksbHTRs0jaZYssChqkwYm40A2ipVBq7OUy+MSyQP7P8D2GYAF3qR
    wSjSchduN5fNAItj3S5CnYyh+H4zIalXUThWeI9uMi0/zCvzYkezrI/aM3DEo5SxK2fyWJ
    eZupMYEs6w4vFoRyb3555/fTu7FS3Ci9znLmlzo/IOAt94BVdlw7DCp/DfWZYxtNutfxcB
    Gu+UE5zyIVPdu35ALh2ZCIJAfQ84qrmSQ95V3gyrW5lP+JyVoqIfCLHLb/1gsNIjYIDa/n
    OM4QdL7Pbro1P+AnzX5k092r2NQDUUDYJ8AsxmgQ6YTEaNM5e1JUtnWljyY5fyWrz1Uhvt
    rUSE156PTAhsPrFkFfNEfTBXyBf3NOzRkMJyKV5NFyt+sERBc6eaR15utI/A
X-ME-Proxy: <xmx:IV70ajCl-t_5uxqWtbkT2BKhBgNCO48kayf1Lf84V7saaLSYFWdRyw>
    <xmx:IV70ajnVrsjTi9xwCZ9efRuTFaZh9QCRooGC3zMJM345VJxNLar9aA>
    <xmx:IV70audaaPhwUb62QixpIKYuLe91XKVCKq7dEa906BKmByda_ZvGCg>
    <xmx:IV70anQ5dzM2XJL0fM1s2lQfrrn47Y_w7_lzJEAOBnyE7bUs86GxFQ>
    <xmx:IV70alts3imEohIjud_ME-MyQFPrLSVeVLVAKOJ58tJC-mCoMPCVtsCi>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1E36AF8008E; Wed, 11 Nov 2026 07:22:56 -0500 (EST)
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
Date: Wed, 11 Nov 2026 13:22:35 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Message-Id: <77983ae3-f4ae-4b52-903d-d5341ac0e869@app.fastmail.com>
In-Reply-To: <20261111115303.3749380-14-ardb+git@google.com>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-14-ardb+git@google.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: c630: Wait for the touchpad at resume
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 11 Nov 2026, at 12:53, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> When the SoC reaches deep sleep (AOSS sleep and CX collapse) in suspend
> to idle, the touchpad is often reset, presumably because it loses power,
> and it may still be starting up when it is powered on again at resume.
> If it doesn't acknowledge the power on command, i2c-hid tries once more
> 0.5 ms later, and then fails the resume:
>
>   [  712.566907] i2c_hid_of 3-0015: failed to change power setting.
>   [  712.567528] i2c_hid_of 3-0015: PM: dpm_run_callback(): 
> i2c_hid_core_pm_resume [i2c_hid] returns -6
>
> hid-multitouch then never puts the touchpad back into touchpad mode, so
> it stays in the mouse mode it starts up in, without two-finger
> scrolling, until the next suspend and resume.
>
> This happened after about one in eight suspends. With a debug patch that
> keeps trying, the touchpad answered the next attempt, about 6 ms later,
> each time it had missed the first two.
>
> So give the touchpad a post power on delay of 20 ms, which i2c-hid-of
> waits for at probe, and at every resume before powering the touchpad on,
> as the touchpad isn't a wakeup source.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
>  1 file changed, 2 insertions(+)
>

Please disregard this one - it doesn't help in the end.

