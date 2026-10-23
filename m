Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791859;
	b=NFhuDpIcrqQeVBJVVHYL2/nP1CMLEMyWFGA221BsrWFMX5WST0OAr3VOJV/8hKGPYbTP
	 AM2xfBOxr/aj9fQYaH8kJeT9Ztlu/imFS0zlHx6elc0eP2vtgMRN7U7iJ0mgQHZnIQ5No
	 nebsboZFiKEG6z7Fg0Ys2h9+qsxKAeK3EQEfmJks5+McPni2yRHqGIjj8vED8059mW9Tp
	 0Q6Rf2KA3PfEPkb4u0Gdt1FN0RcHT2vpYAwCG6g7aOSQURUCr9U5wUNqPYC4PtuyFUzYM
	 yIYSCjwAAvaPCNkKfHv/3yZ3kklyLdSSW3hMmhkuShViB7YOhyqPrijdUDvVjLYFxQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
	b=PjZy2r+jgP/+yofW2QS4/VLZJXiJmoYY1ShHctkJ+6QsSJfHXd0lKx+mXrf5/w7JzPMH
	 p+QSiki0JnQ4SbaLHJ7RS5jTUen/1Mit1PybhfpUIrrkVGynqoI1jW7QSkolozxihbDG+
	 sZOVZ6OGHTTTtPZGLIqzS3a0QYk8ae30BS7+kCd6/nZFVAOXuOoJfKmdyFVk4AHCtrQ5P
	 jo+XltJPACghLUlVC+nCiLjuz4jJs8MxkxGqggSRERJUsQpOD/DGfdCblEKmJwaavxJJu
	 Wo478aAolsd0Z43V/BGSSuXN+tm7eZ8396qIcE4ISCcUWMCDbC4JdFQJ0kaLI5PVZoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mlFIvltp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31443606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 21:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31443606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mlFIvltp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so13877755e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 14:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792791858; x=1793396658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
        b=mlFIvltpQf//XRh4JIZWCEhPJNJ0X/sQhjQhiV4wzLgBap50wkui+qFJRqfQ3YDRk1
         yHrOFrS5vtSk+Yj9CrrFgHVyHo4KKLmIYBaRTM/7bj25gxU06M7VfQCUDI5s4oOeWcKi
         F2DLBsHnk/8lWkH5W/MTIG6K5uKsg84EIbIpD98Yer2j1HB2cyW6kRBGnoRYL2rOWKJ/
         TMDpqq4l0qY2PMRtmJz/10lj9/HkD5YDbOHEUNMayjlxBFrqfDvM4ND1pILr+Wp4uD2r
         eN7CY/Aj2TOzSEIuaZystdERQIs9nH35oiHz6TmbIUQ0iwv7Bs/UPsnfxchnRQzyprGD
         0+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792791858; x=1793396658;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
        b=e63PXq+w4w9zHUdPozM5q8OXQ/BHvWO4NLqr6zxaqpHGTbcl1OSCbzwnyJTW3Fuq9X
         DkKacnwTvTULf/XRshxAlydTfyu5191j7Hi4QNTD+WWuhxJdks1CUCtl6Zu0DhFwMJrW
         j69PAkc2xvJZ3uJf5xNon53d5W0BsJuYwkNhZ1/lu4SSZEuE80sQaYAKYYMIsTvVaANr
         XOfsol2sHNt1iIVHW2toVf/vW1UfUyAV3rj8pdYFzzWClC9VQdSdJrv8VXLEFcPJekd3
         dsCTKJ6SJcUARS1wZeQC7a9pt1Y/jUndtPdwVC4oJkrn4VR6AEFkDFf4xGQA3ll6Gdk6
         8nyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGebwECz18OWoX/w+EJDccdG3vUrsDwEmcXJ1J0svSYhC+MBmYpw8zxNc9Inis0H+qRcHAmF+RSSGxYp5j@vger.kernel.org
X-Gm-Message-State: AFq9FYKpPjKqN01b7sdx7dCdHkTD/v/ASEH4MSdx0rOLYc9hDf2oPoxY
	oQTDjEq2VV33TKqy7HOaD2k2ZV7v+emZJQ0tpXwFEObf9VV0p9fRmGKMsoL71guQ2WM=
X-Gm-Gg: AYBFou03PMASadepotB5qUROxc45KS0RHQ/gPMlrQjbiCaW8ANslWvVkwMfnWH6VHWW
	VhajSW1k82CqLl74RJc+XN1yjVEmb53o6nZJy/K+RXEiuQ/yTvWTh4Vra0Qnm0566mE65kVUt0b
	4u90YnEpxnaqPo5pWlRMjMq4jtXYtd7vXMCTMlquh1k9377wF+LGfPyVubKyGCm8qZwpBd5u+/N
	4Va+Rj0E0FEOoAvBNOTX53zTIAbWws94YncqLNYzemNVKUWgUdtEI2WJKlSniLtHa7XAXs6L9BV
	lSP2Qy/gc06cUlbX8Tfo9/XJ1dF9RMJUSAHCdklYJpHK3MyGbwBrgnb/9woTrNQqngNJ3LdArwc
	nHdwplyHAfNJdoXvwuUteY6FEsKqutkOgcFHA9ee7/isYwW/H2oaFjQ4WnHqVTtqk+e/LZlhpO1
	1DtyzhRVUYkT3ky22VfunzNt/fC4oabszHNhruXhFsFeHiSTjZ8cRdje5Col+Eluu8sLwuUbIuA
	bdhr0qi5mtimDJthV5OnpZOd/LofmzG9me1MIkvmGYQsdnEbtlpB1jmEoNjnKWRYEXo
X-Received: by 2002:a05:600c:6095:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a35ac99412mr2318005e9.12.1792791857174;
        Fri, 23 Oct 2026 14:44:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e786sm10434525e9.3.2026.10.23.14.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:44:16 -0700 (PDT)
Message-ID: <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
Date: Fri, 23 Oct 2026 22:44:15 +0100
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
Subject: Re: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 16:28, Atanas Filipov wrote:
> The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
> use the same shared clock sources are not covered and are left to a
> separate change.

Hmm.

Lets discuss that change so. We need to represent shared clocks through 
CamNoC anyway right ?

---
bod
