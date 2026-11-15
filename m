Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744973;
	b=b32Df+Mmqb7Q0RvxFVmtM1QoYhMKHAvhXWeujuM0An0kfyR8nSRlBwF4fA1P7TGTbw/z
	 i0awlRdJP7/C23jHpuIRtni5kZm6mrEFAXPDeDnbFQG7yn4NOmZ2P1Uu+gVlk61Rm4Zo6
	 UjsQhfP+XDn+00pJebvTZAci7exp+kmbl2AC9F6X5yPco9a/ik/UEPrFmtXoiB3rmlzl3
	 COgllyl1e7+YqaRwIpPn3NtsvYQdPcJSGH662ibEM9zbZUTqx9sIzbf4dYNCqniVT90Px
	 VPaWlm8U4kbedycG0iTJ+o2FTyJPWtN5VJc4Ium3Qu3l86iC9/tfdQSeLU3vKiGwnbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
	b=F8VRdLAdzmMofr3Lf+bCKIvNUBwDXFz2JeRBos28zoHPtMa2WgLv3BMJ2V0xIA3iwisN
	 zw+nOWY0uHzpqFA+ocMBdkKBmzYecZuaq6V+Z56dxYJ4ElN0vOZF/YpVLAuFcSBaAb4yG
	 fvr4vMqgdIdVDpWmCVlNchHXnkMjoS48fJJ7VVKb58jSc7Z3ffxTdPBqrPP6RMPZy4YzK
	 +6ufaFt7rUrlMkyjq2pZ1HU/NVHHemLz2BuUHfjZTHfx5JtGRKOXOgyf2OEHUpVwj3tzr
	 tYvhpytjnidU2H41J0KbK+49Y/PFTNqpJL7PcXjiZ/1ZGnAISclIAIfYcMw8gNKSorA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UMWGuZNB;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A1606A31A
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 12:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115A1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UMWGuZNB
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so28199465e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744971; x=1795349771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
        b=UMWGuZNBsMnss2pwsw8rRFNOryhk6F4P5MsSQtbTOUSYf7p8ABU3vk4PaN1KFgXJ4m
         sLw57i7wKveAJsqJXa81ii4bayts99u5hg3J+aNyMOI795yl24cB+IpfYz5/HXSDqzz5
         8J81IXNBLkrq8pNuLrlDSWMlsmGEW+JxD6BDFcXHLBQjB+J9eOnH/escoFzz40YDBxpa
         l4K4aqxKU+xhxj/c2gSNDaf+IV7G2FNCNjefQ2qzQHvzhnP9uPM67bTReYKQRNnzW10P
         /U8EwovAUK3sCoJtrorcb/qNryT5hTEQM7Pctt8EMwGpw2KT7wD4z3gD8bIyUjh/OWZF
         nvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744971; x=1795349771;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
        b=q49bmhK2JwxSMH2KSfDKyjHLLOq+Tq1Bju7bAT0yQdLxV5veE4bniQeL4wlPD7rywN
         eBbUcBPeMGx8d7beyboJJ8K2ZwZQ945RB5tkxmpCEkD0uD17JUSAy3JgGLRBvFGNNfih
         +sQaTysmw9N4Ej2ah7icRDGF+66UtSIghtjq3HP9XBeK0di9Woa0c138Wlba6GnhpXgx
         XD9n7rLa2PAaObqvRDaMZV0Htk29o2AthBkBviWtK7hhwMRKvO39ueadrqp4ErXuEo4V
         Wjs4SqUUh7oDhqrKM3I5FKOEVw/l/qvLfMtLR+qPk/IQ1GW99GDzIHfPgwKmO+ZMgxhp
         9TFQ==
X-Forwarded-Encrypted: i=1; AL+hErFh5ClY4NCEra9A5wv1DVUbGBKl1oQVmhTSvmL907lkWHH038vA8wgFTqEepLls6HpNIigmhVToh6NDvElu@vger.kernel.org
X-Gm-Message-State: APuU4Z/O+apRkpBiHMVd5FkmKhUPIySQkLq4easHCi1MphKTTdSkonHY
	qjIRY8TmXKfufdcZUgWhHZHgNftbX51EsxieVTZfsszcXARWF9HnymnCyoh9l2g8BKk=
X-Gm-Gg: AYBFou2UlNiZw2d8clV7BnRM7vubrWXgdccvDUE2DOlCwxdbGmsnMPuLqHaCxlVcA9A
	EKgEEI687O6uFmVxcNoiZ+2+Sjmp0TyXz8Qbj/bcUQg5kN/oMNpJ/XFQoGZgk3GOhof4441+/9D
	69+RSLVLa3U5lmEGn2SbOzdSmgYAaZhmXvHNAKePPASlGyXPK7+RqnIAOQ+L1k86C+RO2o7VY02
	RhySrC2EcXOOkwZMr67pfOZ/s9l94H6TorZAMlWoJMrDQLyWNNKIEGm/Fh68MMm76AnbF0ZjtDO
	8SvTlkc7Stb60JsZBh4LqmjEplRwyLPEXmHajrgSfy6G6luiKK22xkkKEoZAgMQIre2LXp6v4x1
	jhhdMNV1fKHOGqMstlJ4zEAkTNPXioh/C5pF2Y0eHS9vzDvdPJ3e/XMrnjoGTcWvImh9IiuW+aY
	0KjBvit/5uHeP+f2RuNU0pO7VInkzl//IpFaLMHJku8aiR681dAnDwVKaPtwAp5IooyRNGKduyw
	OZTMtt9IxDGmm9kwmcwln/+PO+JpcWIEHdM2LZPa+nWH/Uwavs7j7d6C1yO8gw9mFPeDYe8x1L6
	brHlxKZ/aE3NpaMKKIACo6dEyrz/qzFNzuyVYyCeHEU=
X-Received: by 2002:a05:600c:8b0a:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb55a95dbamr161321305e9.31.1794744970969;
        Sun, 15 Nov 2026 04:16:10 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm126726035e9.14.2026.11.15.04.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:16:10 -0800 (PST)
Message-ID: <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
Date: Sun, 15 Nov 2026 12:16:06 +0000
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
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
 <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/11/2026 12:14, Bryan O'Donoghue wrote:
> On 14/11/2026 11:29, Wenmeng Liu wrote:
>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
>> +                __csid_addr_update(csid, i);
>> +                __csid_reg_update(csid, i);
>> +            }
> 
> Why does this run twice for the same index ?
> 
> ---
> bod

"run CAMSS_INIT_BUF_COUNT" for the same index ?

You don't increment a buffer index. How can this be logical ?

---
bod
