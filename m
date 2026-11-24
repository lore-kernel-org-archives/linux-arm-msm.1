Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514172;
	b=Rg2SZjPm9CNtljFQzvwq58VEq/IBi7UF1oZe8Em6qQzt9mavtlaHTXadKokAeAaudvsM
	 MlRDK+fb7s+rqvr0cZPnpYS3afVMHHHZOxpS5wr41x3pFsJ5/6m5Ew+4hAG9Fk8MB3lxY
	 W54WbuoV5/sGa2qPnmoecF3WJWSOl5N3/vtFCkEDCSeplc9Ru5DQLYhq92D82GW6HoAQ9
	 7VVoyuqPSh5zsNPg1nY8NNCDsTR3MGe8dIdK349giDq9THTar5xAPpkqpQmm32DbOgzMb
	 rnvVFpCadMhctHXqgdf8TtmKYO48B5WyKmmBAw4+bMP0KXyFJnlG3tasjqgmAbYSQyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
	b=Vjkcg9Z1pkHIFZAWUVMkHvKZPTB+NvuwTGv+rCX1Kyg1mEbNM4WLuF3Fi5XOMMWcFR11
	 7mpqPE8rIHDKIzLyQqvTT9KQTGGWUB7Wser9MHdKwKXZyE6u1lU0po/EeTs/4HmyizTM9
	 cZBTIN/00wh3QY39A1WVvTYBAhGHfq64NUtclC2bmTLQuamUXKD7xALMYcRUVSZtI7zNC
	 sCkeE5fGTMEAjWCyXppQFqwExZ2kdAWNvmrwDsUxJW3aBmKQADRASzYLoYduYXp4ARuMO
	 wXpKFBGUm9VYkAiJsUklhSFWxb/gntN35u3k0z+7gcZLgZVzspys1LJjoyQM+1crQAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="O/Q2gBA+";
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AA460A260F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AA460A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O/Q2gBA+
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so4887009a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514170; x=1796118970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
        b=O/Q2gBA+rhMwstg5y938RN+PNof+guIwVSXQ2D4BlGB6ChOpIcCDqP+l9UIfXKeJgG
         X4fK/+LjSo6q/p0914sAQTtkD29Y9wgXVqSVhqSWRcglLQ/7IeDtZUBQWXhLV170fpPY
         wlxPU3lxc2pP9OK6kJAogOFqVCd0iao8JypNWp8uRjII3h55+FSskq9S+6svO2ShtI2E
         gFbpSlFvoBiT6elxWr61tvu/S5XY/Cs0ZdXr9twWCFEBcMfhTI9frUVO2LSOqBLKjnoR
         F5lEs/Hk9H4N+zaf8Oh2qDN2nwsEb3/dP9dOy/J4T2Mle2FskgZwW8R9YgBpC1AKUNf5
         1ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514170; x=1796118970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
        b=Z2HTrswTSVK+wtN3gRbwOJdIDrAZa8qZIEGts4Liz+K1uUA9tOd7E+vNAP/UyEYWj+
         sPcYE48qT7ussOjh5mgRWPfj9TzfvP0dsIIyTqJ4XEBPPJLKF68tE47eAXzNjI1dN54F
         ZlXrFcv+0HdzbS3EpkXiog2NyDeiUXpZydZTLN2Ux6Xz+RvS/Vr1NSRfOG69sUILYuk2
         +3JOO0dOjVTjP5/2NB7v2J2juLDES9ughgFcMScJR9tpSpQuHbgcSGnaYW0XsaZvR7WP
         5imKnQY5/K4f4hnyHJVuz+u2neiM0wBvzjaFtBeUhd1a69L31BMmbSUP/RflK0zVbhc5
         ksWQ==
X-Forwarded-Encrypted: i=1; AL+hErFIuSwntwC6rb2ArFj97SDEH0eaJE2Wwzl+I2lQy+kZnN/8AnvK1qLMBHUbiLObD5fPkwmOkzYPUomQAhQy@vger.kernel.org
X-Gm-Message-State: APuU4Z+1FqKb6+A+lKiGgW1AX9u9i14m9/5zw9F3NEopEIy/kEJFcaKk
	/jtlS+rp6gPKXjc7vxA3doxIjXd177YpMz5p97h4ZVtIM/VYPdtTDt6gmMEMTuUtp1U=
X-Gm-Gg: AZFdTZc1i5jtuy9R3lJKD0SKQrjtlVMTWmZeHT7zZrxCDm06jBq09i5jgjokVq9JzEn
	pT+qx/RYwwYqEmt75rme0DYNQhTLJYVIg7FVCBKu10fAVI1Bd8Qq58HoQGxEG+7EK3XP4jKY3tw
	VhQDwhJLQ2x2DharXXvz9R2CvOVmDjDEtZBqdy7Qlhbxb6FlVWLpG26xDkLdY6L+P343euLSkct
	QTB87LM5xofWyuX7ZdeA+leMEnu074tNweKXNQGYIsZDz5XIbJT3IfjygOdBGaydWntGbRxzkkQ
	EyOszub/JL39cix2xTmjcY0ZuvoUzLPb1OyFL16AjANAD319s69dXSGjv987iO4x0AA3a5X+3wN
	pFVURuurhBdykvkAO2uezZVFcsZ0zJJo29Jf5XSxjXx10ZcHEy2yP+UWXFBsmjMUDO3gEOo83yP
	LB88vilxbk3rvd+didHzeQ2cD68/Vpr6zYDfMEZ4WtkWdPxcukl0msJiuvj+Z5NxlkcIM2bHnSU
	yM0b96Yo6mco7MzIqwv/kxjNAyuFwSgmVrh6Bhypno90Yh4RHp9Z09h3G3uxhfOMQbcyfdR5rkr
	hyE5xKTG+Yl4mY7hPYw2MyRqiYw5b3O7JFTqnYSbOVk=
X-Received: by 2002:a05:6402:400d:b0:6b3:f891:c2d4 with SMTP id 4fb4d7f45d1cf-6ba37ea5360mr9116423a12.29.1795514170370;
        Tue, 24 Nov 2026 01:56:10 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm6563505a12.27.2026.11.24.01.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:56:09 -0800 (PST)
Message-ID: <089ec1af-b6ef-4a7e-846d-3f8ac5e72ef1@linaro.org>
Date: Tue, 24 Nov 2026 09:56:08 +0000
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
Subject: Re: [PATCH 2/6] media: qcom: camss: csid: Pass the SOF time to
 csid_sof_event()
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> csid_sof_event() queues the frame sync event with no notion of when the
> start-of-frame it reports actually happened, leaving the V4L2 core to
> timestamp it at the moment the event is queued. Some CSID revisions latch
> that time in hardware and can do considerably better, so take it as a
> parameter and let it reach the event.
> 
> Every caller passes 0 for now, which keeps the existing behaviour of
> timestamping at queue time.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
