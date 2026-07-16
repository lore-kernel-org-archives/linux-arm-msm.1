Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BBF332913
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224185; cv=none; b=iXUDHiQ+JKqURWdFrwj4PrjRM73h9eDgQKn95Q960vH8HaeDwI5VFPkbfLVkdfRhL+PuIbbCsQKcdwRM5/nvlsom9jqwudAuJAxCM/M3dvtw6qY2+I6Dgxub3EOUxa3tdQGdTmtpOp74GcAcNlfrWpwJhRXDrZQ/Q/aq3q1g4Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224185; c=relaxed/simple;
	bh=h8dMwf2MXhdAxkhcE0UScQxJ/befx1264d3qYo6rnCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnogM58x4NX7UH8wvJ6m8l13K5OjwHJ5FT+qetgO51dK0+QywyspR6vlXZSxElOK9jrBwnJMri3EHrNjCiDk5m7TL+6aA8ZboJxPiH9iNNizKJIlpvrm+Gq4MHEO12AjbbrQf9t2KgPdgPmLcdUCDB7gea14+s5hEDod9ROLGWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tf0EdxTB; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tf0EdxTB"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81e9f7491ffso87020067b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784224183; x=1784828983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8dMwf2MXhdAxkhcE0UScQxJ/befx1264d3qYo6rnCY=;
        b=Tf0EdxTBG9LXBtKNyW1iUKNQsX6YyW5St8VfvfhqO4vo0aI3iCtUNY6uliizJKCjCB
         pu5xBHMxlsM/eJyFPPv+Tli/smphfLsqEBfNj/l1tbDxPxCCJ/2NMCO5nepIkmSir07m
         kKpyv/8Zb34l52CdU9z2s7I+45looCr4wRxkrjudM9Kr/yI9zjyH3Rgik+fDcZTCipNb
         jWyrmd10/TWbxHQUZz1/nEDqefdBYvhTLZBaJro8uis6PLC+2YHrUA5+uENbyLAPF5JM
         LfH22EG1jMazYxJPl6bpuI6W+N+LikZgRmARgDjhqtwYh3m2TpK3gqBiL9rKccLcvsG4
         9S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224183; x=1784828983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h8dMwf2MXhdAxkhcE0UScQxJ/befx1264d3qYo6rnCY=;
        b=pFTm3O0ijKOpTMsEcc0mYbQMjiq0lfYzuL2OmDqfMYhciP+elQ01uCbJfeGEfOAM4a
         DzSBGdmEUWbbPJNnMuiOptUN8UASl/FaIfxx3r5v02/7arVBNw6l5BJ41TP7BypS+L5Z
         0CdSKM2eawT9DupevgD6qxI6VYTtUMeS29rjjoz9aydnY7mHdVcUP0T7yb2otr5j8lPe
         E71+K4z4i4UuAWY5FZIGA0dCkLe4GBqrhj3TeiLppPu79ICTD7OT5MCeNbr2nsCazN6l
         dVglkjZc4bjN289iJoxeFq7QWvP7ZdGOO4gqK+6p3lvuW6D4TUvYgO2iydxwu7QFe03u
         VSBw==
X-Gm-Message-State: AOJu0YxABIqjF6YyvDbLdeL729qWk2ecQ6uPwHfGh3tcEUhK6eLWea1S
	U2cx0YYtEUcrDgXnqbwvkuTJ8KAuta2y8s0ljEZinJzQM+X8vAdzpyyGQ+l67Nyl
X-Gm-Gg: AfdE7cmoaHDhjVOKdkI0Ndg1qfvfF7b4NQRUx2cBheCngn4UnzooA2I2QFULuc+ZrNK
	mrzOk7XyVscnIh477BT0vSkVIb0KYrQkzqUCDpiZ5Gddpyh3Yx5cKGAIAXHa2Z8ToY8/ZfXqyx9
	W0fBRrGSIVr8gsIO7cY3NqvKLZV8NGtLfmCd5V603B208Wt4t1r01q3bpTid87ak6tOhaSI9hAQ
	zySpeLmJNdYntQboibHdjeJyrzYB3aqOwOAf6wMrtnZTMzUeOF4Q6rO2OvIpDqJQ71oPnZfWRzR
	5L2MquIEeNG9/OQcXKaxuB/uFY7zYYmVd2d+IVRfTQ7niLDbGGamdX2fViqbvIBB86YUrkh4gZ3
	jQ6OBkiTU3Qke1hmMoB+Piy85zXAx3c8453GrbhraecQDzupUcDiSC5Lp+TN+3VopgiOK2i4HOr
	6Kvlc3UcIVPDTmv/ApCeP1PJGW0Vcdcjh1ls/gOdNUv0DpTlprigXuztzZkd3M9SGyfs/R+q8q8
	hdkCpsNZyS3upE=
X-Received: by 2002:a05:690c:6c12:b0:80b:dc35:6a2 with SMTP id 00721157ae682-81ebfe0453cmr90014527b3.18.1784224182692;
        Thu, 16 Jul 2026 10:49:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:566e:ba00:93df:11a7:3aae:a53c? ([2600:1700:566e:ba00:93df:11a7:3aae:a53c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1ee792sm201943927b3.38.2026.07.16.10.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:49:42 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9688c5bd-db01-4234-b9da-809747e8cdd8@gmail.com>
Date: Thu, 16 Jul 2026 18:49:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] soc: qcom: Hide all drivers behind selectable menu
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
 <20260711-qcom-soc-kconfig-v2-1-4a907e064281@oss.qualcomm.com>
 <9bb44840-c3fe-4bcd-af2d-149dbc2c7c8c@gmail.com>
 <5a69bb8e-8a06-4678-bf20-f0dbf76f47c4@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <5a69bb8e-8a06-4678-bf20-f0dbf76f47c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 7/16/26 06:48, Krzysztof Kozlowski wrote:
> Can you share the options leading to that? or config? Without
> reproduction steps that's really incomplete report.

Sorry, I spend a lot of time looking at unmet dependencies. I forget
sometimes that these are actually pretty rare and not obvious to
resolve.

To replicate, enable QCOM_PDR_HELPERS without QCOM_SOC.

The problem is that QCOM_PDR_MSG depends on QCOM_SOC because of an
'if QCOM_SOC', but QCOM_PDR_HELPERS selects QCOM_PDR_MSG without also
selecting or depending on QCOM_SOC.

I'll send a patch to resolve this.

- Julian Braha
