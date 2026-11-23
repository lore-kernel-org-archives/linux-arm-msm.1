Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444834;
	b=QY8UeMxHyhDH83iyq30J0kRlFcN2cuiM8XIHDFLnAg1eW3kgzhG+Ma5p+0anF411UR5T
	 8C7AiaXYMG1S45JGn8DQllVRgIl3+DmPfm5te7RONuLGBOigFySQfTwkJB44teuNawFC6
	 exL1H0OgVbTmyavkI8oQKF1IFye3pjRFdlfkFz6rbVHXSw7otFnPje1pUjsNKPEVdSqnm
	 NGXmImMxyQYral/7PpU5BZT8tL+wT/H4MUJ/4GYyvGRC4Fv3/HcKSwsgA2YoN433lhs0a
	 TXI96wTB7W1JoHdcnv+k6AWK10YzHXR/62aq5fRaBeO3bTczxon7i2jAV08l2vojbqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aMYXL7EonhTOs209JASQvI9ehnglaVQ947Zpfa+X+7k=;
	b=dVjLikfSjJFb3/SE/y6Nc3A4vZcH1rMdu37ormPwzBCzzSWYMKO5Rwrb6Vtz+TAfhwHA
	 ohjo4mwze5grxpvSD94TKzjJD8mFyDalgFsU0aavbz0kuombc6R109VExv+8NuQtrunA5
	 PwwxE/+Nj/BI+7cUMZpxO80GjAgpr8DT4XhbWhZjti9y9vosQ3o1H2d59W+2FlfjWyWJR
	 BkgKxKJRxOAWjqvdKc+NbVwQdcFJ+9UE+JIhWinJQxT3aydKOM72Q0eNJsrtXFEoB8gyi
	 9a3woPWampjea+h4AGUMal/yUOe2C2O+mIEnnbVnj61eeiq4GuhbTGe9DsLAwBFnDug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Xz/9lDZg";
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D399606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D399606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xz/9lDZg
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so4411410a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795444832; x=1796049632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMYXL7EonhTOs209JASQvI9ehnglaVQ947Zpfa+X+7k=;
        b=Xz/9lDZgTsFzA1LqJOSthRgb6ouD89i+1VlpyK8e5KROmVyCRY0C/414jV4ayO45xg
         IbZ32k6q6VGU8ziQVlvvAoI6EX1sLg6tdGfOIrqo5SZClLp6fw3ReRGgyGJ+DJ22e/WM
         TMZA0rrRZriHODZ4jJqiKJBB8xlCCd2vhyA3wCvwVpL21+Qn83ZEaYOQRWn4bDuq9mHx
         q2Hh7ftU4siUfCEYgOKTCmOglYnunbPywKKuCainCzhcaghDh/QHCsPT/a0aJ7zz8WyR
         C8rB59SLXyUQlnSEVt5rKJs1foS34OUAYkR6nz5ZLy8zjtx5Ci7qnB5mfRWE+iAlxvRL
         du/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444832; x=1796049632;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMYXL7EonhTOs209JASQvI9ehnglaVQ947Zpfa+X+7k=;
        b=WbdQ0RR9I++yeTqEV0cThStZzr53sQHtwN50XA33D95djLb50NE0ZNgrYeIq7tGfTR
         mnpln2vvKYdNlSje9NLAHUc/f8yH0l7pz9V30ul3mN8J2CmTCJPlC2Da9uWUGp36oVuQ
         Jiq15rp2khE4T+izcY4w753HV3qRZvL7EBr/xb+wWARGinR9vXYT3rf5msLKlSlwWTA6
         yEe6K73fJg+cs5dJB6QdPARfeMyb32H/vRbT8PWsw2cC3KNua80kjtWXiW+L0kWw2lQi
         cFmjiMg7kyCTLEWrNxcGPSg3Q+kjVI6DOzMQeB5Ujfmptz2cFESnRs80HIn3mmrF/1+K
         slKg==
X-Forwarded-Encrypted: i=1; AL+hErEGcmE5nqgLzF1A+612C9oOgtE5Ts9H/x69F3a1X3O6it3EKrnvbeLzkh/CZJUkZETF5ihX4zRy4nXp2HR8@vger.kernel.org
X-Gm-Message-State: APuU4Z/aRiOICivTxyXFyVLENth467WKzoe9WmLyKVLk2jIdW6AXb2I5
	+fXqm5isNFEoS2k94Nmh59akYVvWYezv9a3ioG9oQHoDaWuwdaZBew+0ZCOKu61fi8PE2qLnyd/
	yjZgpWKk=
X-Gm-Gg: AZFdTZdJ2eJZwvgdHGfVcRDWX9GWhXmrDOSV8V/X0nuABoZqeLF8x3rgp6/XcBtPy7x
	V/7zsP3xRnGjdUVCZa9nBOVT5aixKiFSv+qLwVXSdIlEyXfIQDDQAmUNBAlEHY4pc0b4NP5olYe
	DZhyCaLaDVTukpsH5p0F/c+8kuqIhanMHd7tjMVkFWUKhDiM0Xr/7KoFrAKUmI1UbppBIHRTxV4
	RsVHMJ8d/Q3P+UbGjvF+HqBafkySIAp/6WKX92KW7mUMAQvIEX2kXCPMEm/UwJQJ1dRlJqZMPbH
	ykhxbu2JR94bC1H5f2F1cGWayjnxRlZRDU972ZOwMkczS9RhkLwdLUAmneq8Td13gYKtfvV9X5z
	ajeAhv8D3rfBSyhUJRHAoqccy/kI95B1Im9FaFVOOLwFyAP+ZzFRjioNUzIKrpX4tIsTFFHFcw0
	EX/qBSCnD9Qj86dwk6UHIU/s2gRblRQ35fa+SEhIC+B+RFDPcjoOmULfwY6neBC8evGb2U3Xhxq
	kXjOOz5fSvvjbRypi5/Gg/FnmlMbQb3m6U6+T5/EPxOXBU+OVQPCMelqa+0qJ4otSOUQMzamFNQ
	CREkg5GXvw8+zdxO7XQsN17mIGeBO0oCep1IJ3Kyrg==
X-Received: by 2002:a05:6402:270f:b0:6ba:a614:2fa0 with SMTP id 4fb4d7f45d1cf-6baa6145b28mr2877843a12.32.1795444832491;
        Mon, 23 Nov 2026 06:40:32 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm5538942a12.31.2026.11.23.06.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:40:31 -0800 (PST)
Message-ID: <60d0212d-717c-4776-a6f1-fc8c9661c408@linaro.org>
Date: Mon, 23 Nov 2026 14:40:31 +0000
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
Subject: Re: [PATCH 2/5] media: qcom: camss: csid-gen2: fix RDI enable bit
 manipulation
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> In __csid_configure_rdi_stream(), shifting the u8 parameter `enable`
> (promoted to signed int) left by RDI_CFG0_ENABLE (31) shifts into the
> sign bit, and bitwise ORing never explicitly clears the enable bit when
> `enable` is zero.

Sign bit is irrelevant to this patch please drop from the commit log.

> Use BIT(RDI_CFG0_ENABLE) to explicitly set or clear the bit depending
> on `enable`, matching camss-csid-680.c.
> 
> Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for CSID 170")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f..804c8fe 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -318,7 +318,10 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	writel_relaxed(val, csid->base + CSID_RDI_CTRL(port));
>   
>   	val = readl_relaxed(csid->base + CSID_RDI_CFG0(port));
> -	val |=  enable << RDI_CFG0_ENABLE;
> +	if (enable)
> +		val |= BIT(RDI_CFG0_ENABLE);
> +	else
> +		val &= ~BIT(RDI_CFG0_ENABLE);
>   	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
> 

The bug is that val |= 0 does nothing, not that the sign bit matters

u32 val;
u8 enable = 0;

val |= (int)enable << 1;

enable is still zero => two's complement zero is still zero.

and

enable = 1;

val |= (int)enable << 31;

sets the sign bit but that's bit 31 => 0x80000000 which is what we want 
to set...

What's legitimate is

enable = 0;

val |= enable << ANY_INT;

will not twiddle any bit in val so please just stick to the bug 
description in the commit log.

Once fixed you can add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
