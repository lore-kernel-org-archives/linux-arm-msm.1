Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867D168BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231730; cv=none; b=AdPe7GD8tcpJm+kL0W7T9bYGdai9H+a/7ORac1qofrHw/a/iZpraVk0e6RNQEi3zgaJNnFEndNbUsr4vQlfXmyE9sNN/hkMK6aXFMF/0pxzY2saqedgBtQee2clMPn32ErzkpVd9Bxe+ZZ06hG+0cdw4WC4uTxfY2LVP68u5hXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231730; c=relaxed/simple;
	bh=xTH5SRivTOjKCeZK/CQzkS1OrhVK53Hs5nd5Py0Ytbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qewtEUn1/xD/DBvRqL/NdpHvpMNmk6/5gK6/UZhZWcl5M88ovid/fTCZmh+lLjYeDSxuq7FMKYqpaHk5uS5QcK28HyW21feV+o7aQ/uIcnVLq3XyzoHRwt8L8tBi4lSf/t5H7LaclwHm8Kt8EvJErdSrs+ZF29SoB0biLctID70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Q58FR6VM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Q58FR6VM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f0ae9572so29333515e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784231726; x=1784836526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFJ0EpzatP7/QvJCIqNNnPldKAnCwWETMXqW+7ClCHY=;
        b=Q58FR6VMHsD4Fg0Ya3aDFIisk7ZWa2+yoSJebEVVvSpd1C0x5Vgrkl8rK7+ZkydyZ5
         kHMcKYXGl/ej2po7pSODXahWNOzee5WrTYcRxhOZID6tj4TJ2oBdbPzpG2PrRn9CTxKj
         kuGxqhJsGJYwzqFE+LRy/TpXb5EiDu9kNMeXj8AzlIIKZMJgXjJLRYYUJck4k2wKtpaN
         /Y9Uvi/sEc/gV30gm7AAgrtsh4m9GWvfEeOE+ZL/lIufWNivGyzAWH0J5QGHOdHp22a3
         F8tHh/DfGJCsOV/G1/7EAHZATEE2ldMiASBfqezPjktUV53LDxHrNqZIx14uTW3FUAki
         F3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784231726; x=1784836526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFJ0EpzatP7/QvJCIqNNnPldKAnCwWETMXqW+7ClCHY=;
        b=smVgb2OJvF8hjW9psLzD8d3Cyn91R8sDnLQ635EIZ/85mV/UA8wqaIMHHlZaRQ4WfN
         iOjW2z19U5m8uvufMSZBV07QKhlbjVEDEsPGWI/cPU8JSTgBUB8kug87+a7xda9X9WeO
         1EQKfIurgnbxqR3MNHs3AqQE8yYrGFQ52Wf1xQrzyaWBmMDxWadLGkKug6csFkIGUio2
         RGBilcz0oychprxKlW/PSALqR7GUIcoorn4Mnnpp/+NTX7moceAMWtuB6oDzEs/ji72j
         9XERX3xmyDHp4rryzMby5ExAwWzZlGr5c3ejC8cR0t35tPAVwtWWgDZv7vtpcusbbJWY
         dmVA==
X-Forwarded-Encrypted: i=1; AHgh+RqvE2MIdpJwxDXtu7rD9bpYMCWAS4p1fAbeYsLHSrZtJQnaOQLU7psI0+xs3nzlr4OW9JLMC1Qfcysr+3WA@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhipgBIMucYf3twNLb+67G1fwCtpBba4zu+qik6Qz8e9rti4I
	H7vIrDsVj52gNVKs0Zew33MFEUuh3dYU7ELUPedd5tX2nkcu4ovo+FOs6k6GlC2SHS4=
X-Gm-Gg: AfdE7clzixZUNCeaJXyskLa58MdklQ0ctCGwtSNh3oSPB5Jzt2+VrlEFbVcAlKlMZxB
	wtcBPnFd/a7ByQrJ1/kH9ds/W28Cf8gwoB4owNU+Xj9gx79UxbU98ToB0uLVymYBOemr4wlyGvT
	BJKZGrMKVZuh8XyWgAqtPSUEMtgAxkgxZsA36HzCRGD1FpJ819h48Al5Buyzryrc5GvCb6Vaw+R
	dkvudDYGruQLGu+EXAxHpqyeAuFCpqH/Yb6feL4Kl8C7yYvJkhP+uYO/ZvkxwQZBziMjRjeG6L0
	E17XyZH4s7rclFDQlBkraEcliX2NrvdYxHkxgDFdEMPE+fsCT0yWV4/bQihVKlHIrf8g4vtDg9R
	++Q8MnS+/ISRgsKFXfK9fK/xzpdLEnLO2Rc+XT5tCyliVS9Mx8ApfSjUN1PD51Hc1u8ab+tZRH5
	N/UigbcN8=
X-Received: by 2002:a05:600c:8b6d:b0:495:3fc4:81b4 with SMTP id 5b1f17b1804b1-495403fcaadmr65609285e9.30.1784231726263;
        Thu, 16 Jul 2026 12:55:26 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49547988756sm14556025e9.6.2026.07.16.12.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:55:25 -0700 (PDT)
Date: Thu, 16 Jul 2026 21:55:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: qcom: Drop inclusions of
 <linux/mod_devicetable.h>
Message-ID: <alk1--PeUJ7pKbvA@monoceros>
References: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
 <alkt62x8pmKE2aKi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dqkq77d6dtuu255e"
Content-Disposition: inline
In-Reply-To: <alkt62x8pmKE2aKi@redhat.com>


--dqkq77d6dtuu255e
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: qcom: Drop inclusions of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello Brian,

On Thu, Jul 16, 2026 at 03:15:55PM -0400, Brian Masney wrote:
> On Thu, Jul 16, 2026 at 08:21:05PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > The only used symbol in these four drivers that is provided by
> > <linux/mod_devicetable.h> is of_device_id and this is also provided by
> > <linux/platform_device.h>.
>=20
> I don't see it defined in platform_device, unless I am missing
> something?
>=20
> It looks like the reason this compiles is because of this chain of
> includes:
>=20
> linux/clk-provider.h -> linux/of.h -> linux/device-id/of.h

Well, the chain for <linux/platform_device.h> is:

	   <linux/platform_device.h>
	-> <linux/device.h>
	-> <linux/device/driver.h>
	-> <linux/device-id/of.h>

but the more relevant thing is: <linux/platform_device.h> makes use of
struct of_device_id and most consumer of that header (typically platform
drivers) need struct of_device_id. So it's very sensible that
<linux/platform_device.h> is enough to get that definition. The include
chain is just an implementation detail.
=20
> > So drop the unneeded include which brings us
> > one step closer to removing <linux/mod_devicetable.h>.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> With an updated commit message:
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>

Does this discussion convince you that the commit log is ok as is?

Thanks
Uwe

--dqkq77d6dtuu255e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpZNykACgkQj4D7WH0S
/k6ljgf1H7m6MuWzdTL3PPS2CmQmF0zqeBZ7EYoM32dLL1e9Yr6O0gFZNZwnGWrr
tTXctZ1u1LJslAfnJ/6Dyc3meHNXlgpOFxJYuQz8G01n/eYKx2yCEq7k5MIRoVj/
qCTzcuywXdlsDwyVHYyiONlBfJjgVTdMrCENFPObWTjqs5lZkMgaajH74RlF4b6b
MbJBX1BmlzgPPw+8RTRDvqQUHl/LsXgriWDQb7pBqCsLuCMfVags1CbYsxDdfN1Y
8VxyKMELO2a1sj6odYEekuTUpZ6JLjwXgR1yne7k01KkyfXAbJyUBLTVInv2jvtr
k6tuCpT2Maqlu144x/WffOSo8CSQ
=XhNj
-----END PGP SIGNATURE-----

--dqkq77d6dtuu255e--
