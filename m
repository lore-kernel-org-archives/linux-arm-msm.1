Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E472542E8FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183410; cv=none; b=rn0tOQPMIyjYDwk0VRRln0yJqYdSeDloNR6TtorE5g7dnTGkFtj4xPb4DC4IJHxaeXhxXqr9bfagBrl7XgtzKwZir1uvCG3k1erCCMyJQ7TSXl6YIpG1HzmpnhFbh5dKTfMa7QKw+4LxHVFLzqE1cyVnG6qN/rwRLQucciptLf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183410; c=relaxed/simple;
	bh=RXHMH7L5X5viH8MuZfC3yL4+XM+W6sEJkSUTTYexSWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qT2r3ktFowle0UMa1aZaTLaJM8qRa7THpi9I2VlHf9RbQ7bnotrUlxX9PhSYoD2EUWPhr1Terzrki9nj4FrBkRxFyd9654wp8E+MCvO/whxKY4ZnoKyL1NvgWTTrZkYFa+wC9+IIr5m1iJkoF+J4LnHmO+KnTftHqaTWqWJ7GY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeVuYfBh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeVuYfBh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so453230766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183407; x=1788788207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fneGRjr+ySvdkLjxtzdgXXRUjfjDg7lmHVjWGaGc48A=;
        b=UeVuYfBhRivUcfKfIBoz9Hx8fwBGsbJgclYgspSZiqGOH0Lk4xO1OAWx9SzBVoFvLq
         ARP2YFH4kVGG7fdrFix+ojcJsjLO025J+axTMiPqRbb88RKHWajuagD9zFatv2tAP0/M
         5SrQpRBm0EDEWRW+6/LyQhRBI8nr2mI2+ViaSKjFh1e/A7y8ga4SIJvQB+1kolvVT9cG
         sEpfmrFrj5iV7yYON3QdhpHoKkGCtGOD+4xjsCTgCj6bHE03DAHkKpIcG2ipmF4nYLjh
         fwSp0CRBQk/U/1MZ+BsBOpYWNCqSfn3Iupnlv3VKNwvFyG/chcjv2ncF8y7R28xDOKJN
         ePvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183407; x=1788788207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fneGRjr+ySvdkLjxtzdgXXRUjfjDg7lmHVjWGaGc48A=;
        b=Ys8ssEhQ1sRHe4S3J6/XnGRt6dYrNBMsXYA3F8nFORxWprdEVEH7c1vQ9Vfc9DVbem
         oqzs15ZZbqFh5fKiZNXrMKqj1lpEKUjW7jBKCTnk5qX8yMrfsE0cNQFc3cwSoECuEnF6
         a4f0/jlI+cUhGYwtpaaM/ed7fGtHN6eM84pzBhj8sD5P8ctaV/MF1VyXTmVVj0MJy+wR
         xGabXdVYLvfRake8qMhB97rxMD5hW8qQhSGf/o/fyjLkKvSTBgvxJqUP1XvjStVxW2T9
         NJbAaI5FXOXGDQBiYPHgJtoQGrcF5BhmGis/h44onNpypCcbSFlmr6QcxhHOsjrV9PCZ
         v4qg==
X-Forwarded-Encrypted: i=1; AHgh+RpC/qk9y48jX/Ir5gwhhIfReZPbME+E1ZWsVxidnq20pDqG/Fmc50GAQCNUrEfhcUhT3wQ6SR7VN9+Nv1U/@vger.kernel.org
X-Gm-Message-State: AFuF++lBv7db1pRHnagD0nqVZBv+QqZKJyvU35McVJ1TFu2cuiOC8CF5
	CI+tTFWLSA7M+oIhh5+MKW+r5LBn3H7+cUNOU0+sXgAoVVbCdZ4DG5Yk
X-Gm-Gg: AR+sD128V6DBpXn+/rYzug86iECRV/1Afik5SqYzZpfXVS83xJiRvh9tUmeQ0aJ9Me4
	pvWsoXWhaKmGqS4fBSjKusDetc/1PbgrOALVNvFYmHGL2vYEwkM8+GNTsZX7avCaZ5J/SOiPIum
	zbPaCcGwHIXv9mp9DaGPwTgK2SiAr9U5lJC/YgTmlZPO4egMQmW0nAnrTDIzK7/rqzdhmzZF+4f
	WDVYUrcdSns+OlA3F1Sj0VOG9H6wJrqDhc6hAYCY3804GP9DGxiKBsrA49pO5xP7CeE/19jnZrw
	fKXna9Io85mWvofvdLECv8LcfyYt/Xkm/dOkhHzA9oU0cCvgMyjXPlBYu0FHEHgTiNA+bq5rQOB
	uSgusxTAr8zkFHTUBaHphuTDOrrmeghWx7w3A0l9ROfuKIJvHkFvQF1rSpzrk8EYA1SqaEZCp+E
	2vERNoZK5JfDtkN9Cb1zxEIWNSod89a9ZfZcC82H+Pii6iqO6w0SCSkyaOOdvw6v1RL8fmgwiVq
	edF6aF9qr/PK8YXC8tKkdlg
X-Received: by 2002:a17:907:d649:b0:c25:62c7:fdef with SMTP id a640c23a62f3a-c2562c83b53mr1418035366b.18.1788183406884;
        Mon, 31 Aug 2026 06:36:46 -0700 (PDT)
Received: from [192.168.1.124] (83-131-188-88.adsl.net.t-com.hr. [83.131.188.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2853dsm467137066b.18.2026.08.31.06.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:36:46 -0700 (PDT)
Message-ID: <97bd737b-31d9-4eef-9594-76fc9739e04a@gmail.com>
Date: Mon, 31 Aug 2026 15:36:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: wwan: qcom_bam_dmux: account network packets
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830085400.2542956-1-sinyavin@gmail.com>
 <apVH-Wd4d9q1uMzy@linaro.org>
Content-Language: en-US
From: Dmitry Sinyavin <sinyavin@gmail.com>
In-Reply-To: <apVH-Wd4d9q1uMzy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the review!

31.08.2026 11:23, Stephan Gerhold wrote:
> This is a bit odd, why did you split the two if (netdev) statements?
> The skb stays alive until it is freed here, so you should be able to
> obtain the length even after bam_dmux_tx_done().

Agreed, will join them in v2.

> Would it be better to increment the stats after the packet was already
> passed to the network subsystem in this call?
> 
> I'm not sure if we need to check the return code of netif_receive_skb()
> and increment rx_dropped if it fails. This seems to be handled
> differently in various drivers. Maybe someone else knows?

My understanding is that rx_packets counts good packets received by the 
host even if they are dropped in the stack downstream. I also checked 
that mac80211 follows the same pattern: first dev_sw_netstats_rx_add(), 
then netif_receive_skb(), ignoring the result (the documentation for the 
latter also states that the result is "usually ignored"). If there are 
no strong objections, I'd leave that as is.

Best regards,
Dmitry
