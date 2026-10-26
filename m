Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005699;
	b=4UAu+UTxn/esce4KjFLg5rqQ6+4Mg1toCeotV+OjeFaFFqr5r9JkrCaIqlRnQ6nbfx0W
	 PzVuaI+Dl5QplhU9j9G6JBK4n4Rrf0jHAjvWnMwY5bbCl9jsCW6uT1WMec5iHQEOuSXHF
	 zq/H0Ad2+aVnYuIgYAcif2GYaxjRbJVek6ArDznpIfq5XTYquTAfrFavl9LzXjR66ZuIE
	 gayHr1HMBe4p17OVJWcNmhZOUi9YxY8fflylccoL5g0Xms+gHWFkh92Pp0oud/0AO9aTW
	 LzHXLXge6Juj83R5Taxqk+GSzS9NhJRHCFhVTGILlXp8GYJEqivXZNZ9Q/FfGylozRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
	b=wses6ZQIU8x1Plh3LrLeCQWa1Ly0PGmGFhbEiV4RDu2aFB0WcFWJ+9eXMCwUFLqg2YsA
	 uuQgzb6h8A8nbxhLarTQJEMrsjrT4qM9snt1jIjJkuE02F568CJCQibPJCMlkDYFPjauI
	 xK097/Umq/7n3ZXS2qg9SR3Wp5SwpNF/1pjc+V51BEgd6GUIsBqKWclzIzscMxA1MdL0W
	 UY2EvPF5sEwj2Q/zsrT+zve7JoB0FVNp1itUrsrdv07yXRK8Jf3LPsGIEJBp5xSX8rb2q
	 9adkHBQWgi8i0Tf+JJq1I7FZpfkJgk2Zyl0gRejB55/xffWw6YqkspIqSzI8z4fwVvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4efgHo6;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384DC606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 384DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4efgHo6
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20edd106so2371988f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005696; x=1793610496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
        b=Y4efgHo6f2uQUfgBu6LlKapCdLVtJ/9Jq2r6veR7FmHxZW0Gk7M/8OXCpxpKXQhH/6
         Hle3zjGBdLBEcSglhs5YSab0EaZ8o3SnJDDtUi1oieRfAVWv3oWJrrV+9foFwo85Upg3
         Zx3M1PZRAv94CambI4tsHrJMj4YqZsRfhhTUsCOHNAMHxByhIxgSr5sEJb8T7dqRu7su
         AEJyUzsY7YgDQt+yeRYNLZHmcuxVAdTeYj3ci0v6t+iqcTgaovEoCOTNUYbTm810n+0/
         40lJIaS6oAn42zLYjtEy65RTllGTSYNG6SApOzNX5JhL+uGbKd2Eq2Fj/7kpbQyQqrQr
         OmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005696; x=1793610496;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
        b=EjTZ/84RLuENMD5RhEAj7zZy0ZzooPaQhXUlZRVIB0oGkpAXEqM8IrK6VP3BTeic3i
         sPqwI3zXxZWsAmCQSKOANEZ4suehDTHraWO/AawDMqIGp4FerI3TQzEoj55Bw4Od4+Ih
         VdQ8VKINVmrQ0C88CKZny6Noz/JoDHaW1wvpUP98iYJ9gho6xpoTps7SJBA/0mTtlw64
         7Jd7jR0zFDqEaVwEaM4SUFywErz3Z8LwruCAvY4IcrcSTzykeXYVLzZ2WdLO56h1/atF
         RYDnFdYnyslYO73kQf9uuN4i33qLqRreZ/ZOpQizhO6C2I29CO0bHqteVync/BtXesvp
         p7wQ==
X-Forwarded-Encrypted: i=1; AKwUvByIIGYntFMytADtMZUPlaZxU8Co0UcwFTq3qHJghSo1meQvIgXlBKQBi8TkhGiqkDOp7cgStfUvCTjWTUxW@vger.kernel.org
X-Gm-Message-State: AFq9FYKqXKLPGbw7b8EhsSfCdJ+PhYjsNCLXRFFGJL0+GdZ9GS2VzN/8
	VcbHN2RwTSIpF1UC3sHnlmXPnpVjhkAjqnwVHR4+BgydG6KowtbiEOdaAWhW7Uggzik=
X-Gm-Gg: AYBFou3sNnxp339o4GlxHKgamh4eaQxsmjOVBd3ciLpoXsUTnJl1TeaR7tlOGRau3yv
	4FlqIqSGlBu9dYheu7gmeoV3YKtY+/owTajlfW51AefpJtfU5jl/3vg2lfWK6Cm73ACux++/b6A
	FikWMVYvKyHzElnjnwSNdioG65+jW/PuINyKxqyLQi9JeZkj+CHfI0+pi2MnfJvmaDfji2iD0bh
	WkqBv37c9HwRIGbM8TumjLqVI9JHf/H3mEA3yQFzcVE+RpOspAC8p9GSWy79l9AhxA9x3w8Khp8
	q0L3XvmvW5F7ViXh+z8SFyGD24uz2OVGJ/ModX5WRGyX5KEQhqO785HZEGKCMW/7NERYkGPVS3N
	YqeZqfK9Mp7wr79Dn+zvBjr1MYMhy5xyJSU0ADT6CaqSY/l+mHyX+AUlvWLhQuhVzHL73hfe5Vh
	JVi2Gw6rqzC/YrSxDcBbXNT0Z9paPXPpfhcqXYw5ycWYxIpQ4qXS/aV3/OUTRPKpkP1AVIbm3x7
	otNJyvSvNCSlTpFLkkSLwaMxfl9wtTtpNnLD26hjfMft+X3Kj+Sa4wjLbX0hyHdyC8=
X-Received: by 2002:a05:6000:4b0b:b0:48e:3473:3c60 with SMTP id ffacd0b85a97d-48e3eba34a2mr10341811f8f.57.1793005696454;
        Mon, 26 Oct 2026 02:08:16 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd47basm16380307f8f.32.2026.10.26.02.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:08:15 -0700 (PDT)
Message-ID: <476b23ab-4a9b-4902-8d94-541ec539a9b8@linaro.org>
Date: Mon, 26 Oct 2026 09:08:14 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
 <D2XTuBJMTMPZaGrUZYisimpk5Xwm95Ms6ofRtgYOPmXT-xG-3Db5oAjBKeneMRsN9rp1OCl11piUQIlKIhsNzg==@protonmail.internalid>
 <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2026 10:40, Atanas Filipov wrote:
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
> 
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
