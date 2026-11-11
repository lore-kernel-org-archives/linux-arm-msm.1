Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403039;
	b=g6UlyJyHriLcPtbk2GYCxqJubg2Cn3RMM1sQknknJ5wPaYOxFqbn/7xSRksI6vY2HXL4
	 nFWNwBeMr2/5T6ZsBReO/2sBmtgcDudKl/ZHcUfzLBeu8X5zG8lHxsQruJfjhlLKqXfZ+
	 XXUVqBmfqwSXNuLp0jGVqO49CU/gi57K2LiBNyFpWUVDG1QaZeQwRPbcRjFKGD+HnWULO
	 OLOb36aWpMLtbKWMoKEnDYMG+qUkhYGWdCIF/vrzdd9GUgD7pFgEPmRbuvKO0JFJTff/u
	 isq6btmV1JUnmLivb1EfV0B6SMh603Xrfgl4rgd518v673/71d9vI6wycbcMxYfTvWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403039;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=5SJwT8rIsH3vNzy5mU1VkbzREjNOjEG5IE7Q1aoqzIE=;
	b=bAVvTc47PoYidvLvDn2Lv7IhB9phL/+X0f0cjLmwEeppb6AoDG5hp7jxSu9XLHv+6bEa
	 sS3DbpVyq9x5XhQ16i0dSsY9tcEbL3mDl9+bJkD1W/N8zcYQmQ6CcjOVBm/RGbq1sr4py
	 j8odvHvS6p3uIIKv0otQkw4SOLvBy6wo/C297ISP4SupSi236Xb7va2WR1cV/lspMRen2
	 PMHsOaV/rEP0kM6DIPw8LSiMKwZcTLFh7FaI6mbc5x/5TKN5EEk/oHAQ8g9AD3oaZkB+n
	 Ig3ebv3KFv51k3QEKjDadfbrPAeoASfZvMT89xmVGJMcvdws0VTOV3+hxkcheBdlhOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8IkPuea;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134AF606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8IkPuea
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12AD1F00A05;
	Wed, 11 Nov 2026 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794403038;
	bh=5SJwT8rIsH3vNzy5mU1VkbzREjNOjEG5IE7Q1aoqzIE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=V8IkPueaAeR7nf9uCvekHF5K/WMjlDTPPuUu5BwNcnrfJqGKwZZwIISv/qty+j4zP
	 ZqxHVUN0IIhpi9pD7u4DEDPbqwnK+aODW5pvpZx/hGIBSM0GRqZwX4sPT7L3Pm7spM
	 UqE2DqoFznmOsQtc6RCqHVgWzfO9X0BEmGb+erbJS0d2EwdPkjtw1fomwTczaxhs0k
	 GLQudOgZqFlbPjGj1xwSE/4ubsHMEBs7TY3j3UjvDGKvi0XK+Ii/l9ilXzelxeGdFL
	 eOPOwDPxti0Vg0V/7sXhwPNypxwU7aILJGYqIyqae1g6rFHle7DCYCXcuT2W7TOTxB
	 vZMj12Nl4qBFQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 59428198003A;
	Wed, 11 Nov 2026 08:17:16 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 08:17:16 -0500
X-ME-Sender: <xms:2mr0askG5KzbppcLXJVCKnxf_HtaJV6-yd49LtNjd-kj4L4j3z0OZA>
    <xme:2mr0ampNCubEui5EnD0zRmV7HRhVpCm4m3xUp6KapC_kn7nPnfF_B92PWYD_GMC5F
    FSolyLQtQiYBNTrncI4mPIFXWIHt0Tb4WSjuIhLHK1O1Y6JgI6H4lY>
X-ME-Proxy-Cause: dmFkZTGMs/2p9uw8vSDXjIhdGiBmta65mulqijHZHXyBT5yuT0QV2ClH6QM132GSf92YsX
    gEL2VQdtQhOMdFo1P5VZ02yR2sCFJR4fO2o+vvOLOcaAsoTuhmbNnTuw7AstHEUo7Hh/Lt
    b3Zo19akWbhyK2tVfED9hdEmhCcRij8EkRKRN0ejcOSJajdqfTE+faYuO6fRzajuRpzkRQ
    ZVwLNPoKpcRoYXoWTSSdw4Ocoe1v7WgfoNpYSg3OWXCTK+bN0hsWK30JR5uc/ljCB2tI0f
    a0atSF8stJWePCrAPjFwSpPwrbwN/auKPPE/PDR5PgpUi4bRqEOWBGlX7cT3JF3TZweBsm
    72EIe7PiwAoMXaMeGhUyQ5xN3E2f31YjJsXWyx4LTLWbmIXH+SLBGuyvY5w7RunXeiYFlf
    mn1Vc+IvAYq+VsQUvPobJ3hyrM1LM0p5ZQuCubZSQZ7PSxin7QaAjydVNhiLdHN8E1tlT8
    q3yUejOOcg2mC3szRyXyuD6F82SbLpP5yLU+oNY9j/GCoU+NjrX8PHThmQnxzA5jteHHyx
    mNvRNcYx4UCBB7SyTuwgC8l9Tswe/VhxsF1HGoyTmPtIOvhiy/uIvfWDrwK5KJBCaNTqg7
    gcg2BpsDCrsZUKp6S0GiBXnxYxiCuloRzROYNwfs+9SDc4QQpGui3d2+Gcjg
X-ME-Proxy: <xmx:3Gr0alUkiti7DllWn9wF8zOBeo-M9GPY_fRC67Ht16T8XUy7OpdIfA>
    <xmx:3Gr0aoK2hba27PBppglV5YLkvKMKJ7nqJZp18AWffy8dFh66P8g2wA>
    <xmx:3Gr0alBW3VtMOngucLYkC18u0Wr3XQKfcvzrYAo60MhEzTGcSBmruQ>
    <xmx:3Gr0aodVFvheMg_s7XAIP8ShRJzeBAW2NZKM0xa_zq_bKPkDojrNIQ>
    <xmx:3Gr0ak3kTR7337I4spLbW9iFU4UDx_ZNFgL5SoPkZj6Qn0WqtJxO61zo>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 56B65F8008E; Wed, 11 Nov 2026 08:17:14 -0500 (EST)
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
X-ThreadId: AuNBHevpIBkc
Date: Wed, 11 Nov 2026 14:16:54 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Message-Id: <3d4c25a7-8572-4a2f-b8ee-1f17cf5edfcc@app.fastmail.com>
In-Reply-To: 
 <vrdpknallpy43dxgkkudqokq2cykm3ryfebpf2oesyfbs53k45@jx6hp7mglchv>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-14-ardb+git@google.com>
 <77983ae3-f4ae-4b52-903d-d5341ac0e869@app.fastmail.com>
 <vrdpknallpy43dxgkkudqokq2cykm3ryfebpf2oesyfbs53k45@jx6hp7mglchv>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: c630: Wait for the touchpad at resume
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 11 Nov 2026, at 13:58, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 01:22:35PM +0100, Ard Biesheuvel wrote:
>> 
>> 
>> On Wed, 11 Nov 2026, at 12:53, Ard Biesheuvel wrote:
>> > From: Ard Biesheuvel <ardb@kernel.org>
>> >
>> > When the SoC reaches deep sleep (AOSS sleep and CX collapse) in suspend
>> > to idle, the touchpad is often reset, presumably because it loses power,
>> > and it may still be starting up when it is powered on again at resume.
>> > If it doesn't acknowledge the power on command, i2c-hid tries once more
>> > 0.5 ms later, and then fails the resume:
>> >
>> >   [  712.566907] i2c_hid_of 3-0015: failed to change power setting.
>> >   [  712.567528] i2c_hid_of 3-0015: PM: dpm_run_callback(): 
>> > i2c_hid_core_pm_resume [i2c_hid] returns -6
>> >
>> > hid-multitouch then never puts the touchpad back into touchpad mode, so
>> > it stays in the mouse mode it starts up in, without two-finger
>> > scrolling, until the next suspend and resume.
>> >
>> > This happened after about one in eight suspends. With a debug patch that
>> > keeps trying, the touchpad answered the next attempt, about 6 ms later,
>> > each time it had missed the first two.
>> >
>> > So give the touchpad a post power on delay of 20 ms, which i2c-hid-of
>> > waits for at probe, and at every resume before powering the touchpad on,
>> > as the touchpad isn't a wakeup source.
>> >
>> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> > ---
>> >  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> 
>> Please disregard this one - it doesn't help in the end.
>
> Are there any additional power supplies that might need to be enabled?
>

No idea - does the schematic provide any clarity here?

