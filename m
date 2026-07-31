Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BBD3D9680
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486717; cv=none; b=ma++gMSI/SPveWV6n22Am4Z9LZE4N3qoNdeQSPlUgqWilvK4NDO5xa3tBNAiG5AnGFD4DsgIkASRTYm2R3sRhCREN6d3P3/YCAuTJYS52hzOQ8Sm6ZOZjksM3grLT1a0rCWBBiRw+M7QxNVW8MAovqyiPM0gk1ZeLCU15ijYv3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486717; c=relaxed/simple;
	bh=kAqAcIz5QtKYzawMTXXlnqgqg4JMmqIv5C9dlJgw0nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Np2cPZW9f4ZmmpX9mc0Hs2q0wY6d9mzkxxEBkGXGv6o7JSRpxKZ78Qghva8pO63WmpCpwBsKUW/S/7VWNCfOJX9FBtnGiILs6B9VUL722SCx34D21hRTxtkvY0MhXQAC/rcu6J8b4QAMkAa7SGjuxGuF6PIFGQZHtX6VBD0MSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7Z3pUqz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7Z3pUqz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so763066a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785486714; x=1786091514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5opxjM3WP1uKoiXfgIFGWWJoVd8/eK2NiqjT4aZc3Co=;
        b=U7Z3pUqzLKBuNj3UHhmmUfdoDH0Etmk7KCj78uk25IN9QllJiSr16WdBkKqPoWIcvr
         pqFMA6DcE9VUsUEImLUIt+ArWzCs2u9wIiEwgiph42Ks/LCSLJr1m5zEOoDiDk4O+3Sc
         h0e1aK6VzRrhK1ywsGNSvcpGywaqNypeeSGUJYNiRhq8Y3DflN8BBkj4ueHcViKJNL+v
         gZLtAsV0Hw2o/VZDuEVV6sSlA5s9RNNx3x1s7jrO8oxMiltYjSZXnUUNRcNpaVuEyFU3
         esPSDjM036pGD3CMMIcLiNviQwcZb9i1blFf0xf6Vru/kGv45WUjD4eWKqgjgiFKBE5P
         hJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486714; x=1786091514;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5opxjM3WP1uKoiXfgIFGWWJoVd8/eK2NiqjT4aZc3Co=;
        b=mCksl0vlo7ONE+1FHkt6TNEX4C9ITwtJfYP9fJlwVgj0s/RPfUPRCQYiBs3vkvfPyJ
         eOhERj04Xed+tfwjqaFNFCYcjwU1abXko0dMxAPYgyu9LFmtZ8DAZzrq2bpQNgW2O9DT
         CISI+LXjm5cjevzDjHJXzDW/7uu8s8Y9NHefZo7ccW2/hJHcdM2I5O4KJmRzvjKKuw64
         c0LLj1s4ukciy1t0kSBKCfWD6uMErQdy84ZzMWSwkx6+iTKyJPIH4FD/Z7Fy/fkLeTv1
         a6Wv6D/5YKbTn3gtYpthSHBIb/vXdyLfdnj4WvUj6BAjarYsSCOWXVt8m49xPI1Z9aEL
         7aNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpps4RUzgjnrQi3eGp5Ura6QtRZtHjeCXhJYu5IL4ztGOlXAHzVcn7B7GlGOoAZmgo77QFizwcFfbkVubxH@vger.kernel.org
X-Gm-Message-State: AOJu0YyCaXh6PkXRxvMTLNZ2Boa6/SKB+cW9Y6REboCCJcrKMl1dsXr4
	0p8v2gm267q9KCp7ZNB1TOwN3LI72eg1mYMCrYEvZoImV5ufP5TfuShdKZsZBX3ujKg=
X-Gm-Gg: AR+sD12isKp5Roo+c6Uv9XpyoKVrxlgxCtjLYKIC2VI2XtR+J1Mmumm57+WHJ/QY1p/
	SZHQYOu4qG0Q72jl/rZgfbvVaB6EkMJAaHbOFgMinfsAl7AskMoXhDxhjZofbHLZC70jmuZuv26
	HtP6t4+fgTrOszJeuPznVqwe4oUGeTTN+dPm+2rU1LYKjpMQbzvAOWDsbgOghIuH0XMJNwM0A75
	Q1KNlyeDOG0MvAyWZFkts+ZVY/MZptXsAkknnEyJrl6PiX6wapsrrht7px0dHLK3mYT5zolI5/Z
	QNInB2Az9r94ibNZs3icwuXg+UqPw+GQdZvOgOEIf8weFnPN1hVQzan8ElGRAZ5X0GQeeqKnwad
	DFxQUvre6nav0uVmz4WSF4av+FbndAHghiDM1d1GOug+tWKF58HZFCGpa6FVyudokBpbdNRbeBZ
	fIDgthbSytLZBKy0XBAxiTTNCS+emVAJEKMlT3h+1OWAIhQeURfTac+PYmkh04tBQIM89FNttGo
	g==
X-Received: by 2002:a05:6402:146a:b0:698:81ab:c506 with SMTP id 4fb4d7f45d1cf-6a098cfe5f8mr558492a12.39.1785486713758;
        Fri, 31 Jul 2026 01:31:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.219.203])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5b0c0csm581589a12.7.2026.07.31.01.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:31:52 -0700 (PDT)
Message-ID: <a83a736d-f53a-4dc0-9886-ed1aeb33e82c@linaro.org>
Date: Fri, 31 Jul 2026 09:31:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/19] Revert "media: iris: Add Gen2 firmware
 autodetect and fallback"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <nciBbGKNOK55HVq4C9HNepE0A8FCWZZ2muPnZ1bx53-GzZ_vgwa_mnh4V8fpOmYYK8QgwQsm7PbYDnjeo6WGGQ==@protonmail.internalid>
 <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/07/2026 00:48, Dmitry Baryshkov wrote:
> The commit 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and
> fallback") added support for detecting the firmware HFI interface based
> on the firmware contents, but it has issues with the MDT split files and
> with synchronisation / locking. Revert the commit, it will be replaced
> by the better version.
> 
> Fixes: 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and fallback")
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
