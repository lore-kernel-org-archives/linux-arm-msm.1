Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715898;
	b=N8WKOr2Lpe4V7O8fD/AAHEc/54KBhWKp4LKMqrFS/xAYOsZZOcRtvuyfkLhwKyxWiho1
	 xu18fT3EIAsrFRm96vqS7kxX7pdh9jj6GB/dubv9L5RKZd9fJGM6RQENMtntaYrtSPj2e
	 wjgTdhi2WzBpsL/4rw3TYNjsg16BtTS+O58LqVpuWjo03143SS/W+1uYWL8HBZkH7GHUm
	 GlZR0arcuZOeM7El29ldw8evNh0X9IxtQ8zNi78pANyu9/PwQQGu+JXjfqbFszb3sht9w
	 ZFgC1Ome+VwWngpaiwlkQR+DAG8Gsz0FvuU/oamwvBFmls0w6d7gTcEH9BUlhus8mtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4TONlcxqo54iN78pAMzbzkX6q3qNAFO1iKV1Ffm2IVw=;
	b=NS17jfKXa1jibhx+h+60MXTqtkpMXfxIU9cYN08u8Rmi19PPdnlvK0kjnvvqvdtpbEGU
	 t3oA+B3jO2340OZwahcRx/GSegh8a7qWNc72852iPKHqCTKJjDvtWOC02/4Cu6XypwLQ4
	 a/k+XWyE3C3pc4UbqALV4ZThijlfki/vsQ9I/x1blVDVr6BqHi0CTb0Dk8tuIYsLeR1LM
	 1Y9Ji/ghd9zvGngNyiQG7CQ0AheBB76G8a32ff45/3QlQ9Q6OXK1rtftGiHZoB7LMHbak
	 3UPNHFOlTe0RMF0/6P5nE5qU4uRGdXVYZgIpjeKM3bRNKoCGU8ayrCtPFY4rYp+/QiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WASXR6+Q;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA883606A329
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA883606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WASXR6+Q
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4395d31228so651527966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715896; x=1794320696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4TONlcxqo54iN78pAMzbzkX6q3qNAFO1iKV1Ffm2IVw=;
        b=WASXR6+QktALwIYfvUJyNOjQf/PDBB3cfp4FNeNRntcgkgHY2WV8cpY/gy9Tky+24W
         h/Fu1zs47zL3h/6r0HU8EDrdl3bHqsLtoVKX7ZB0GiUVaTLcJzCJiZbxfbYdMHzJxUQD
         eW7ys3sawcM2gzqiimc/NvByfzXzuh/A+DU9yJSYLkrLSiDjBQE+NSkCyM+7qQOXykjq
         vuGjc8gVsM0b2SzrnRo4AaZJJ4s0p74K3DvVwe7bZNtmy7LzojLqan7rjcP9xWVsR0y1
         O83geE5VrUxa05PIonQsJudInSBSxQaXdo5gkuHjEpsx7mNmUe6+/qfv4d0HhqPS3/Yb
         a1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715896; x=1794320696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TONlcxqo54iN78pAMzbzkX6q3qNAFO1iKV1Ffm2IVw=;
        b=lWNbCPHGLF0i533ZXIFlDrbmgHv+UELJxBInYVelagxNuhV+Lw8IoXrQ9/NujS1kTO
         o37kqGiycVc2yyPHGmQTi4Fz0zkIfCkwPRRYd8AYlKDrLnwvK+SWeh93+BaKK6qucRT9
         U+Sd2Nk2ER//a5eN6aZrrB3e1SSCoj4SCqwPbR2hTZ3qqlkdIGvjsp+HhtavC6hwvEtN
         +4s0rwTUYt/uPWTEEiknYnzK3L+31VeiJuRyaVn+/gjLKenss4ZwKRUpSN4+77DEktrb
         6I5c3wp4wtxxUsHCObskIlNZ2GoxCZOe5dDz07BZLRGHDxxuQ2s4qbvqMec+aezb6d+T
         7keA==
X-Forwarded-Encrypted: i=1; AKwUvBw0VcYng8701k3DJCkGMbxvOCyyv4pr3cGWBKYTHI/Dt0VuX3yJOsrxF0GxzRga3RgXiQyaYoZBzmLq2b3g@vger.kernel.org
X-Gm-Message-State: APuU4Z8fIlMQBN94Opeurco6uHHpuRsIIYyZk150DYbJjjoJ+m9XDHkx
	1Z/p9uYamWd2zBgk99YB2dk3gvaHY82mwNkK8ro/VHMn3U52Jlb21+g=
X-Gm-Gg: AYBFou2qYBFoD5sQs/8dE1H69ACMDpvsD4ghC643vMgTlYCYxZEjCuwprdptyJhy9yy
	Mh2COP8nPRxqGLaBKAhcP8SL9h0qEhkkrJ3x+ngAIdBFIFzuz2sR+J2pcIaGQhof7GzLBcEaFrj
	NZQFr3KXAUY2nuLDR+aPXp8c1oIc18VtAyaQTBlM5nqSRK3yVIErXqDKVY4mZkpZAUjRVk950TE
	DKiAnrep9YanpfXGl6b2aH1dv9F6JcFMu7X8R9qn8f2FPu+WdvXjPlvvtT4LkdXyPf6xcNCuVRa
	oVVaxIn0pss5YbfVtfSefKk5QIKv00+BvgQZvzmjWYyLTD9Oi9+JSR2nlAKyqvGW/AKl4Fxwm5v
	RT5Dul2q9cIKYBZ3C+VmW4rlCqzUnsEa0jsKdL4LIwQhv6vhgYPO0rANruVjcf71qFfmAs/IoVf
	mlpuLY38OvcgkBnoK04XFZ0MdKmyAgrlzDxzReezNVfCTF+5np0Gj3vRLuaHa1VXspEsR/HZmOq
	OImzhBYAPh0/n2al0YRDf5z2xmesH104PtGfe7BLnNC3dXxPxhnaAiR/g1ncQCfjDnkA9vr/kTA
	7R0JttHuKWaeJyyHhexaFOmqVyTTuv4MCA2rz3kw2esKJKjaTfaN/vsIz5i505cjGOxokReCzJm
	mpzNm0nj/
X-Received: by 2002:a17:906:7309:b0:c46:645f:cedd with SMTP id a640c23a62f3a-c4ca7a18e93mr1175687766b.8.1793715896002;
        Tue, 03 Nov 2026 06:24:56 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3cadbsm90903766b.50.2026.11.03.06.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:24:55 -0800 (PST)
Message-ID: <d4b18854-0e02-4fce-b168-d4e80035aaa8@gmail.com>
Date: Tue, 3 Nov 2026 15:24:53 +0100
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
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: rob.clark@oss.qualcomm.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
 <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
 <CACSVV02mTpCPZ-JtyYrsTEsRXKyS3zuxTehx=c91NbxgQSdpUQ@mail.gmail.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <CACSVV02mTpCPZ-JtyYrsTEsRXKyS3zuxTehx=c91NbxgQSdpUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 2:58 PM, Rob Clark wrote:
> On Tue, Nov 3, 2026 at 3:28 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 11/2/26 8:00 PM, Rob Clark wrote:
>>> We need to move the gpu lock around a bit for the next patch.  Use
>>> scoped_guard/etc so we don't have to make the error path handling more
>>> complicated.
>>>
>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
>>>   1 file changed, 12 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
>>> index f12701e286ec..aa59b28a3392 100644
>>> --- a/drivers/gpu/drm/msm/msm_debugfs.c
>>> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
>>> @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>>>        struct drm_device *dev = inode->i_private;
>>>        struct msm_drm_private *priv = dev->dev_private;
>>>        struct msm_gpu *gpu = priv->gpu;
>>> -     struct msm_gpu_show_priv *show_priv;
>>>        int ret;
>>>
>>>        if (!gpu || !gpu->funcs->gpu_state_get)
>>>                return -ENODEV;
>>>
>>> -     show_priv = kmalloc_obj(*show_priv);
>>> +     struct msm_gpu_show_priv *show_priv __free(kfree)
>>> +             = kmalloc_obj(*show_priv);
>>>        if (!show_priv)
>>>                return -ENOMEM;
>>>
>>> -     ret = mutex_lock_interruptible(&gpu->lock);
>>> -     if (ret)
>>> -             goto free_priv;
>>> -
>>> -     pm_runtime_get_sync(&gpu->pdev->dev);
>>> -     msm_gpu_hw_init(gpu);
>>> -     show_priv->state = gpu->funcs->gpu_state_get(gpu);
>>> -     pm_runtime_put_sync(&gpu->pdev->dev);
>>> -
>>> -     mutex_unlock(&gpu->lock);
>>> +     scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
>>> +             scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
>>> +                     msm_gpu_hw_init(gpu);
>>> +                     show_priv->state = gpu->funcs->gpu_state_get(gpu);
>>> +             }
>> My clanker tells me we can't grab the PM reference before a mutex,
>> as the recovery mechanism depends on the rpm count being appropriate
>> to let it drop it (and kill gx this way)
> Yeah, but we also can't do it in the other order, or more specifically
> disabling ifpc needs to come before gpu lock or it can deadlock with
> recovery.. but ifpc disable needs to be after runpm get.
>
> Re-working that ordering was the whole of introducing cleanup.h, to
> avoid the error path with mutex_lock_interruptible() after taking
> runpm
>
> I guess if you are hammering on debugfs while crashing the gpu, maybe
> the first recovery fails, and then a subsequent one eventually
> succeeds.
I guess it leads to a sort of deadlock scenario because the recovery 
path waits
for power to collapse, though it timeouts after one second.

After that hangcheck will have to trigger again so I guess the delay 
introduced
would be significant.

I really wish there was some better way of doing recovery that didn't 
rely on
the counbter having a known value.

>
> BR,
> -R


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

