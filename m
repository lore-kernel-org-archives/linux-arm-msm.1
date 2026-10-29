Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266664;
	b=5aoMmLkYNOkMMsOsZGv3nddKbjewU4GsnTZjcfxMyvjakCuMhYO4lHg8NWWYa4aAEnkY
	 IfRhihhjoUvCmbp5V6b3lKTXDegomizzoPC2u56R3/HLovruu66avfzj26EM1FyCBEwZm
	 VQE4AW/FR0F56MtDGyIky8dWIgsX7zoFf8Eqm+Y8PNaJtgAPAXdjsgcQeJBC/27yFrzK5
	 O5DGjT83YYN9hTQRchzuUc/0+P6o5lr+qZwaFT6nCPLcn4jVu5OC/xLw3ZCcb1xj6dffH
	 xeCwxOpnLqOtVo262Kwsk6NMYpZBk+HxctcPJ7tFb6B4T1NlBuZnP0eh4ahMV3BqRuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
	b=dxDHkHIH8fBCNdGRzTIi41FrD2M4Jkgf171B1Ib6kGMFu41RGrXDN06TaKoIzxKpC0vh
	 QCgxPzdUjYdgaoLgTgY/5OWFscRuj/sW8Xw5TPsqp5JJIRNfVIgMD5ZWpKmSJ1bx6lEyP
	 yaio4XpmHOVtaWxe4XJt+852McfKtkpj0oE2vQl99dficsO1W50rTEIfU2k7yeOzqbjs4
	 OU53lfEheCnGD6DpKeW2hmK7N36/gVxmSB7pqN1f/s5j5WaXv9/v0EjKf5sq3Z5AYsiLR
	 YsN57Xig8UijMbSixx3ZQJ0zbGJMSRpxi7EmeFQfnjuspiErjzVBnjQcqdPC34a7aiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tvlfi9kk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97A606A322
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A97A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tvlfi9kk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so22628395e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793266662; x=1793871462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
        b=Tvlfi9kkVZdSPhIzlLydhHuDpvCbtkpigMXcPJSx/VgUJ3csemwFPH3EtWdV6Etp+P
         NbA66dOQOQlfNFxvQLgA9rBK2HoBeYyqhpjO0SbDlVPDOrALYrUSrno76UJXo9pW1MtN
         GXMHERCWzFSHDCvPpVUfyp11hY5p9q9zI8gWDawSaayo1Q6ztGlGglgWXUN6gbuF2xa4
         Bfh8q3hoAvJ8jPs7HKaplnHqDmF5d+EdmhP0mzlcJdQ+/ddbPkZoNoxdb28lC7EeIBoU
         /xjeUhZnu9Sq8QYLDi9HwKGYgp7EqJfa8ogCGSD01XRIv1RxASB9WH2WSeJht6btVfxT
         TPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266662; x=1793871462;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
        b=X9f8NliCcklfcInLIUcRfH2b+KywqNVYo+t5pnn+6tq4Cqawi5rHlFOEi2uanVRuf3
         2pBzwB4NoyUZKRAxG8wfnNLId5VBpOqqs+42lR5sWxX5h3HJ6iKHHodRjUYLuvgewSLj
         ypgw4oHV9e36JVwBLEWGnnzoqeJwxKu2r+xAHtDV2CFtbwaqmu0fil4CTAUj24tntbYy
         QV2KcmKX5WueATyGyIDSNgK6Hr9ba/R19G2g9PFYdfPbIU88abqMs6wGF1JuYtZrSJN+
         p7AQfkcQ5SrHu33bOpOjOdNkND9nEZptAbrzksbyVjNnE+kpgq9t4FHGEs+Jh2CBhBU8
         8k9A==
X-Forwarded-Encrypted: i=1; AKwUvBx/nrkQLWQeT1U4ExkgZBeU+LOsVT/Sy3jvSSZJ9XIhg9+Tf3OP0FlwBgiO02PJogds4l4AMNwvSjczGyXB@vger.kernel.org
X-Gm-Message-State: AFq9FYL9GozbjpzrZuFk/KOBlcJOhK4NyVNj4T2r56+NYTTJRzD1BcBS
	ugusm7ks+2cb0BLWriyGLxChp1RW3HBAK3j2ugkvzjxq1erCI23YNuHNuntzvTrWB9M=
X-Gm-Gg: AYBFou0/d4C3TEwR6tCh1vqqUEEFHs4SkpOLCii9Rr5D7LMtfh9QFxUjpjsUAfkXjle
	/CHvKwBE0QuMBVjJOmBQszhG2+IlQRmA/Q6wtdm+eMwfAYATN+5r6THRL3xyfc+1L4KJ4OHqvD5
	jR//KCAwXiDzm4dqXr2ssVMm5jwTTbp5Pch6fq7Y0Fr8MknCbNP6lHAA4hzaa3p2nF8x0g+wx4p
	pvvhnEM7Qpvh9jySseE2LoHikn6ThVweLoJdoAfaJ9kV5NxYE2rp0HH2hYpJS++ZAi1olTWMwgQ
	+Ma/HZaaeQKyII4mA4ULlZeYqwagyRrb0pMBcDOuuHYtqM9Ll0yR+YNwQSxNnKe7UzPoGslzcXE
	sgz5t0WhnADtZJdxg+idHs51WuilFhz72ftldjl5OwF5DGj3XvR2a8G8BO9fVYAov+w6D8FbiLF
	U4mRyI1ydyOaqaLYIW2uPgxHzzWY5hB2B85xhbCu1fJVpayLFDCgWsquJW0Y0dwhiaXdjgbLgPd
	azowPVOxvwIEomALAOMh07n2DSUtTJtPkKPqFGLMRhAHhvC5Fd/0jlzlEsExaBsLO57ynoxK8w0
	uU7bzAWHnNV4sQ/bfaFmrfS98HHdsv5FIgfoc65b
X-Received: by 2002:a05:600c:4455:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4a965ec950amr104208525e9.6.1793266662424;
        Thu, 29 Oct 2026 02:37:42 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm59460365e9.7.2026.10.29.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:37:41 -0700 (PDT)
Message-ID: <f3a1ad00-5c74-4922-9c65-dd7a56c72582@linaro.org>
Date: Thu, 29 Oct 2026 09:37:40 +0000
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
Subject: Re: [PATCH 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

Thanks for your series but, I'd like to proceed with Hanxiang's 
contribution.

If there are further fixes you'd like to submit on top of that enabling 
series, please feel free to do so.

---
bod
