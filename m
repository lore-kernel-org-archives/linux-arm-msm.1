Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237C3A450A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195635; cv=pass; b=OJeXttf96zWC2WFzKpRx9lWRjeOX5ZClKuDdMy3CdW+JVIaw6QvN3PPCn1FHr0SA5Y4cS1EiOgAGknImGmif7q14nMl1p6mrTWZI8WxPRTV36OYwgqadoX+/I5MCWEAt0OJJLnUYzJmEP03bNRo/QG39zxxlRlKBAzGNJ0UUcyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195635; c=relaxed/simple;
	bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0oo3hhQ3vp4iXCnQo9HJEV1Wj3t2MpeqlNWowya+L468eEZxpsaEC18CqeFMcCyxm1UTZhiKePQ7RF/6ZtW5Xa8oU5/uSk5CwV1UBLPDeg90iG9f4C9X32ilIf8UvFNeCesCDI1ymTG5V+dZUSyoph3hsjUxaWEgLfb2aL6VH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1670dad7a8so108922166b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195632; cv=none;
        d=google.com; s=arc-20260327;
        b=X8C26aNz9ba7zptZKEC57Xa/dM/dFroQ64F3WsnRpC7mirELw5zvzGKvnq6MMh1KAz
         MAsQfF8kXn7x27EE0LxbhKKegIFcqjtrv3O0BJQwSZ/V3ROnkd1WukamtjcYn7AAp9lt
         MLo6lUvBKGgroc453khuAiWLrMDSuEd9iNYoqwDKR5kicawKvX48woTzSJDasupzMJrJ
         0igXdyDbXpePJbDNps8JxT4asK8J6aQFcTvnh4LsMOcofDxhBBw97icDORpj2OB1oyU3
         d0KZWrwawfmJYFVm8fOTLN5ICyUN7FK7rtl5tE/n5w1CmZ69q/shtj1nNwSAubbzyQBG
         cZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
        fh=02ger/+hRO9oXciRpZyWORDUeqAbwldc1Yu5+MgmK4o=;
        b=qZhfU42AZHFBD9hzvBtqFITzMfNtsKzEK1oB0CFF/A7UHP6ETFNwzy49ZtZCk9x1u1
         b8wDeJp5oLI5uNuQnDLsbmFZ3QvyKc7U6us4vLYetjIM/KasCwYx7YqsVEyZhJwt+cgL
         5FPE6fMBGd2sVRrFPPMI61+36BSCa9MsB+ZoI4/9gTvT4pvcTvRu1ZeXBr6UkhtR4lxY
         Z00zJp4nN5i4XqzvclHmsD5UkxN6BkChbmaPvrzEKpS7faJ7TLbCEeqV+oQ0b5GuGyDQ
         pRJ2Q8GuX7a097+J2MqRkk1ce53u9OFmQQHuLIofqTgSYstyB9xuN4ERLod12lPfnOK8
         CPbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195632; x=1788800432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
        b=D+Fi6GiqEecNXYgOe9JB2ogwlCkESrycTdtcxHzdSb0wbKPsSUfAwY8RgXc4de+qIK
         DCglqMVvwJCo3mt6xR/h/nmaRJkfc69SwB8Fdl3hwKM7OCGNuSH5wZxA7gcdbUJupZ3b
         ALoM3uWBTDAOGnlS5oU0ga8mLvIpq/ZEkBS86CZ4OV8yhwoNIARvAJ0XY4Ibl+Jxhfnw
         nGSznTWD2isyZsF8icZdbxsyUZjkfGHYPxWYmjaJCFQB/CaMg/2AvyX7f+BY7bjQOz68
         dygLfQ+lLw7WBPLLq1Yv/vpyvZh0PEBvCNMdWU/xqbu96YJdUXQAETFgYxs4ZMXrTmFw
         ACHA==
X-Forwarded-Encrypted: i=1; AHgh+RoVB9UA9olr9Txr00wEu3FoIc7qhaFZtwiFml4yvOt976P7+6ZH1oc1X9agRXBaYSLzg9vvmfHx+DT8WOJd@vger.kernel.org
X-Gm-Message-State: AFuF++kdW8BP/B4ExUFLCceffLSyUekN2w/wnHLfFkDLo3+tT9RQXJhD
	t4hDLkuaN5ScGYLtf/Jw1ZUxur0TpJh+lISLeXz4XIvJC/rt7su9NzweN5S2LriA9+LcUr6zdQ2
	ihen5b4dAWbkvyFhJDWuQYJN+g2x0VBna7TNp+vbU
X-Gm-Gg: AR+sD13khNXZs89Rz+uJedtb4r4Wl1GtIXQzp03/5RgFeAYBWj3FkBcI1SF+Aajy17z
	/B4kYv5xoBCQxfZHvn65iFvT1z/0k2opcrcOcyV+xo6O9nvPChfDKQ9rehS7y+HbrfHv4/DPhR3
	BDXhsZ6uAwAiLCa/EE12duvf29O8nnGAllm5LZhl3M0eRmTXQjIRYC26e8NL6SaQrPJKCxD1Y+B
	u2UiII6GVkXLEW+bNPNtFw4wyefSlR0GtgmGjTW4hRLwfNxb9GtDeR8pW4dJhQ/Fc5eFpyy8Bal
	u3RESb2cmzGsoJRFAc7xqT2fSA4rTWXpem68DcRBpVlqi9i1R1SHat5uiuvxBepH7qw7JYc+6fs
	cfsS8PgMH4TwOBn+uUYbyrPQaEUmvMr6JbCvLBj35zpGh
X-Received: by 2002:a17:907:3e04:b0:c1c:2173:d412 with SMTP id
 a640c23a62f3a-c2556fe9307mr1660123166b.1.1788195631588; Mon, 31 Aug 2026
 10:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
 <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
 <20260830165934.34e5b82f.michal.pecio@gmail.com> <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
 <20260831053825.11f1007d.michal.pecio@gmail.com>
In-Reply-To: <20260831053825.11f1007d.michal.pecio@gmail.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Mon, 31 Aug 2026 19:00:19 +0200
X-Gm-Features: AcwNN1XNg3dD7oaXf6xtHhi299wPsa-ycc5jfTUXGnyaxivHR6JJ0HBY77JeeB4
Message-ID: <CABUBpLdLUbC6nj_tKKq4FFmoVNGJ7MnAhE5=O_S4_fnP69jHJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:38=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Mon, 31 Aug 2026 02:58:55 +0200, Matt Eaton wrote:
> > I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix
> > the issue:
> >
> > commit e3d757dc9257
> > commit 042aad8d0db6
> > commit 7e0ef4332ed9
> >
> > There does not appear to be a need to apply this patchset now. Thanks!
>
> Great. Did you try disconnecting from external hubs? This code can't
> detect that, but maybe it's not a problem case. It wasn't on Renesas.
>
> Out of curiosity, was it limited to USB 3 devices or also USB 1/2?
> Disconnecting one device or a hub with devices behind it?
>
Tested both cases: directly and with a USB 2 hub (no external power).
Disconnecting the phone from the USB 2 hub, it didn't appear to issue
a stop endpoint command, so I don't think the condition was triggered.

Cheers,
Matt
