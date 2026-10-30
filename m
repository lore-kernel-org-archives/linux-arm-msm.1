Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367979;
	b=yGoB2TDZsLHFjALyyA1NrPTcQFy1DiPOVwOuF/bI9NedHdMA9ArhZq0gOo9To35Dhwt/
	 CZduQ1+QXANAGZ412MFCZ042IROKskISUoABO/49IIgVweyYV3M9SwdliHL+oqnCWMk3F
	 P5mIEMKDv3OGCl2uWTKZdjrYbzclz3Db6URImRUMYPpcLV4q7M49+9iv+Wk+F4yCsKLnX
	 /E4G+yleVylrU+fslu4A4Acgr6OtW9woQXlx+ZvikTOm1BaBTFnLg2h0oELnT8bI9HK1p
	 A0TvXw2CasxDZ3pg5Lg7prtQKMleGbS76QMRgumXd8561Ni7piKYt+qJtyXmpN9xjpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
	b=i9UKnyrCckdq3YU+SCBZ02pWPAYQGt6Sht0egU9PCEORvNKQDS3jy8BJDerV6AZr8vK6
	 ZPGQbpQY+g5TAWBMDQdJy9movkB5eCL+nh0Qv1DLiS71wZ6jGwa8Vg+CFBm4gT1EdguRL
	 eqsaEtctgG/1MrRZLapG91d9ILLq1O4XsqPujuGLjQSKUg1W76uVuTBd15j+IZiqZppdB
	 GWaaU9PNCW0z+ugsYi2W6Sg3aoOG2d40jIZRJO4wCF6NyIFjVrRh8a+PG5teeXORLoqas
	 pUzvBWZ56WbivnjSCVItF2MlDCYkvJz3RAUtkKyfm3B+Jv999R1Yy4JzXVtOjYOq4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MHCzlPUZ;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC34606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC34606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MHCzlPUZ
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85a5455bd3cso425586a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793367971; x=1793972771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=MHCzlPUZKMnE2kNo9yoyOWyk5iazVdyGZcGd3KBZgWLavn2s/MGurSTnlnGWrQcNlG
         Y4sRWrGUcDXFVzUpwSMONQl4Vvs8Jlm/MTkPIxqmO3Gw4v3nqb5eZnERYCNZ8TeSG9yQ
         lnRadBi21wkXJaAEkA/aq62Uy9tv+sDun8I24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367971; x=1793972771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=rEJKyxNGF8PHlKajLNQ9bSkG9IQn7ej2W2EkluzD1QlWiRtYcw+kKUhe79QGA6rHKB
         8W1fXZMv08gqdguXJoCJVNzLWnHXCyQJrezx+d7BJEfT2LuHEMc/a1AYPvw2cr1rEOeT
         qMbKZploZTODz+VnTpZiBytgvDt9C/JMQIyaWRkycifXJsF/YGl223ZS5YJIQgD/j/Fw
         15u0Ekq34YE7fdbC+hFhST36KHxGhmo8rMZmNw/36XBaxmR1RdzstS7+ODvZX71lPVnR
         pUwasIgaiaRapRj9ecGkk1HBK9JiY20CSyZbdRbAxpsP+F3P2lme2JmbEDHKDst1C7Rn
         W0jA==
X-Forwarded-Encrypted: i=1; AKwUvBy+MXigB+++Ct3DpHJlFc4B0OZCcAxTJA8qLYBg/dnAGZrixE6it3pOe9qtKmloZ5VEcidhJnSGoHVhDnwX@vger.kernel.org
X-Gm-Message-State: AFq9FYIw2ZyXK6a+A3tvJDh75v8VQeWUos38Wd74zdVQfP5sC7BPiLUf
	FhWARerh/wDYNKUjlepWbRkLJaITnrhZyX3CtheKYm+ixZqcDTPxgsBvxO7vPEvok69wihl3R/7
	f+vOwWDJE
X-Gm-Gg: AYBFou3GKCSMw/OxExysSURN4RoBQVockeaawjj4WR02FNvMKWD39/IJDw3haMlVsfq
	6DpPaK9MNV8pJa2TKkZEZEMLhhspIU1P6hZMX5pvjsqpU8d2Sfb9v6VKwgtNAEpmLRC69kNS3z5
	wE2IalH+g1xR2XnStuCAOOncxXMIT8BS9CXy/W9eD3g7bxm2ToBGxM6fLekv2hUcBUGuPczSEki
	fVhJN+KxZ0tQYf5kd9foyzSP0Hh8+7SCfELZaWDfBj+EHeNIAnfpvh6pKXVBdGPT55g06yjYoPl
	xHCFLajiwrUkRksPVNTfz+a9/XKV3OZ/4txXVbp0E6qMkB9VD2eUCWG8UELUM3d/9oDt+aCueXq
	aDiVlbfZWOwWjUiYV/kpAbz05vud1H/XSI5nTk/wHGNvquWlZ3VGoZr3WMMJ0VPXumBBJO3kan/
	ZJAJAzQwx5jDC90yYZyuG0+484TUY4ZQl9dicRyLRHZIV2OKscZ+Xiuj3p09S1RUb903sxWj/wy
	sQMbU8JNqPSKXVH2yExiChJchmo6pwOCKLiBElHFA9YL4igxdLCNZZ2vvUh6MIPxtYzBqA4UK22
	Mh952mjBpKDA3be2ErPHeGQ/
X-Received: by 2002:a05:6808:151f:b0:4c3:6d56:77c2 with SMTP id 5614622812f47-5640de7e3a9mr1613306b6e.41.1793367971178;
        Fri, 30 Oct 2026 06:46:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-5640fdcef5asm1492922b6e.9.2026.10.30.06.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:46:10 -0700 (PDT)
Message-ID: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
Date: Fri, 30 Oct 2026 08:46:07 -0500
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
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 3:57 AM, Sakari Ailus wrote:
> Hi Frank,
> 
> Thanks for the patch.
> 
> On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> When CONFIG_PM is not enabled, all devices runtime PM state should be
>> treated as active.
>>
>> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
>> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
>> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
>> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> otherwise the same, except that it requires also the use count to be
> non-zero.
I think "yes."

I think the logic for !CONFIG_PM should basically pretend runtime
PM is enabled for all devices, and they're all ACTIVE and effectively
in use.

That implies:
- disable_depth == 0, so usage accounting would (if enabled) be done
- runtime_status == RPM_ACTIVE (power is on, no delay)
- usage_count > 0
- runtime_error == 0
- Maybe ignore_children is false?

This might not be complete (and could be wrong!).

Some of the other dev_pm_info flags could probably be assumed false,
because they represent states in transition between ACTIVE and other
states.

					-Alex
