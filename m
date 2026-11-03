Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744980;
	b=xWUQ4+b2HO8R1eXe42qOt9jlq32yjjG4lG7471nY352ZmfXorQQLR293PwSUZANwgt/p
	 WFUjNJlefgVPrgOWG37je5wO+rqWRTPLHkjP3czqLSI67cw/X2r6kzCPkOXKO0eby00nj
	 HJbEw22mjZB771/0oLZnbHZE4huecP582Mvkf7pHpfQ76uCj6tr+QSKrhtsfTo/HNq/fq
	 y3/AQX8gu/ufrxpk8SGsCmLGxOhMgalDtevqTT+3JFyO3fFc5aid4DBxavxGBKEOMfqK6
	 EjSJzL8J3XT/yj2ae7K/GRqtVC5gfc94lv8PxqfmppU4nW3E+uArgaxlIn9eolsEwZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=IHoHcKx6mBDnMZc4i5vRaDiGlQVTMQ8r4RGlyDdnzgw=;
	b=3r5XijtMbetQyBXpp7dz9BrE3zz380+ExBheF1HEbAAWTZKAPwdPzltmByL7GcFaY5p/
	 NmqdJlpxAeORe8ro2dwPIC/SSb0r7Csauq8Z1dskQQFisGyu3oz8e3kVFSL+e5RZJ6EkR
	 5LfsoywSuDunB+yLBzQ1JoshRfBSgb4O51fO0OM15Z79IvgBnhx8tngte+AFGQ/NNVB3J
	 yl3rsrVcvBFoQ8T9Jk9zPRWXbz4w7xcv8niNPhq97DuFthPXlwloe269MTeslmAb7obaL
	 dr0CtgtgglHy1hsMFsGRwo6nfrgWXS0Iqd6xJE5k8uwuLN5nkhQ/Ee19KyUxIZF5SdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="gqC026/b";
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F49606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 22:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F49606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gqC026/b
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-945ae2daa68so147818785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793744979; x=1794349779; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IHoHcKx6mBDnMZc4i5vRaDiGlQVTMQ8r4RGlyDdnzgw=;
        b=gqC026/bzunkmPLRDkDSIuzQXWG56nIq9g5QM2iqFdNRiX/ld73Uhr+uAgnFA/Ou3b
         bsXdkCchx4azDe2dyU/edJgKXNeE1W81atwgWXeEZKN20Hi9QwRSTw70RVKn3TfIpmpc
         WrJYW07ixGKFg3ncE2vvfX9Xo9hCSfRaCmfHkyg7CXBw+PNsvad0Yw+ubUCiOCg7wVnM
         6qYAUpkwC1LW2S/EYv4i4vv5WCItSRzOfbQWrKvvgUIBy0bII20vMtqswvAgrE9GcM71
         eOFSHiRHVrlXn/eA7UjMwBbHF3oc8op5kNo88UfjQCz0uJhnqaAQcTZvSnE9wvYFcVYW
         CHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744979; x=1794349779;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHoHcKx6mBDnMZc4i5vRaDiGlQVTMQ8r4RGlyDdnzgw=;
        b=R0n2md0LVFdxOiq2EW1YhHjsdPtTY8OdVwj4bMcbTO1oWf+wAdaKX5KOyke1A15cox
         oSIK/jc+djpxW5xY3/hcXlZEBoGUy+q4aN59o43erhPFP0UcxmQVt50V5BVV86sdG0f4
         KopWPIB2/N8Ot32XKBOaJPvEQQ2ZVmms6gZpPk4yUMridDb1Npjk5dfVoLkYQptsOGv1
         s9isL6eJTuWSQf5bAPqcVk9806rdYyvnA6/5C5GOYP7ES+DvycNgnhhu4XkWidvTu9E1
         UjDQnlVZsj0zHAy6rBT3T6IOGO4RCWRD7bzZgZ/gNugYPS2pK/V2r0vAZdGlEZDX33cI
         G+bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjlwWX3+tcuRy7YuAeh/inNWgVbBqgRjlxT22YR49h6dWWWHg7Gu+IC/kRKSZHmpWxpttlps6BVa1HkzvY@vger.kernel.org
X-Gm-Message-State: APuU4Z/hDukulApCZOJMARBvdLx4VGPVBSpFyDD8oXcQL32muEk3co97
	7Bzw26R1HKgAByCdBgt9mOqdvLI4bb5TdurY+P3ebVc0aqS0BWU10ZdqFce1+abYvvc=
X-Gm-Gg: AYBFou1JrD7tYSS+wdAnEJiauelRkxNJRSM7yagP+kIQo33haqg69csQo4ptCXgOMfz
	CqfgBQwCHTc0TyMXlaXdrSuUf8ekVpVl0q/lB8OVmShh0f3eCOg2n1ktr3NdcEntidJDTa7qRVC
	W0k10dL1ntvREsyyfDM14+Yg6NEItiYH8juvEzI33v45PBTWnfTXiSNLvN/tYuyKyoP9Q2mjTTb
	DQbhqTvebWjCb/Hd0LItqNBGsHs6fVtsQYNA2ots1B2hIalu+kmTJbx6FwMpA1PttxGF6QqFaCZ
	l21m72s4gogI3SbxhX0/iEhdnZo2/GTJ49EV8oC6x59l8QXLEHgILHVjiK+PXrxDBMwkwtymzVb
	8JJuMScBON5QLccPMZKW7ZLK5NBrO5MCrNWQUYbweK7En/ig6cpqpC5pSl3k2xn4/m46kEctqm2
	swglPcgdeyl+AK+GYtMy43q4C2v34HiqR5qCzPD1M33ush+SoxEsTF87FAuXmO3dZB0y7a+QWgT
	gcBY16Q1QWPAIahc7Bg/1YZhqQEp/WD0lhWzG14O5zOd+7mtVUKXiXyla2nAV59GTIp+I9uIhr7
	zbdUE4Y6a4FiXWhdAx4QVbR17vOmVGHflZf3GJNSQ3Fu2o06mBtjFuo=
X-Received: by 2002:a05:620a:2986:b0:93f:eed:ea4f with SMTP id af79cd13be357-9442175c2a3mr2150152485a.41.1793744978875;
        Tue, 03 Nov 2026 14:29:38 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4852ba3sm41272785a.31.2026.11.03.14.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:29:38 -0800 (PST)
Message-ID: <6d16d639267c69344623f80ea91817308ef4f7d0.camel@ndufresne.ca>
Subject: Re: [PATCH 0/5] media: iris: HFI gen2 features and fixes for VA-API
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bryan O'Donoghue <bod@kernel.org>, Xilin Wu <sophon@radxa.com>, Vikash
 Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal
 <dikshita.agarwal@oss.qualcomm.com>,  Abhinav Kumar
 <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 Verkuil	 <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, 	dragon@radxa.com, Chris Obbard
 <chris.obbard@oss.qualcomm.com>, Deepak Sikri	 <sikrid@qti.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,  Loic Minier
 <loic.minier@oss.qualcomm.com>, Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:29:36 -0500
In-Reply-To: <e0911e13-65d5-45df-9e31-7f99e5600a50@kernel.org>
References: 
	<2a2gB7bYZ9q2UTG-mF855lyJvWdn3Ba6jqrFTEVO1EAjAIXMh7_-65v4XlrZmljww-5ozkNYL2-lWKTIH4oqOw==@protonmail.internalid>
	 <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
	 <e0911e13-65d5-45df-9e31-7f99e5600a50@kernel.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Fe0eDLBPpEZmvHAInadr"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-Fe0eDLBPpEZmvHAInadr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 23:00 +0100, Bryan O'Donoghue a =C3=A9crit=
=C2=A0:
> On 29/10/2026 04:58, Xilin Wu wrote:
> > This series adds features and fixes to Iris HFI gen2 to support
> > qcom-va-driver [1], a userspace VA-API backend for the V4L2 stateful co=
dec
> > interface.
> >=20
> > It enables decode-order output and larger CAPTURE buffer pools for VA-A=
PI
> > clients, and exposes encoder deblocking controls. It also fixes
> > error-buffer timestamps and handling of non-display AV1 and VP9 picture=
s,
> > which affect both VA-API and direct V4L2 clients.
> >=20
> > [1]https://github.com/radxa-pkg/qcom-va-driver
>=20
> Is this code based on https://github.com/intel/libva and is there a=20
> route to getting it into the upstream of that repository ?

libva is the runtime, qcom-va-driver is a driver, so that won't happen. Als=
o,
qcom-va-drivers does all sort of guessing heuristic, bitstream crafting and=
 the
readme show that it cost as much as 15% in throuput performance. Let's be
honest, this is a bit of hack, not really a solution. A proper stateless
firmware and driver would do a way better job and reduce complexity instead=
 of
increasing it. The provided patches though seems to all have merit, matchin=
g
feature with venus, fixing bugs. A bit of spec work would not hurt though.

Nicolas

--=-Fe0eDLBPpEZmvHAInadr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaupgUAAKCRDZQZRRKWBy
9CMJAP4wwoUZlZek+TVR6fbqjnUa86Qg/f+W04lCKj93YBzQdAD5AZFOH9r1I1ZU
9po/9hzhqZIt5G5ASP6uuTikA9wL0A8=
=GQ+b
-----END PGP SIGNATURE-----

--=-Fe0eDLBPpEZmvHAInadr--
