Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E6342CBA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925514; cv=none; b=fOoK4s7ORZKXGqRvclA9erobgjoDZmI5wBsZRRJ1tST74P8qDlrq0hKyozWYFDYsHWsXQdiMls7ExphncM8LsZeKcvASTFUvt1S7d1LiKU6TyyRDTsEwt7d79MeE+YgbJ8gIJHhjrwZIsd3VwCoKmoRrOY3Q17g6LUc+vRbmauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925514; c=relaxed/simple;
	bh=3UZr+s7uzcW8h1DHN6h7imM0CeaJ4iWPF13rcXL8v6o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jl3bQIJSoj+wUtdWEzb17Eun08bUdFr1tXzH1Doy9icLUBAJ8MUPfP7RrIcsrHrWfakRKjkmhh2/FQwhHalJW1DIJSmRoKvs0TRCBJfjo0zpF8mzz/mRwnizR4+PPGy0HuhkUPnAuyV6qcxQPn9imeLsANwWA6PyN/GsWImWEEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fuhYrbj0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fuhYrbj0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15ec1da77aso318071566b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783925511; x=1784530311; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YzKzbPipk5HuR++dvISXo/Dbcil94rLYMkCRdCOQ1zY=;
        b=fuhYrbj0oakAvtO4aXV2tIokazuHogcH+ITiZ21to9rLb+7IUFQDRVVFjefh0+RKIl
         5ipMT82FDUneFmpyCaRK0+Mi6ZiynOJ8G01m3nphF1RMj1zUf4EJqc7BcRGPuMXB3nXA
         sHB9fXzbh8l09CueEimIyrnmrjIOb9+CkgQn4dMODaWbXWUaKlrNS70DXhWQfdv1a4fU
         ETk0s1noQuYcpPJFPNAJT8QI+78iRLi2r8+L9BFgOoN0VjenmsVEtgqT+5T48mTeFZWg
         q6jF8epVeWIeI/A4Yod33vAnGg2fDAQkoK63odf9KXlwNud9H5sWgdkauVEOkeqprA6a
         yibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925511; x=1784530311;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzKzbPipk5HuR++dvISXo/Dbcil94rLYMkCRdCOQ1zY=;
        b=MxtRCWu1ocZYniHQlmcQBWzw3XY8Gs0Y8HjgqQzfrHKDvxSGLy3z683MEBmPxBuRd8
         HVfSQlwQsbbj+SAXj7oGKEZ2TnLYlFqWJJvnSEl8315Xo9Lj6sW6nLooHveD72vbujSA
         HOyraZcDvsfS2osTkY5Fcg1ZVMfFGpBox0m/u8AQ5hG2C3qGfN5d7xNMEWRpNTT8+Lmc
         YBpkDdMyhShzCEQptMEW9qNKbFHoP6Ay5b+U/1KmIma+ezStfLa/BLnqTi23uqQ/i1bM
         6f6F+Kw/AyMIUIl2bAZBaN0jBzdWcccgjgZ9KA/SJQ+lCfWQ6lhF96/7DmCEfRQ5XCxy
         E+Bg==
X-Forwarded-Encrypted: i=1; AHgh+Rpf4VJjPEqHnMzjZLdEJ8s6YXVCqNk1t+5oOp4nSlgkcfcCbV4nmotABVks5QqUKlYcMiwUIUcYhDB4QSVh@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMBc7I4OcH9xh9rkoiHvwUj57aA/Rd7WRpH7VbxfBHw7Kzd2K
	yM1/k7d1QwTacrzMumYve+4wcT/eQWUxikneQUDJ9NGKRUMHcMtfQoxU/XRBv3Z3bF0=
X-Gm-Gg: AfdE7cm/QRXWlw3gQzcguWjDo6s1HMZLdoE38Jv+Z1zKF7AKMkgJ1/bNGFovlPvNqx9
	Rn/lEdnK4yIDlLBdDuc1OGFAtErJTMe4B5irSWpILiTNP22e8g+iOfKp/sRajCX4ScOQKHE1HLA
	KgOL8lfg/Sz2JOGeypOMszV7IJiEXZSJP1lv7Tqp3oL4XQN/bORQdteilaTF6vv6QxN95EOfiU1
	kO66zyNeaoWiJo8tSspmUBgBHmxbusfM4CuAGysClKoOh0QZDFhz5g/0o98U4BmVh5MwYZPXHpv
	gW4/WR9rn87RZ9/DViGfD547YhPH4GbGCr61aV5nV98nz38Im5mZZ3m9ndJ5InEYAt86EV1Xnyu
	cS1h68RrOZdXHE8YFUZmi3BDk7pbKwn8VwuJbVTCKJLWIMHL+rOWcxnoX0Ns+b3Wlj94GQQt/Z8
	9RS38cjiSuzIMm4iS9FuYBLtAQwIoA02lW+zn2TQsx/zEvToJ9xEoDcJVbvnqLd0QCAwx1
X-Received: by 2002:a17:907:9b8c:b0:c12:1dd4:13ea with SMTP id a640c23a62f3a-c161e9db95dmr250567966b.30.1783925510861;
        Sun, 12 Jul 2026 23:51:50 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bc428775sm870313466b.6.2026.07.12.23.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 08:51:49 +0200
Message-Id: <DJX8TDFWEWHA.390Z9IP2VQKN7@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
 <alOtC4bjK8IWzEj2@baldur>
In-Reply-To: <alOtC4bjK8IWzEj2@baldur>

On Sun Jul 12, 2026 at 5:05 PM CEST, Bjorn Andersson wrote:
> On Fri, Jul 10, 2026 at 11:53:57AM +0200, Luca Weiss wrote:
>> Add the missing reset (BCR) for sdhc_2.
>
> Don't be afraid of tell the world why a particular change is needed...

I didn't see any issue without this on my device, but usually the SDCC2
BCR is referenced in the devicetree so that the driver can reset the
controller.

No other special reasons I didn't mention :)

Thanks for applying!

Regards
Luca

>
> Regards,
> Bjorn
>
>>=20
>> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/q=
com/milos.dtsi
>> index 8c9232988953..262fa8801256 100644
>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>> @@ -1724,6 +1724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> =20
>>  			iommus =3D <&apps_smmu 0x540 0>;
>> =20
>> +			resets =3D <&gcc GCC_SDCC2_BCR>;
>> +
>>  			bus-width =3D <4>;
>> =20
>>  			qcom,dll-config =3D <0x0007442c>;
>>=20
>> ---
>> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
>> change-id: 20260710-milos-sdhc2-reset-8e61165cc5b8
>>=20
>> Best regards,
>> -- =20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20

