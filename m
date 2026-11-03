Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744078;
	b=dtJUzxFS/zf6hYcLfeDNSdYGSq/C7T8S3hci2EVFtRRzUEPkoW0/UssRu2RXjMa9QviC
	 rtPpLQgbeaG+F4Vejd5iQ15avmQIeVQ0uRQiDzBhl5Vw5Hb2FLE/OypubIlK3xbjWqvZO
	 fswO7VOJfnyTodENtgG+NOFmno0LkNATH3c+1smE0LHjv5umHOIZnjrvC0HjKriGXpOQV
	 8zoTbbu3nxybbaI7xqiAKaVyfEkNJCketKFgjzZQoFtRcrnohc9eYGL4S3qt+7CWWlPCE
	 vpO+uu2Yut+oVSKlnH3re+qZDdo0U+XWRynlVo1j6AzTetxBZx5l9jV+f9CW74Ab77Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
	b=CHMFqSHbe/apNCbgkOdK2SYi39rAYkgiF3P6cBLJUfRbq4eOPeToevzKhrui1pNSH3Pf
	 3GRPtT0eHLCjLput/j7UscGWpgGwxg5wCPhftTpBeAcCd1O5DlBsie4roMtfe+Wo/jR91
	 99PQix4IICClQugJy+cfkhGX8aXDPc18GIrv8nGm2+IwtQm+XqUOBsmbn4Z2k2HXx+RgQ
	 LXLy1e0kl38QziHB6tdarQfjI/FbxYBNPcc5Es1WkI8L4QhpboCoi+jFQa8jpP5rNppYR
	 639fJp9wviXbtx3TXrK4QfG6TEZWmgmYPPxT4j3YeH38eMnuzgO9MCtcCPbadFBr/Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S+wRv2wK;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02059606A328
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 22:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02059606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S+wRv2wK
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-54465f79af8so164541cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793744077; x=1794348877; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
        b=S+wRv2wK1q+ylMssFA8QEQJbCrILnVnOTvEbUvFi2wtCpN2XJC/RHGpvN6sCyZjVMl
         gcojuE3280oN1+PAwH+r10TvObtAUJhCxnHEarRySD29DR1V/P06L98L7at8YnclsVQd
         UbDY8pG7lEXqe5/rb9EADlFAzzW1qe2F/EXr6AQDjGUS01HfEKW3TFpVHaNyjAGzPJ9r
         5BCzQf0BrggGkIQ4hWOOKKJlW3oJ5k5FYg9xPKmwP0ohO7Wj1oMZVE7eugD6AVsNQZ3W
         w1WVO0hYf1RNuiSzYTdiYB2/IRjqSsjHrQQNMMU33RRrJEmNPQEI0/P6Q1w1SDBPiXrw
         Eukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744077; x=1794348877;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
        b=zGB1vkKkIKfDMmQrLL4rYsLo2BDskL0VNT9kU5LA3mOMfphOade7BKWDo0+MK/C1SX
         KKADZoROUpp4b8+OK8EfYrxsm67gOWn5wrZOTCJhtIWeY7VeIexNqIiwotF+OYfhG8s3
         x8nXrxRxkbwZwuEvDkhOc2IHJfpy69XqymvplGQ/6dsz7W8GrhVTbR+tANw+8OUdJxBi
         lAYrqoRoDNlQPuCdZMHzv2FQSI6JhJfx1oJRNeV/F5Hdtf7+uif2eFoXx30zZTR3KJL7
         wu1Nu9wSYlo0IobTINu2l0U6PVhAP9WWfxm9rN6l5G6oT4mpRN7AM4lzgik5QFl5VBGZ
         v6cQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoJ2AkQ+lCLlujKvxYQCJxcPfj/0SonCWDACv8D9L6JVaettKxGEwlfUmPDzaO5LHQr9pduM53dbHaw+AA@vger.kernel.org
X-Gm-Message-State: APuU4Z9mUT+L/r5z8xw984bZTAI14gmcxm8KgSaeJ4RITwfjLaiiBHAg
	4sIZq0Lu5pSQbOiIJ+9YClxmTtg+gFjC8r8o7sTs4I6b8ZiL3+WtMc+m3TwnKNSYF0k=
X-Gm-Gg: AYBFou3DSKaUo0V3vSDvX9IBt/zqzkRpw5MrTAjpKeGtrn1fJ+74YxNLWCgdDfjEoBI
	3msjN7hVSkQ7chmYUivIMJzZ7cYURsPRfhps/SiCd+49/SuYGl94WxCHo/zehFVCq2oHAxM9MOj
	JcMaqKsrZFqt8k859O4W4Rd+t55IM1qTdaR/TX/u/gQ7dTFj3RH1VTa8X1+8DDTdHSwHcEBiQCD
	uL77UUqv/OAMGjavvJpSr+v5LjV8gB8jGst6dx2dtTtXbVW5TYcvNSWmuLlofMqFRVRnK2S4rWJ
	NPxF/n5kTcYMUnYXuYEgaofJy9o8MywtWI7KHw0OVN4S7Vh+YtXFVLFhj43Sztd+CqTlMx3aM5i
	V3z8Uix9N7cniVMZrxKqcS+Fm/nyYjypvIpKSYV8/9P8rskJJ+I+Al9gDyr6YFEejcO+3b4OyrC
	i8dE23Vv5arwlOu8rbwXLTJoOKzG0J9g/EVfzCnCQT/H4jvboC6PPfwF830bqbftH884P6Om4xZ
	lsO0Zjfny8R9wXhZmuDU4ua1+3I6ktYLVOr0zNjabfcMT1oKTXCbzYHS6JpX0M9LYQGS7jNcVJG
	B3KWrn3lB0JTFwfjqf+tht0+3slDIOXmkGUb7w3AECREU41O7mJ12JMGo/p08MyHiUC2/r2T6SL
	g
X-Received: by 2002:a05:622a:58f:b0:532:b3ce:f38 with SMTP id d75a77b69052e-542b3e691femr241721551cf.4.1793744076882;
        Tue, 03 Nov 2026 14:14:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b1086db63sm7077331cf.11.2026.11.03.14.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:36 -0800 (PST)
Message-ID: <3d6f4b59b49112b4c93fed08f7a85601458dc9b7.camel@ndufresne.ca>
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Xilin Wu
 <sophon@radxa.com>,  Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,  Abhinav Kumar
 <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 Verkuil	 <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dragon@radxa.com, Chris Obbard	
 <chris.obbard@oss.qualcomm.com>, Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Loic Minier
 <loic.minier@oss.qualcomm.com>, Jason Pettit	
 <jason.pettit@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:14:33 -0500
In-Reply-To: <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
	 <9YPKYT3Qcls0jbUWdxOqIWNLjQSGexDoWWE3PUBiJS3UpxTN9rFeicV5aeaeTDyrXqw8emy9LBK0hkxmeEqthw==@protonmail.internalid>
	 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
	 <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
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
	protocol="application/pgp-signature"; boundary="=-WL5Tl81B56C34oK9WNj2"
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


--=-WL5Tl81B56C34oK9WNj2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 22:57 +0100, Bryan O'Donoghue a =C3=A9crit=
=C2=A0:
> On 29/10/2026 04:58, Xilin Wu wrote:
> > Clearing timestamps on error buffers prevents clients such as libva-v4l=
2
> > from identifying the failed picture and can cause synchronization timeo=
uts.
> >=20
> > Preserve the firmware-provided timestamp when returning an error buffer=
.
> >=20
> > Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop fr=
ames")
> > Signed-off-by: Xilin Wu <sophon@radxa.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/m=
edia/platform/qcom/iris/iris_buffer.c
> > index eb8de60c1177..f790483d13d4 100644
> > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, st=
ruct iris_buffer *buf)
> >   	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
> >   		state =3D VB2_BUF_STATE_ERROR;
> >   		vb2_set_plane_payload(vb2, 0, 0);
> > -		vb2->timestamp =3D 0;
> > +		/* Allow userspace to associate the error with the input frame. */
> > +		vb2->timestamp =3D buf->timestamp;
> >   		v4l2_m2m_buf_done(vbuf, state);
> >   		return 0;
> >   	}
> >=20
> > --
> > 2.56.0
> >=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I'm generally ok with the change, not that I think libva-v4l2 is a good ide=
a,
but we should not intentionally make userspace life difficult. Userspace sh=
ould
not though assume that every OUTPUT buffer in error will generate an CAPTUR=
E
buffer with error and copied timestamp, this would be completely off spec.

Nicolas

--=-WL5Tl81B56C34oK9WNj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaupcyQAKCRDZQZRRKWBy
9Ka1AP0R8nbzNuhXJb3kDXY4TjuPqdCINWuaAR03XI+T3+Rj4wEA8JM/izovKNbb
aWez0IzFR/4tzcgFC0vw+v6Xqr69dgA=
=gql0
-----END PGP SIGNATURE-----

--=-WL5Tl81B56C34oK9WNj2--
