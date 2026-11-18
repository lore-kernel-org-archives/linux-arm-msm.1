Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034284;
	b=AeCu4AG160SYc3ynBHj71Va+uRNynj5OsO9g/WHvrrpzHnXw1GJlnvGdUfv/N6/nKztP
	 PT4XW3sq0RV3/yKYAeem4WrYOutp8nv/qv5nAtHSLgRMmeYJPwfT0cz6JLmkP0hhtoqrh
	 jJe7jbjBSctnDvhHJJZtjfixPAI30o+AfZ1+bJ/U+hdLK/bidAt7d0h2EbtkYYBuWaY3o
	 wvLFMCVXz1/uLXs7YLJcgmVQi6c/i3p5UQMqorv3YPh9iPrHwrnoNBeNQfRj/C3mAgObr
	 mAB5GigTlOcwQf5FdeLcwcdKa8XykY1FpTnkpy8H7h2CU+VO5DNTMgZ6jUZTpLNtpLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
	b=Kbhv0gEGXr+gNw5lyBfiX+SNLYM2sLH+8BRTB+WWFvLgCNe9OdRDF16lhCXETAvw4b/x
	 GfnV61ugWy9FUdZbDx2w0yXB6eAnOwzGti0vcfqQ5+1Euf9J6fAKx4/2ud6hRuo4CNR2x
	 zr6XgTFGnVwRPzSmQtICFg3W2OZ37bLmLFxKik15jsFjmWbWZCUhMC44OLAXuZbyodhIv
	 s8bU4A12HAQGX9zynFq1ys0Z/Y08fmJ3av40S/W2rhDdOF+P0pVZ5dC7BewLQ1vT3ys2n
	 oO6xaPhQpYfEs1i8dP4grTXTStYbN0wd/McQjZljB8oLMMggBmxSoufvFvfNBznkbBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTYMQlHE;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314DD60A260A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314DD60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTYMQlHE
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55d30c054dfso15497071cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034283; x=1795639083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
        b=LTYMQlHEbQdTlKUxPBuAzs7VvXrbF1oiYVatGoqHremn64qVP2+VtOWCtRF5qWcysZ
         l5agRzunf1PTVH+OhcBmq9jYrHAzemjz4WyV3wBLt36wZrQ0x7fPwVhjlRLFVGESKxPf
         +/4B6655MaEsnAyT5EMT3L3L+5LMMNqr7/S/RSS3WUY0tltxdQDvgW5sBwl/iDgiaEIt
         NlvV7HMBuHOAHp6Gijb+5GONLMQZNPRG9xI4O5mYqn0+7y/TECNF/vOwxcJscQJ/bRbn
         Vlqk5jktTZtNoIyio7RbDVQL5gsV3UILZXv8IJLnDskLLzk55xz7abbhpMmUb8SqWpqp
         A9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034283; x=1795639083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
        b=ogXXno4DRnmsishJUf+ouZYtSP6ANiVy6vbXuJ9jH98lRtAojEyXZFT3qw1lgJZz6F
         XGZreyzo/TyjfoDswyqrrZBBVKmKESdOVQcf0vupXf9W19xLYDc0d+I6fMrx8WfMGVdN
         AdXlc7El8VVUO7edSbBfIkcLIjlCjJ1B5LE0b6QoNYHMlZO0ngQ30RYBjNMU5sPfpbgm
         RYZeBGrRBzqUxDQN6aQtuNE6F9crXN0uwT5yFrtYYj0CquKE1f4XXmEWID0OxHAlV2LU
         4AiTwPqjTRiW/J73LWkHAOPW0GHCjzIeTYESpGRZy5Xfyk5NrLWwCoxb89aY5abvzDeX
         MGtQ==
X-Forwarded-Encrypted: i=1; AL+hErF1sX+XFc7PIw604g0Y9m4eU7fYf+2qkd19w9PeNMJICtMIszFXQSmkWBEuL18H52a7EClZpDp2o9xJcGLt@vger.kernel.org
X-Gm-Message-State: APuU4Z+dqvsCm1q0s+QKeml+8a1YzUnWIGZ0mOOVn+ma1x6hh0pQxxSv
	ZcYBc9/IV8ca/FNLRZSrRcWRYEFoNRFtqSly1d49pGbHlSIOrQXGLKUz
X-Gm-Gg: AYBFou2UgCXqmbBdY0a/mRGCI0JAoW1ubvMWInVFxuvioXZvDx1Nk6O8sns0Gh39Y6V
	M84mEIlvCqpG7yKKMbg3iMFY323VdVo8yCYArqmDQckQxZSVxc3XB46k3r8Ss1phnkIJk+sLJ+c
	Bp/UwtISHTaJv9F7t08UtotNnhsjgmCyYbb6s7Noi4HOW1Q/jHtg/gBPq7QZZwVBOxYHQIvq+vZ
	LL4MNesrnMJaWEoTfFGrVW5wTdMRRnPv6msMKkovLBHtY/xp72/V96B2wAS1nV5hV6fKpjxiwwT
	Jyw4lFWK7ufin4uIDnrwQkH+2eVSDqT9seS4GE8rtPr6cjgSQQs1PD/D5IErCB2rCwJR2LAkTOe
	9bSjgq4F7AarB8cnf0DrpoSXprj5RXsdOdYHXg2QQ24Pk5PrMtUYn+flOozfnGZsKcbM8R2kpNc
	YOnCB+VtWfHWRnjZjAK7pxoKuxVvYK/2kqePjAha5HJVIpwifg5EVPvYZDl/TVDjV8Wpkefefmf
	zPcvl96cDAsNibZQmBdNdP8YC2vEHJuYC3Ahokv2tI7XVcBxxkTJfDDtN0OcTZZTe83CDLLGSaD
	/fwY8LaelT+0eBanHOSi9KArvTlO1eK3jrKxGLqIq3qA05KgTxcKhoB7uljOQLRUysdaL+AFxTc
	2ECpVuEukhhqSX6E=
X-Received: by 2002:ac8:5d4a:0:b0:533:370c:7600 with SMTP id d75a77b69052e-55d5a57da20mr64973751cf.27.1795034282998;
        Wed, 18 Nov 2026 12:38:02 -0800 (PST)
Received: from localhost (bras-base-toroon2176w-grc-63-174-93-36-89.dsl.bell.ca. [174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f58dbsm30837106d6.6.2026.11.18.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:38:02 -0800 (PST)
Date: Wed, 18 Nov 2026 15:38:01 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
Message-ID: <av4MqUrrZ0OgMjlI@rdacayan>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-8-mailingradian@gmail.com>
 <avubHsbu-zkf5Uqc@zenbook>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avubHsbu-zkf5Uqc@zenbook>

On Mon, Nov 16, 2026 at 06:10:25PM -0600, Bjorn Andersson wrote:
> On Fri, Nov 06, 2026 at 09:24:51PM -0500, Richard Acayan wrote:
> > The PM660L analog audio codec (PMIC revision 4) controls the headphone
> > jack, and optionally the earpiece and speaker, at the vendor's decision.
> > Add the analog audio codec.
> > 
> 
> Trying to merge this on top of linux-next gives me a number of
> DeviceTree validation warnings related to "sound-name-prefix". There's
> also a number of warnings from the later "arm64: dts: qcom:
> sdm670-google: add sound card".

Oh, sound-name-prefix can be removed from the digital codec and the
sound subsystem can just overwrite "PDM_RX1", "PDM_RX2", etc.

I hope overwriting the analog codec "PDM_RX*" doesn't break more than
what we have now.
