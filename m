Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C0549A3B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718059; cv=none; b=Hju+K51dYwMQtMy3fpCdoYKg8BZCsSNzlqGiXKLgRLZEP2nOB3YMTBxxkGRLws0fM4uAg854Y4OliNsPpt76rE/ZIHqoW+AyztNsf5vWfeBk4Si370QOUq4tO0gq040/Pmibno++ffTcLzq8igfrsWnzLKQg3ZKwxWyAZjVRkN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718059; c=relaxed/simple;
	bh=kNjWH5+CMgW1Pl5h6a/fYwVArl9Y83OAw6Pl4E7UYmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFZuWXM8CNJQCbC/j7t4AGd3FUvVneVGpCe483onzlqBwUbnIgr5rTRlk8sUHUeSZv5fBe/Vtrw/3l2tPN2ETmDTjsWsqsordW7secKmxV2s0VOfuhVvbpTyLA+rqtm6jWn9mynBKIkcEnQaauAIxGIo9z/G8zuW6DmhA89qcLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxIs2gZ6; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxIs2gZ6"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6aa487e2337so597795a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 00:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789718056; x=1790322856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drEHSSlhuZVaxkDlnBGA1Yj/cgZE9sePJP3czUIslhE=;
        b=AxIs2gZ6VH5UgYIFr9Yw9EV0BCQ1R8qky6GwRmk7r36t663M3YjIgQ45OrUYfvv4XU
         1xPInICkSV1b1a9Vdi5FMVoRtYq20V65xznc5G72rrvLXaNzISvbtExVX0apWPEvEN9M
         4z+VqgE5GwR/bi4IuI0rzKmCkRiGDk2oF71M3VWMdbTsFGggVQn6A5qBg616EmD512HA
         d2F6EczK4Tz+gjzGHGjLJKafFc7qINFjW7QTeRscKoKwLAoUWo3vJx4aVi6CVuzjq/zM
         BNbeed+DRZDosI+MoHynG6tjI0BQXwrju6r6/VwkAZHbv+rKEmMCww4PmPsAL8TDVRWG
         jNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718056; x=1790322856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drEHSSlhuZVaxkDlnBGA1Yj/cgZE9sePJP3czUIslhE=;
        b=ed1+8b7NDlsw9tb55fqKpNJERg/OdHOZU+YIAZYZv2tizb+JmSK9Vg4GVQwzcYMrRb
         QMe5JxMGIuvk5K9Ifqg63qzkDWTI83JojZKQtp4lQcfPQzcmq7VmOUmYA/psXqsPC6k2
         Dsm4sPtvT08hqkWDEGkg7rI6LBRUAPIvXFtdj7igHQzybENhqUQzEnNoSGPHTQ1dr5Jd
         SnXO21b8XDAtPYF01I33yRNAZHGpqVmWTKlPTG/6sB80NU8jVd85VKwwG3djx4n0AWrg
         qnSiZZ/QmqjC6ZG+cmN9SApI64SmBQ1GtHHT71ufvhH95QkCgKAkFZIuCfm+2KNleuKR
         MPLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsMACs4HgZoyfCi7m+u5qWE+M7GuiAaQ7XldSnojuwPyGGNYPxKN/Kd9lPgtQCczKTmKZ2F/XMkDFXBZw8@vger.kernel.org
X-Gm-Message-State: AFuF++niYprPRH9MLT5W3keRGK6/umKvIMr4HHRhI2NzKF+8NoeeauFf
	+/LQvnOruYQKC1folVC+fl1Nv3InatHrVddEf2vuSfk1UcIcQ58WG1vk
X-Gm-Gg: AYBFou3p35X+DdS79gsL7+meRDgEIFQ9UBDYsvGSbS/q946H/QWUyVfFRZ4PecqbTDL
	IMD+k0YSD10y2lurutxHnhrsFRykEfHKVInMLGeoLM0a2SO1zuPIxFS9ljhx/I//9ZOOUiIM2/0
	PkXswSKDZ1gd50YCXqfRH5gtKhQkNz11tQnfQanlIyXKC8kNm39xTmn0A34DwxUa0yKn1JixjKS
	Y4imrjhz7JIdvIz7SUkuPC9zk3KsYIPfQhP91196jWBRDqee92aRzG5tbN/Oo/9zRzu7qoWFE8H
	aP0bus+s+YfaKAdD0r7Kl74IeMYLVmNGDwuduAAlwlwXJtJIvMGdAXMUj3vBXBlZk/++3iZHbNl
	JtiZ/X/Vy6ucRx5WpAGAQh/rYWbES7lph1YVV6l/Rp8FJtNtlsjefnVoKZrP0DoOSTgdxQ43Q1+
	6pHd/ZkFo7nWOiIF6xYIj9LngSujE9b8SjzOb3IWa568TezmwjCeN8we08A6qJPWMNpGDZb8F2n
	IPjnC3qe9+3aPEEQQ4ay3bT5oSZLlq46yM=
X-Received: by 2002:aa7:cb1a:0:b0:6aa:1d71:4a7a with SMTP id 4fb4d7f45d1cf-6aa36e04b69mr2998119a12.12.1789718055453;
        Fri, 18 Sep 2026 00:54:15 -0700 (PDT)
Received: from [192.168.1.30] (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59605618sm469752a12.11.2026.09.18.00.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:54:14 -0700 (PDT)
Message-ID: <c7fd0dfc-5da7-4bad-bfb0-308e3937b1cc@gmail.com>
Date: Fri, 18 Sep 2026 09:54:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: qcom: add
 xiaomi,taoyao-pmic-glink compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260915084901.56622-1-zstaseg@gmail.com>
 <20260915084901.56622-2-zstaseg@gmail.com>
 <20260917-sticky-sheep-from-pluto-adf65b@quoll>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <20260917-sticky-sheep-from-pluto-adf65b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 12:07 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 10:48:59AM +0200, Stanislav Zaikin wrote:
>> Add the compatible string used by Xiaomi 12 Lite 5G (taoyao) so its
>> battery manager can be matched to a device-specific variant in
>> qcom_battmgr.
> 
> Previously you were asked if the device is compatible with qcm6490. You
> responded about something completely else - that you need qcm6490. That
> was not the question if you need it or not. The question was are they
> compatible and you have entire commit msg to explain that.
> 
> Instead, describing standard Linux device driver matching in commit msg
> is redundant.
> 
> Best regards,
> Krzysztof
> 

Yes, apart from battmgr, the pmic-glink implementation on this device is 
compatible with the QCM6490 platform (base communication & UCSI 
implementation), and therefore should keep qcom,qcm6490-pmic-glink and 
qcom,pmic-glink in the compatibles.

I will adjust the commit message in the v5 to:

dt-bindings: soc: qcom: qcom,pmic-glink: Document Xiaomi taoyao compatible

The taoyao is the device compatible with the QCM6490 platform (apart 
from battmgr). The device also requires both UCSI_NO_PARTNER_PDOS & 
UCSI_DELAY_DEVICE_PDOS quirks.

Document the PMIC GLINK firmware interface on the taoyao by using the 
QCM6490 bindings as fallback.

-- 
Best regards,
Stanislav

