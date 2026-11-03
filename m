Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715571;
	b=PFk6f5F5YfAetR7VY698bOLnQn9dcfi+LqhhZIqQ+6KdrdRqCw8tipkR40gBeuHUtQae
	 OOT21nr+TY+orEMRrXWypVYxqwwJwdTjuJHo7eT0yq9WfzNUdKuv10OEkv656V5DOgd0g
	 4ovAswV2VkBUx2iIiv4U91LwBx0pnzXaCBuipvEC+QqN/l4l4SqgSRKRE+J3PEi5kHgEx
	 pfrcY1cl4GnIrpABuF1YkYODadI5v96uiCnhx84sGoAMNAmIXHuNH07zB2BZDU2hFn4I8
	 m6BeWrOZpJlJMbbOeula9phLavtQP5rJtB6hh8BvS5WBHpxpV/2DN1kqCAC9CqGWcqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
	b=sSUa/9paRbf9KRYhOLHdXGHQdmZytTiIh7pDxU0gvlXrUN12Lm6yZKDVNDL1Bv1wgT/S
	 OzjkpMaAwKkI7iCnpxYtdT4lvR6lIuFO8/nL/tWN9JHLo6CNDw+9qhcE1iVVSRN3WobBH
	 eCwvyF+BOSIf73anXdPt1gHlmu/tynVw5wdCwP2a+6l3dQYUmuJaWA/VChFBicb292M9+
	 0Z7zkZR3hd0GSOlsqa9ne0WprYm3gND5hgQEna5vMbfwiRivbqXfkXweQWjtq/cGa1QSg
	 sWH5DARYof7/jrT0v59Z8bT9zpEsmHBVgNx9xMs3hoGdizq2ufowt2mp5XBcvQi8u8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYVuS7oN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE0606D814
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EE0606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYVuS7oN
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so813266e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715570; cv=none;
        d=google.com; s=arc-20260327;
        b=fbcJZASxx0mmp6TrQOoIbk8+QjOU/ftGlliFQ3WgnOF4I8TCo/UBeU/5zr+T9Rdc/g
         dQm3H0ELk/kHggjjcG0NXOrr8f8T1c/G+Ro4pP+Drm3PdEzsv3IWtbUvLXVd1t2q+dak
         wAFrKiIC7gu1Tmd/yENOZ+iZdi8kNvK/A3zwAcnsFKKKz+co6wbDdVJOoCbOHacuMAZl
         R/c1ZiDvyfNsAgyaYYEPLT8cw5b/Q7NHlq94tqZkrOL9X2xaXq0+4YmircrGW6B0P4Md
         rSMg7xnkS27XgWnc+7Lf8y8acG3fpJRy7S7Q3vCFKaZjxSD6ir8kcIVeCYLludbCJxzy
         53tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        fh=IGFkNXFEcAjWuuaVUffhMhV4H7FWEWmxf72VUu/DfLk=;
        b=ciiq1bMhXc2Oa+QfO2mELnlscjUAmgVtWTwfgI8haY04A1MBwb5rCTtvi9i/d1Tc5U
         GlOQM2LXxQRQPnWQ0u8UbIdm7WvnBuQJKRwRZLgTOxnELWD0NVj96y5HhSBhRdRxTqdh
         VrfVIvUpiB4PnxTa5Ogr00nM9dRjnlvsoeOcOBmMJwhmjEZdvuay3mRckn9UnLTHyOr8
         C1DFHCE4j3SvfsFh6eQH+yEYuo8qTrRTc4/lYKaHh7NH0oMbn59PEDeam4Lt6oc1PpC4
         Xgo8itSXdja2WYTiplF/sXkaQOlkwiEhxvHAilCsVFNeoisvNc9JH6jFqsUQCFcXUu4I
         Y2NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715570; x=1794320370; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        b=nYVuS7oNjAC5uc7MgThJnLihQh6ecZjNLU3BG73OcVWyDUz/zUpCmKWRdP3Uw7XMsU
         oyjqxVh7rNpgq2yeuVgz346VhA+PrdpJSYX3reNs0H+YTX1Qrt7Atx4AGdLblnf6DXGG
         QUQzf8Gy0xw+PKLt5C3B1MoQFqqGyW3skmOqmH0avdWqG1m9nwVwXE1maS2knPLmckGJ
         dBobYx2IV17qf4yXHSfQG32nQxeiCXnfGdLwQe3G0kJ5mxE8oH6XcqlA6uCDdGdPO7QO
         OWDpjVMnu/9SCrw8VCHgJSW76JtDOenWUU4kWrwMoWCMsSboev1GDzWn5fdoRGOtrOfu
         Bh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715570; x=1794320370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        b=gPAGzTlTcINUmrenyGrUzQmmrhYnJq7lVa2MBTgB3OFgjs4e6VNL2GQGIxuouwGwnQ
         ctSe7R0O0dj3YoyOhyTAW2irUycxpeXrctbsrklhL+Sqs75CAOZ54uSSh/Ff3O/eIHgw
         XJ87V8A7adKqeWmPaba/NKWg60ABfYWZPgFtVuTqbHMrNDGWH+BZe/zHNG+g1Hwl5jxd
         uF7IFjhlA7BKWcJIbyQxJ4/FdAvtK3+D2P5a/BIvUrrZ5//G2q7EzX1kaMJDyRtQE4NU
         4kzpT/P+mCwavhQGN2Ja/mopO5vTSixy9Y6E6s75Z+ytjUk4CRIpCSGxRFbwvU/IkYLR
         +Q1w==
X-Forwarded-Encrypted: i=1; AKwUvBxvUPOXWyiKOHpB8p1I9z9GtwpqlCy1xX1ly35bmnbHuZS7K/ro5+pqb1DVBEYRwGwfSbVU+eMqll4Tq2UA@vger.kernel.org
X-Gm-Message-State: APuU4Z++qsvv7FR3a/F9+hcO+nultEgnNzbJzogDi/vkGcyb/yQ9MZbX
	Guor4Tc5UTnL1B7mIxERVZCxaA8xzsBJTUaO3AC4kKyLZ6nME/a8ti4U3jQcYAFeEirQIRgHUYf
	A01ObaE0+KhN1x1Ly/venL3aDkCQr75jzd4ADO8GrXgBG
X-Gm-Gg: AYBFou2K69pJFHFZtrYGMxJaZtf3pmibD97ejojxyy3LGlW5GfMK8Bz5r1m49hpxFXk
	ZnwVXWuiUg1U3/BQpFoXff154BjRN2yLn4BPfWBE8HdRLmGSSnj0qFf7LaLWO4Va8gw++VCThDU
	M02ZxysT3iIBxoeSfFiQQYWRYSR/B+r6XgZZc7T76WNPVBeIVpy6FAjnHy+bVDCcBW9wsyTnhfe
	uChS3E1x5278cX4COJXu3XAok2yCI+4ZCOJ0LQPeT1WXpY5uGw0FT80ncbgbT5WKGXWHbom6poe
	q2KSi6KgxSSPPG+R9ITxXJ1N2IHwSLNWebkYKJmabSSOm2P/VlcYx0sf2QKF7ueDH3PWyT2U3qA
	9V1XDaN4WM1RMGc4va3lyVI/ynDVkdMyOM2cfM/Ky3zmsOf67j3WTZOA/nxXN5R4iNHlA9Jvs3H
	xvEGx/ClKQzY5Er3eFbZ/wZUDp9kTRTAic3xO6GBj/l52WEF3CDKdm1YBtFToYpZvCHHjNJUzyI
	HoJEzNTYKjpjAyFLZnW2BvG2bvMpMqzmbXgzxdfCtIj
X-Received: by 2002:a05:6512:361a:b0:5bf:d2aa:abeb with SMTP id
 2adb3069b0e04-5bfd2aaacb1mr3055248e87.20.1793715569649; Tue, 03 Nov 2026
 06:19:29 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com> <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:19:16 -0300
X-Gm-Features: AclHuK8iuWx_PT6P7N_TCJlCYwfej936uif1OBa0Pk_vlcx5ZLqlhS-8ZHFWdXc
Message-ID: <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Subject: Re: [PATCH v4 01/25] accel/qda: Add QDA driver documentation
To: ekansh.gupta@oss.qualcomm.com
Cc: srini@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 01, 2026 07:37 PM, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
Hi Ekansh,

The document reads well. I only have a few wording and consistency nits:

> +The driver binds to the device-tree nodes described by

The kernel documentation spells it "devicetree" (no hyphen). The same
applies to the other "device-tree" occurrences in the file.

> +4. **Context banks** (``qda_cb``): creates a platform device for each
> ...
> + They are created before the accel device is registered

"They" is ambiguous here (the platform devices or the context banks).
Consider naming the subject.

Thanks,
Daniel
