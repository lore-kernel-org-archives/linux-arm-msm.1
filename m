Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572603;
	b=Z4ZmwwsSwNC2GmxVYmwMOfyl8pbCvVbY01Ej9i33ng8cZ1GYFdW1IOvliIBkclodjcrR
	 YiG6bdukdDWbQNCvJYFG3Yq5CgyVLC30T5QZ5mZz+BZMmW2nzw09Ji2FXkkHXAC57TmkZ
	 JBYk7JXM4uvUCppMJGt42iB2yMHHQbk8y1je2ymproYZK5W+36ooIiVW1g5TiJ5wzWSXu
	 abVwDbZS0r4QXd9M6vdPk7PzPSoZcH8WBLVXBltBJ0/lrbI5ATvrldT2O3a7R20h1g99n
	 kLQiI+JgkL3zo+Apsa/Vmk5i+YaKIvePTleTmbXQ9z1II86wsjRHCtx0Mdus4D/O8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
	b=e5lmUIEgrYljgLMY9d4CvykNN85BxOPPMecvlSIqRikduuUfxUxgLS3PnM4QOU2BcZ3M
	 Z32xwM0/VVCw/K0j6SRdkmwRv+qmIuMzBfIIoAAvRua44saO2HK7XxbG9/h18Z91/y9bQ
	 XmLiIlGgoltsLf/I5vtzH8vvVrgOR6Rj07AioeHahR5xdbOz7GR9V5JZFV47JgWXIovPS
	 QFrvtD/BYe16MAAIGV9BwrlG86ns3uiG+ls4iyPSqfYHXkDOHaFfW/A+fyWWvMlefSnfK
	 1asGpgIMgxODkthiCqvccB8kfrPiYn2hsK/BMIzKEXqDiXYMB0gxQ+c5m+SKumir21A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pXdyC55s;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29B606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A29B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pXdyC55s
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d885929so334809f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792572601; x=1793177401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
        b=pXdyC55s54e1Hv6vU9hVz3eoRTKMYXUDEFys21tpyB9ifVl75wWvOYT4F2dyQMqX/Y
         PUQm08WVAcVIFGuZfSdievc2L8yh0n+XJmB3vuW/WJguh/RrkhVU0J8kvl+sL61YTJ3f
         FKQL/DLChMmlFTkicXB5UvpsrygqzizEpq2tqROG8CZX4iWiFwFp8NvN67AuuO3Gmlau
         lHt/VubbcIKIRwlVMWnOlXU7jJ+FtmV8/7PIh2yp5kan5ZRv21djx6EAZiqcjKmGxrDP
         LuD7nCkjX6xcZTe2iwpqixLQwqfR3RJIfOSggsuX8EfprDIn+Fr1e4Ze/6ijfIH8+Ogv
         E23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572601; x=1793177401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
        b=xkw5EY4En97BT3rq5fGg9PqRxA4T681ZeWDOqeQAoQPqoM57j0MXybmyqew7svWfwA
         U7v0vkOFBeVpQDZt2RihxrxGG1vlBQXCGON1GgulB8d9BH18QHH/OGZdvb23Q+ggTezR
         6aLMzROYYnIBvCEuDsOQgvBCnwiYu4j0Zjco7SXHhzQgEPHu52Ba7pVj443f1Sa8xBj3
         rDw9JFE+MNi19wyO9l+fDLSz/VRGngBMNlYutzFs77P6ilU7+OOgcud6lTsZbT9T2/Nm
         8wDzk58YxxIKycsWmZTxcz2L6NKz/Bq4M9SKfqoEy/JUDhSVog1tbviVxLd7ESyYwUuQ
         nLLA==
X-Forwarded-Encrypted: i=1; AKwUvByodB+7kB5+EpU10FYSG0SgNTFY2mcC+xchoOiuytV3YY+D/dD9wRHGvUEnkSnyF9CNrggxSvpt1zOlM83R@vger.kernel.org
X-Gm-Message-State: AFq9FYJpkVPYYZwwaLSOwj5+7Bg/+mNfi2GGn5/B8swoA0rii52ZSwsL
	35eZcaANJqr0g34n4PYQmBsIzul9MIGq+tI4BmwlHgX4Az+FwVO86YHiGiUn2TPDVxM=
X-Gm-Gg: AYBFou2lJt1+/4jpL57Bsd5ZEb1ZWCcP8UbhYwjM67EKr23wNfAm7mHKrueLvLHdtPz
	DH7Blt0faRa7OGZsnQ2tI2SlS3sssd5JAIUExLXXnSh8n3xZijtFRqh+i7Yiqoy7UkMSoZdgt4m
	sOR/m4MZJE7J5Lwkq0aAwcDJngonvyUdyq6BCK9jLW7wQKfVEOJsW/MKkpvVA6X4cfoPOwBKaTn
	hwY/z5BL1zSAZZ+8gtL04fWZL4P+gF/O8c5jfZATBP0UeeQ5aNiptvQ6gFoaQfeaTJ6lH9Fr8Gn
	74ahr6iWc4CwNIkW9HrSXWSW6r2HGBw3OxN7ZMISTZ18hW5R82UDqzZ5uRUv1nhiE2s9s+lnRXG
	pTAp9d5H1iKfR13vhnCOFkEZed9w9GJciENpsVl8lvS6Hcadnd0llDWHmLr2BG/WS6pbcVEbyUb
	0VMbWpyDHWZOg4Hz9UIfwwp7Rr+bXltcfCtIvy5yKCgYvXsS2bajvKz+GAUgDc5nEzfYb73jiXX
	4y9pfW0s5StsN40pkRdh3ihQ0UVjjqqt7WEo6bhO10M6zRp+YlbJgW2bWxAHd/dqw4=
X-Received: by 2002:adf:e28e:0:b0:48d:ec3c:3247 with SMTP id ffacd0b85a97d-48e264dacd3mr1959740f8f.44.1792572600908;
        Wed, 21 Oct 2026 01:50:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f10:39f4:5e2e:3b34:d185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581efd9sm4013258f8f.18.2026.10.21.01.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:50:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:49:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <ath8tHxHOdA7G-Bx@linaro.org>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>

On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
> 
> Thanks Stephan for the additional information, that's very helpful.
> 
> We currently have an urgent thermal issue on this platform, and getting this
> thermal mitigation upstream is important to prevent overheating under
> sustained workloads.
> 
> Would it be acceptable to address the sensor naming and description
> improvements in a follow-up patch, so that we can get the thermal protection
> in place first?
> 
> Of course, if any of these changes are critical for the correctness of the
> thermal mitigation, we should address them now.
> 

I have no intention to delay this patch. In fact, since I'm using the
latest unmodified stable kernel on my T14s, I'm also suffering from
these thermal issues. :-)

On the other hand, we are at the beginning of the merge window and Bjorn
is unlikely to queue patches until that ends. The changes that
I suggested are purely cosmetic (the names of the thermal zones), there
is no need to repeat the thermal validation. The throttling behavior
will be identical no matter which name is used for the thermal zones.

IMO we should use the remaining time until the merge window ends to
correct the naming to avoid any confusion for people reading the patch
once it lands.

Thanks,
Stephan
