Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407423;
	b=uxqvcFeRI3y7aYk9JAJATViaK1pjMeKEOsODPstdSqWoq/+wZCjGx6F5omUKWe8ELtud
	 I+cOvVcenIs+pn34k21CraUwdYlDHahWXW0keQmuhQTfqpTq86NPDaypJx3cI2lkXCs3q
	 Y+b4frU4i0J0wRmhWV4wUMmZHOnERkmr++/PbB3kILa1mkml60T/vC5pnHK4RtP+ikQy3
	 J07wOr4QyAgQflqpf3S1vFSS0zE+54Jrd9hDw8wvEwUbxDTglZYncuVJMiv4RMkuItaL6
	 sleqXj33zD2NPjT9KLWQcgtRPxVrtwdpUVCDKuns/mBApx9levnpqRoWbWGbF7XeL5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=YzRt0aFNigfIjuZzIG9Q1L3c5RdrENe2mSuQa2UuzMM=;
	b=TT3SznOKMQGjWL3NZ8O2AZgnpqsa4wi4+T06Z6VypEyqkuNg64j75s1Mq0S6WqkdF4d+
	 lakxif9Y0qY9mSkAFOnvVfPvoHwVlWrTsUJnd51BOZiKY19BGBAshS1AOlzkjpmSLVY/l
	 VmEUCHvR8SnrIlwSj5sjoyp6ajIyeFYNa6Amdbu6o5rb/qBF/UyF9A/MOdere06VSBuri
	 b4VdGwP6iDit7X8HE9PmYWSElrwXNje7uPGclnr1DeHzKut+2/wyX/xjZ5lHzkkeD15T9
	 7JBk8UqxTKk7bAReTnpqS+O4vLiMj9eNZbUWreK3gioTeel5KfTjTdHsiphtJdtGq+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pC2/5JIL";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1386B606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 04:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1386B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pC2/5JIL
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-382f4710a17so4910875eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 20:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795407422; x=1796012222; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YzRt0aFNigfIjuZzIG9Q1L3c5RdrENe2mSuQa2UuzMM=;
        b=pC2/5JILDWebNKIS7WN40P1R2+FeLvLjKLTsXNuBIfgFm0owzGiwJKpdD14U39sQOQ
         XuTPTSr0Ph0zRijincIqGnZi6Bjy6kn4hKD1fvqd5r0kS4vQcJbYyYbsnSrs5dvoDgGt
         iebo8pA1t8/TBtJtQivVLj/3OmYHOeLf2toFeUn2GC61WeAwnzt8wsES6gp+N0Npmyso
         7Jy03PsCWIYIdLO+XR8SNMB4KBos0yk+UCLcb/11dyssMoziSJE4uGm2ZwHu+PZ/F7a8
         2hHIvz92sdpvuvvFCBjBaxslbsZqE50x20YWSbIpGnYUv5dLq9xyOukpLFDW7Zu1q7l2
         aTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795407422; x=1796012222;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YzRt0aFNigfIjuZzIG9Q1L3c5RdrENe2mSuQa2UuzMM=;
        b=Kf3lAlc19LFgZ16XVBjNDQWiYRURGDjJYybLyxEIRuoaR4jTDXqVe8wx4U/HXVlOaS
         Oz4YpNjrxwViG6EnKsEpVH4xH5XowZt8k2llUn6mikw9KLmUm1tdxHaeI2qK1mPVj1C3
         Xy53HVDddQBTD7+15grB86viT2LRR5DJuAOpDGhbBJRlD+TSsupopfk9Qq74SnifWsaf
         Ypa4ArMc5EQcVLPHrIgp3ybYmaVOw5mRJs/6Z6XyNbQ9d81Bl+W5+KARrdA05n+AKGU/
         GJXnLqpg/0F3jzmRMpgSsPI/LafO94lv0hC7Bsr3GCn6XvbiAskgK6BLG75OLeaQQhNI
         pspw==
X-Forwarded-Encrypted: i=1; AL+hErEnH/jVAalAs9zwe/3KyoDcYenpwTo50lEaY8cfI7Ln9wn2N1uSGL3x9tLg1MVodZV7mXxQ9LX0OSKgTBa2@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vzp2uO6hjeZs+E0tO4PWp4mS9UA5FjgJFUsXfkWCDlIBPVJNz
	qmQFkQOnnfGElwV30tAbypLGJuBD32d7xDHEAhYCZuX9YtdGcu1GkMiT
X-Gm-Gg: AZFdTZfMoZUR1xl+GGZyNqiiaZAueeAcBGPZF9etEr0f8OUs6PgnpeiAINPYsMitGdw
	U74sGtSgT219gwh0RL/EG6iTRTqvQueLaA7unJOQ/PK9om4YtQ72nfCDA0AvvQHHTWi/rhByWKO
	yfhqPST6AR3qPGE52yV8XIpiSbKVLmh1w2SC3o44aWP1eYWYlKIJoYkmaYNfpp/0vP+difggY7l
	EGXcsoU6A/cVTozlKsPuvfmfVRek4kHEpLqGN0WXffo6czw8KnxayhZ6D3H9/Lsp27Hh9GTfQdb
	F/Y6Hksf9Mgy2Ae5pW/wf61gKA10rV7Ee2L4weNx6OQHMRXYJWmp82EhbzoGt5ygqyuphE/BclM
	PCdH9QzGxarW5n8iL35yW3pVkj7IxHxGWZiTWBnf59Tq08R7PS8sFwbYzkGn9BXQrZFh3hXa+uM
	DfjwFxoVIm2/x1iLTum4cvrtvIrWG8JZrMCDH6ot9LeKQ3SAhL5dJuvvkcDe6CoGPNAaYbGDqY1
	Z76THft6rpaXlw9ieqGuomcx1POnGPclu837+RXN5CBA0COCejIV5q4pirh8o/KDL6GMmOrW9OL
	UIkXgkpVyloXseV2KP//422mGfjHxg2Z/NKn6Yisnrn7itU4jk+lxU6JHiYmxXu+Aji5Dg==
X-Received: by 2002:a05:7301:1703:b0:386:319b:fb0f with SMTP id 5a478bee46e88-386319bfc98mr9614430eec.38.1795407422015;
        Sun, 22 Nov 2026 20:17:02 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm36065292eec.10.2026.11.22.20.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:17:01 -0800 (PST)
Date: Sun, 22 Nov 2026 20:17:00 -0800
Message-ID: <847ed9034c9869373a150d43d352b2b9@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Auer <mick@yoxcu.de>
Cc: linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pm8941-pwrkey - report wakeup events
In-Reply-To: <20261121204112.847960-1-mick@yoxcu.de>
References: <20261121204112.847960-1-mick@yoxcu.de>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Michael,

On Sat, Nov 21, 2026 at 09:41:12PM +0100, Michael Auer wrote:
> The power key (and resin, with "wakeup-source") is a wakeup source, but
> the driver never reports a wakeup event. Its wakeup_count in
> /sys/class/wakeup stays 0 even after it woke the system, so user space
> cannot tell a key press from other wakeups. PowerDevil, for example,
> uses the wakeup counts to decide whether to turn the display on after
> resume.
>
> Report a wakeup event from the interrupt handler, as other power key
> drivers do.
>
> Signed-off-by: Michael Auer <mick@yoxcu.de>
...
> @@ -161,6 +161,9 @@ static irqreturn_t pm8941_pwrkey_irq(int irq, void *_data)
>  		}
>  	}
>  
> +	/* Let user space see that the key woke the system */
> +	pm_wakeup_event(pwrkey->dev, 0);
> +
>  	err = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_RT_STS, &sts);
>  	if (err)
>  		return IRQ_HANDLED;

Could you please move pm_wakeup_event() below regmap_read() (after the
error check, or right before reporting the key event) so that we do not
report a wakeup event when reading the status register fails?

Thanks.

-- 
Dmitry
