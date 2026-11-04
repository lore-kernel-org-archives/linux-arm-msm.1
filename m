Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799995;
	b=lmfZN68WaUvPr+hJkGCKXbh3WmZsa5bk2YfxJDF4rIgtSWMMDJzT88Ws3npiBVuOzpAN
	 b/W/DjElqrQky4WbT80p9fvFuGav96foGMNChDZuphKWD1NlnHDT4sfec2p01YAqAlDiZ
	 DdvdMpBN15Jmb/WwdVUjeS/9Xp3ND4adjyb0SSf1nMc1P74ItktQYhd+bUdNHzaUgSHYh
	 9aZfMudeK3A03kmHQ2qx/HSsvRiFSBSVDBHqzp58IW9zqsJ/RkFEulD2LTc+ps8qkPsUu
	 AC+9vu+TEULFpkemk3ZIDTm7Dd7QD/aOs2TQCODAI66zeIblIGzsQTQ2mSU4LtwcVrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EQOuQtMWNcKIk8UAS07t8w97U059WR6PXWD/U5Jt9sA=;
	b=gbj9HPgq3sIC+4ZRJ8Gq246avidKcLOqZefNaf9NfTq77uR/XMloHJt40wuqlq7tn0nK
	 ETRq0E55Um4tHAGHefdu2CsMRhEuaVrPK3ow811wk5FsF4DcFFsMCtGPqC3HHYZJe1WP3
	 tCNg57R7sIN1MpTAIdu9FXmOjk+0gch5cU1ClIerkaNTyfeOlboIrAa0LCK7N+q3+zGpp
	 nvEGpqjvLop5B6UWtOmbeahoInU+YtrsCI+2TH5Sy5WBY+RV0ZWTvBpxj9Kc/zbdr65k+
	 QzmlGPh6AShLTKtJjp9f25R2gxq6lxNcWYDx1Ep0xJkEErHujkmOGeH9tztf339s0Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4DSp+ZT;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D062606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 13:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D062606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4DSp+ZT
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c418e215671so104600066b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793799993; x=1794404793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQOuQtMWNcKIk8UAS07t8w97U059WR6PXWD/U5Jt9sA=;
        b=U4DSp+ZTutmJdsT23wcbIhCrOmHZ1cv1fxwAxSVyNAkLCULrvFm45DFMbarx4oPpwP
         c/vQfLNzJFVuBUIeqb4PHii3wYKUmhwYL1JJ43W4xnJu8741oP3tv9GfiiON7uljJgBp
         Xgyk6WKR0hyWYBQHY5VW8O8yjLP11iyPYlrJKaGbeCLnFGMneD93uQ2p3vqbxBLp3U1a
         uI9PMq3CHOaXpXVv3WU2j/oZHQBnsh+UP8q57D7YBja93unxN4XpNSniL9AQDlu+KeC6
         /uLMDt5O68XsPydNNnFprXjb80wQdxpIwSXQOvsGNSjG5s5MDdjzFUXxKJGx3EjgaJ+9
         kHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799994; x=1794404794;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQOuQtMWNcKIk8UAS07t8w97U059WR6PXWD/U5Jt9sA=;
        b=iWrkOFLzDETsLShJD9rO30OnaPFTpi7kXSHsRdg2b6ybGEFB2v98K5pLQsF2Nscr/w
         szIaO8pUKATeU7Z5rk3likpu0RviJuL8gQRjcy7iSvCDaYtCJZi60RpWXgaCFt6wXBsa
         9F0MlNlcsy+o+ZGRsoCdvaLUVLd5I7yygpvyzkL//yt4a4FN5iFbg9skZOLvW/7921ep
         e142PDBavcjlG6lwftNO1tNrGDUtoJMnvCgOaraLK6Lh2L0LFS8HQlMo2jJ9yDxZ2+it
         CzNalsDeuaU2Xxp8matuFrFG6tZfzTS8Iuj62CPjiRvufK0+dGNooQCeTQ9U8DOsyZaq
         U5Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxTV/chC/uwUJccDPMLxesj17CyRM8ZoLw+4v1tRXt3qA0unh92sgvgVd9d1R+YM7zmtcygIiXtSCq/IU+Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8LfuFRs8p65yK/C7p/ZEEkAIHoReuAOZ3eba4IF+IixPRu+O9B
	hKroXSmYYbBrkpuwLVDW2l5v4TkukQreV7tOy7mn0TG2oLo3KqM0cYG1u2LRJp2BRYBa8QaCmqo
	lDMtz13w=
X-Gm-Gg: AYBFou013Yxb21Hv/1WTPgq4MEvK/uReCJ4e4gwK+DGE8jDDY8O7RTftJxt7CQwBu46
	5zndDRiXq7aj9h4S0+ZEHD0BxzDoBFgETL7rVWqRls7DZ+MsjvjLL/BRvNUNmVXweS0zjAje4KF
	KCoj9AkQ1aKmzDcI6G50L7SvaA2xv7EMKlgCd9W/+0tSA5LOjlHdQ+GpRzCt1BR3oT0c/lbDixz
	2Ztr5u3n9cQNa2Nv4DaWY6zqLNS2zdF2+iXyonRF3nA9cy8ArLD96eNDeih4Nsg2FVjLPqy1aCU
	a6BE7MasuPE+dEliH1ZIMSC4GympoKe4uxXx7ZAI2pVj6C/j8NG6yyIY4bd2/wbfi/zgmtoUGJ3
	B+atllO8A+z1xGDs4mSwOnewBLEqfvmakFHQY/Fh7YwOo5RhFwV0V4ovzR2g/NS8mtSDWZckIaR
	9P+9H7lfcLyj5tCqzauMLBCcWAHHC5DRzH6JbH8C9BLbgUxbUm9kzZHRbZel9ryZWT3bacXudoW
	if00hZ1RdBFzwKgOSt7ovQthaQijde61j/Q7LpWZ9A0XphUJ0lBt7gLfPw28OixvCP+nL/hgYOT
	vWWCum84uZDb4g9gLrkMfQgFqZZuAhgO6nWK3LIDlg==
X-Received: by 2002:a17:907:2d25:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c4ca7ad1bbcmr1367741466b.40.1793799993289;
        Wed, 04 Nov 2026 05:46:33 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e44739csm73557066b.46.2026.11.04.05.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:46:32 -0800 (PST)
Message-ID: <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
Date: Wed, 4 Nov 2026 13:46:29 +0000
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
Subject: Re: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX"
 to "csiphyX"
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Frank Li <Frank.Li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 13:00, Vladimir Zapolskiy wrote:
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef228..dcc005674d8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>   	csiphy->id = res->csiphy.id;
>   	csiphy->res = &res->csiphy;
>   
> -	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
> +	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csiphy->id);
>   
>   	return 0;
>   
> -- 2.53.0

I'm 99% sure this is a change that was made @ Frank Li's behest i.e. 
that csi0 is how most other systems do it (true afair) instead of csiphy0.

---
bod
