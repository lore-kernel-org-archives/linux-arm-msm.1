Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611537;
	b=Twc47uvbyMeYvC8iZ+jlQGErjMQBgbwvlqwcHPjgT0rc6wRxpNyUk7Vlzs+W1lO4OnSK
	 Ebb7/DGaWTpwaWT2b+2ik+mRIt8lcDVs8q1CAyq1l/z4gn/hGwSYRTa2mn6WtBGBjgLbz
	 qlEJhigUrzDWgYZDMsMzcmxqJl0aJi+FMd7B532fEBONrlND8rB+0iWxkw8wRpDasR3vR
	 XfUY5ut0Kitrzqlcj0/cXH1/cvUSjzg+QO9Hf+sEgO81EjDV59Yv/qBhNGKKpOybyA4DQ
	 Iy5osqSoL9z97bsE3noEqxsB2LmDimzlbdFLj/E/DsDJ21rbcwju+EhddmK/LF9EVgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
	b=rLOaiCrag999qkXzLMnr43l++K7N15lupp9tcDfpTp9wgUaeBGwSGc5SxLS7zAWgOUTw
	 awxlKM4lXADMAToVNstsiDI+N8n0hTJ36B+HtVj7W0SbF6rtdQ+cvzi2xJKhyRfmn2AHT
	 07kTTdXQF4OL1e34wPOVog3EIS/s33lm0S1kgSj/mrVeZxmbHqr0ZWfLCePGLK9c0HEmI
	 K1EjB/atZWtQKqDrjiA6VZdHZnbEfI6E2o3yw5zTzPDsnk4chBr01/Anwu2EWGe6I+Cy5
	 10rAafTfiwK0UqpM7u/M4iY7iTqkV/5ZJXUI4luCFJCo9uxEC2Y/R9bZYyaxh27O4xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="p/DI/Nj4";
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767CB606A336
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 767CB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p/DI/Nj4
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adb75e65ecso4173631fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795611535; x=1796216335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
        b=p/DI/Nj41CvRYVlg9y550Y0THmM1nyk8wmWmigoBB+no6LIx/8W+/VK5+p+oIzIxAV
         eFHUc07Hrx+FpwgNuFpWhO4Ju0QZT7jUf5PVOoTG54+Buo8ByjNf9BCMoAt19CwDkCSt
         Y3fcyPH9dmUmWj5j8c7JyZD8BwuSv9ul+tt8PyFloswbKfmoHFQCUfUlLFNtBtCo4/Re
         rup0AXGG8sR6XOufLrnxiZ/vWv+Y8nMO72jcepwtKCfnraOwNDFg7mzf9ORl5OtVlNk9
         cOpKycv0rYpHdwHEhOIepEKfsDDkWPUwiiklPFa5VKVzFglw3f4bzE/08DR3MkmZ5916
         FOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611535; x=1796216335;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
        b=xJft2jQ3ZWaoJxmJfaNCntfOOEThNHG73+INDtC6iZKpK8SXETc4Ew5+aocMDnpzKI
         A/B+WEHOJdN+y2QdYmduOOY2elJqOB2de4SZJbOQXVA7EpmeMZ9fKKnNlXkTG9Nnwt/2
         IX/Y56sKa7AUYTvEpxw8sH6+8FZ9BOHI3c9UgW4hND2R5pq/XnalX6TkVZrlFQgdnav9
         6xzC4aJxefvg4sMeUywj0JssVojAxlL1oWTsIyidWE+ymv0EjQLr2L/ZVTFHkHsbJhXJ
         8phh3VCwwZ1dN2OUg9kHSQWJZdpzkcZbb4w4ZEBi3qw4dnUrqnGP3hJ5QEAvXbFt8PFs
         u7Iw==
X-Forwarded-Encrypted: i=1; AL+hErHBviPC7XKOEXzrO1YEpwga/xTHNZeC2uhVYEXC3S4EcEW7VCiEiC1c+VliLmF28Pn0E4ei2xCThc8024HV@vger.kernel.org
X-Gm-Message-State: APuU4Z9iyRvc3W+EFPMV47bYjSMalEG58czj1ivU2UiR+LwM1czdFE97
	+uia6SOkRuwhBNe5eVga/0Wfqc148fBHNcuUPdu0c+h/XS/rDAwtq6+9ZfQqRZeiZBE=
X-Gm-Gg: AZFdTZexVuItq5wsE6rkTGohprgTxOOJYdmLjLZ1S8mjajyIAWE0KskiywHpemG+a8X
	wLJjn/ivTACg2+WsyPi4nlPMmGvY8ERueOBrJYpYJJKRwwgQpQ/CNvxp0MMUlY2jOvabHohOvrV
	/BoAKAEbX+psFFfRU7Fb/mRScA1ta2eZ3ghYZtOY7yI2lPKmTXtzUkLmiCDkSe/MT5BnxYiuOFD
	uihKFDQqxV4vFravSH5fLRGv769UUPnKQByLvBwUR2DTGZkgwVAtX1Xx87I2m3KDZRXEPDs5EjT
	DK8FDNshi925TE0B75kIknaSVmI/32KS+BXRSdtIrA5Gkawf7OL6gSwNhqAQOQrea3zGTR/Kvgb
	37vPmomVQ+uFeN/ZD6yUTEpNy2Lq/Dui2p317rXv8vL/rp/VmDLUssUZOTm/+bbYZhEmuXQMgf3
	PLiarKHPTolOMZiq4L/lnq9WcJLlLYDYyB5CAdEXZSjaEvccAueYbd3luOhRE8LPwvL1RQw44aT
	xa10sGagW1yuAMl0LRraUGaqF1WFXcTeflyrBVoA2GXh4vIX8LzSiKTjPFOKT7NfPLyAru1h1Vr
	uxiVrUPWMhAikdFBW7CPb1eomTMHnP0Yq8CTCZKCs3c/UcLtpIpPiOAUTpvLprSAHpt2uwMZL38
	gwxt0TSs=
X-Received: by 2002:a05:6512:4382:b0:5c1:57ce:d4b4 with SMTP id 2adb3069b0e04-5c1bc75212cmr4845380e87.2.1795611534560;
        Wed, 25 Nov 2026 04:58:54 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff87c8sm4512834e87.19.2026.11.25.04.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:58:54 -0800 (PST)
Message-ID: <2bac2b46-a124-4f41-8a19-7dfe1c936caf@linaro.org>
Date: Wed, 25 Nov 2026 14:58:53 +0200
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
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 14:29, Gjorgji Rosikopulos (Consultant) wrote:
> Hello,
> 
> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>> The timestamp reported to userspace for a V4L2 event is taken when the
>> event is queued, which for an event signalling a hardware occurrence is
>> only as good as the latency between the two. A CSI decoder able to latch
>> the start-of-frame against the system counter knows that time to within a
>> few microseconds, whereas the interrupt handler that gets to queue the
>> event can be hundreds of microseconds late and is not consistent about
>> it.
>>
>> Take the timestamp from the event when the driver filled it in, falling
>> back to the current time when the field is cleared. Drivers have had no
>> reason to set it so far, and every in-tree caller either uses a
>> designated initialiser or memsets the event, so the field reads as zero
>> everywhere today.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>   include/media/v4l2-event.h           |  9 ++++++++-
>>   2 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>> --- a/drivers/media/v4l2-core/v4l2-event.c
>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>   	wake_up_all(&fh->wait);
>>   }
>>   
>> +/*
>> + * Hardware able to timestamp the event itself reports that time in the event,
>> + * which is more accurate than the moment the driver gets to queue it. Fall
>> + * back to the current time for the drivers that leave the field cleared.
>> + */
>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>> +{
>> +	struct timespec64 ts = {
>> +		.tv_sec = ev->timestamp.tv_sec,
>> +		.tv_nsec = ev->timestamp.tv_nsec,
>> +	};
>> +	u64 ns = timespec64_to_ns(&ts);
>> +
>> +	return ns ? ns : ktime_get_ns();
>> +}
> 
> I think it makes sense to add an additional field for hardware-based timestamps.
> Converting the timestamp to the monotonic time domain introduces precision loss,
> so it's better to expose both to userspace and let userspace decide what to do with
> them.
> 

I support this.

-- 
Best wishes,
Vladimir
