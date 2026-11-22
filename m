Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368164;
	b=vs57n0Vcb/pBM5pCHkjJxkBCCd4N5DTyazihn+Ln/kyJ0rT4EbNAKbodNm7sEmajW9iw
	 bX1a7ZqdxEG5dJxiqcQ6YtfAkx0hImqyP2jde5uR10qYJ7XEVaa81AsJ+oL1EUAXAnmWe
	 3sMUgHvyyj73w3A3eW7IYGwQxnkshf5USQ7v8Hcud8RODzSimlEYED9uy98IYsRPM+Mov
	 wrl3cTwMht45qB2vke25vIep1QkVFg4lJwk6pW5JzVNB1GXkc9IS1DCc5pbRc4R7JSyQg
	 lwX9jC+XVo/VEmRDJbg71bpos+HpbSf3B30mH075RcDTJ2Yptj+eNIB/7A1ZGuambqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
	b=h0VZM9SxtF8w+/9/mT+7RTCShzz77n4Pait9zByLosWblEkwn28wEIVKrIjD9AcWSVp2
	 N95CS0lX2R2RgmLd8/pFbgVFDbSLzrgZxqI7GSywIxWzCNf73swKBeTKLKt53dPXBh7dC
	 oED630hXyrSXLY/WKevdcCTP7Kq5c4BmPw4uVqP3t9f0AjzA9IHnvRTpmqHKD4J+VTWmf
	 yBPrtVTeArZNkJE2nmURK7F46Y8qH3hGpUBxzokJJhoX0NYAnFTfImZ0rp+OcKVv3Za4a
	 O4D+xsfK3xdGZ38rCMzbtQ7WTEJ3EJgvTzEdQFxfBLGmCusrdPL4+5Ikyl58DAXd2Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rdMN/uuh";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01AA606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 17:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D01AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdMN/uuh
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386ab9ab619so774953eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 09:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368163; x=1795972963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
        b=rdMN/uuh37VKObF52K9+lcme53bqcVhzqmpmYe9zYf4xuf7IMBHBGOWYyCDpwozQem
         HWXEws9rArjqW8P+BJrs8nA5WqwClIUasxOguhVLwHBAfr+1EfGiWqdYOGJcP3CtmHI0
         gFM2LT3VrFa+7Y1gdLeG9WA6HQpTTkVWY35gj/quFUOILDjm/CiPqDGJ91U16Z19CGBl
         KUK3EdQL3TDOO5ADOUiFXPerabn7IEcmxNlrpheQJPGdqhsKbS5g6fctTEQ8Xc8PYA1C
         8gAFgyUBNZoud48/lrvtNYJu2wAHKjInCOYGYtovVezXg95EEZqg2FGRsu8+8BtEPE3j
         PHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368163; x=1795972963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
        b=MFg/uIqf45/S6UUNk8l95FmAIeA4ALQuPhE5rIwqP4bGtKfxGwWUrgDV19onIL74Bc
         HXPCooddROzt20k+08zqWBxWND6urkL52/SmosIIAr5UdV0yM6MljJ0FVedntJrjF8dO
         aEL7A/kO+7eqOL5gHNCjs5VztfcvxKN6VENkpw9m57rXJc9FP7AL98UT3dfEI/phQ2vJ
         bCPwiQi+2K/fOev9Do78tuGrGHig7v7WnDtqXyxy9qdap2OVTfNZRVgnntQ9qz7npO+8
         +zDhjdLVfDAZFOQBm511QF5nCqvSqgS+41LfsS5scdp4Mq/MRQwilFLfIAS1obDgU21I
         nkeg==
X-Forwarded-Encrypted: i=1; AL+hErH7RoPMJuZsVwujAr31FgjqQixkNBQH7cdLm5VbEhMvhg6JtUfXpCxZdWy/wu+NfDMPJRV9pgyBFaCJbPs4@vger.kernel.org
X-Gm-Message-State: APuU4Z/kA3qwth7LqO2FaP8WqmnelQwyj7sMZoHuIkdos0pM8hBPwY6l
	4nNY8WIkfhJ0BQPSGrtfZxb1UxVl/57PqjcwJneFm+wJdK1X1kRfH0vf
X-Gm-Gg: AZFdTZduk4xwP2T6Sp9Q0YzBy6SK7BHledXGxWrVIUjFhiBazrsU4rjCjVUpX34Oz4M
	aenCAZaAoCwbPyzZlqGB3gChlMnB/Ej7FFfB1CetzqRcoosErYYo02J1WSbncwtDSy+5dqdtyMI
	6tTSuBvqMHzVLRZlTlZPNsGAhvb7EZcnsXbaDtN8Bp0lkKHRmNzw+ymQ0irtASZymg8cv08XKNn
	TVASBi0gXiOOmn8LIYwEel9BXNfeyp1+tGfO2hFhplu6HTz06Kp3m4luBL3hinQXLsljMGB9ile
	Gq0rRiYa11ZrpQQBKnzXDALSfGs6jmc5a73c7Lx69vpX5ZFfmqn52FRdmKxF9aZi430xvZ+/FEG
	s7Xjl58L8IgKdF491eUEOj7GTnCMxEQ+NP/MKW1t9vJTAGbOqVetS8ZueJxVVO6ClV1S6AkaUHA
	OH+LrcQyCtGmnOijoKlhk4WIsEolL1f/DWX/QU4tV0Kwl+SMDH+/adx+YEpJJGMdJJgK2O7ulnA
	lDHrSOscmvw1z761XXKmggu58RaN+HlOO21O0/OZ9t0f/99Lbq3ul8NkFlLEqp7RKwXlsLHc4Vq
	3VbAiyTTTngSkVofFuzEkbS/uT4Xc+n50mM/3gteLhtj8WJb3GNP6mEYzPbNJKic4qlvqbWbBHY
	JPbxskVYXpy1UKSXU6t+mIwqgbw8dfUIkgMPmdu4kWaDGdACvAbXkaOy7mn8Wfs8OK2cSqL7zPz
	yDsPtrEA2UJawp83XzzoEuF5o9/v0tqYt4po+oPUo0PO45EP0=
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr10817054eec.4.1795368162901;
        Sun, 22 Nov 2026 09:22:42 -0800 (PST)
Received: from ?IPV6:2402:a00:163:3509:b842:8324:ef7c:136d? ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm30943866eec.14.2026.11.22.09.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:22:42 -0800 (PST)
Message-ID: <9997e6c6-2e5e-4314-88b2-a8547ab035f2@gmail.com>
Date: Sun, 22 Nov 2026 22:52:36 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add
 ext_mclk1_c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
 <20261115174237.48908-2-surajsonawane0215@gmail.com>
 <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/11/26 18:10, Krzysztof Kozlowski wrote:
> On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
>> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
>> function ext_mclk1_c, matching SC8280XP, but the binding enum does
> 
> I do not see it in the driver, so are you sure you used correct reason
> for the patch? Mentioning driver means you document existing ABI being
> used.
You are correct, thank you. In mainline, gpio5 in
drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c is currently:

   LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),

so ext_mclk1_c is not implemented for SC7280 yet. I described it
wrongly as existing ABI.

 >> not allow it.
 >
 > Entire sentence is clear here - there is ABI and binding does not allow
 > it. Please point me to that implementation.

There is no such implementation in SC7280. The same mux position is
exposed as ext_mclk1_c on SC8280XP, in
drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c:

   LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, qua_mi2s_data, _),

On Vicharak's Axon Mini SBC (QCS6490, sc7280-compatible LPI) we need 
LPASS gpio5 as
EXT_MCLK1_C for the audio codec MCLK. Patch 2/2 adds ext_mclk1_c to the
SC7280 LPI pinctrl driver, and patch 1/2 updates the binding so
function = "ext_mclk1_c" is valid.

I will send a v3 with a corrected commit message that says we are adding
the missing function and binding, not documenting pre-existing ABI.
Thanks,
Suraj
