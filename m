Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614368;
	b=zeiGDTT5924Z3CnaD9JAGRvqht7sBilN3vGH+aooJbJf5yDitkoZH5xYOkBuqEbKZ3vf
	 zrZsgHvoiS1ARNdSjt/6XvjLyi05+AHzubMNaaJ4OaaNJSTvFj/bWhom00Z94lP9E7crv
	 c6MxyhdlnHP5Yr6+yZYJKn+e7/mOIj4jMPjXyI4YA6gZBidC/Ei6E/nswQFRL5jbS45Uw
	 WHHpzbrQq2waBgHruJJfaXbxf1E2j0+8Iqn3Wv5thlqeZE4gyOxrUIuFl8UKWUz3H++2p
	 YeM4HvwUusfR2a2GhcIoGrBGGx7E1dBqi3sUh4nM+Ipdd8wvbyYtfxYDyzYfqPCu6/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614368;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4jZqsZWp4ooYwhfyJ4y0mJBIywKILW2kOFcQL/uGzgM=;
	b=4DHBi6lD0i/o/5MBTA6AslmlNCnwpNfrnj92+p+XcmbSsmTwuL+PPccXHgwcrXN68Rvn
	 FmvdmEdsQ8FUbTg5g+5338OTruqIiv03TkjTPQIiwkk5iYozViPpWNTHnhr8ShoXeBVRO
	 wAcbn1zUeTdNFerG4qzX4jsIBv7j58FUItFeQxmNQT7r9LeWOBB4ATBdJrftDiFmraCIz
	 UiC9PW+Lkt97kx1HZ/PApzvPA1vLORpqsW+vuvKfeMGfDdSBSnOqXEDllueHBl3YGue+a
	 B7/mffWWEsLomNorNi7Niu8hi8GxZMV3GOHFvAxVhAAEiZltgxA1o4CxZLyBqKdk2QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifF3bAuf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6418F606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifF3bAuf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4231F000CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795614367;
	bh=4jZqsZWp4ooYwhfyJ4y0mJBIywKILW2kOFcQL/uGzgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ifF3bAufXHV77XVWr2MRCQo63HJHoPyW/kmeN3Wdi+Uvnhw0o0EevcXIraxpZahnt
	 Tpr50qs9xBUuFTmDSlAUiGUk34SgUbxs+xzVnvTX7pwp4g8EjSuSoueSHv3F6/z3lR
	 qaq7NSXMVFFWhihtPoPKIdTZlJUFgfNlo6Mo0fwdRRbM/rUC5jMYnpds6+UyMTtaEc
	 bKwdZsWQEWmocA0bba2B1QGs4Al5L65C1IPVpMMJbRr4D6K6aOIPRehgJsrkMXJnco
	 RlhlfKvO4ApSKsebt8G1xGjjwszVEOdvuSYe74chzYgoE4o+zd6R8I3LuTfo+aAdmv
	 TtDHhHNpAiP1w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1479a959aso4306816e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:46:07 -0800 (PST)
X-Gm-Message-State: APuU4Z/YahSHTk3+j5yLA8cWrVxS9I9HCRDOrm1/4Q3Xk6f6lwelJDuC
	EoPtqa+KcHmCJjykPkoXuXpSCAesLcaTCZzbWYLF0gkfmdvQiOT34bfsOxOgMyskD+0mjU3Do/A
	vRo5FLx3z/iTD1eoin7MTUKJ4LRpt/J4=
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1bc8198fcmr5837892e87.54.1795614366500; Wed, 25 Nov 2026
 05:46:06 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:45:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLmkSNamcvU49S29HmbbqPZiO_P__-vf2VrUTbiOTYQ5nA@mail.gmail.com>
X-Gm-Features: Aa3M54r_va3lokUc-LWrlB0jUYgyg2M9NoU1QfnHQvyjmsPDY4Ce4kWCvRRlMHU
Message-ID: <CAD++jLmkSNamcvU49S29HmbbqPZiO_P__-vf2VrUTbiOTYQ5nA@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.4-rc4
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:17=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the following set of fixes for Qualcomm pin control drivers f=
or the next RC.

Pulled in for fixes, thanks Bartosz!

Yours,
Linus Walleij
