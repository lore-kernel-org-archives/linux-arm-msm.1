Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574802;
	b=rQxnZfARpIKjVEdgBTJofi2rb7Zo9q8PPLUASfQbyyn55kknl3YLIZADUGTKUdd7wT/r
	 xOvmkPbaqQS1jfyKYSvfZsfiRo+9LlFZoEcTyMAb7UGGV1koRCtY7c1DGG+mSFLa7ttWc
	 hivH5/L8K8rKaazcuFwXnsbuCGAK9wRomh+7d0xMPDxx+qCkhnxcMVm0ZPXaTr/IBjAmw
	 vNh52MHxkXe1QHJAopeoU67ctsre5nXlc3XwyEc4fcQt0B1c3IdsxYV59buCEh3f1iCrv
	 hoxA7WuXMtM4NCUuXp5RtoZ1pMmiZ1xhacnBJTxnDhzWKKG1JYfa0P+kGAtEw9VSwWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
	b=eRftmLvMJCiizZEmBfy2LzN3aIk6s1vrbwaagmhicENb/635EbgGD772nDEwWUy+SQk4
	 RRWavt+43evgHrdnl1FvBKuGtjmiKJL/8Dhhm7IbDR8zpqA2DestjznMVYlC/Dnm5u5Az
	 8smuwP6qn9w8322w4Z5hsrAbwT+5+i5mpQLhNAkC5TWqnQUU0rv7GOZzjo9CNwGSgom7y
	 EvFF5mFadcjUhtAonmbT4HareT6pHaZkZtp5JqXRUmmt9KV5ytC3dYcYtX9m5fe4m/UC8
	 lm5jwb5umPG3a6iOAlVa3gmdzIbK5EqRqgr/hhgmM4sXIs2pkrEfnYU5MWoDwO2wfeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UvD9jOHk;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56C0606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B56C0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UvD9jOHk
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so166602766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794574800; x=1795179600; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
        b=UvD9jOHk4SiGf8rkczNn6Eu5dUIyL68LeD8TP0a/E8TFSluP09i1lj2STN+pBd1GXn
         r0uw9Gl8kUyeEgYwk17G4cuf38u7C24RUDfNbWEB3MzjNyM/6nbDz9Hgmi2xs/rV9rrG
         nob/zKmUNGCENceo5OPAplZ/3ct4N147esrwLqNg6j9sc4tDO2bDrXTeu0NHcpwmGHr4
         RyPPSLA5iduIrS4kXN6Szy/UMAP8J6zqbvLrKjW3T6gG40ajhCHcQtfkhLBriUwm2UPA
         pTzPn4HtoaIgXkKNwiZf2qCLzhOe42cXmBhbgp56MJgl7crXxsm4WaNRgdtQ65JxISFV
         A+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574800; x=1795179600;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
        b=iQLATe1c01dOfJkmaeW1ea4X90IKbMBLORXKmcb1aTD4ph94bSdOE6dB6n81Q3SE2H
         gy7JMZzEei1pmKv9+nEithB+BCmFNS+bs34jDVJW330vvK0U7GK8CZZGaLfGE1vgOPwS
         yBUT/8VypwrVMJXOgRB3laQlhJry3wmR4knJe37vYgj//KWS6iptoZsvR48ql90zUHhh
         770PTH+5Vx4HIYhxsHj3GOrSp/K3IA1ES49bm2qmBH76ynKZLfbtHD29aU6IEkQ99ubV
         gr+ujBYY5zTqR6CSM+ImwnOJYB3csOUSPtKGVewrYwCKekDVwkMPCsv5Q/xeo2hVol1r
         WJEw==
X-Forwarded-Encrypted: i=1; AL+hErHr6dlQTTsbKHGwo8R4xoqhMiLSHtzbfd204HmagYS5fUBuc7DIh/Xs+NjXZ0rWFm/GtGgT6YcI8uqH5NLh@vger.kernel.org
X-Gm-Message-State: APuU4Z8ll1QYgKTWcTAPbrIZqgRDRcV5qlfhpdJvAHlM65+AGbg8aKsV
	d30gGnmcwDhTW9EFGogoKN28jVtG1PkZrFF2SGWF8H1o7/jWt0x3LXjvwekStEdp9Vs=
X-Gm-Gg: AYBFou2W61KYFV7An8Q+aRvx47/nMY/reUvqwdxQk2k+WbU3BDV1XSoj2iE34aKVI8Y
	UQOQ+91KpxL5ch2v+hTRyZA1q5TLGLarbc/caE9FKNAjAjAbsefY0RAowpNCt82v5UH3uKvyMFV
	k3hHKdDKuPZ614OdWiVOG9jEnEXLJqW2PtSXcPTY3WeIoJ5vr4rgF6I5lXRIs+QFVU8KiKexE2D
	8mWM8LKsFD4fFGbnQM0I7eILq64u2mcWIscGLMXXxGd0x3kWWzl9G1pUqCRwjXyGBLtxe5veIHz
	eUcqBOA5R3HORGJ/lR83zF5ZQzbqjg4f8pVpVPGNMyksxXJ/PaG8vQ77155BemWjP//TvFr5yZA
	J3n9gGcYAndpqetX2KnP+9pXYp8sAuQoyrG+3s7gMZqhFAMSeD21EPSt9e0UNBlwO+xyjMj59Z4
	sGflH9yO3y4ah2em8hkJohxDy3IY7sdB5cdmAU10giAWqu5wT6jrGIqBgyvq2hfP0x05Kz5EKsS
	ENoXZlMG0wizBKyB76Fpmo6F8VaJq9DQU8+W+ZJYGNU/FefYuei0CgaH4RJOVpJDX34Z4FEHnEJ
	pIcqvW+nip7MikwhAFh6H1io4afp3bDZ7tVwnnrp94aTYXGFiBJOaRdpUiaStiv4PiAT0bTIyg=
	=
X-Received: by 2002:a17:907:9624:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c509614d513mr218483366b.6.1794574800110;
        Fri, 13 Nov 2026 05:00:00 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b6f6eesm88283366b.63.2026.11.13.04.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:59:59 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 13:59:58 +0100
Message-Id: <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Val Packett"
 <val@packett.cool>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>

On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
> Since Linux has gained LCDB support now, wire up the LCDB regulators so
> we can turn them off and on as desired.

Actually after some more testing with extra patches, it seems that on
FP4 the touchscreen stays dead after toggling the lcdb regulator, while
on FP3 it works perfectly fine.

So please ignore this specific patch for now, I will figure out what the
problem is and re-submit. All the other patches in the series are still
good to go in!

Regards
Luca

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---=
------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 37aa272019cc..d592bede6a61 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -72,14 +72,6 @@ key-volume-up {
>  		};
>  	};
> =20
> -	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
> -	lcdb_dummy: regulator-lcdb-dummy {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "lcdb_dummy";
> -		regulator-min-microvolt =3D <5500000>;
> -		regulator-max-microvolt =3D <5500000>;
> -	};
> -
>  	reserved-memory {
>  		/*
>  		 * The rmtfs memory region in downstream is 'dynamically allocated'
> @@ -784,8 +776,8 @@ panel@0 {
>  		reset-gpios =3D <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
> =20
>  		vdd1-supply =3D <&vreg_l1e>;
> -		vsn-supply =3D <&lcdb_dummy>;
> -		vsp-supply =3D <&lcdb_dummy>;
> +		vsn-supply =3D <&pm6150l_lcdb_ncp>;
> +		vsp-supply =3D <&pm6150l_lcdb_ldo>;
> =20
>  		port {
>  			panel_in: endpoint {
> @@ -925,6 +917,20 @@ pm6150l_adc_default: adc-default-state {
>  	};
>  };
> =20
> +&pm6150l_lcdb {
> +	status =3D "okay";
> +};
> +
> +&pm6150l_lcdb_ldo {
> +	regulator-min-microvolt =3D <5500000>;
> +	regulator-max-microvolt =3D <5500000>;
> +};
> +
> +&pm6150l_lcdb_ncp {
> +	regulator-min-microvolt =3D <5500000>;
> +	regulator-max-microvolt =3D <5500000>;
> +};
> +
>  &pm6150l_wled {
>  	qcom,switching-freq =3D <800>;
>  	qcom,current-limit-microamp =3D <20000>;


