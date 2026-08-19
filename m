Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621A4779B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152253; cv=none; b=e2cjGqHAaa+QFB0ciPPwgwCDZ20wOr3afEbzAgT37LhZVLp6cIIC94PWWD1nvk/dI+7oJm9EdTzlw9zvIRGWhsFPMA2x1T2HpP5a1N22Qs7JCg5SrQvNRVb+moq+TzBhzajDiFBthgw5MRWJtELnDeSq0rkpPf7FHS1Q1UJX3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152253; c=relaxed/simple;
	bh=F3lvj/4K46bjW1es84GGKG+07YgBbrH+81rQje8Z1Fw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OzdK0KnB+iy5vuXAUhBfEEDYISbTBwyjAPEpXL9rv9tNM1DGvVSGfcEhE+nkmUkVCTRkhjHHL4bErEJBSNNrsQR+Z4DlEGFpUekwoYAb1o/mDTeOKbjlzkJ37GS3WydyHnltcXmAxzx5Aya07TC7LSxMQ8oEvRZoP1qN7lvD2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0BZqN+7B; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0BZqN+7B"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso11970555e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787152247; x=1787757047; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TxPC8vpecxGJhj++hKRNkt6aU+0imcHu8gQy6A/MCx8=;
        b=0BZqN+7BNXeOJUuBVGwz/rBIsng5haAaHIlMG3vGqobQXHPo3h2Rp6DmLbshafwEOZ
         iV6t4/gKYRPEXY4C6Sfl8hsT1v2XKXaN5hg4QUHo3x3lHyS57230P30ActpoqXjbSvkc
         M/Y3E0TQw2Cqs/m6r6to/pxar0lihu0BDXtCFAq4yyz9+mWQXlNIw6E9Y5egk7YSXyBx
         MX/VfTcRtUJSsP8piVMWJHz/uxeBmpgo0DkQN6L5Kdc9mX6ffHvhK+PTFJIBwFNQS2+8
         Ax5EZLmKi54PlJddJQPEE7IWrW15zjs3lffZ56JOgqxKFu7laEeaYFwBokUJ1dTcbA/E
         Gksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152247; x=1787757047;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxPC8vpecxGJhj++hKRNkt6aU+0imcHu8gQy6A/MCx8=;
        b=BhdRPNKzn87toJJUDw4rNqwxMVDWWrpb14zHoKIhHblzvmIgpe4uUJhdVKUxqhsKue
         NTOAkzYB3IGQi4yN4zkInZt3T+jqbUhuLY45Ea5t1AxyBU3n36n1NhKxfXFcroJfGrxk
         r/ADGCc3/+D1gwG7s+7JdfHIDWUL6Iz5G0NfjQpGHH+7IgW/Reph4xF19KXUbqIaK49n
         9NXs6Htlf738YJH8gHl1mhTSJgbMM/fSyiEtE4NhTva4r+New5vq1LmrUIYdVOneq2u8
         tt4pcNzMltMD0wISGfJvcR58CehQRmZUktyZwy5OaTszDcNy8xTFUcEKDLX461POfU9S
         h5Lg==
X-Forwarded-Encrypted: i=1; AHgh+RoRi1TJEXJs7nkCfVhtEQy3sSpX4w96n0dPfk3ry8BFZNii1ypAykCMS8kqnFwi604qMtBVBGoGNtATtvh/@vger.kernel.org
X-Gm-Message-State: AOJu0YyTU6CcPLfsfpbSM3ZK3cCVHn2xTKzOb9RzHdQ8wKDarukSWWhQ
	yUTxx8KQj3s4pfi4pKElphehEWTB6prK3eOjQjXQLA70pgtgCdRdIB8xXO8MCJ8EyjA=
X-Gm-Gg: AR+sD10PoBDDFLWZAsDHhO7lq+dh/oOTVLV6YHkpiPPb/7Z7/A4VNJih+51qgJHEIjk
	oAorYdR7RkzYeoFR3KvHeM+jwEUZbPQSz5jRE2c5CkAAgKvGu2Q+TzIkeL0eFwyDYcU+y+dvYv7
	lhOLN73Z9YsKmjvP71+aYwCxT6CO8Bi+XXfnfYI++QKsg3k+gqQor77xV+Z6NhquDbQ7y/8sDDW
	SpSOctwkBQoN7yoCz3lVOO8WpC8glT2EMLzUzJYOGvVkLWaA7OA2O28Hq68PLWiHXJN0RGU8zkb
	ySu3ckgqRZ3cUOgGbbK12KgCc06L9CKPSHvU0KIhTlDnER2ieO2SXut1doHVZTpEiD4ZTCRNHih
	d6A8zZr2zp6s4NJPIrBVNT6iZSft9ywIXrC59aM8cp4ozczPVQO/9bRwRUn7t2AM3570eCyRCFb
	YaVHjTfGQ/YtIE6e7lcXvXovFBoJC/rN2oeGYjLh4kEJr8KXOzjM1+p+iKqyKCqm4E0kcV0Ri+I
	DMscPTxjJkABI3C0A==
X-Received: by 2002:a05:600c:4e94:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-499aa1b549cmr97313725e9.11.1787152246988;
        Wed, 19 Aug 2026 08:10:46 -0700 (PDT)
Received: from localhost (pekko.lucaweiss.eu. [5.180.148.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e784a4sm68071005e9.1.2026.08.19.08.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 17:10:45 +0200
Message-Id: <DKT0LJOID8PS.2NZUSIK66M1NR@fairphone.com>
Cc: <david+nfc@ixit.cz>, <krzysztof.kozlowski@linaro.org>,
 <luca.weiss@fairphone.com>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kristian Brox" <isyourbrainfoss@proton.me>,
 <oe-linux-nfc@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260818205940.1973944-4-isyourbrainfoss@proton.me>
In-Reply-To: <20260818205940.1973944-4-isyourbrainfoss@proton.me>

Hi Kristian,

Thanks for the patch!

On Tue Aug 18, 2026 at 11:00 PM CEST, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd-i2c (raw NCI). ese-present and
> uicc-present are unset; those links are unproven on this board.
>
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index d48cf38b7..a485edd24 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1006,7 +1006,14 @@ redriver_ss_in: endpoint {
>  &i2c9 {
>  	status =3D "okay";
> =20
> -	/* ST21NFC NFC @ 28 */
> +	nfc@8 {
> +		compatible =3D "st,st21nfcd-i2c";
> +		reg =3D <0x08>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <41 IRQ_TYPE_LEVEL_HIGH>;
> +		reset-gpios =3D <&tlmm 38 GPIO_ACTIVE_HIGH>;

GPIO 38 and 41 look correct.

Some more things that probably should be described here:

LN_BB_CLK2 from the SoC is connected to SYS_CLK from the chip, which is
the reference clock input (clocks =3D <&rpmhcc RPMH_LN_BB_CLK2> ?).

GPIO 39 is NFC_CLK_REQ, the External reference clock request signal
Honestly not sure what it's for exactly. But if it's similar to [0],
maybe it's irrelevant.

For power supplies, L18B is VPS_IO (digital IO power supply) and L4C for
VCC_UICC_IN (power supply for the UICC). I think at least VPS_IO should
be modelled.

VBAT and VDD_TX power inputs also exist, but they're both connected to
VPH_PWR on FP5, not sure how much sense it makes to add them?

And yes, as Konrad said, SWP_SE and SWP_UICC are connected to SIM1 and
SIM2 respectively.

[0] https://lore.kernel.org/all/20260811220135.472380-1-jorijnvdgraaf@catcr=
afts.net/t/

Regards
Luca

> +	};
> +
>  	/* VL53L3 ToF @ 29 */
>  };
> =20

