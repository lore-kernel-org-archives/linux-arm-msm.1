Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611470;
	b=Z/dpw95xxEm+GPVc+5w5WJA4EjWgQhAYprGeNXMH+I3aDiIcyaNl24IRN6KyF9Z4fPQt
	 cfURb8K6JloTXk++nlxkYzfAP566TmaHsGqNM1+nMz+5Ztw2vGGcFS71igjOhEyyK/vAr
	 B/a2LYSgcLG+jawkB+aCSQmnvTUHbvGIgtb46EkwF9bLIsJQNPPFzD5oqaZnilE77y6Xm
	 Qfn6zdZJoCAmpGlgt9kFKYmEOf6gq2YO5VLrws65jGTwCij6hD8GmChkUUjIEbiYTsPB7
	 yaecGWZJZqhgKg9Wk1dQyHsPujuNHrJqJfuLvogHKowKq6B+PeVPMze5C4DojWggnKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611470;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kJt+ydyRTixeKLbA+0l2aYt6ojWzKdTKUDAlmkzXSx4=;
	b=ZHZQvEk73o34k08Gr/j3dCd9uv6DkjXAdr9hcMtsov8ZXE3v+sabL8FA8PNBjjYrnqNn
	 pIX/5TurswcTp73SH0IiHubQh2jqHmqa47BGlYCtuLs/J2+S37VyuajWQ7tH+1CRS4++0
	 DGOCXLNn44rQuBeOnKLm/aF2tDdoKCgMEkvPSBUoT6zq3/XSl3ETlU2axM4qe9H45p4/y
	 D7Q7cBNfuwSL2+2ZcpenpOY5Mx55aurtOHiaBTxOx4R86zhB7/aRsYDEqWRdPeX4ebEX9
	 hZCtNkLeRKl5sFM3gSKdx+WZwOuGp4Ii2agLt3kBFw5yiS4cYjKKAEO2y06MbFoWD8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="btu/aT+w";
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06735606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 19:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06735606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=btu/aT+w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792611466; x=1792870666;
	bh=kJt+ydyRTixeKLbA+0l2aYt6ojWzKdTKUDAlmkzXSx4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=btu/aT+wzkBryud6j710GW2QjsH7PZsuAMMGFC03bMG6WMUh4kg8rY7zrsrIQmkvQ
	 X+pkc+4eiYHuH9aeaP/Pn6wC3aBgNkWqvAD0ajLwQ/vLNzhfZ+KRmi4wD5GowoqJ1V
	 lZH1sCNs9UconzRk/A1eyIrRWEomHz+F0WyGUzAABzVrsqNWKd1hqhBBe6t12j+cuQ
	 nQLF9WU8D9DnhUPKudM0u5W6I4+Mc9cBmQsxbciPnIQK3kiEny9F5JW5dPvOvnRuvY
	 UQfIOgKAsFe4pLG+bCfwrWPeV/T40InKAUQJFKenpNmqYULxeYkgTBtFoNNn7bBFf5
	 AMC3GeVPtG2bw==
Date: Wed, 21 Oct 2026 19:37:42 +0000
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: qcom-cci: Reset the controller when it resumes
Message-ID: <179261145907.36927.12230352776394948067@pm.me>
In-Reply-To: <CAFEp6-3s9ER_V_B89W5f5PVkRnLrgSwnUwE+tmftbUGB-1_BdA@mail.gmail.com>
References: <20261020193946.51478-1-birk.skyum@pm.me> <20261020193946.51478-2-birk.skyum@pm.me> <CAFEp6-3s9ER_V_B89W5f5PVkRnLrgSwnUwE+tmftbUGB-1_BdA@mail.gmail.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: ff5736803f5461e1fbf86162dae562ba1f05d144
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:20 AM Loic Poulain <loic.poulain@oss.qualcomm.com=
> wrote:
> > +       ret =3D cci_init(cci);
> > +       if (!ret)
> > +               ret =3D cci_reset(cci);
>
> If we don't know the state, it's probably better to just
> unconditionally cci_reset().

Right. I kept cci_init() first so the reset-done interrupt is unmasked
after a power collapse, but cci_reset() alone works there too. On 7.3
with only cci_reset() on resume, all 30 camera restarts after 2 s
pauses started, with the controller suspended in between and no reset
timeout. v2 calls just cci_reset() on resume.

