Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223343;
	b=cv/+Jp3hVqco/VRDxsE7hEMYgwru6wQCVMPzs6oEtmeFqAY4edWCb2We/EoH5V1T3blH
	 0oln/z3DoWnL9ivdfexk56IgsDYvureA6tIpb1CcUbync5FVY14J7MU3guft3BvF6DmAF
	 0FYS/XE7QaXcxQrg3Y3qnVpjaT3UG0977EyaF7FsUAk3d/pW812u+fbU9ZMsiU/yeCTHP
	 HJ+GlQ9QNaUQ1fsB7IuY4yv1jaukqpg0WkNwxwnRwHKOIodn93reXrLjf+3xQur5zLv4n
	 JZEugOajFvqhCxmN/c4Adc++PgMSxQ5FqxBG/BofXeoOC5GvwO8UIYggQIwc9UJnCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
	b=shqFXeGv2Gtcfh0+RiVzfyuslHO+nBKTllOUSXPOaj5aWuGjQ2uK0t4RSKTPupDiwFDT
	 K/wi3sn8YtrRx6TNu1E6EbtEWlPT62Ry4RbwvCtRZdBb8wbyXnvCZ0QAK+yNrpuTHiYnU
	 +iVvyBdzCZxU+13R4ytu1qMZec3NCoySMbjZp4bY4Zx4RVzuZNESwLn/39WOxwbQWFr38
	 Bz8xgAlcPyp5VYhGqTKlL/92Rnmqx3sfQxqGjB8fcWkKxYRBUMffE6H1VOTKuMAAg7n1V
	 OqozjR7mcTKJxExiJZKlSBBtHCrxAGxmDvHrFUQKpx8ro1eYchbrgmDWxUF9YtlI7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfCMgCBl;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148DD606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfCMgCBl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8496485e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794223341; x=1794828141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
        b=jfCMgCBlY9RopVhaSNRGgRHB2LGNqgbKO3lacuno07E4l5GQXAsyg1vIl8S5+G2Hib
         WTLw2oluK8WNJay+xGNbCFdu6rq8+RDVil/5vmziw5ZhveSVb8Atdc2u5pvDPCBvRp7W
         mDSeD4hJWBHULWqzSZckEGzQidvexDgEHLApAeQxwCB3A60sCys5acrGlV0L1jCdpgJl
         MMG0JYRz5npQt1V8W9XihEPoF8aXciUcRAkdAYSPy/CfMcTwM7WcyYwwTKIoBiPVWx4r
         /950l0jX8a6fWRBfhoEWuSpzXO5jPFNAVhZuWSXgV49epv0XwFNSUbjMHzqeZ1jfm5J7
         xMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223341; x=1794828141;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
        b=myrDlT8I4X2mpICiNAQTySEYfhxV/ibOu4ygToVbeUnd3BUvTykjEH9gl4YSnUadf8
         2HTjhsA5LVc/CXguhKb795GCDoIlC/hB04q6kUOH5+UDKWBUe86Z17jAVsoYhKs3P+5p
         fraLP2VqFyGjyxOTLvsiSoQDRbxkdxCduiWDMsC7RQoQwHco8gl++eyQDwu7UQlj239w
         wzEAGrOHDDiXsxtByoHv3QfH73dnDRWDdiYQnDo1sDOft1bNT51XwagGXT7L0H7TsTfI
         JVRYj0G941a13ePEe2ht13FR/u8UFcSi1mo+313qyX8GjKZBGVWX7qnzMUrZ9RzRYR1r
         pqUA==
X-Forwarded-Encrypted: i=1; AL+hErGlB+q2LCcOwtt616l+iwy96kyC/1Uh/cKXLW/HjRoXR9m5srz3SoWtkjWdlX1FzG/rWZoiiyWl38uFZMcJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/6nYRYKkHIpLKEMwn75yPCtU82/Aof1D2UMYu9esyfJsbsFHal
	AHBmarV3uVf5s5CRTDB+WRHgzarPRvLCt1hqFvIbfbLavzUErAJvJitgwCxo9BXiBkk=
X-Gm-Gg: AYBFou3ymxFfnqHuv6O/NQMQmW5RlSX8D7lCL1qzS2cCo+i8pf3x0VDK2idBEKIsn5a
	ie8tsgmtIij4pRdN0ZnsuMupWMEkgSH6+hsfjdfRIsFTRqe75A5pYJXLzj/AGvVZtX5dfm6ex2a
	Npec/8AwiNGZ7J1Saeu+lf5Au6kjruM7dUJ+i6rGpCuXzqNHFhxPV528NADY+cw7+3v8odFInjf
	mFim1lBJRGaULGbHztAyDn0xxHSJcjqMDXexPWSiIR/oMJy5ndgcCRQepS1Wdqvx7btBEFo/lkR
	Qq9kXnMsr3wYCHjGvs176BT9gkdnIiUjIRS0bUruCYZgHTZxrei6kJlexZRLVwOSkM5VmisozwC
	wJnPTYwqfzJiwPIQKyoXuE52A2vPVbChD3mM8zcignldljhGlELRyHf9RSx/GMQCNVNWbmg8uw3
	sss5k7yVfCMqKFuoTGYyfPQqGSG4ArqAnY7rypDkhXCKsdLOhyK3CQgXQRMJPC24w+x3Vi/c4vq
	sLcEJH7myv8xEixGQjzoOcL8UW5rvFn2ZtyCU4z9/eXZlgoGY8EggHoB37GlclzMEoFpwOyNS+L
	VnMOd6fJI+rsTLITwVIJUWZKb+aFUzKiHmcsdg==
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr72108245e9.7.1794223341348;
        Mon, 09 Nov 2026 03:22:21 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm272724515e9.1.2026.11.09.03.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:22:20 -0800 (PST)
Message-ID: <7a2e44a7-41af-461a-96c6-ea91780bf524@linaro.org>
Date: Mon, 9 Nov 2026 11:22:19 +0000
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
Subject: Re: [PATCH 3/3] media: iris: Fix use-after-free on unbind with open
 sessions
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <2rWHCgRwgvQ8e4bhpYnYDjIzh1pjQNSNjdBFELmGe_h6iZzVLuoQDpUPAD64feN0mYHgyoDf3AYwIu-5ilkZdA==@protonmail.internalid>
 <20261017-iris-handle-unbind-v1-3-7809148eb90f@oss.qualcomm.com>
 <46e9506d-1eae-48d4-803d-d731d85fd376@kernel.org>
 <831090d5-57c6-46dd-559a-bd6abebb982c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <831090d5-57c6-46dd-559a-bd6abebb982c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2026 05:08, Vishnu Reddy wrote:
>>> +static void iris_core_release(struct v4l2_device *v4l2_dev)
>>> +{
>>> +    struct iris_core *core = container_of(v4l2_dev, struct iris_core,
>>> v4l2_dev);
>>> +
>>> +    mutex_destroy(&core->lock);
>>> +    put_device(core->dev);
>>> +    kfree(core);
>>> +}
>>> +
>> What you would have here is an admixture of devm allocated stuff and
>> hand-allocated, refcounted with custom v4l2_release() which might all work
>> but, it's not obvious to me does work i.e. core is hand allocated while
>> reg_base, response_packet etc are devm() managed.
> reg_base and response_packet are safe: after iris_remove() the IRQ is
> freed and the core is in IRIS_CORE_DEINIT, so nothing uses them. Only
> the core structure must outlive remove(), so only that is refcounted.

Right and you can confidently assert that for clocks, regulators, power 
domains and ICC ?

TBH I think this is pretty hacky and unlikely to be safe.

Another way I don't think this approach works is an ioctl() waiting on 
firmware do do whatever. If the ioctl wakes up after the devres() 
removal - then what ?

>> A much simpler solution to your problem is :
>>
>> static struct platform_driver iris_driver = {
>>      .driver = {
>>          .suppress_bind_attrs = true,
>>          ...
>>      },
>> };
>>
> This was discussed in [1]. Dmitry noted it is a sign of a badly written driver,
> and I agree: it removes the unbind interface to avoid the problem instead of
> fixing remove().
> 
> [1]
> https://lore.kernel.org/all/ 
> CAO9ioeUvV+3sME9P1bJTpDOSty=uojOKak659XCf337++vPVNg@mail.gmail.com

In which case I think you need to do more poving/reasoning here about 
admixture of devm and hand-rolled allocations.

Like what's the use-case you are supporting here with the unbind exactly ?

---
bod
