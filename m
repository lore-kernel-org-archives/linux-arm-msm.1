Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005732;
	b=3PbDSD+X7ZvTgxLq1xKCNaZa+Eu2/1yTjwbQi6LkHXNHkTeVOD/qzyAhGb1DZqjDEjgd
	 tWGFwn/kAZxBK/e04HqyipzRqaogfGFSYSt2LIzOi5n9TKsoI/Jdu3SqaRWnmrojjlnYl
	 WJCGlIr6NAIYl88Z5cIueDhni397O9FcUQ27nGtmAIxA6aAJwVgLikADRbnJioiC8ncNY
	 XINWo2K+SSl6yKg7egAeY9MCyAB5bULGds8LmzUxsLV9cjLAumubKxWbLWIANqrD+oKrd
	 Z9W8gk/M84D7vm2NCQUAPUyw4g5BHbF3E3tZDWArRdLQxfn6hq4e7pkMD2IKRLd2R6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
	b=pRCjTmGPk+aQ+eOuEVJ3bjUCPcEpkoLmZOQy8MLtjc6qZLSC37sdt8GoEvasMZ8BODDI
	 bW9huVOhXIgWzUAdmjQpQC/i8dE/tF4cd2z7lbMJzw1Bz1xThWP7DpRZn71/fDylcAd5m
	 MyOzYFZH2nNK5XJtcdtm4aV4IP+3+hLxvz6ZwlPnwFqOv5UNfPDq1XXczWBhVTFZBAPr0
	 SehB64SLiK1o61gAnGhBA7Zqwr+sxsD/QPmAgue3AyfXDUWYqV1JK4caF1vki/YOCsF8A
	 wXh3GQfcDYfYOXmj87POup0pXTlODb7iRG3TGF6uHPbOSv4Bd/V+MxTHPtVwwVl8b9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X2OOUp+A;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C69606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C69606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X2OOUp+A
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1487970f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005730; x=1793610530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
        b=X2OOUp+A02CXDZvu8A20i0A6Kra8e4XDde7P4W/y8Ml4B6cdCfBkSSZbeRW9XJ7pfi
         nf1zLDFqoX0M1m5ST91pY3FVF0iZ+yXj92VKjKXpuv2aFa5fX4+KSHpSwjTnhmmkzQN9
         LYM0Wx72tHCgBnmCr2VjuVhsdL6lYkzKHBVImzyDavyCD6owRdMEIY7o1EP4oHiCywgl
         ky1O+qCDd16rZJTLbn3RmrEt3mRNpANDxIAcT9uZeEzNE1NqyVQHZT3vfhMxKeJ0ybRN
         ci+LCHoJ+iRHmcuKntLk0ExEcVJfSZBGBWq3+VGeMBX7qnIO+KUxtXnFSexb814dyljs
         isng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005730; x=1793610530;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
        b=uMw5zyhoSddzOOaAFE/3usmvZNcfyk8EORrlf5rF/X7OHLSxRkcWOcJJNluAin4dSd
         JLDm/kGPLEwIvwfet6z/aIsyP4CHY7F/Cif3IVyvBOIQ3enI0ce9Dn2PcfGNDuI0cWWm
         8K4kWqJlI20McgUim4vHQuIj8svzuhwrYDwABlUvBTQ972WLPwIb7yFG+tJnuk+r5BeM
         g5P26ZFRHdGX6CcZwaCUw6VOE1AYUudabiSoNs5kG6CUWT3UfQJHL/jBkSKgDxdohL9s
         vqQbsu/ZfOvJNa3xwdASE9VqbI8I4xm85myCz/Eg9gj7O2eyNfLAUaiqCSI1kDyerdNZ
         pEqA==
X-Forwarded-Encrypted: i=1; AKwUvByPBqELSgco1dta2dwt7R8n1hCZi03E3yAvTaQylt5TW9rml1Aas+1flfE/++Uhk3SHP6YPWQaZddUiLS7w@vger.kernel.org
X-Gm-Message-State: AFq9FYKXnDiNeyc6NczuGeeAhs0SKSqX39IGHPlbWLs5S0DOlbJIqK6n
	mxqqTk41i8+eBwHAjUPqMUXA2xhDkd3oBIZhnjU7EbZktuoMOu9XTM3UTYJvxpgTb9QZvQSMY/Z
	IDrwI
X-Gm-Gg: AYBFou2PqR0pta75YM4MOYzL3clG/Sh0LfJRs9nm+Ru+QhAdiA2uq9FgnUeY0UXS5BW
	rfsZql4MTPoWF5q2VK6C4IA6IlgviJn8HnyJrdbeQtbyLQha+SbIAGiML2w+oNRfdK32F9PDGRG
	cXd1UV0FScV5SFQPuYe9JfitdVATZj3dH1puiNWpwBNZU4aNN8WI11WPLZhThpygGwX+HKTiGLc
	lIkpE4Nmj8X0J5YWY+eM/ZENgg+jcdhQQMtVBP1+MxAapMuoRZYi9drrKBsnX0awJyxbg4Ud1I8
	lNS0ONLshnDb12UVzYfwczh23/OQ/45aJDbbyDMu2C0wzKmMbSCEJn0tNvRSR27Xa8pILDfPEdY
	JDCy9QCh1i+0QqHUtsNHYa3xNKjU8SfL7+jE0AQMG6v/joO9ma9vIEvtWmDOiXeZQJrdccg1RLU
	GDMtpOqU4ZxSLyYA1MnMw8L2rh1Q9YxWr8L2UJWvvtEiUO9qrkEF9LyKcnrf6v9K7phCIXde1Y5
	cB31H7gFgCYyRMcjpqCD8zg43vH9xDukEGsFk8odPMuDNsOIIUVND35TWZ2Yn0Uve8=
X-Received: by 2002:a05:6000:2312:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48e3eb8b4c5mr11452297f8f.22.1793005730243;
        Mon, 26 Oct 2026 02:08:50 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm14118984f8f.58.2026.10.26.02.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:08:49 -0700 (PDT)
Message-ID: <2665de15-dea8-493e-9a24-1c12cd9eda3f@linaro.org>
Date: Mon, 26 Oct 2026 09:08:48 +0000
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
Subject: Re: [PATCH v2 3/6] media: qcom: camss: sm8250: do not set VFE core
 clock rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
 <eGhL2aGIqxBFBKgd68g6t_m4p17F_a0I12V3BQjSCuOQ0HisGBIC1n8Oh4dIXGvyIEEJBQptPK1TAGQpg_ik1Q==@protonmail.internalid>
 <20261024094027.3095475-4-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261024094027.3095475-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2026 10:40, Atanas Filipov wrote:
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
> 
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
> 
> Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
