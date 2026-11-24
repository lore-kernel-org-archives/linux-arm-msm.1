Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532959;
	b=v5uAYczZyKp8+zN2VBZrXRgss5y1LFNf79KVD4F9dRvim0GI8plwphi+MawZlMzRi4tS
	 0njAj52Waxi8CejOzFQyoGSks/Dm4zxdN2NzcW2j0a3P7Xers2eKgd+NxX4U6aq8UKktG
	 3YInCiQ6vn7aw/7LxhO2IE+7uSqLZFHuPlPPm48j2RLl5EpSD0q2OPgCHtek77U0479zz
	 i4u3TpnDLWTERLASGvJDHC1nhZ8XieGqp9Qp7CHfizQKKPvwKaoM/Qx7Z+jLbrJAK5YSz
	 kb1lvmX9ChFImdSQZ+bybKl7Kjf1GmK5WIwPRhPKUqte1w0cCnwRie1mm4nbvX5jJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iVAYs1Y9//2eBIr4MloGLXRD2mrlM2kdoIMhU8BjEJA=;
	b=XM8FOXVDVvttblBurnemUjEm1/+UZmSTrCmzpR+r7bH/Yjxsyhlv+l1V4XK2G1Lhvkkl
	 T2Q/cEu79ocEAy81LBQ0DHedVN8RAlyjxElwJoeAoBNi9Cdj76akjP6V4uExUS46xzxut
	 NoDl+auOqZdHXq7jN158RmD+g5nnElTgI/2pFUFZbqU0uO/5+8O/YSw8hqOaDp3GMUbLN
	 cj6R/lQdq5GDLGUFJXdG5WCNTMwzKAcs6j95K3r9EbvFjIV7RwvCG6loDeIx17RwYIlAm
	 wArBPiwvzihmV6CzQBuxuong2PJ0Os5NKdA8dmEcdgLXgWVPhXeSzO6a7qOAak74Mfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wS5b7GMx;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C2606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wS5b7GMx
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so385603e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532957; x=1796137757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iVAYs1Y9//2eBIr4MloGLXRD2mrlM2kdoIMhU8BjEJA=;
        b=wS5b7GMx7S3fw5G1R3Y8V/aYJcptr2GMMZsjGiBBg1kyhCMIFU9Iu/kU/TzS63Z+XQ
         xT/0fjzmw13A32kmD7bmOsug5NqBM5A4OcmBHA/J1dZn9ET3u5SjbuPL67vH+m7a0ctg
         s6OvsTIS/rFM29sszDc4P1p2cZuyWcllN3jSvagXHchoPPrD2ffg8DTJS3hV8wuByhJF
         yE5hc2j0WR2kuVdwIaMqd9A+hjgJJ7RXiwZ7TlNR/VrUNX8QuBMSLl1XxrnCT3NalHrP
         7TmnYz9tp9420G1eGp1D+8MMEfW98y6BJLRbHlh7/9ol0aF6k7BRdi1Q07BJu5Q4GyNI
         3Ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532957; x=1796137757;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVAYs1Y9//2eBIr4MloGLXRD2mrlM2kdoIMhU8BjEJA=;
        b=wJJ6UlUmBJRTvDKZdMNKc5y5r9iWgOD2y9Eixjk4X/vz656u9psr+idseWE/WE+QEw
         IaL0ACUUtHROeZsxo8WvkcSD2oiN+EworFUMhjuLrDT0fDkXWFabtAZ4UpPO6WWwclrI
         AswJ0q+QGDkp1/ZE2ESQ0vixD8Wt+bkrHZHyh1ZQ27iJicFy84jda1Xbol7VqLi1HYgg
         0FoYS6seV/Dahow3wGKZIXjp0zXnktzDjS597hrbzpIWoeNmOwxI5Pu/5uR3X6Di2Bxu
         EiWF5pM4tQJTjuCpN68OSTNAy7V4C4ndS9Eus8HVsYPWme+z87UljCTUzy8XztVSkgaQ
         i2zQ==
X-Forwarded-Encrypted: i=1; AL+hErEjyUxDnHLT0g+InSFEOAWSiDlCAfqieoCUZUeNjF6u7MHSgwBZ3CcFHPway/dhCQKzMSKR7T+wYO8fojd7@vger.kernel.org
X-Gm-Message-State: APuU4Z9OhIS1/6l4D/WqeZz9LaWGs7HyYItQ6Al93ygbGUIwiOx020Vn
	6NXfVDqi1mPiCdYK+0ZvUyT1/g/yWaWJnDq7ye1473QAWdUtDgO3snJgQFOMgHeER1U=
X-Gm-Gg: AZFdTZdCyR7Hm7U4jn63LjEmOyr04wXplddVeUUd4tgUH+vtKeQO4Y+aXZcyf7MFpFt
	hVYxWpouX7YfLp2EYlYz0WgLXb6zs+s903UksQZlLrWhbrfbYRH19IHYgN/BVQyiaQW3cphVHmm
	PQPzkWvGQnKuekewb9gq7H4EtoApHv9PxcHG7c/Msp2MnOvGkVjhc6adWZ3AWPpU5BHViEZJVjT
	fr7u4sb80BVaQ+FLohNqfpGnN0q63jaeljcfD+oTTPrsFCRHwtfiPQuewMBk/McfbP+ePtNmWv2
	lURbEG+hEhUCZvTR2PDH2zAiLwsYvLwnbvyhh9TpWCvgE7DznS3iLl5CjJUkyWSJq3IZy9+EQP/
	pR9X4UarUxdWjQELR2xhFL12arvwx9300hv3b+8KbJIsTRqnL5b6zpok0yTktOdtn2cvxKMsI+C
	weiK6K2Nn/RPgMkbFSwKL7wlJX0DVOH9bDaQfRDq4Gua0zmZTQZDdihZJ6aEq+f8rey9wlBrPIt
	nuYy+EDHi+dAkFu1vUPgMxnd/axA1zxKIy8cRKStIXDYIQYMkRGMu0OR+rkTjhev5rDAz1kGgRZ
	YvB3vTkQ34x3BMgl0K7+qgzR1/z06lLQkIfltxZ5rp0hl53LKBh1pqB1dhNYC8J0wtG7XRmUbN+
	XrpvaXWQWz/xGKbhIJAmsugcD4t1k
X-Received: by 2002:a05:6512:1048:b0:5c1:4e17:1ed6 with SMTP id 2adb3069b0e04-5c1bc80fd9cmr4476151e87.6.1795532956873;
        Tue, 24 Nov 2026 07:09:16 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd017803sm3787723e87.38.2026.11.24.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:09:16 -0800 (PST)
Message-ID: <6714ffb8-0739-4821-aea7-17512def8de4@linaro.org>
Date: Tue, 24 Nov 2026 17:09:12 +0200
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
Subject: Re: [PATCH 1/2] media: qcom: camss: x1e80100: Use the lite clocks for
 the lite CSIDs
To: Jesse Casco <jesse.casco@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 19:40, Jesse Casco wrote:
> The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
> clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
> "vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
> then run with their own CSI-2 receiver unclocked: their registers can be
> read and they raise the reset interrupt, but they never report RX, RDI
> or buffer-done interrupts, so no frame arrives.
> 
> Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
> already use.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
