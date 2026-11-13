Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581660;
	b=w6i4vvKQu7Hbg5oekTvPsWv9iCWFoZHZajTjR14OYyEXFZG9cjZTQXS6jS5LKzZa6CyN
	 NN5lLOENsb9d/O6kkPQ7cfqfd2aGjVhIcN94RlOAjNFOwAC5ylp77N5VrMl1TGYEnRizn
	 RtQtjblBz52cgyclsJ6Ca17aWXwVHQ2lgTsbjceJSFSrzzt9z80aOhoDNRLl/4SLadZjH
	 Km/dV0NzhOiDx/Qfh3x0c7roZpGJ9B3l5nvt6NFWts1fPHd4atk8CIVog7FroJsrRnVgJ
	 C7XEJ2jQaGgzv6yFYk20tmJV+vWGy/hR8LKPIe4KB1xmjsfqsUaPJmVghMI8u58WkOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
	b=dhKajkDOn1DfldhJnX3VOq6ARYGzGBif9QSs+hvaI+1TkHRAB5iKEZG7yUfpjKWAsCLu
	 O2wP5OF3S0U1VnNMIg23TbTzZo0vLwQMy6OcLC+HZHmqFfKoXGr5qSEn4W36snKslKt5b
	 peLgyUyOr1a6jy71qosXgJJH8pKHZtFLLX1ssCDTjZgn2ivdVWsVU3QBxDsbAkC+NUvbj
	 178v0aHMMmZyPsMVsAwFvmbnltgp8WmPpwGW7aaUOldmEKfdLoAPntVTU9Ph2mbUsDXpe
	 sR2GGhLceU2kS1zWdH/v1Sl9lokumiK9u6d5o2pxO/mWMV2jQRK4WkhG8fnI1pRjTtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=DtUb2MSs;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9294F606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9294F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=DtUb2MSs
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5067a2411bso204131066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794581659; x=1795186459; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
        b=DtUb2MSsTrLlshbb82Qrnc7nt2mk7Di/3LVlJvL+a+hyBCjKmoyE0a3v6Lz0I7liwB
         R3K2EeLS5F7QYb0Nz5bXmUSDqnPOI1WSnzrKMViW88wuGkzfF+xl/UBdQXCablxE4Wan
         Y3ZhfYDrLnPIDnTZ7hSk62AG5/+tmmjCTrQFKjC/EOCY09k/1bY0RZnFNcq+zsKk4XZi
         eIs87xMiMyXOwCK1T7zuhkfN6s6nb5Gd7Y00aJuq+UExYKM3NuGb6dAtWan9VpQjLkPz
         jwX9oVYTvUmuB9MY+5dXaTOTRWj676J+TyeoH7V3rmUu/c1SJkaK3aSRaOy6OP/HP4CT
         HdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581659; x=1795186459;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
        b=zLmrD3VxyW/hrszImP/yGbITPCZOOGj1kE1N3cYHCTTF5a9O+dVq/ifq1DYwlK3x9D
         2zE0WEv0yATJ8gSesG72E2yv6X2b9M7j6J8UXAt90ef0xnPqKB/lF7oSjhAICmPtLfP3
         w0xA42I3zIVUJaTs2yBck9jacNsXwa39dETPlwaxRJvsxPWdpCQR0aFraxF8Ww11iMUc
         WqRvjLB2b5rt8eOXvcG6VULBRR9Lu6ycGYbAhI4U/f01CTQX97Kj2r4ylvmM5wytsXMX
         a9KmmwUsnwL4IfdqvsFytbYrN1BMSRizAEBHZzr9IuwWBFVIVmODLn2q7TMs6EaVSDR9
         3hTg==
X-Forwarded-Encrypted: i=1; AL+hErHMnHX3DCBe3CR2Nfqo1NsVTCN2E+Wm1Cex58QSfYAgZ+GPUI7drx/Uwbdq/QzIedCm6troTJBN51vbFuzn@vger.kernel.org
X-Gm-Message-State: APuU4Z/Il980B9akADfw8kiC8+vL6Eg4/EeJ/oNbt8591u8iVRBgkfvh
	WepMUEX1i1lqSSEjE1e2lQ8G6ZZHeshY7R+48pRAvUY2xLOy11UhKS54TWRb2WzOAm0=
X-Gm-Gg: AYBFou2mR5UtYkkefLbp29ycZn5ulrv3E9zHFOyMQDP6mFGGe/gzdu305IctNCGrwn/
	DCOuhRpQGDHimxMJtxY+my8XnLtCCMisrDIOpRjkTHcENVY0WfhHCPYWAuPazIyQ8k0xekq5JO8
	NA457VqiHJxwnoMCuGtzEXC2uyQwn7v/2Ou+nKW7I/5lqtLnu0qWD0iFU2L3TyWCACTao5T0Sga
	DT6/SxLzbm8vLsnkBcwgR4JHENLN2xHMkuPfrIrHyNtk3OqrY4yIuUSdtYkZVpZTpAdQY4LzsJ0
	8zYQePPuI8S2HJ3HoRZuCZYOV4jwkVwbAG+2C6h22Ehhf4KJEwD3pkbossnfyzv0bCbCnz5IFqS
	pTdTwjm4bujJHWr8RSjVRGCrZ95zP+2ke7gh7/lwmGeHPHjTgDcRjavG2fXKWtX24KapdKwfpmk
	XVfknZyCJEI6NA42jFQXJ8fc1KKNa24aFnm1301Mf46kwHLM/mWU8OHBnrSBwY0a5bXv3W7Trf/
	fh/sbw+SsZGNyRIUBjrcXfDtCfhOwvIHd+czCqdFypDn0rNkI0tBTJO/0P4k/Q3aClGDBdLXONU
	9PPTJ37QLhrc/eFXYHtIcAv9CMAvNabDCd6tooh3ka7MC06TwrLSeK4YPM2rjnXkn5rMHpq3erg
	=
X-Received: by 2002:a17:907:a089:b0:c46:9876:e9b1 with SMTP id a640c23a62f3a-c509664a09fmr236807866b.43.1794581658937;
        Fri, 13 Nov 2026 06:54:18 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c78asm112075866b.10.2026.11.13.06.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:54:18 -0800 (PST)
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
Date: Fri, 13 Nov 2026 15:54:18 +0100
Message-Id: <DMU63SK443BB.1CQ2KXXP5PNW4@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
 <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
 <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>
 <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>
In-Reply-To: <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>

Hi all,

On Fri Sep 18, 2026 at 4:43 PM CEST, Luca Weiss wrote:
> Hi Konrad,
>
> On Mon Jun 22, 2026 at 10:23 AM CEST, Luca Weiss wrote:
>> On Wed Jun 17, 2026 at 12:05 PM CEST, Konrad Dybcio wrote:
>>> On 5/22/26 4:46 PM, Luca Weiss wrote:
>>>> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
>>>> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
>>>> and power-domains for the LPASS RX/TX/WSA/VA macros.
>>>>=20
>>>> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
>>>> equivalents in its place. The qcs6490-audioreach.dtsi file can also dr=
op
>>>> deletion of power-domains properties then.
>>>>=20
>>>> This follows previous commits moving Chrome-specific configuration to
>>>> the correct file, leaving kodiak.dtsi for Elite and
>>>> qcs6490-audioreach.dtsi for AudioReach.
>>>>=20
>>>> No functional change intended. The clock-output-names property will no=
w
>>>> exist for both Chrome and AudioReach devices but this shouldn't have a=
ny
>>>> relevant effect. And WSA macro clocks weren't added to Chrome because =
I
>>>> don't believe this would've ever worked given it already referenced
>>>> q6afecc and the nodes were originally added during AudioReach bringup.
>>>
>>> I think it's better to keep them, if only to make sure that the result
>>> of dtx_diff isn't outside the expectation of a commit that claims to
>>> only reshuffle data for these platforms
>>
>> I documented this in the commit message for this purpose.
>>
>> But I'd argue not putting (likely incorrect) wsa_macro overrides there
>> is the better thing to do. Probably somebody should've taken care of the
>> Chrome platforms when adding the wsa nodes in the first place.
>
> Is that okay, or do you want me to change this? I'm still of the opinion
> that adding a very-likely-broken WSA macro to chrome is not great.
>
> Anything else to note? R-b would be nice :)

Any further comment or review? I can also resend if that's helpful.

Regards
Luca

>
> Regards
> Luca
>
>>
>>>
>>> It looks OK as-is for Elite and Audioreach platforms (for the record, I
>>> checked rb3gen2 and FP5)
>>
>> Thanks!
>>
>> Regards
>> Luca


