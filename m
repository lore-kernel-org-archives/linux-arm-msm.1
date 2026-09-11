Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE344BE42D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151785; cv=none; b=Z1/RLSlGkJSg0llCZxaQSRei4dxa+GVzfpPLeozid9J2eNWI769ep9wwLMe/+oU610MzLZiWIkUpi5Jw/mPQesydY+9ueWds2hNn/4zw1zqBtK7vL9mmMO+zcLQ44tLKTJKuPQsx3Ro1ON/N/KygjxIbvUxSnrGclOchs4Ummdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151785; c=relaxed/simple;
	bh=lb/Hv/vqEZyIorfE/AOb+//fnEmSJFGFf+2xZzLtrZw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EKh9qrH3FfxH2sZ8HJaM6aarN9Wmts/AdGahHKS7NQAFHQtwjsE1c3EdKIkJJJXBFstJCndq5NK3ScLAr70diKuJI2LArVTNXT5LgAjBHK/J2Fn15EnqG93d0nBg/bBM82/7wV99p/Q1YlJq5Y4xW/VSEG9e6WkydcB3evV+vZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ok3D9HET; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ok3D9HET"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6712bea5c91so901696d50.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 11:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789151762; x=1789756562; darn=vger.kernel.org;
        h=content-type:autocrypt:in-reply-to:content-language:references:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PQUFlReksbLvMHzOhaRbAImsyhNtxAatqnZZuEpJRhA=;
        b=Ok3D9HETB00LZJjbTP2QGMb1ptro0pPN8aAAjVCA2fBG1Fg0gtGTEX/WE6XfeJuzBs
         4clY52MucBPwLuKtfU81nee/V3LtJGrg1xZh3oHUxCX+c0qG7irf7djKtdsplESOjTPX
         jEAnBJnNF3NganAv2YaX12hG+sbtqiDyd69xjs9UHMIx9708GLilzxVIGbICfysn0rgF
         rf63IOF8wbQHjro6Sl86XCOscOg2RbOqXIbTJ2aFD92h4qkRtgs0GvZHJYu8GQhM1cmX
         z7MjQF2XeHW9QhBdfDbeJMIIfdl8IoExDKNSKOtNMuOXG26VUvZrsISTYJwBVO8TuL6u
         gYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151762; x=1789756562;
        h=content-type:autocrypt:in-reply-to:content-language:references:cc
         :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQUFlReksbLvMHzOhaRbAImsyhNtxAatqnZZuEpJRhA=;
        b=obORjEYn7p+TdEGKSYsFL6WALS69LW1kYtd5IF2HsU54YN0dW44tlEgNWU7lBez8Xs
         J7PoSAUtjWy614kynY2Z3aEOItRIyU6rOiTeE5ooapW7mGJksv1yTzTYjMqha42ixDTE
         SMjZ9OMbmDvvOwjdSy512x2IsFG9+uz14h9Eot+sK3IM216KnBFhYY/jLVW/FVx8KzcV
         dR7ET8RO4YpK2nN7LvN8G7Dh2BTzxhBhulQk0tWKQEGx1I9/6N3j9DWKb21jmehMFyGf
         BJ8leVqsc889mL2FWqvca3C5IIFB43JECXI1M+jbNK7vW/BX7JAwA3KVIrjYJN2D39cX
         KCSA==
X-Forwarded-Encrypted: i=1; AKwUvBz97m/OrYElpUdjRgnDiyGGKDYAUU4t7XRUHWXMgj+n5zWv/FQ/RC0zGeX28gq/HDuqUqSq3GxsYC/mCNeP@vger.kernel.org
X-Gm-Message-State: AFuF++lsYQ2bqiw7zdXSHN+U+LVLroIrtXKxWCfw9PSgXoOA2AC59+TN
	CsDJcX/9KWKSXuVvbdI55e/4XSCDAzeuG9DABAvNsHvL2zDghtezcss8
X-Gm-Gg: AYBFou1Ccp376zrHP1gznGmqXIHuMRby1iHHRV2V6qhShVVW5j6Klx8tkWZTZXoQJqZ
	tsAcERUc73IQvV+KbntNo+MsPmW9Y5ZQzpdkFDSaRL6tZyDpqBZiPilx9jJYQTAgClU6ZeGKeMf
	h0hZmCa+blB2Lp/0/zLKhu7iyZicZdiJPAHp9rbAD8gN306DC+wNculTJySEns2mOtJuemK/1FN
	G4FRKhtPlYOMv5+Iu2GxtNnkMuEa1yYDHXGAKxAEA7Eh2iIwyySgPjOw2/TKlMvmMzi2812K0Du
	3cIHzp4Ot6i0iHDrD6mvrw62SglIdl6zmqeXEK7eFnmT661d87rxN2JL6FIDqtJrK8NddstyLBI
	aD4BThZYDM2IukvwJr4aCXXZzC1l1X9PgxMK2FaPmsk+UmaN4GGfl/Ry3cj5P3ZxzWPd458Vi+u
	uFjjTHlVOSeGEd1X2ItbKiiSPxbJySqYDOgCk0rsfWVkUeCbaYYOXxlP1ymEkVVIpPu65LT1ZoR
	g==
X-Received: by 2002:a05:690e:dc6:b0:671:3261:b0ab with SMTP id 956f58d0204a3-6713261b143mr303786d50.96.1789151762005;
        Fri, 11 Sep 2026 11:36:02 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125db747esm1396460d50.3.2026.09.11.11.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 11:36:01 -0700 (PDT)
Message-ID: <c08519bb-b912-4d34-a164-5a9d65162716@gmail.com>
Date: Fri, 11 Sep 2026 14:35:58 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: Re: [PATCH v7 09/12] crypto: qce - remove the BROKEN label
To: Bartosz Golaszewski <brgl@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Eneas U de Queiroz <cotequeiroz@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
 <20260910-qce-fix-self-tests-v7-9-cdbd2718af14@oss.qualcomm.com>
 <20260910143140.GA5719@quark>
 <CAMRc=McDHXWRfYTwRasdBCXMnoVkXK9T7RB+gBNgCsGof-euyg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMRc=McDHXWRfYTwRasdBCXMnoVkXK9T7RB+gBNgCsGof-euyg@mail.gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wVAkQh0BYR9c4IMoAzf71N0A"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wVAkQh0BYR9c4IMoAzf71N0A
Content-Type: multipart/mixed; boundary="------------0OOUWZtcuQBwgLiyOlj8YQdY";
 protected-headers="v1"; hp="clear"
Message-ID: <c08519bb-b912-4d34-a164-5a9d65162716@gmail.com>
Date: Fri, 11 Sep 2026 14:35:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: Re: [PATCH v7 09/12] crypto: qce - remove the BROKEN label
To: Bartosz Golaszewski <brgl@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Eneas U de Queiroz <cotequeiroz@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
 <20260910-qce-fix-self-tests-v7-9-cdbd2718af14@oss.qualcomm.com>
 <20260910143140.GA5719@quark>
 <CAMRc=McDHXWRfYTwRasdBCXMnoVkXK9T7RB+gBNgCsGof-euyg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMRc=McDHXWRfYTwRasdBCXMnoVkXK9T7RB+gBNgCsGof-euyg@mail.gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT

--------------0OOUWZtcuQBwgLiyOlj8YQdY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9/11/26 07:14, Bartosz Golaszewski wrote:
> On Thu, 10 Sep 2026 16:31:40 +0200, Eric Biggers <ebiggers@kernel.org> =
said:
>> On Thu, Sep 10, 2026 at 03:00:50PM +0200, Bartosz Golaszewski wrote:
>>> All self-tests now pass.
>>
>> Have the other bugs that were reported been fixed?  For example:
>> https://lore.kernel.org/linux-crypto/20260723202704.GB110634@quark/
>> https://lore.kernel.org/linux-crypto/20260723183438.GB93534@quark/
>> https://lore.kernel.org/linux-crypto/20260723205342.GC110634@quark/
>>
>=20
> I will get to these too. For now, the series allows the self-tests to p=
ass,
> I assume it it's enough to not keep the BROKEN label.

Personally, I think the driver should stay BROKEN until all the
known bugs have been fixed.  The self-tests aren't enough for HW
crypto drivers.

>>>  	help
>>>  	  This driver supports Qualcomm crypto engine accelerator
>>
>> As this patch would make the kconfig option visible again and would
>> result in everyone running "make oldconfig" being asked about it, it
>=20
> I don't mind changing the symbol if you prefer it to avoid any accident=
al
> `make oldconfig` carry-overs.
>=20
>> needs to be fixed to accurately document why anyone would want to enab=
le
>> this option.  As you've stated, it's actually just for "testing".  The=

>> false claim that it's an "accelerator" also needs to go.
>>
>=20
> "Offloader" for lack of a better word?
Could it be called a "decelerator"?  That would give users an idea
of what to expect from the driver.  Maybe explicitly mention that
you will take at least a 50x performance hit?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)


--------------0OOUWZtcuQBwgLiyOlj8YQdY--

--------------wVAkQh0BYR9c4IMoAzf71N0A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmqkSg4ACgkQszaHOrMp
8lOJcw//ZYv8AEBDFni13+DfWwnPh1wU47dii3Cvw4PPVNbr2gUyKxFsCRgqib1D
9NtqoDZYnVN5wgO1m1ON/FzOAzwXz2SnTySdSKiz3t9ycF5vjXFw7gFHFgpmnyCf
Kf6mYLxy8ot4i+ztZlucGTyQwwbqkGONrPQIwcDIBvTvOmr2kyQ6nAn7xYlmK1uW
ch0vUXjWCpXqkWThuEYhPOCEYkM9Y3hsFVVwrBQDZ2n1gpF6LvrJHdZ2zukPIRWH
Jo6hHRXk6JUn+SOTT1EHLxzfgQB0aWmT/8oWiQFySyYKeI5GgyfTOCPXV9Rz84Xz
MSaLDzYpHc96r1UWjLE5tmm8DIAjmHsDI8GeImxsjm3PCX2EjPiX2iVhjYdmtEsD
ZrD30/i+7/6RLlBvrrv0KVD5tQIJ9qhnkbk6BIBjWH+wfmIwSk31txLWUIv2ZbhY
CltiKKaZeC1aylgkePOSqPchiyIbSifKCjbi9XC1jcCmlIwOi+i0Z2349/ja8Kfj
bpb+pF5MsqbVf6CZ18Z+04nn9Ym4UsK0uexdDxEwy+oJEroGL5HJcEDQZ16NKY/x
hWXVvFMYYxX6NNVIMqgiqNzFnFF0iL09ib+ujMhGbs+2GaedN8TGZCYkJHl6J3nI
QCbvoNl1bFlb2IVbJy8jafma0JplLC37IMKDlu2u8cgkhXE8iKY=
=GS2j
-----END PGP SIGNATURE-----

--------------wVAkQh0BYR9c4IMoAzf71N0A--
