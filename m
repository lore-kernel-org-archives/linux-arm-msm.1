Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514384;
	b=z3ikm1gHR2wDemCy3v8PfIgPGK8ibIQYc4BThRf+31rTfDK/z0/FAXkD8BN/oiM0uvz1
	 SeezUbn1v6yuJ6ETwNfogvGurVZYVOVZQKptXjZ1ntnCylssnaklvc7lQbqb9M+/0PXBF
	 lClnY4IA4lOqBrhmgw+U3l1d28d4fCY+T3Y65pG7+2ib2VvCGlTYZ0qagldMVKMdelbki
	 jJyBOuyfXdoXTLZgAVCEBZdN4noknRmRiSG3V4ZuXsFL6MnyJJVbeRhjclI4mkJb6Z1ij
	 LNErytHwjMgDtqnd1kpOIepUDNUUbDc09iLQKXQkcaCeJnjF2bFOiNZ2bZTSh9o8EmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
	b=3CeGvV1k49cWoh7SDckPub8RTA9tAlKzD/p9bpgrN3UqmCMOCHQh2xhleiVDF40A7eOP
	 LYgFlnjR1T3asuo+SQoAoKC7U2WDWvI3QjW6g1svpS3l/iwY+NefJmskLFfvt9bm1FhdV
	 m6Qfwv6Tbrqt6zQQwUBUb/VnSk5SYzjcDGZdaMlpE+L8mvHfnHIfTGt/1ndceSlMeoavG
	 ImSz0PcP0rCS+IzxhVv6vUacf6pB8ybqQ3xLaJOx2g6mnkAO2bx5m4d86BNXqcJKyf5mB
	 So61movi3ADxj/QlbDMZ7/IYkTeuXN9tIjXz/prPLpUPWevUB1tkSKRIAMnFQJOUKQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hSmIepVb;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143A606A33F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5143A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hSmIepVb
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so703313466b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514382; x=1796119182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
        b=hSmIepVbK9PWjrJBE1AprzX2N4p1wm7x2m2I4anFjoKv2cxG0XLVrsBXe5NIFEkEyS
         N1kijXpvpVAN1QOMPlyRqhgOTpbYI2dzHaqAoJgWxpAkkhtP/f5iWwn9TTl7wD24X3EB
         WxlV6AcGpKBEp2UfKtKPv5cEG83EaXrPouH3HCq1HYm8dq+s0DeWeySHJUhux/lzsOQU
         968QwsVS4eWoqKrOqBrwPqrEZ0Qn1jTJPqZWc1wPIH36W6qEAhXYEFtpPDLNxQ1aVfiF
         CbjZJRD7nsJlM5HtssYnsr/+Dt2Z9ZMa016YK5pVeoA31McodNBQihAv70Dw6snjGmXN
         dLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514382; x=1796119182;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
        b=zLKldmwxe1AWhA/HUlxYm8ae6upgl/s8wkIQCZdUvuvXJEMEZRKGOYLl59X2amQi0k
         MaK4lLJKpk79nPEobm88+dI6lyVVbvvZZUf43zqf298AMQGy5p4u2M33FiUnykL1J3K/
         4GrfcjeVhuzTOaLnWjOD9yBRjmzevp7OhfqsfXowFrXo56b7xhYzBWYSh2aXoCEOnwin
         VM7YKg4fh7kMhumCqMt2vjJzLTAbZLYv0E9oGRUqNSttNL8EuQe0jOnqZd/A5LRjCRPS
         93ocDsgPaaI+7QuYMtfISl+tHp9zOjrCpm9Xjfc6z1SLqaUu2jb40cLTzQfJVzmsHnuJ
         AEtA==
X-Forwarded-Encrypted: i=1; AL+hErF3OrfTUcAESdQFPIWayo3RgAi8WfRNPyXHwx92TXnBXSyON9JqQ3gLRRA9x/GT74sNTpW4PxTm+J7RVALJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8BzNHqF12ztl6aoZnVGQMsZ/k7RwIr4A/yaoA4wWi/SXDENnB/
	r2ppu1lVyxNHTszHBoCPNRcszb2D2IjW0psx+Mto1wuFdXNtdihOPZ9ndF2uCLvCVGEZJwQbOQU
	HaCBnAKQ=
X-Gm-Gg: AZFdTZcCFs9kBicNXl4EJxZhB+U1+v0xT8m7IGoxAdt+Yp86LenVgno5sUA54YYpiJr
	X/AWMZTSEzOYC2SfSDLWFmmijiTsWvt2Vvq99fWhfokLqxA4T0kpCxhBYtJbguPaEle26E/CZjF
	f8cFOH2C6/OnPK8AcWFPJK7vkftWC9HQXBqEKujNIlDD2YxOfyrXGlYFPxzb137biVGvq8Gf9e0
	5327K6YxQtRvJjC5/nBeJEJVr32dGMwAMvnwODYPzRNS8/KY3YdNp0+7G3kZqkbb0/4I1aZ4ZLc
	2XV/1n3iBUKjzgkmiTdwbL0qAcs9IWpuKNrawbCaaGGIVtNmLqo/inXB9KGdKsbrNeLFNQzb1JE
	m9h0cIxOJ99Gyp0QcjlqrSg9kP0Wr5QpoSy4WMJKuMoARhNtir3q0pPnhNOMm8gNuEZb2ZRk8HG
	XAw4CFxQOlg+wFTbfFZ0/tAm2a4Gnd9GXUdD12qUTHzIBD0XPoEjFSBP4qHBveZYB/x2szdXbMK
	pzknm+j9kKn/0FRCsrsXdMKBqg5T9HZTCXV0enbZffhGDZx2CfLuyGUAQFbu5xdkr14uwVUoT6j
	5mhaN/C80rDTCJV0SnJ2Ev7hmVeLrDiCbKzK20WcEfU=
X-Received: by 2002:a17:906:f10a:b0:c49:b8ec:a9e3 with SMTP id a640c23a62f3a-c513aad202amr993480966b.43.1795514381642;
        Tue, 24 Nov 2026 01:59:41 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01b0bsm493902266b.10.2026.11.24.01.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:59:41 -0800 (PST)
Message-ID: <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
Date: Tue, 24 Nov 2026 09:59:40 +0000
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
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> The CAMSS CSID latches the ARM architected counter on every start of
> frame. This series exposes that time to userspace, both through the
> V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> 
> Until now both were taken when the interrupt was handled, or worse, when
> the frame had finished being written out to memory, which is about a
> frame period late. The hardware value is free of interrupt latency and
> is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> with other timestamped data such as IMU samples.
> 
> Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> having the core take it. Patch 2 passes the SOF time down to the common
> CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> uses the same time to stamp the captured buffers.
> 
> Patches 4 and 5 are picked from the timestamp support Bryan shared
> earlier, with patch 5 adapted to use the conversion helper added in
> patch 2 rather than its own.
> 
> Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> Bryan O'Donoghue (2):
>        media: camss: Define timestamp registers for csid-gen2
>        media: camss: csid-gen2: Report the hardware SOF timestamp
> 
> Loic Poulain (4):
>        media: v4l2-event: Allow drivers to provide the event timestamp
>        media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
>        media: qcom: camss: csid-340: Report the hardware SOF timestamp
>        media: qcom: camss: Timestamp buffers at start of frame
So I was offlining this change and kind of left it at comments I 
received to make the type of timestamp selectable on a per-buffer basis.

IDK if that's really required for a first pass but, its where my own 
reviews were left at that time.

---
bod
