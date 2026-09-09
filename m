Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A10446847
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940529; cv=none; b=socinD/+rw+jNbam4MERw7Lkuh6X8PQvCnuOyz5SeL8ATANC07WCmabtO9SiKNcvpjNZsOsa245I/rqCNxNFxB8cGa7KbTGrTgwtrx8e2YWUV9LRrJjrmpfJUEeH99lWHFYivwF1M57vD33iC+2Ml4R13EDiVNBumoPbztO5/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940529; c=relaxed/simple;
	bh=6Le2F+TUQ+TGRTEKnK/S8sMdwbCtzHdIIGXQUR8JcLg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pJix6XAHJiJecLl5pGyVzwJxQK0qb/zBo6X/LAXFecWN16QBE4hvpIhtuCOwz6dE09QKLrCF0TxxpoWR4qDPBIJj6rutVPrFh2XuIDd3npC/iaWLtgscw/QHmGL1Pso4NJ1KXoiLlNpVLXjfKHHKABNPutxU0Sgd96+9ck/4+qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=DRmalh8K; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="DRmalh8K"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2D75B240101
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1788940518;
	bh=6Le2F+TUQ+TGRTEKnK/S8sMdwbCtzHdIIGXQUR8JcLg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Autocrypt:Subject:
	 Content-Type:From;
	b=DRmalh8KOEi5OCcec/0WB+ATg/+EI4CnY+E5NNKRcRu9JK00CUZThDQcKe8tEkT59
	 8o2r9DTDgk5rbMLMwlFLHEkMKxAzsHS8w/1SHqRXEbGtXWnbocO3O90obOICBlNNPs
	 ZOWbdarTMhP8ZPS6cLwcvVtI6mUDmz6BD6STneqGVKgQ4g1LG1bzp4i0fcszQWg4MT
	 Jm6+uDHnAssUOd/yqxHRUqG4Uth1B50UUZ6RdqKRO32sM4eMmcVrNBc0GcYZziIkIM
	 ObuishwhcvYxT7am8vF2puQkZ3w4uXTqXQ2KzcKw2yYzgu5OWLLFZIZhXDrGG4xrzm
	 0PnwX+fH/zhuQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hftQF3nhxz6twb;
	Wed,  9 Sep 2026 09:55:17 +0200 (CEST)
Message-ID: <d8d76226-1abb-4b28-a2cf-b47cf83600bd@posteo.de>
Date: Wed, 09 Sep 2026 07:55:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: de-DE
To: konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org
From: "D. Heine" <ds.heine@posteo.de>
Autocrypt: addr=ds.heine@posteo.de; keydata=
 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
Subject: Yoga Slim 7x Gen11 (Glymur): hard reset after X.509 certs / before
 init
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aWfvz0S8b9qHkugCtiuiJ3L5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aWfvz0S8b9qHkugCtiuiJ3L5
Content-Type: multipart/mixed; boundary="------------4G5lfYn5QcmwkPI6g01EJKRp";
 protected-headers="v1"
From: "D. Heine" <ds.heine@posteo.de>
To: konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org
Message-ID: <d8d76226-1abb-4b28-a2cf-b47cf83600bd@posteo.de>
Subject: Yoga Slim 7x Gen11 (Glymur): hard reset after X.509 certs / before
 init

--------------4G5lfYn5QcmwkPI6g01EJKRp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgS29ucmFkLA0KDQpJJ20gdHJ5aW5nIHRvIGJvb3QgbWFpbmxpbmUvbGludXgtbmV4dCAo
Ny4zLjAtcmMxLW5leHQtMjAyNjA5MDEgKyB5b3VyIFlvZ2EgU2xpbSA3eCBHZW4xMSBwYXRj
aGVzKSANCm9uIGEgTGVub3ZvIFlvZ2EgU2xpbSA3eCBHZW4xMSAoU25hcGRyYWdvbiBYMiBF
bGl0ZSAvIEdseW11cikuDQpJIHVzZWQgdGhlIHBhdGNoZXMgZnJvbSBodHRwczovL2xrbWwu
cmVzY2xvdWQuaXUuZWR1L2h5cGVybWFpbC9saW51eC9rZXJuZWwvMjYwNy4zLzE2NTUyLmh0
bWwNCg0KVGhlIGtlcm5lbCBzdGFydHMsIGxvYWRzIHRoZSBEVEIsIHByb2dyZXNzZXMgcXVp
dGUgZmFyIChQU0NJLCBtZW1vcnksIFBDSSwgVVNCIEhJRCwgbmV0d29yayBzdGFjaywgDQpY
LjUwOSBjZXJ0aWZpY2F0ZXMpIGFuZCB0aGVuIGRvZXMgYSBoYXJkIHJlc2V0Lg0KDQppbml0
PS9iaW4vc2ggbmV2ZXIgcmVhY2hlcyBhIHNoZWxsIGVpdGhlci4NCkkgYWxyZWFkeSB0cmll
ZDoNCg0KY2xrX2lnbm9yZV91bnVzZWQgcGRfaWdub3JlX3VudXNlZCBlZmk9bm9ydW50aW1l
IHBzY2kuZm9yY2U9MQ0KZXh0ZW5zaXZlIGluaXRjYWxsX2JsYWNrbGlzdCAvIG1vZHByb2Jl
LmJsYWNrbGlzdCAocWNvbV9zY20sIHJlbW90ZXByb2MsIGFvc3MsIHJwbWgsIHNwbWksIGV0
Yy4pDQpjb21wbGV0ZWx5IGRpc2FibGluZyBzcG1pX2J1czAvMS8yIGluIHRoZSBEVEINCg0K
VGhlIHBtaWMtc3BtaSBwcm9iZSBlcnJvciAtNSBzdGlsbCBhcHBlYXJzLCBidXQgZGlzYWJs
aW5nIHRoZSBTUE1JIGJ1c2VzIGRvZXMgbm90IHN0b3AgdGhlIHJlc2V0Lg0KRG8geW91IGhh
dmUgYW55IGlkZWEgd2hhdCBjb3VsZCBjYXVzZSBhIHNpbGVudCBoYXJkIHJlc2V0IGF0IHRo
aXMgbGF0ZSBzdGFnZSBvbiB0aGlzIHBhcnRpY3VsYXIgbWFjaGluZT8NCg0KSGFwcHkgdG8g
cHJvdmlkZSBtb3JlIGxvZ3MsIHZpZGVvcyBvciB0ZXN0IGFueXRoaW5nIHlvdSBzdWdnZXN0
Lg0KVGhhbmtzIGEgbG90IGZvciB0aGUgRFQgd29yayENCg0KQmVzdCByZWdhcmRzLA0KDQpE
ZXRsZWYgSGVpbmUNCg==

--------------4G5lfYn5QcmwkPI6g01EJKRp--

--------------aWfvz0S8b9qHkugCtiuiJ3L5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEZOmYwxmlFm+8AGEJJMHjAmsFpOUFAmqhEOQFAwAAAAAACgkQJMHjAmsFpOVg
GA/+OusH8xQchfJ73kQAA4gBG6Yky2Oglg84b/Ha89vTpMiAMRJPMZHV+HwAHdPM/k95Cv1rjcFP
gNQFYsy+QTiIq+dPTWwzYxHVveIE1x/2fbjB9qFL3yH3ENBtXFRZbsoU62m3yw8dKgYVnt60hZX6
xLTPBVF2c53LCD/jAxnCZm1WI3yILhq8OGk6kT5hQsmZa3lnlFcAKp/Cg972sgvNgNlD4T534U6e
dYo7/3GHuEqo1tXfhkEWbp8P0WzqIn+YQmBfzVUjd3fTj6FboMz/bAz89ETCgk8mah0W6ULDgSgX
9X5UfPp0+g8JfGNccQe7Plgk82qZdNsUq/c5ALqUyWepAFIBUs2fGCifnyle17I2qQZLctzsaweO
UGOx04PHwgaw3XMJB9QhAKCXaTN4aLz2SYerKilvUMc7dcd7ogqLNwaLkdG3k892jSjF1m+kDEYW
v0oGiegqnKt5SWXTYu+8wPLWe3OvzRu61j5juKsNWui1TcYeId5NuHosv7datTlTpAPi6a7weR+8
NqfDKchzboEm/yiQUzhi0+9pZeCHFNKuLWKxCwnHYBHWHcNR8SffMoh/wtCEUfNH1tomaWM9Cgzq
nZMhVrdtfPRgPJUQMCm4TlHwETxc1SdE5lkCm9Zq6+mB8xT+FkyZiZTaJRl4rmO44QwUGJsDdkGf
IkQ=
=C+6Y
-----END PGP SIGNATURE-----

--------------aWfvz0S8b9qHkugCtiuiJ3L5--
