Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701BD34CCE
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539760; cv=none; b=JxeH8edXylH/oJgjA4fb4MmJ34jx46GkIkoXrVT/OWXUQhyFHoQVmKthjHu8U9Wi17xQ1emBzl2oIRQY5//Vm6DfLxS0roH8sL6fEML6oHLyK07usc9RMhKTFoGOc0ea5Ea+N45aJiJvG48cGY5G7LV6cZQzGvI0zRmNgiEIQ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539760; c=relaxed/simple;
	bh=QbQ2/AtCs501q7UDf1Jv6gkx1pyrMNlfW45xsO5RoQw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=huf3SDTv9Zak00GKid/wnZzJ47a7ZnkGv4/kRwo7rqkPLesRrI1RKxg/HtEzgJTFHAQc31WEECNjrVJypUNafLOR9Y84V8x/zfL/H0GmRSoBvqpKdIN9kujLQCeVN6TzoD5eHGYvzzJM84GhGsFg3yEhkweOKIapZNI/bqX/1+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iVA3e4/K; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iVA3e4/K"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso483707566b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 02:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791539756; x=1792144556; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QbQ2/AtCs501q7UDf1Jv6gkx1pyrMNlfW45xsO5RoQw=;
        b=iVA3e4/KGcNGREd24E+mHwDu/qtLEHh4zil04bmUOmDn4eXHsO8XQiCAMiG48ZlG7D
         Rq1Pn6XrpKD3B83jjP0umt++aE8uVHDGNU4lB8AQagJs/dlLEmjxo8WopbWKnqbWdeb8
         lplDKNl+mwSPFIRUaHYqgjs/8fChu78ds73BAvXcQx8nxFCXxIEdZyNrKvPwQcD2SSmy
         vpNU7piITLvZ9p/3gNLVyaVV3fE/8OiGVoYv+MBWngpFY2TYO3D+hjEhx4L2yCKtDpDK
         xal1EjPl3V63VoRmsGnghGhbJ7GhCGTGYbSRjE1IV3f7pcjIubV6ZSIDmsw8yrV+aNDr
         XXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539756; x=1792144556;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbQ2/AtCs501q7UDf1Jv6gkx1pyrMNlfW45xsO5RoQw=;
        b=VUr6WnHCC+S/xxs0VnVezHBPAQQl1mEwPr8SizS9PLr/nl+dh9fQA1hwBtB5kiKqWr
         asQ1PLZoSEMGGCPlWnaTv07z0TklzbTia2D2OT+3TrewAiyrXiQOz/nzJy90Sgq1+6ye
         OtMpc7nLF8z9JtkKNO7iRxhq4RHO+daQYdOJpOlbUAiY930jj6NApKMMGvqN3sD0A6V9
         MMmPEsn25Rb/4ebjVKbqXyXx6VRy3ajWXmooQGgZQMIvdaTpFibDh7U/Do1G0ZM3sD1r
         OpfzkmNBkJ27DXSIicCE0g7Nb5B5xK8JFbuRah8DYze4CkyNrOET4++7GQbGycX+u88K
         Wrjw==
X-Forwarded-Encrypted: i=1; AKwUvBxKbkfjbdMA6TCkibcVHupE7vcPUBKAewbqDQBobTZaVW5uUtANBDCHFO7OvnY8tyh7nJc4EoOpc8rSxFly@vger.kernel.org
X-Gm-Message-State: AFq9FYKAOHJ+GOVjd6GNbsDSaGJ6QE8XMj51yIccXPPbmYDF8f6zIeg9
	q/uVdWtWt5WCeH6mda5r8x7O1P0EoE/xyFVT8xjo5C8YDq3HEYVHkJMptg/VPSGHU+4=
X-Gm-Gg: AYBFou1w3GNy7ZfWNNXhhvODWHZDxkDfrwCidWUbPtF9NW1Nku+FwBkNgqRdUocR+0r
	yjGwlzYLoOJ/lhsvbMCacfwYXy+P/kACP3QTBfBt9H1PzXq43YgmratNg21Gjy4ncLGQpqjzHv8
	qmEn902zEjvPRnBk0qoTFEFrA6AB4Ss5EexV/tTEs9o1o1LbkS3WD2tW/++yrvEv+9jvfAKPhfy
	x7Pi8TAgiu26wazaiD9KZ+FksfDqy4rQaoNOcap8aBh/2pu/AmFxDwcLdFog2b5KqmHQTesIh3b
	2ktrN+OrQvsghMPruL3wKBYkPb0rw/v/qvWV7AttCHgAqQERSkBKTw3wPp4z5mY4co9eIa2hoJ/
	1sG8lLw9CHjo7Z75hUk+RlS9NMdJUzZVW0HApBUgsa8qdk6HOgKrbX8AZBD0QhFwyR1z4e/sjyK
	mRRGqevNZTuy7Bx3sjnr92sQjsjcjPW+wCutnUdCt80Jrjw5U94L01z/i4h603noTFbrGBAomKb
	XncC8X9R97AdbfeoiNEV1KXPDWcnQQpQfoMSGAGmm8=
X-Received: by 2002:a17:906:6205:b0:c2e:4292:d27e with SMTP id a640c23a62f3a-c31aa017fb2mr131169466b.22.1791539755796;
        Fri, 09 Oct 2026 02:55:55 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9af103csm68942466b.87.2026.10.09.02.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 11:55:54 +0200
Message-Id: <DM07U9H4GK87.1NU4DXWEDZKAM@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] Correctly use TX macro v9.4 for SC7280 / Kodiak
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srini@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <96294c65-171e-48e4-9938-9f321b4c5e6c@kernel.org>
In-Reply-To: <96294c65-171e-48e4-9938-9f321b4c5e6c@kernel.org>

Hi Srini,

On Fri Sep 18, 2026 at 10:34 PM CEST, Srinivas Kandagatla wrote:
>
>
> On 5/26/26 4:29 PM, Luca Weiss wrote:
>> As a bit of a note where I'm coming from, I'm working on microphone
>> bringup for qcm6490-fairphone-fp5 where so far we've been using
>> qcom,sm8450-lpass-tx-macro to get the correct control names. I've tried
>> reverting to sc7280-lpass-tx-macro, updating audio-routing in dts and
>> UCM to the v9.0 names and it does seem that microphone (AMIC1) is
>> working with that, but I'm not particularly happy about leaving the
>> wrong control names everywhere, so I'm happy to try and untangle this
>> situation.
> Are you referring to the enum values that go into "TX SMIC MUX" mixer
> control?

Yep.

>
> if this is the problem, i think we could use values instead of enum in
> your setup. They do endup in the same register.

I mean technically we can also use the incorrect v9 names in dts & UCM,
and they resolve to the same register values in the end.

> However I do acknowledge the issue.
>
> pl let me know your thoughts.

My preferred solution would be cleaning this up completely, as in change
to v9.2 and update dts and upstream UCM configs to the 'correct' values.

I do understand that this will likely not be accepted due to
backwards/forwards compatibility issues that kernel people want to avoid.

The most straightforward path I see is add a new compatible which uses
&lpass_ver_9_2 and can be used by boards that have been added before,
while new boards can use the new compatible.
This is suggestion (2) in my original email.

>
>>=20
>> I'm also not sure where this v9.x actually comes from, maybe I'm lacking
>> some documentation, downstream kernel only refers to Bolero v1.x and
>> v2.x so these seems to be a completely different versioning system.
> Am not sure how we ended up using lpass versions instead of codec
> version in tx, this is a redundant to codec version. I want to clean
> that up at somepoint.

I don't understand this whole versioning anyways because there's afaik
no public reference what SoC has which versions, feels quite arbitrary
to me.

If you have some internal references and can sort this out, that'd be
appreciated.

Regards
Luca

>
> --srini
>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>


