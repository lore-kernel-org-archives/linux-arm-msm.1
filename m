Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635561;
	b=aUP0+eX264NnNvezqrkSYI+/Jq2RWphz9PsDfmQ49HwUmbfSNhyViLm3piKrLTO2q7aT
	 qKKDyl1LSEkGsz7zumZiSuu22RODzlVVi7ALOyacAXacTmGsnecXU7zxp8uFksjpZdOUQ
	 ho6P56PbUbZibsCVgEhzqGWmUFaCGhEY+/xnSXHysbj0+TYPs7ZWi0RVQ7jFZyDbiH0Sn
	 MA1cK/7f+9Cr8cNfQXyjAhBmH47NiT/ADj15Yu6MZJS6t5cUKEUfQyFqEPHbXw8JHFNbq
	 KQSlEnAV9BO4OHFVJx3auV44qI5Npcx76ry1OPncdjW+MZgo8H6a8oRP69E9Gt9J5Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
	b=0o+J36ZT1Th6u97rmYgcPTe3OfTVJ0bQ3mew5YHNVRkQcREVsANVQsyW65bwXxEZbKaQ
	 s6yvTHsRVAmuPhcASf2+lGm1BocfA66fBxRkrtK5PzmrjEm9SQzF0YM+i+U4nFimzWuGO
	 QAlIZwPBJwWd4uWywZT1Wr7fqzcw85Y66esvKkQ/z2IpFNVWa6wJgAWdtu1OK4KDVvZCQ
	 zK+EHvM2LMdAhjuYqnPFFHQtFl0faf2F/6lWhZnIT6PVhWJOkdui9z6MTARlWDCPYKXsl
	 y7+cBADvhyT4MBIb/T1Wt4smNtYA4gtjx7WO2Us+/i+fAqRhpKHfXmeH+m0msZ327JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pZbTuoUd;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478B606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7478B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pZbTuoUd
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4523971fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795635559; x=1796240359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
        b=pZbTuoUdSAJLh2Oer9e2HrWRgMZr5zDSucwcrZtOXNa6DID1VfY6xiJQp5apWyc00Y
         VWI/5GbqOnnPIg7XU4zeJqme1N0+sRi7RY1Les3CkolXNezn121ARAiuPAba8ACYA8Zv
         S1GFWiDvULRpDNMuIKILBNBRZitruRtqf9JwsagYcrOQiAsDTuIL6ew6WlJi9CrEvuzS
         p7ufqcekp1JSrjgj1TChFnTakdZ11cS68khCZ2LxiVxrJUOiXF63bmaY9Li1k0ZFG21M
         pyRXQtfFHhp4tyvI+Q8BCCMkY5j7PIyMsmmiZv8pmIn7EYwQRX+0VjaC5aw0g74yLNXU
         RIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635559; x=1796240359;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
        b=mKTdQyeh8qCIxy8ioy8xIxek4l+sm3JXluWb5kckhkCNP3yNIjJeaHvK+teMSSi8oS
         wCtpHzMscEBEMr6nmYh6lnsybtiuXYGmHoPEv2Y3MaDyGNJPJqw9IM5j7k4Y/psZtU4m
         GFN3zsen8hYV8zm6PlwrHEh3pOjYzHq1MFOEovFsxmfiXNR4MNEPzPjTET/wBKlChHcT
         Cu0rlZjeiHqMg69pRPU5rupofuUtb9BSp8H0dnpPxQiuT0XGkNbR06DsPVNsJDsQUtbA
         Z3xRs//c4K44SEtZrivas/EmA/xQ35AtRFYXhSEQH0OxYrhsi5j8uKS0onHM5yLgHtkY
         pC5g==
X-Forwarded-Encrypted: i=1; AL+hErHfbEWrqV7kZFNpRK3Tam2R4TUMZ53WqF1Z9/MuSUyBQV6F5BmPUkyrT5NV8vl4UzfH7nNa7z2QhAsqadtw@vger.kernel.org
X-Gm-Message-State: APuU4Z8wYouG94goKG5/ALWvX3OCrWL6W8aRO54zvl5S4SDZdM2hFiBc
	I7m3ULM7UysYcNcbhvyx8G9D5nxYclebhZj064cQw4hcV+lh6ZFxh8e7VI4QciTY2GA=
X-Gm-Gg: AZFdTZeL060V3f6mpt01i/JOVYZsmVoLmoiLMbnAFOuF6kihUyDt/ncXn0fwhLEm6vR
	1UMP2Bt+jq7zbsQ/uM3bnOVdQ6u49jWe3Znu/HTisihgrsoOEIKmCK+vQPW3miGmZ/fKs5MBFe/
	rGQmP6GN+zoYkDEtx8rx4BbWFRYH9W4ZUvqDKyRbVj5ZEVHhP4eapddiD5ZuCJ8u4qcmssnACUC
	77IfSRjuVJqW8Ey05+U6wn8vKTNoDFQkGiCm1vW6ZtYByxNXuaIxRV0Px5JYoLA0wwqOwxn11Z5
	jzZJ3R9Q9YqxxWrDUbOm11KCMkfyz89epuwcyrXhgrtplow23nVFtWH7KchJDZZGvFQrAfF3Xcl
	qnXjfTvSNI9eVoBGEddSGC0HHel+ZioZXqlaKVu5dkfkw3PIVSlxyUdNrkJcwl4Q5cUrP9vk+to
	l6GECDjsEN24fupzj5y6fGeLS92pPgouw7y7F8NnKMBIfubmxMNU9mQUnSNcyh4Ji+94tqNyTDi
	ZamkhZF2eNYQEh3xqGKhKh2s6Nh1dja3Fvzeqy38PSz4Q4TUwQnT/dK7SDBcKU9BHT1C1k/T2Uj
	YDUqgiq5eGq/IkPpEifdhVxw0t80brFyntG6G3QgipFmVt6hgYIjQ+KaF9Ik6jBgYivOA8DQroF
	LphDXLsmj
X-Received: by 2002:a05:6512:1048:b0:5c1:4e17:1ed6 with SMTP id 2adb3069b0e04-5c1bc80fd9cmr5765974e87.6.1795635558529;
        Wed, 25 Nov 2026 11:39:18 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm52215571fa.12.2026.11.25.11.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:39:18 -0800 (PST)
Message-ID: <ff986bbe-7cb6-4733-9f95-bf788f4f1f07@linaro.org>
Date: Wed, 25 Nov 2026 21:39:17 +0200
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
 <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/25/26 15:21, Loic Poulain wrote:
> Hi Gjorgji,
> 
> On Wed, Nov 25, 2026 at 1:29 PM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> Hello,
>>
>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>>> The timestamp reported to userspace for a V4L2 event is taken when the
>>> event is queued, which for an event signalling a hardware occurrence is
>>> only as good as the latency between the two. A CSI decoder able to latch
>>> the start-of-frame against the system counter knows that time to within a
>>> few microseconds, whereas the interrupt handler that gets to queue the
>>> event can be hundreds of microseconds late and is not consistent about
>>> it.
>>>
>>> Take the timestamp from the event when the driver filled it in, falling
>>> back to the current time when the field is cleared. Drivers have had no
>>> reason to set it so far, and every in-tree caller either uses a
>>> designated initialiser or memsets the event, so the field reads as zero
>>> everywhere today.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>>   include/media/v4l2-event.h           |  9 ++++++++-
>>>   2 files changed, 26 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>>> --- a/drivers/media/v4l2-core/v4l2-event.c
>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>>        wake_up_all(&fh->wait);
>>>   }
>>>
>>> +/*
>>> + * Hardware able to timestamp the event itself reports that time in the event,
>>> + * which is more accurate than the moment the driver gets to queue it. Fall
>>> + * back to the current time for the drivers that leave the field cleared.
>>> + */
>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>>> +{
>>> +     struct timespec64 ts = {
>>> +             .tv_sec = ev->timestamp.tv_sec,
>>> +             .tv_nsec = ev->timestamp.tv_nsec,
>>> +     };
>>> +     u64 ns = timespec64_to_ns(&ts);
>>> +
>>> +     return ns ? ns : ktime_get_ns();
>>> +}
>>
>> I think it makes sense to add an additional field for hardware-based timestamps.
>> Converting the timestamp to the monotonic time domain introduces precision loss,
>> so it's better to expose both to userspace and let userspace decide what to do with
>> them.
> 
> There is no loss of precision. The timestamp is actually more tightly
> aligned with the actual event. So I don't see the point of having two
> values, with one being less precise than the other.

The hardware produced timestamp may serve as another unique id associated
with a data buffer, under the circumstances it might be helpful to receive
and rely on this kind of information.

-- 
Best wishes,
Vladimir
