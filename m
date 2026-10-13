Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52B330ACE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869957; cv=none; b=VdLbHn6WN4W5XLpwgFZ3TBA0RSsO8dBJVVNpkrmCLtzydPDkg+ju5B9AqbHeoop51aYvjg7Ct1c7D5bMVhvMJuZt/ZrHLj67W3NcFLNEbcGduD1AgKTEnuC398OI5uKH2EUrxM3z4OFy5NkKHmWhiSIZ1xSq9X7rESbpnHX0+9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869957; c=relaxed/simple;
	bh=d8oz8IfjHSSPFz6zRAoFmMxFVc/XqgQmfirLnRNRlSI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u98DW8aUOIMBdMGrqBguds3A161NzRgFWFGP0L+knb9C9Igrv34ztjeExBJI9SFqE2xj4flyCv1gMGCKNQCiRblXEfRTnHyCZm+LPun5EgSw+8mLDHz7jImEANWctGUAmc+mGrfNWZUeRmHTLCLNGpdlJ/T02s34jOk/aLr3Gfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=FweQbrl4; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="FweQbrl4"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CDCFD3F323
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791869953;
	bh=d8oz8IfjHSSPFz6zRAoFmMxFVc/XqgQmfirLnRNRlSI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FweQbrl4Xcb8Ae/BmvzY3ojgIPFJTECkIJIuT2AG+E4oDxeQK+rTE0rA6RDG6rTSu
	 3h0FliMMGQWu7u8kQnw+LbGcmLquTNuVaafjaQrqVOBov6R/XTC5/YdHVmPZklI8iJ
	 vHrfDpHE5KzRc1cv7Eg8duTjgqz2qtrIctZ2wDJmLaJMyYrHJKZ0ggZP9qWgRPIKwd
	 jvJ4kwVCdeoMmRS/N1lu/jTWZt49sHfBibTPAgcDQErTwA/7WuGpLhoufvuDb3GOf4
	 P/q0r7KyKRBVSoSEaezDw1NKFHDt4gBP2cF/BlU4AwJrfHGJBidsxFcRS/t0RObH9C
	 TdwAicnBl2itxJQ7oUm7ceh9KRwIHwh6NzwE+QsASEolX+sZdgvmuS5mi3CUfSfMdo
	 Z2PSInTwsH3yo6To+BExMT1O99kPHWnSSNQzQDCgD3h/zNYOALDrUZz3BFyYAZSqGy
	 GcilZB8whUYReiLKH6hvVAwU8KWf5Dp9n2X1ZG9PjTOSic93z8MOdxH5DffQzNmysK
	 l3SFi2+0pCVD6gbA/kkzBeZc3lYiFO+Ggjh4WO2g4Ci434Q9BTJBwKB66LfBqCmYDb
	 PKCJLQNWUmNGNHP/q53o27PQQNBjudb52TAieitOLzIi+CHi5ObfiKitf8AKYBE3t1
	 vW6b9bMXU7ZkZIdArwVlbAeU=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48afe000b94so1993619f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 22:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869953; x=1792474753;
        h=content-type:mime-version:organization:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8oz8IfjHSSPFz6zRAoFmMxFVc/XqgQmfirLnRNRlSI=;
        b=sPMh2T7XN9ghA4rgaZI0IhaKBvG614qVHbImaVbb0aHvYwxEVmbjpLOXqqxBjGF76K
         XzAk21Wc2hWt2M31ZM3/ma84/IiKLjHrqUYWdh2X94LlA0OnsmfVnUldMV4k/W2ZE0aD
         H5GoxDDbilek4g8XfyIWFfufgxZlFouKRwQwrH9j/D2bUmNgSNwHMWWIb/Tlu7s2RPZL
         XpIIRfEsWD5Yb2HkKyqhGay6YoPCWr08smEnkB8fR18D6uHZ0B8VGLQ923HwJKubz+9L
         4Fx78wuIbSN/VpCJ7indBK944Lf+4lpJMN39Dtx6p+vrSzzSZCiltiNXBaTKqs1Sd9ti
         pUnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9GUm+UJby+NJIU2BNNenmOxkmOT5mO98unokyOKQMjuV/m8rBeT23oOxQgs9+kRT2t4Y/EGqx34FV16tS@vger.kernel.org
X-Gm-Message-State: AFq9FYKp2EmMnVxnaDVXHRZZmWhBvmMWcDzlixcqfqkAuPBXp9HX3uXo
	NAs0gef8r0sIDhwfvCPX8c7cYHdkgpYuiSnzZEsov3w4OxVEIkc5w2MXCMC/3/J8PTWAi6PsDR/
	cqYZstJn2SbOqoZ6ES8rKlRTuehOp8acTRS3w9cRVlA11MH+Lv1uGdnG/yJzLR7Voa6srO71lyN
	DkFGGv/T4=
X-Gm-Gg: AYBFou0OceYhPGfG718ibP2XfDdg+R5IRndrz+KKw95Xrkn3kTaqe0EroUV3Akg0NRW
	SaltLWxAGbWGa6jsk5ft4DSM8rI4APrPSDgDa9rDU6Fs4wb7R7UVG+oWazKgXpOFUppjeRe8if+
	XOGDwlzZ+Fd7ZfCnoxTjc64LuBv25cl4xme/kSenUSXJs5BeFm+chpjJaC0eqZd1xeEksBTHN28
	9U3BOsjrPgqvuW2nRO6tdQoC2dDb60dBYGhrZs6KCFT1SIBjiU05qZgSaEgO2XdOphAEcx/B3f+
	dRORTNvu7mERZqueLRCURwpVDeEY3+XgyQWkR8cJQpIyuIEyMSnIwCXQuBdR3Zx3i3yPOPC2OQZ
	i+VcB95/V7UvRlzOulnUjpbqthu+1o7g16i/fAnoZhFfTVrchTO5Q
X-Received: by 2002:a05:6000:288c:b0:487:73c:3f9 with SMTP id ffacd0b85a97d-48dbaae3908mr17887196f8f.22.1791869953365;
        Mon, 12 Oct 2026 22:39:13 -0700 (PDT)
X-Received: by 2002:a05:6000:288c:b0:487:73c:3f9 with SMTP id ffacd0b85a97d-48dbaae3908mr17887087f8f.22.1791869951510;
        Mon, 12 Oct 2026 22:39:11 -0700 (PDT)
Received: from smeagol.fritz.box ([81.221.225.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm2977480f8f.36.2026.10.12.22.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:39:10 -0700 (PDT)
Date: Tue, 13 Oct 2026 07:38:56 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop
 omnibook-x14.dts include
Message-ID: <20261013073856.40fc2cec@smeagol.fritz.box>
In-Reply-To: <3hc574blvlfxelyvrki27dc3pjabf36vc3jh7muiisz7cjuvbd@qv5cjqvao6he>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
	<20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
	<3hc574blvlfxelyvrki27dc3pjabf36vc3jh7muiisz7cjuvbd@qv5cjqvao6he>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b42gS_4XJSJ/_VJQENvUI3y";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/b42gS_4XJSJ/_VJQENvUI3y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Oct 2026 22:11:56 +0300
Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:

> On 26-10-08 20:34:46, Juerg Haefliger via B4 Relay wrote:
> > From: Juerg Haefliger <juerg.haefliger@canonical.com>
> >=20
> > The EliteBook Ultra G1q is a different product from the OmniBook X14 th=
at
> > happens to reuse the same mainboard, not a variant of it. As such, it
> > should not be a child of x1e80100-hp-omnibook-x14 but rather a sibling.
> > Include the shared base platform dtsi to match the other OmniBook X14s.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com> =20
>=20
> You are also enabling the some remoteprocs, so please mention that in
> the commit message.

Done, v2 is on the list.

> With that fixed:
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks for the review!

...Juerg

--Sig_/b42gS_4XJSJ/_VJQENvUI3y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmrNw/AACgkQD9OLCQum
Qrd9PQ/7BXmdRIOviHrj93ggZaLcFp1mBuCNCM20n21ieNbBOxsGpDgBvApeONYf
huyp/oFfZ+xgQzludVksZREOEq7CexdstRC+/OWK7gL/mv4djo5GNDQA3RTq/CX6
RdJIujt9sPbzPDe4PVenoKDEdSTMrvrsK9ET2S/Hd5lioV5adzZruoxbNybac/ms
g1iU6yTqi3zZihE1CqdDL0JNtMtJTu1gawnqFEUtd/zg6QQIX8A5bLzdWubWugXv
NF1zGvv0tgDedAbd1UIAftsig0UOTMOeHzU+CKgfT6s6bPXi55F/V2P5hcVGkEt8
FU2KSj+ZuKY1L8D+sLIqfQ8g9rgHOp23kdW9UBQJ3oxCwuKidtY6+lrp958zq+6a
zL6ujyRJd4tkcA2pgAmY4/QKe75sVVkkvSev96RdR4TFBPdJqfSN4JE6jDv1txYf
AeM9q1KQlSxi307dO5uvPXGIasTbp8Qe5YGd6CvdvGhzCLu0Ronjv4E1oRpj7ENy
lMcyPxdYcdMuTpGFBQlrWGYM9YcDZbj56p7Go2KqAn7+zw93vsKAuDVpvoy1E8gw
JO1hR5oYvJTzCvP7b8/3pMFq8sQ3uCNH+H0yJrmJKBhzaYfxblP1PINgipH6C9/Y
K6Rs5tR1Lddrbz4rVm01vO09QoZ8lJkyvAYmrZ6u8AcN09gSm98=
=AR0I
-----END PGP SIGNATURE-----

--Sig_/b42gS_4XJSJ/_VJQENvUI3y--
