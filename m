Received: from mail-ed2-f15.google.com (mail-ed2-f15.google.com [74.125.228.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102D3D5647
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742911; cv=none; b=Sfm5qfc9xyQrDMkZ+BgJuXXCIoH0wz421zE4ARfUQ0Skj5fhZY1iqnolEpsmq6O9GTiPNHXgH7Ro5dmFsRd1Zdois1qnHANBnovw7RYdsQ/Gf0H9fK+j3WHjCBts3ysPtNmdaDKwm7EPstqZ2CvstHi2c/v9tKbEMq2Onw6Yqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742911; c=relaxed/simple;
	bh=L4bI3PGgU9bSJgOhljQBgG0v7C7CIE/2yIrGX7MDOqE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WdLHgmY/+vmufu8rJsHW0z2DmUKf6PE0l1ur4U2IdBo0GCHPPZ7tDHjratiSj8VaYXGd21eW59CltghjJ9LBXycd3QfLWLqhV2UUNH7L5wJUKalIJ7jNszQe9UOJ4gjIAMRadHVQNemOJQXpQNhoMV0PA4HU3NCF82qyPTgC5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cyWzPhFE; arc=none smtp.client-ip=74.125.228.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cyWzPhFE"
Received: by mail-ed2-f15.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so1016668a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742906; x=1790347706; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hg9vfa4lsW5ktc6Y5Et7BMiTJemiUATqSiHMCuNMX5E=;
        b=cyWzPhFE7qdE1aFe+S4eLXfEmqXcs3wc5OKxabPrVzvOUlA1/CVsSGOSDK2oUBeAHf
         VTHuh6+d/FtT/VedI1JDFJYaYnSSS1KO1r0NoyKWq7kc1hm+HuV0BquTHazshHcwNrR/
         CYsEjhCTSRtjUZ5yCOcn9ToOHPGgfU2tL80eldLtBtIA/bPQi2Bo8Z8uP0tHFEgjHa4C
         jMF7axCTOcoTmYSUnwAs3UwuO1NDILwFkWymXVDr2RC863dwQAdz2BqvaEl5Eks26FVN
         6NSTxy/zyd5+Q40bdbDn/T+W5Q+6hgvmTH/ayxJjgn9q9cdlobpAuvIJFaWayy2Tx+UC
         Ozrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742906; x=1790347706;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hg9vfa4lsW5ktc6Y5Et7BMiTJemiUATqSiHMCuNMX5E=;
        b=Xjj8IQuEpuNRimRJND8qNg4RXG3geqQevI7isliNIZ2xC1ijfPCoeWCLl+Q3qteC1q
         SPo3I3qe1eH/Wop01z2vT23bcp8KY6qw7ZTu1IA961gnQMCXFLcGSOvTyuyoLtaLWsGL
         jfq3Y8TWVFMeLmrIBQhoQ4srEkneBL9+8F6nIgHqWxdy6e5U+Y2KX2HlKjGVi0SbNTd0
         51ccHGuWc6Wosv+XqUQD9Aec9d5jQOsds1LnBiTZuG2ZOmwKMO8DocdmxPn9gtt+fscO
         RpeKoXHMoidzVyjEkLT8D3inohZ9yyo7dgI9RVN4r8DkE5hz4hpazhCmRXbKofdeGM17
         vY9A==
X-Forwarded-Encrypted: i=1; AKwUvBw8PQcNSE6OvmuCEdrCCZUiVUDct6Yeqeg+GZpzw4oZn8d5c6lpNI7gxEohO923PRyie9Eu/U7zhmRkZSwE@vger.kernel.org
X-Gm-Message-State: AFuF++neCDtZTMtJmvNdrYV5EOEh/80nchOd7n9t2ozVJeEqgVOFdHiQ
	pyUl2/O3IhUYIkyTjhbZcdSnMqDPedUMeCTmxUqxICXXK/fnVfh9L3DPQMESELDCNOo=
X-Gm-Gg: AYBFou3dl0b8Bmh3V92LrAIJseXGcdRDbzlXm9n2Jm44OPNnQLiQ1DIz3pxNkB6R4wa
	Jl5WXpWC5a6f0ImA0BS70chgza83SlFN8OHNUwNLJrcjZnmgJd24lTF3sBy6jTtSn+Wp7BU+YMo
	BNwiPefHayWNw67kVYqTCm2sxfre6MPORrr3VOUlOo0UK5BC8F7awuvIAZnqRt6cn6xP+4gaptl
	4cRnDv5bWKOIeAdgV1ybCxsTUEzDpowazhpQehk431u/35Ul3t3Cy/6xnOTSk0w7eDoyQyMC6gM
	joae2PJRkO7FAlhq5opuqg7w/JJjgLRdUymLRmzGGHw17Z3sDXc3qEM8J+5xcKalxxG2dwdqdv6
	O+fErwkLdeco6gx/CilXcBiqnjwcfHFtchn07qCgaoy0xiEDaE5GJnYZub+32sFgXCAm1+eGPqk
	I41YqPj1OiKNn35/2Mo1N7GQxORl7zYA/k64nsM+bD/KA+berhwEVFNGapCEOGF512oFQKmvWsP
	XWQN90DXA7oZ8MBYzOu0DBTD0k18psoyjwYNpj2jmE=
X-Received: by 2002:a05:6402:a0c4:b0:6aa:4865:55df with SMTP id 4fb4d7f45d1cf-6aa5637bc93mr1670013a12.26.1789742906136;
        Fri, 18 Sep 2026 07:48:26 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3236esm980880a12.9.2026.09.18.07.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:48:25 +0200
Message-Id: <DLIIWS3MACOE.1MZFUJORZ6P5V@fairphone.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct
 config for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
 <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
 <DJTUMRRV8K1A.3AL1AMOF242DP@fairphone.com>
In-Reply-To: <DJTUMRRV8K1A.3AL1AMOF242DP@fairphone.com>

Hi all,

On Thu Jul 9, 2026 at 9:06 AM CEST, Luca Weiss wrote:
> Hi Dmitry,
>
> On Sat Jul 4, 2026 at 1:55 AM CEST, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 05:29:54PM +0200, Luca Weiss wrote:
>>> With the v9 data, the controls will have completely wrong names and
>>> using wrong code paths that do not apply to v9.4.
>>>=20
>>> Note, that this will change control names so it's a breaking change.
>>
>> Is it something that we want to keep as compatible for the old DTs? Or
>> is it completely broken and unusable?
>
> It's definitely not completely broken since a good number of devices
> work (seemingly) correctly with it.
>
> I also tried and I could make the microphone on Fairphone 5 (QCM6490,
> Elite audio) work even with the "wrong" v9.0 config, by updating the
> control names to the v9 names instead of the correct v9.4 names.
>
> In the cover letter I've expanded more on this and the possible options
> I see.

Any suggestions on how to proceed with this patch set? I want to sort
this out before upstreaming microphone support for Fairphone 5, which
has been working for a while. Just needs to sort out this situation
first.

The cover letter has some possible options (new compatible, new property
to mark the dts as 'v9.4-compatible' and more, etc.), but it's difficult
to send patches if there's barely any feedback :(

Regards
Luca

>
> Regards
> Luca
>
>>
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>=20


