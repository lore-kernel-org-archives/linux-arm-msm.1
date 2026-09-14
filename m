Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4094E4A3D47
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399090; cv=none; b=Esswgz/wPj0SJrsA/ZkJJh/N6yy2+E3YhRVUbdOhFbZOVkwKjDWX4f4boIyEMk6fAZfxvuI99TMkDaFjtUwy0fqMd0U/GSYj8sSEUVu+gDpgygorj/k7ivI9xQ/dN2uqoeN/DNMAMUjd9MML/bWuUCn58aZpwRLBv76TWpuJtm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399090; c=relaxed/simple;
	bh=/pgQG5KUhDkYmVqUNpz6SqgDukRn/wHm0ri+wDmcxsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6SuOMpXHQuyB/qbDc0Jul+BekWvCosb1N0fPnBQcWUpt/vG2Tm+BD9JY6O4K+/ZMDvEq+qYeP7GTpP4FtpAhrcrbH0R1rO3CifDQl/LZ0j+IbNIabo/g9+O9wx38ucmVJ7j7kip8QIa1tFrI0XtShQ9t2qUM6zSWEMAWcmcJL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NbiAl3dR; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NbiAl3dR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so297350466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789399083; x=1790003883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=djWd8vxPQqmW4gSE0tDhqhSUTCq+zmwi1DvcsmVYZ3o=;
        b=NbiAl3dRkpAvso3n9L6yg1iPhc+btD3tIBNA5bGuBluO7/2ncBoktPu35GLLlCUidL
         5V/U9PJMf4LmsP8lwwgyqzBbl20iCbTnrny/L/jD3gQZahmwNzKKCQ5GylnqVParBW2U
         FD71KrEb4VDwBK0fjW/uqYriOG+p+8y63YhGImzuGk66QvG1Wcv0QdbzV1Gmc2kpAhwY
         ZBpkQQz7p9tXJjpEult9+r1sEC9yNzIHWF1UgevtX0D5h9CgafTkQFSwSod5i84uKjtJ
         DwTws/2aWs2GJSjwbuGADvky1E7gWXISchhvWixvt6ruFuADvKVkQW7WLg3W+59BOmzx
         PT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399083; x=1790003883;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djWd8vxPQqmW4gSE0tDhqhSUTCq+zmwi1DvcsmVYZ3o=;
        b=sdUBsuZlZZgsvm5nsN/LJw6KHsa0vXfRzQ0RnsLP3omFATTbU9Hu+Ft5ENtKDU4ajx
         qhEx7Kg3Z35LvMmfIYGm3ttVkx2TbPr1WRzi/qFTyYJb6MMQGXxDSqAlALu42udqi3Cm
         sh3qVKqPWSnEVMGS/+NxhLbURtko1w+M8oJgWzAf07YGBV7YpDzZzEwhqglgxZtjYI89
         LzDz0Hh3XwHzqbiWdyU47bjJBFaFdjVd/vlLoRUqn26IJh2avee9fa3gbn8yFb1TpFzT
         6MhVAQfnXh+NA39uGmklHygRFHmrOmPwLkAxuhPtXT/UKUGHtY3AV0bcXFBez0+zxWKH
         nslA==
X-Forwarded-Encrypted: i=1; AKwUvBwbGHCTxOYhVYI/uC0UYqQaTFf+ksSeD4Kxb9LQhfXsRrEIMea+hYHCeTSXrPARoTOCmbnRZDto41vGX2zX@vger.kernel.org
X-Gm-Message-State: AFuF++lhPNCI+UEg92A8p+wcnMUR8ej1oP8VdEpb8D+w+uI3WPFRcCNp
	uIqtt6HN6PASuSs3LIymjBXydpGh9wwwku/HFOrwGdeCEsBTxC3ud7AGjH7YBVWK3NU=
X-Gm-Gg: AYBFou3IAlWIcuEZ7hXho0Ds1/k4YLeLQ6qbOBFDwPSTA/o/bCEeICqPNN5xvUDLB0O
	ei5v3Bm3TkuknpBdVoJ9clYjPOxkM699YWcIXGKdm1bRNN4/ggwXNmNyy9918OqkxN9m0xNVM9S
	zDwqEtdxtyPBCZxmIWUqRDbaAsNoYzjA7kE3v5AevQ9xNsus5bkg6VmHUZi/Vcw2noDMw8njhuj
	AV+5F9Q6yW0lIGASpYReGbxqUrHUcl+HMFC0ffHq3eyvLVn036oLHBgABREGsZ8kCoxUW7JnJ02
	buyVtV8Tbe7nTchdiXYWmfe3We3Ozp8dbLQASKBu/ZC+hDjSH4IbLWicnZQCoyiB6FRkpyXeDs3
	PzR+pm02ioN3AHWgCijqqQZRTv+tfOGFmS7sRCkPRIbT+wLaPgzxDaFCPuzY/mwbtA7ztyndP7v
	1fSR7NKLzgf39RHZYXiDxeMH2wUgitZpLKFGOvLO/iekg5M2HMy1xaVPwQ1Xbb1jK9SIKSzggMQ
	kzpYbqIIQA=
X-Received: by 2002:a17:907:6092:b0:c29:63ce:a796 with SMTP id a640c23a62f3a-c29b875fe70mr205584366b.46.1789399083410;
        Mon, 14 Sep 2026 08:18:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm452450966b.4.2026.09.14.08.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:18:02 -0700 (PDT)
Message-ID: <aba32d74-74d1-4571-be60-d9639a4fc04a@linaro.org>
Date: Mon, 14 Sep 2026 16:18:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: vfe-17x: do not gate write master
 done on IRQ_STATUS_0
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-4-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-4-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> The VFE 17x interrupt handler reads and clears IRQ_STATUS_0/1 and
> then reads and clears every BUS_IRQ_STATUS register, unconditionally.
> It only acts on the per write master WM_CLIENT_BUF_DONE bits from
> BUS_IRQ_STATUS(1), however, when bit 9 of the previously sampled
> IRQ_STATUS_0 was set. That bit is the ping-pong flag of image master
> 1, which says nothing about the other masters.

This paragraph is disjointed, places a full stop where there was going 
to be a comma ? "IRQ_STATUS_0 was set. That bit is the"
> 
> Those two reads are not atomic either. A buffer done that becomes
> pending after IRQ_STATUS_0 has been sampled but before
> BUS_IRQ_STATUS(1) is read, for example while the handler is entered
> for another line's RDI SOF or REG_UPDATE, is cleared by the bus
> status read and then dropped by the gate: wm_done() is never called
> for it, the buffer is never returned to userspace and that line
> stalls until the next frame happens to line up with the gate again.
> 
> With a single RDI streaming the window is rarely hit. As soon as a
> second RDI of the same VFE streams, which is the case when a CSID
> demultiplexes two virtual channels to RDI0 and RDI1, the interrupt
> rate doubles and one of the two lines loses buffer done events
> continuously.
> 
> The bus status is read-to-clear in this handler, so once read it is
> the authoritative record of which write masters completed. Act on it
> directly, as the gen2 VFE handler does, and drop the gate.
> 
> The write master of a PIX line is skipped: its buffers are completed
> from the composite done above, through vfe_isr_comp_done(), and
> completing them here as well would return two buffers per frame.

Please rewrite this whole commit log in your own language.

Also since your are describing a bug this needs

1. Fixes:
2. A patch title starting with Fix
3. All fixes in a serious should prefix functionality changes.

> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe-17x.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> index e5ee7e717..f62fdabbc 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -363,10 +363,13 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>   		if (vfe_bus_status[0] & STATUS0_COMP_BUF_DONE(i))
>   			vfe->isr_ops.comp_done(vfe, i);
>   
> -	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
> -		if (status0 & BIT(9))
> -			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
> -				vfe->isr_ops.wm_done(vfe, wm);
> +	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++) {
> +		if (vfe->wm_output_map[wm] == VFE_LINE_PIX)
> +			continue;

Drop this workaround for pix. We will fix PIX a different way instead of 
for local specific stuff like this.

> +
> +		if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
> +			vfe->isr_ops.wm_done(vfe, wm);
> +	}

OK then this becomes a one-liner to not disjunction BIT(9)

>   	return IRQ_HANDLED;
>   }

