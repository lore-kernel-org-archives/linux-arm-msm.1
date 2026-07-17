Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42832C11C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302834; cv=none; b=srTEAb5+tuIDoIUZZEMiWvdQrSPdlsw8t5yGgtNukh1OtNT7rA0sIFcRwn2vXcfblu7lFKeZAx+/2uZ4AjCcBboS//qiCaoHpu/FU2QYXTnW+nFcxux03TiMViBw/LZdL5lRLE/fK708hcz2UcRNv7B0EJ9cusXxektHxOvv+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302834; c=relaxed/simple;
	bh=1LTRCgSFoxKqoO+f0vjNmVxCnjcCSEY4MiefjXT7rIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHXC+YL08x9KKwQ8UWOSsyGuo9L7xapMRnSKPceWumLHhLLijWHO8xYf1vxMvGvGnVcV6brxC7yc87HJ6rndIkkkDBJDl2tNkS2Jcn1Xtqtl+QVHovtBilMKCAA9a5+awtUXayTHoAKo+HRvWaFCyGZfRW5BlWqqpEv7iIqTWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YGPkwFap; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YGPkwFap"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso2209085e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784302832; x=1784907632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LTRCgSFoxKqoO+f0vjNmVxCnjcCSEY4MiefjXT7rIM=;
        b=YGPkwFapDkWlVHpqrkEVpYjxCCS+rgbM40KvDi3+8dxQhabmJEzC3dHGlqli09BdnK
         VKChQpVTxrd6/Kiltd1PQx7hYfnSKjjXbKpq4YD9OUpqCpw00+BmldPS8t3cF4+xzE8B
         v4UGK/2kY6fh77D6fq3beekTN5YDpeYdu7hoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302832; x=1784907632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LTRCgSFoxKqoO+f0vjNmVxCnjcCSEY4MiefjXT7rIM=;
        b=lI0+9lQvWddaJDplSdqd30lcB3YXzlczN2z9jmb5P/V0FcasXLUSehAYfySSsW9s+T
         E0J6VZH7YDtGLc4If/x3d8gqi1TtbtEloLuMMc3VY7h0KxYEJbzsKLVqO4BkKDRxWfQh
         Y1SBtEhaCgKQULSQK2UX3rftLdisb+97zQpmbmlZKrBWcaJrf1oyq6afVnPrj/yDyTIS
         b7YE0qaH7SQ8Ldu1BCPS2fEZOfkuZnS6zAtItgFsfShLA/MdOElNfQY6P+Vc5w9cJeIX
         V4F7AHH/RriLFBxyw+QgoAHXX2BnLTDfSO0MwZT0XX+56q9x37m2+EP8ZBOfGPgcUBRn
         QGJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSLH45/aXMjwbdvTiZ9PsyVbeXMp2nk+d4hgr9IkUWFKGuEDb6z+DsrNK7tsy4JbKItMgDpBogowUySHwO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxau1J+wcuZ5p/VYgPb844TK4XRSU57MhANpc3LRFk6edPgrXMY
	LMXU3PPFSb9KYOT9+yi1AF2nMp9LPwfPtEaZJwgMbd/TyEJwYYog/Ig57lt2MY+R8TVF1c0rw2v
	AegE=
X-Gm-Gg: AfdE7cnk7NV4oUuDdW5V0tJGbzFVUucVgUpZOD/IjJu40qU8aMNHnO4CLJ7Iq3Gkr9G
	B2BBbSW7O22XR1FHT4V+BwK9hyqZkMqyYJjJ6Twb6aUk2rnBg5lnAAXX/qydlhiuFxyu3TW2GIY
	NDPvdRGNa6ZDySgw/rmRH7bGgVS+G4gnbaWnXcGOA/59ud/K8olY8g/A8GuNZhmpwyVZlX2D+nt
	D4iRqMST8msfNW1P2XHacTnGgDkPZ1xWb73C52q7iQ+mf9dN4XUp/fmXrq9j8NDsCDHgNJRQT3l
	jV9bR8nnKBAFlWFijMBxyTijuqoFX3XbEluZPeu2+QLCIi0tasGsyYMOQsNQaM8lQLkPGrOvQlR
	tDrCDkiRFK817SdNKtZGmQP8NkWdDCyhTdPiftNsUv3HARnllz9XhiVZ46ZuQV2LEz1Of5rxkUe
	Oi9VTBQpIZNC53c7IyfcuOc9WObWHf7iVy0dkDFHNc4g9W+qWisCk=
X-Received: by 2002:a05:6122:4085:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5c1b6646347mr686633e0c.4.1784302831793;
        Fri, 17 Jul 2026 08:40:31 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eee52301sm868940e0c.8.2026.07.17.08.40.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 08:40:31 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9725084c547so2544885241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:40:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrx2jVg5CbYP5hr20cdokodI6EcDPUKI5izRCO1fLs+poKN7UdMbC/veB9/6f8xffwG1zc8iq96zJmDrKCG@vger.kernel.org
X-Received: by 2002:a05:6102:5810:b0:737:5c42:858b with SMTP id
 ada2fe7eead31-747534cdf79mr792514137.11.1784302830399; Fri, 17 Jul 2026
 08:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
 <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
 <20260605152825.GA3740391-robh@kernel.org> <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
 <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
 <CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com> <6e7ae036-e63b-4f83-947c-992f3199dbab@oss.qualcomm.com>
In-Reply-To: <6e7ae036-e63b-4f83-947c-992f3199dbab@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2026 08:40:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSgE5z71HzZwCiVKhYjt2CPesPD_HNejFZg4xMpV1bTQ@mail.gmail.com>
X-Gm-Features: AUfX_mwKjGGKjxDAeqITUG5KUm08CfVu1NRr1wpnrdcgFny_h3p0H-VAhH4pTdQ
Message-ID: <CAD=FV=VSgE5z71HzZwCiVKhYjt2CPesPD_HNejFZg4xMpV1bTQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 17, 2026 at 6:06=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/6/26 12:41 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Jun 5, 2026 at 10:14=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
>
> [...]
>
> >> Well yes, people have a hard time using compatible strings that don't
> >> sound generic. That's too bad for them.
> >
> > OK, so sounds like going forward I should NAK changes to this file and
> > tell people to just use:
> >
> > compatible =3D "samsung,atna33xc20";
> >
> > ...to mean "Generic Samsung AMOLED panel with power sequencing that
> > matches atna33xc20"
> >
> > Yes, it means that if we find quirks with a specific panel later, it
> > could possibly be harder to work around them. However, since we have
> > several ways to identify the panel (via EDID and via DDC) this seems
> > fairly low risk. You can't perfectly predict the future anyway.
>
> Are we going forward with this guidance? I have another laptop with
> another ATNAxxx panel (ATNA60HR07-0) that I intend to submit a DT for
> soon

That would be my preference.

-Doug
