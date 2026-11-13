Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576429;
	b=ROwaHPHU0f4zXu2r/eImfXMjrZiZio5rM3a3/U6TporO1nGULOSVS7RbMeJATngLJ7HT
	 OrG23eu7U+2csDcMSoo1OTLPMvP0WLRI70+osSOqbhDbt1MhCoIGTdmcGm6c3Pi2Y2LLT
	 05W6syNc7x4nTuRP3zcnPMmDXbX9Wm4Ifb5EWK4EIfyAUI36xJZqadiqGOwqtS3aUQyMN
	 0/2VFy+5axp39ZA80RY3/akEZ1WVynJ401eCqrjjxJ3AcyblK3JZTN3zQviooNHfidla8
	 2taH4dVm/FGLvmTS01gzfaLzZP0RtiMxiaehkAa4pf6uLrP3KMwjubAAa8QEsm4itmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
	b=V1g/3B7FLk+2j4/gRQgOOVCYD/RNcrZRvPggyr8xZSFX8cIDHSAjAwYAfTGj1SsGOUqP
	 ShyQrR/pk86C7LfrXyW3BThDb4QFzTh3mixObsImLLTO+ra8nVuNRbIC8Dt5JXHNuJgAu
	 YlTmpoN887aNMumgPCz2Y3TRkY3C3wVFsqze/wgyXks1QeCijz3/Qxriy1GZg3XNy0N73
	 ULqKZPMie88/znuwIi0BabIJNw5LCclAitFpwQ5x7Nb/FNWigW4k/WkQkna6xlr7lZM+m
	 kNhx8nRHPPBbAMoWulDS52tbymwNx1Tbo1i7xT3V6/yMReh64pToMr/llEqQtnB8Q0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=F1yZ87jM;
	arc=none smtp.remote-ip=74.125.228.69
Received: from mail-ed2-f5.google.com (mail-ed2-f5.google.com [74.125.228.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E4606ABA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0E4606ABA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=F1yZ87jM
Received: by mail-ed2-f5.google.com with SMTP id 4fb4d7f45d1cf-6b76ad6eeebso627256a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794576427; x=1795181227; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
        b=F1yZ87jMnXnJnLHZNPOxMjDFrraMurLQnwrX1PMENdMZOVISppTaVGBEAtXvSg6sOz
         i9eAuh6Cgy71jZrixdwAxgT137uU60LKBjJZoecYrDmBY17aqhX0CQK53z3/DFHzp3OS
         HO8pY1ChVVmzaURKpqR/0uDaIqzBpuWsL7pNlWQv+WWGPTGnGiWVhc+sH9t3ocCdIsk/
         1gaPJkUFZkhMnE29cSX/5rSBAPg25LLQMAhR455VagPty+KLpeKraqzH7YhZa0gufVVd
         L0RdUdI/LMnKL55WBR+7ihZnx6jRxbWPHl6iZ6QPdbO9T4NB5waWuYKHll7qFbYZnn1L
         5Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576427; x=1795181227;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
        b=n+Xjaz2didlcKtoNIxfDaPyoiHj7fd/jpRT1oL5TP0nJj7KScEdj4xK58h9k/6TGcU
         SMHTcXX2ZJEagXlI+CJAZU9jDq+sdYhmAmYgTLWlQH/MCZfbHs/mzfzpPi6t1SjDS8qQ
         Y78NqhgSKot3KXvk9NCuo+qyhTobzZ58lqg5XKHqbFiyDA+kTv2ryaEF/c7FgCilG+C5
         S54HMmqjlVPnfpN2ZOyIgN5wPRJKYcB0euvNy66g+JV1fIfIJvTf8kpEcEzHVCv+qybA
         TvnUqTGwCOUQEqUVDbt0fduKA7sqUkp4qUPaUIiXPwydwvLMfGxtIbDEr7kJ9xiYZANV
         ifdg==
X-Forwarded-Encrypted: i=1; AL+hErFAQT/FMq7Gr1NTfMO+AwmdGxDYZSzNQegqQMeOwnb7zJBiFRJXfH3nqkLi1iipqqUTUCPjF8dsAxBOSPOE@vger.kernel.org
X-Gm-Message-State: APuU4Z8gPnlFFEq1/RIBHC7ywP149mBQ+/JGa9k93KC1b4l1zwUClEO5
	vgfVbK5Ch7VQYqfqkhMj5pg/HQMb3i1Jzb18R06n/C93XGsJkabeHI5HOA4X8CWo4I8=
X-Gm-Gg: AYBFou33UUJHS38LbBxhLvHEk/FitH5ldn6N+lDMmzczj7XJ67hGAkdlRsQU8oN80xX
	mszlz98gNBTsWi7G8GChD04YXB1PeKYsMgz0cM2KLQEkUEHY4eQjwH5wXwVRmd1gz9cEeQAFSWC
	IKEH3vB1qYcAMPkE91EB+dYYWiy/pDo6FJFnXEAaBQL92NtLFRhPKFy7D0kMyfzptVsR+31mQkx
	XNpLP5+icSGx4VybU/AlNOA0w1ju1PSezZPxiUcUVH8LK+RgOhGlIGnA+8nrWg6DBHtcjILLE3H
	Gh5ydSH+dILFjdLTiIHEJPWVgn2RjNEOeTx1yKSGU1oKuS62zNxEGZSl2KgxqpwBBCEfTlIrXkI
	lM6XD1D3y+p47XKNcfkL/pzK1ADnUATvhEnEnTAi0u0TXo+Z4+ONbqAMuiaKlLETPw3K24W/OIb
	ORnLEQX2DboyVHaf38Jrg+jkbNFeixISAhPxN7NqAbjAxFnUhg3ddGLmq8KoEzRqC1NKjjPbr+y
	InLA8dUGbSzYMjRarMmOJ37yXbzGanxTXJJJA9CSpKrQlmkJpXMg5EQwq0sbVs8YbLdYYb0mihQ
	V2amL4BnEeqR941P0QVxuuFCkK/F4lDok1Pcwt82HeqX0qK3CfMW2EtJ5nqD0GKH3zIIGktbgQ=
	=
X-Received: by 2002:a05:6402:280e:b0:6b6:f22a:8def with SMTP id 4fb4d7f45d1cf-6b7c0ccec63mr2358666a12.34.1794576426950;
        Fri, 13 Nov 2026 05:27:06 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c1e49be0sm968246a12.0.2026.11.13.05.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:27:03 -0800 (PST)
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
Date: Fri, 13 Nov 2026 14:27:01 +0100
Message-Id: <DMU48Z0SWPHQ.1HRZYE04S91HX@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa"
 <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
 <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
 <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>
In-Reply-To: <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>

On Fri Nov 13, 2026 at 2:09 PM CET, Val Packett wrote:
>
> On 11/13/26 9:59 AM, Luca Weiss wrote:
>> On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
>>> Since Linux has gained LCDB support now, wire up the LCDB regulators so
>>> we can turn them off and on as desired.
>> Actually after some more testing with extra patches, it seems that on
>> FP4 the touchscreen stays dead after toggling the lcdb regulator, while
>> on FP3 it works perfectly fine.
>>
>> So please ignore this specific patch for now, I will figure out what the
>> problem is and re-submit. All the other patches in the series are still
>> good to go in!
>
> Your touchscreen needs to be a drm panel follower and/or reference the=20
> same supplies as well :) Most modern touch controllers are part of the=20
> same physical DDIC as the actual display side

Yep, I assumed the same. Probably need to resend the init sequence [0]
after power cycle, when the panel is back on again, to get everything
running again.

[0] https://lore.kernel.org/linux-arm-msm/20260821-fp4-hx83112a-v1-2-474941=
bd8860@fairphone.com/ hx83112a_init()

Fairphone 3 should be a similar setup (FP3: hx83112b, FP4: hx83112a) but
apparently the hx83112b doesn't need any sort of init to start sending
touch inputs compared to hx83112a.

Regards
Luca
