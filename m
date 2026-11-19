Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080944;
	b=Bv/MyoO4cAPzAAW5uxu1ss+lM9ON5+Iy2Y5d2V088WDqXlsG7K0eUdz8PuRDabqJe472
	 JnskGbdYxJkAUjldkIAAIDrNoXWIh6s2a8l/s8QmISBptE9eYtPJ48woxoAg7Tvc145hM
	 QXopJyA+yKzCHcy6Jnw4iNcJpWdC4XhBHmweUwrjmBQ9deQTv4mGgJkk712ml2sP+rkSk
	 +JEH3FbeQUApa6HruBujL900ekhWna8CtoJlrJrKYN8r6mQOLgG1lx5b7Ed3jI+P55Rh8
	 yDq8/MDlNVT3q/q1AR6pTOuqNVwRGqlbuJEtGQ6KbJFS6theOs1BlCtj6FrGO5x2oNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080944;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
	b=TLDTNefZiE4VW/qfUUfqjwEl3ooNfXAwMQPVaWokM5mxhC0xrTp3WY4/mt7tRxePGqy6
	 nkfhmurAaYloaYMA01sKkU6t1yIrGPzOVx9A3vC3sEFJEEIL0hVPLZ4WwhCU4D1bS19i3
	 RATcaDbzDwg9VMl9Mwwc12TKEz+8hVivOOj/DwUMmGuY7tNyRL+nK/GSNQ9oUbOK5Q7iO
	 3WpPX+9fq7pEkT9zbfndidar9Oe5fvpdRYMtg2H3l/nnSyOBsuZU7C01sH8V1K8m9kQI2
	 zcVgT57SkUXHVz8mi/XLhoPZdPWNmIrKvW/lsLlMP6rYPdtl0qj0OWyL1tF1C5Sj1ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXwzz+wq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dSJBwNcU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C860A2603
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31C860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXwzz+wq;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dSJBwNcU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795080942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
	b=iXwzz+wqJO8VIs2AulHI2EJmMxXEopej+86se/l0NLmF08IwFeP6IJbaGmAhkGuM96u9cp
	FhWzNiZWwst+Mi4S6CzqUfv3gY/lE1E/kGBWA1NFMHkFDE6MLwSmaVjVeo68R+9tt05F77
	CQRDeF1jsR/QarneMiVUYRaNjYnzvwA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363--ksKQNu4Mv-tjKkTo2a0tA-1; Thu, 19 Nov 2026 04:35:41 -0500
X-MC-Unique: -ksKQNu4Mv-tjKkTo2a0tA-1
X-Mimecast-MFC-AGG-ID: -ksKQNu4Mv-tjKkTo2a0tA_1795080940
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4aa0500c979so186672f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795080940; x=1795685740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
        b=dSJBwNcUgfpqpqpcO00BqOgy6rn/27u4bSv3znU6NaisVn84/7OzU/9ig3OXS8+qsK
         qkKbiT4enLFnOOfvErU0mUGxO9SyqIicLhEdGhj161vtOw7rn06zu5zlfeN4M90uksHt
         BqdsSOZQ9+ChDM02orCwj2u0lN8u9SgDRjDOPlR2V8oX9zNrwJO8yCgUkeLrzbJGqLhe
         Gdo+aLVsRknjp/6HczOJxengWvca6cMc60CwN7kZnk2zIFWBWUiULNnSpqhanfL0AXUr
         uBGXqJNf4T4Ht1kz09UPFF3lpULA8QfuswA3BN77urak8D52Xy+IS+NFkuWseWi4Vwuk
         gtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080940; x=1795685740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
        b=vtu9EcPg87J5Yyjl1EXDktQps9I6BjhxuxWD0AFmIDPBCcVlynLoUcnTPUa02U2OZR
         9O4iaVZ6bnNI/HGmqW2/CK5/E5XcLizmm/lVbN48q8aLmmBgIwRUjaXiO79rFS80De34
         U5xrb5nxa8tV57wRsVvjy5pGt3dqLmlFhAWFsbTjXWoQBKlnbXDsTLPx8rU27PJ4MqMj
         gvnhQ7zOJUejkmDGGXITwSYRcCMFfwdO8Tyv7TZ4sWx5+j0+FoX7yfEEWWKZVHTcI7W+
         I7tqnGiI0fDSKKRjuGNH0u+ieLMmp3Jwv/ZRFNNGAO08QiL/B+kwE5ON/+4j8cpPWUVw
         gnLw==
X-Forwarded-Encrypted: i=1; AL+hErGYDc6US182d5eMX7uisDSjfjYJ+fXGYDYsIBQKY2LhiUxknuS8FxFUAkFoKDyu6MZRucysiiVJGE+alM+c@vger.kernel.org
X-Gm-Message-State: APuU4Z9HkKu7MUGXa1WBPtPoiM5mFl0kvYjT9QRYVMyG3MbtStx3kEb8
	ES6Tmet1rImPokqZp8spvf8GQ+h29LdXcv3iqBOF/RvdaVzU4cnn0qA5Di5FvmAIWvVb1SGCcrm
	KcuqUjFPkRJfs8KNVDTNcvjdp3daB6c1W8nU4I/oWFqmclOh2v+AsCBW0LoHKGBKWlYs=
X-Gm-Gg: AZFdTZct/MbmXfqSt+ReuY6xriSyBLaNltqTxqX24pnz1KY3Y15hHnSoeZjz84TKBoZ
	2UoYA8bGTH7vSvIdFgXmPTDrP62z4j0J/0tQkG0Zqe2uC5I3B+ZsWoUeyrE6Oo0qssCbDGpwhvu
	fcWYlgq+hhSEaONfsyTY9qIlqNzd1SJ2S6F8C0uQwEEE1CSQ5tLxd+T0UZnQyqlEnuITwyd6sO0
	ISZv0ebPGAtcflx/DWbh3k+UQpBCuYI7NBgAAPIR+EFxQId6aQiMzPUbAEJd+TZzbUOWvpyk/h1
	HbEOX6W1MmLdBrmkoZIq8oqfgOraXnzTxvhUIw+xrxWRaPGONHUAwIi+3XxM1dYOY8IGKt2J9Ly
	eecBnUJgOGDgY7S4EXFAxNJKHyRJiSIb1XIT9RIX6O4BK4Vy1kFtU6OHOhZQ+mmBC3t3PUb9cHo
	AbTzQ+8eH+KDCD3J81cpf7+k3jwtp4HMrw/fx9w2W3zI4w
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817850f8f.34.1795080939763;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817756f8f.34.1795080939199;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm9495655f8f.17.2026.11.19.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:35:38 -0800 (PST)
Message-ID: <4eea6d32-4200-4cd1-860a-70e81356678e@redhat.com>
Date: Thu, 19 Nov 2026 10:35:36 +0100
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
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to assign
 a unique node id
To: netdev-bot+sashiko@kernel.org, manivannan.sadhasivam@oss.qualcomm.com
Cc: mani@kernel.org, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 jjohnson@kernel.org, edumazet@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, andersson@kernel.org,
 christopher.lew@oss.qualcomm.com, deepak.singh@oss.qualcomm.com,
 raj.bhagat@oss.qualcomm.com, juha-matti.tilli@iki.fi,
 jeff.hugo@oss.qualcomm.com, daizhuang.bai@oss.qualcomm.com,
 jeff.johnson@oss.qualcomm.com
References: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
 <179478985187.3136.15328141866524028119@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179478985187.3136.15328141866524028119@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 01:44, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] A failed node-id insert now drops the packet, where the old
>    code still delivered it, and a dropped HELLO is never recovered.
> - [Medium] In AUTO mode, nid and ep_nid can end up different, which the
>    commit message says cannot happen, and the rewrite logic then…

The first concern above looks relevant, and the 2nd deserves at least an
explicit answer.

In general you need to address (either debate or fix) every AI comment with
prio >= Mid.

Next patch as more of such comments.

/P

