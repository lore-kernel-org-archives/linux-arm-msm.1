Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51E93F7A9A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 22:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288049; cv=pass; b=Y8+MltadMFp97XbwSLqRw2/hMJv1VhvhLnsnmIxo1MiV4XKKpVdw9IQ99xqbVcNJP8cv5bCeysijBlCT6Ao1pqokaohg+1RLA86ufsABP5HssFPtiycZ4IPTYZaKpNwMUaeqw2G6zohr1NNCYSK8hq/sJWMygAXML3FfH6/UbVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288049; c=relaxed/simple;
	bh=Y6k/VDdVR7T5GQtdNCr0LEwRZJBjUJRB8yrHYl+hVCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIskrW9DaQYAUeVvWvVmrHPRZQGLO3z5JIAEkWtIQZtf75gzfi7BZm6RtguWzkpD3WDPQbIFkCvNbgOLRQuevKQ5TU5jbPSqZ8T3nRacrB/Tslt6bSnmppC0Mvyw1m16Ds6L1KkeMN33qIQW4blvmV7JNjRTFJDn8gndi1pmdik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=jcMdewhO; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="jcMdewhO"
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5cb331763c7so86416e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790288046; cv=none;
        d=google.com; s=arc-20260327;
        b=C/uehzCqz44qxYEWGDiSk69lnTSVzfMCC0e4xD8s1xkOJcod6uzkR9IOYa/Vyx7i+D
         tGcV1XcTR9u6+WBytHoJMnKijvAswXzdGdqtoicPToiT7ZWu4jTvnd7B0o18UEGdPSKe
         ndB2FrVGs6l6Btx3H64iR28u/XZapGra27jZfEujhIsLXq2Juw5nloSS5ggm+hoCb3dN
         794WpBD727mSli56UfpNGf0/H4HKhX4rPU2KGUeWFgUQaJdgRvUMAAJZdSrAjmw6wMfP
         +L/t9WgdjC+fo4v6GIIsmeGhbj03/SgMslYqv9ee/A7KiPRsc7zgBo7jocw/PTJr032+
         we2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        fh=YwZQZi1UvNSR5Q1YDtQukR9QNCFMKu68gVu+xFuLVwc=;
        b=HCOxK050nWN/0SZ9Pd81+3XCcwMHVNDzEegIks9pGcSscD6DqUdmiBMQqvrf4XV9Hg
         1j1ih63zpkOLUh51qcMfwIZAk4JJSdLk4Tecbc4RNLBGtaJcjINjZ8AoIJWWEPGY8pPW
         kBLikGW2H640DH78dqG1V1VEjUsCnJhSBSSi2Fot3dGyIWwhQW7onbINoMXK+4ibudu5
         duwyKRGmBErVlQxI6ocLTqimnSjfl69eInyoDTkTidBgHNuCbO6ey978iP6+Tce4/2p4
         tgPGauYWt56v8mHjuZKhzv97y41yQH1nc5vvpYDbksXQP1wShFE0ph9HbG+8TVQtjslq
         jDpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790288046; x=1790892846; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        b=jcMdewhO0LuCU11N9vOKUuiG2uuR1U8epwSilRscOvpeLdoo87Cl/tl4jMZvs/uoKl
         DAxxNKoAx6Wr2oBBk6qaT4HbeKDj5dma9b8QK/q9lozofh9a4ZhtfS8GeAXD4MXoe5p4
         aMKlCkQ/kAlbyNOtHnbfe4MJgnMhmFSlEz/RhwFA7+xWAPPTDm1sqSOFD/XsqjUrwNRz
         PPwh1fAccMUnGfZF934EOSi8YUBuiXwPlI83HPP6RvANcXTCL7dOqPh8JiePVNjuY1bA
         BzbEQ2CgKmaC/fKWgjWtfi1kvkSfJP83pPdwmzR5t/4T/ZS6aMv/OJy5b6Gyi+E2NqDV
         uUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288046; x=1790892846;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        b=FSTkGu3iiS0RdcBlkcQpuaznPXgYHdXdpSXCtWPlGrHva3PQa8LRGb6gdhmy6Tjqhm
         HYklFm09Gkg4hb6yHvnAnchErNSHEFmz6ITKnUp/ZYC0kjhyr9wxF1pRBiylpk/N8UGy
         4otEcIGheIrBUElOfJqzkxQEfY5COeCF7WuE1O9Ahb92ZbkqsvVy92holIJEHYLa0mtw
         qQIGjrp+z3TX0xdygvjRURdK7sLOD5QRGE+Ys9KFRTIRCR1kuPQr9LTmanWRMoneVzlj
         aPbJNncSGpdIfnc1VRW8INNoQO7zpI/MxZoCUzkVArQonUcPLB1853ScZR/iwwPw2ukB
         E//w==
X-Forwarded-Encrypted: i=1; AKwUvByNYHRmPqQecUfk5mV+hFuIU+3jXAhAlPh+SXeXyzLZSGnKvZ3D4mt7QuhdRWGiqiAhole2uQ5As6Y0DrEh@vger.kernel.org
X-Gm-Message-State: AFuF++nqUYYVEdTHuK25an8jBz5Cd1/K7cJKmFqtW1+TqDxfgK5hYlr6
	2CB+T2INMZUTLT2AWNT0fvGZlctJb2wfZJvaB5WRJW/VZpxVKOUGA1UUfWzZqzNRi07k7xL7y7V
	0BhX1bEtvWS9uCKkW8yZ3g9Vac6C9pT3BG20wMii7gw==
X-Gm-Gg: AYBFou3VtKGmlx9+nzBqGdWLceGJdZHEauzy3709a8z6qSvFCTtidK3413GV3uCSGn+
	sso60JTQsf0Cq+Q3TBgaFIS6VCwb/mqzqsH4VGdvcDxb8UqigjJZo3JK5m5HogFuwg5HsLCiZcJ
	LTKEznHs7zsP/DkARnb54yQuS2YRgW2+cBsc+0uRf05s+V04CuQiJpes9kwpo97rdh6JisNUf4J
	k+pHYGIBcAat7sReutW9+kSlsQhkaJJlMuOHLZkhtmK9K1gkhFvw8MQGkRtgHGirKX8KmzwyPox
	NLwXxejsgcXENyE5BP0CyzJ0gEMvfLE/l/tFS8l6UTySh4KsuDt3f/72v/jx20e0kd8=
X-Received: by 2002:a05:6122:3295:b0:5c9:c60e:3a43 with SMTP id
 71dfb90a1353d-5cb0c04d686mr2341350e0c.21.1790288046416; Thu, 24 Sep 2026
 15:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924125940.22665-1-lnicoara@thinkoid.org> <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
 <CAAhq3a6OV6+Z0p=qVqpUiL-QoP92fYTsf5MBQL-f2oedddW=Dg@mail.gmail.com> <d617c7b0-e6e3-bcc0-7ea9-5b955bc367bf@marek.ca>
In-Reply-To: <d617c7b0-e6e3-bcc0-7ea9-5b955bc367bf@marek.ca>
From: Liviu Nicoara <lnicoara@thinkoid.org>
Date: Thu, 24 Sep 2026 18:13:54 -0400
X-Gm-Features: AclHuK9Ny-J_xRX3edCHYS4smybOTebjsGXoFfMTc6mVJ9Lh1EVgnmD8m1H0i3E
Message-ID: <CAAhq3a51vkfsmjsLSyVBydzLrCAEW0mUjXMAPqzGLViwVCS+Dw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Jonathan Marek <jonathan@marek.ca>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> in this case, while its playing with the wrong volume, use /dev/mem to
> directly read the value of the volume register and then write the same
> value, if that fixes the volume from 69 to 81, then this patch might be
> necessary, otherwise its papering over the issue like I wrote

Done, on the unpatched driver (v7.2.6, stock lpass-wsa-macro, booted
with iomem=relaxed so /dev/mem can reach the macro at 0x6b00000):

I played back a tone that I changed from 81 to 69 mid-play and the
volume went down audibly. It read back 0xf1 through /dev/mem. Then:

1. With the macro runtime-suspended, I changed WSA_RX0 Digital Volume
   from 69 to 81.
2. I started playback: it played at the 69 level, quieter.
3. While it was playing, a /dev/mem read of 0x6b00414 returned 0xfd
   (81).
4. I wrote 0xfd back to 0x6b00414 through /dev/mem: the volume went up
   to 81 at once.

So the hardware register already held the new value, and rewriting it
with the path running, without regmap involved, is what made it take
effect.
