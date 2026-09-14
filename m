Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B03911A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413376; cv=none; b=cUhiVcYljaq5ID3twqjfhnPwF1d7IxnTKVMjV/8a7tIw5UBnYq/+eQFaL9DE6N56boPDt1lxFZBJhoOXj2h/Gt6Go3FkOGG4UA7y/5q7SbXW8tgiXImE2vfqkXMnEqA66erEFIc7qtX/DJGXC9mkti5RJT7SMjSQxz9h5MoDDS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413376; c=relaxed/simple;
	bh=ONhMYUvE1AYozDi9rjskj51lOvdoeRzP5ph8TVZxPSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukXl8Tai7oe0npUlALvS/t3FUKP8ApAeFyBa631ozLUS9ccz29vL0/hPD7KwU8ig5aaQ9YnLeoDI5jVMqeMymBU0w+W2fnC7d7y/mcJA1v6X20Kl3nHUf6nEWKKFWQZY4WNiLrxEmgvwzte9RknJuxLXz8ssgPNlps3v8B8kvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cX9u8qFX; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cX9u8qFX"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60d5so165647266b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789413373; x=1790018173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6MtyxxEqlr2T5M/hPkFqK6tirGQWgQ6HId4VdLZRKM=;
        b=cX9u8qFXYhsEWGdimKxyDNjjbjRxWsrc2w5QNXPYOM9Qy7YDF5eEuely871k3EHcgC
         RKWnwzc0+A55M+vN8AEytSYgNmQgYz7cLc4waIpHVi6ZupRw6o9qpC4tbQEgrLmxNmFZ
         NuwDRJ+0i4k2a2Vx3KNyc4pNejWikhQBtX5+9sRlFpa8swUj31ptIcRe3cZsVf6PhRqN
         /kD7zLjqeLs/gJJ397XXcpiMnBaITn7M+PQ964HPIQPXycFDRuNyF7zGYo3s0YixWfDs
         yz8h5n7Tmek22+JAcrv5TJGcV6gfV6SzD7wHi4YKMnTxhwuxZsxhTp6pAgDvElNl7C55
         kLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789413373; x=1790018173;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6MtyxxEqlr2T5M/hPkFqK6tirGQWgQ6HId4VdLZRKM=;
        b=izTxLO+rxQs5ewJkoFTOyQSSnHi5RU2zockwyPBBhevFRiSbQOFc7nFqs+oZxDGnda
         uwPEWNKfXAEwyJd1EYUO/wGnF1a5WMWJxnAbZF2L+Oh8S7jB74BWzwKi31xDNot1bo+i
         5EnNOOTE+yWaEaIVv7MkVVkjld5Z2zf+ZSFAIg6EC3UHP3eNXCh1ElSa6/hLg55nCVxk
         eVHHCVfFOf+yP4MhSbj0/nijtxWlJex+BnmyLBmapO9odejasqG6ADPuxogguPj7UjGm
         eyLuhnnkihAtpTnzKbTmQaX0RzGP8DShevd57oaqkNyNhT3H5ubIgQv7p5WN/AWkBA2s
         rGCA==
X-Forwarded-Encrypted: i=1; AKwUvBw0kvld7+NORumzP5mMVGMO1bNcH3ObTehkIxBYcVaD8HOmOEYkX1+ng1pAjeS/Nl7rQ1igPA76qj7a7Sdl@vger.kernel.org
X-Gm-Message-State: AFuF++lDWYUaKKvyjsi8f5uyBYJp011smxPSXmxR30FpvyMxz5AHG2Jk
	hz2RppJ0HB2oAK4F2l71UA+H9RZzOJ1hhspCuzpq7FSNKZDqRSXJkM38ePLeHG7tW0o=
X-Gm-Gg: AYBFou0Lmv8aIOE7aY44Vz3ZlQAuvHBIPlw8GimF6u1GdSUOMXbzJjgDviXVmpufDtJ
	GNwfIo5xR+qw6ZtBCJjyMIOw6Nk8pcA0vO45Cb7tak1PTRN/jZmUWurHqh9AnzIqlIydXVliUn6
	yb+fONOtQccEBCrCFQ5BwujVXTs57GwvdRtwuja1hYhBzmlJWZAfCRTlG9tRl4vNN954IFriyDX
	NEderXwKBzL/XiuLXY0OBpcNzVmF+zON0+UKcwnCihwgz3CPgRxAjo3S6LHixXcGo5UyXRIH4XR
	Gf4yidgMNTIlDggxNVp55IEaIoJL9XzFA+4BuNN+1IrUWF8abjzjCOxcHpP0x4oHqmaQQRVC11G
	sqWce7u662UNWcR+AkmIBOZl82ASMbyw2QavzL9wMu0LZe68qfQ0u3q4wEl110rWVqPbq479rTT
	Lqr/46uLnh+SF/sawnYN8q1FlwmXyhRI4s/pb9CtOZl+oiw3KlPWd21eiz2X9sVPr0ZSZxTWTxS
	8mZ9x2Diww=
X-Received: by 2002:a17:907:c16:b0:c08:580e:899a with SMTP id a640c23a62f3a-c29c89cfb88mr58253066b.10.1789413373242;
        Mon, 14 Sep 2026 12:16:13 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296601f4ccsm470075666b.20.2026.09.14.12.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:16:12 -0700 (PDT)
Message-ID: <f33eacd5-2770-4f9d-817a-9b21a8b5330e@linaro.org>
Date: Mon, 14 Sep 2026 20:16:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: qcom: camss: drive streams-aware transmitters
 through the streams API
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-8-hitesh@ebytelogic.com>
 <CAFEp6-1yTw+p6B_dOPAtidiNvuYXqAq3PxwWiEkCp-G7ZtVhdg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-1yTw+p6B_dOPAtidiNvuYXqAq3PxwWiEkCp-G7ZtVhdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 16:57, Loic Poulain wrote:
>> Subdevs without the flag keep using video.s_stream exactly as
>> before.
>>
>> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>
> I would like to point out that Gjorgji has recently posted a CAMSS
> stream API series [1]. Would that series address your use case, or are
> there requirements that it does not cover? It would be good to
> understand whether there is an opportunity for a common solution.
> 
> [1]https://lore.kernel.org/all/20260911062213.195007-1- 
> gjorgji.rosikopulos@oss.qualcomm.com/

There's a fair difference in the volume of the code in both cases too.

---
bod
