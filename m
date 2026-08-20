Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249B3F1AA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217466; cv=none; b=okrREJ2Zbd9OBWDWu+W/1xCbEuVOK6mxlJwspsw/Jl67HZpqhd6wDPIQF2wAfBYgzNBY3SEQdrVjmAxqPx6smNN8DGAiN/tqzMzarKZHETDgfFOGcPrHUpnpuM9LdB7BgF7tvIzrA2L21MM4UeZ+/8/7uuL5zSVkrbGIwAEJxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217466; c=relaxed/simple;
	bh=nPkFTOEtgZNq1DnQm57ec1O9IDgRP+zAD+5M9DAnY00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5ZO806p4T1Wrl91AzQrRfNpCHIUKeJNQlncnE1/txxEcSGC/YjT2fiCibCPXjngxfgn/UOToz8uulKectH/6mnt9d3l3EyUo+In/7hzN+F4m5cXlHgLzp7p8tEtyvPdIx/2mgoqF5tjdtmN2uuJRSBsw5t6/LEWtMIxBVAPQv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AoZOmTaR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eItdZoKr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AoZOmTaR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eItdZoKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787217461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6lDvs4PBwNh/pPGjCjR9S79ZeFLuFiB1QygAoYt1AWc=;
	b=AoZOmTaRFepP0+jVzgG1kOYBLkX9Vjuhb2Trivf755oGjI4OWU9pcittjFntatzhF+ttJ2
	4/nOUKsIzN2bB9IfIOt3tJ8K8KdmWWhGeAHLrtrPpW+39VV6l1hNPur3EGoUJ/yCwJJiCQ
	scWQ3SbcKZr2xuryLp3o2C/PVDPT0ak=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-KMAQILifOwq37RABWK8vEw-1; Thu, 20 Aug 2026 05:17:39 -0400
X-MC-Unique: KMAQILifOwq37RABWK8vEw-1
X-Mimecast-MFC-AGG-ID: KMAQILifOwq37RABWK8vEw_1787217459
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-482b88653d9so403646f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787217458; x=1787822258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lDvs4PBwNh/pPGjCjR9S79ZeFLuFiB1QygAoYt1AWc=;
        b=eItdZoKr3XLHiiVVnJvJCRsnOP5VL4HWWwMJH9R4qYNfHAqe47WAPcikJfBaMnRXG5
         BdIgLZya3inmSfJ81eXUpB6vXuUyb+RLFhLfnx3IDfFFU2cugTDGW8eqTQ2hhOYKL+8B
         /aBjsNZgWQZbubwkMjo69ADTDDV9t9FKW909+uDMbA2MTXBCWvwrzDBWj3Yw77sz6a/n
         QhXGCdUBlygdmo6rSW+GZezr37ArICYkuIfijsAvpjMrr8xnDVwNNYfM2cw2nNePOzHB
         BdK5rco89dKdVrzC3dT0w9lRhXID23JyxWiOUwsiv+9EvyjBw3pRHfLxvoVqE6pvYPBj
         n+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217458; x=1787822258;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lDvs4PBwNh/pPGjCjR9S79ZeFLuFiB1QygAoYt1AWc=;
        b=hWtnqljNmuOH16Dodz0lBNbh3PbLm0ALSoJqnkw71KN2eyUpq4vMW+PwrrH8q0qD4C
         UmXk8y8JeNaKigdxR6v9r8UYbBZQFlEyHZWWlEOHCgDrxhliWTVZ08Xd+tctm6dDp1j0
         kZNX3VTKCo62evd8R7DCAcLr5eExSXmCrz/i2R7TxSYCMEMmsuqPjgbsT/WXFcF1nBK/
         LYBfqZY5gyviv2Dlt0MxPDNUJMr0HjN27hCVmguec2T5zQuDdXwoVxSFynwqGIPqz+uc
         2zUdDYMSeBLhEHjHiLxq1fTbjTc2LIvNtgf3mE2iSQj53vNCp5zIjNFJHE71E66BvI/v
         Ts8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Io8PF08m1Gzzc/AAs7Bdbdi5XqrlHydxmQ2qqYtg02/npdFU9vv/w14bTbjVHpl/DBFjAK3mwAahzcqf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/lE6STxEIxqVTXfIyN9xAXSOM9cx1Od4SLuMKOM8BkRhcouK
	pddhuIy67jZYY600nhvEl1OlsDmfupNHg2HmrNWMJoGVjyeJbbRWzQy83W0j+yTCsuggfOzmnoy
	ZbMcYZQbLiniRrhk2zSBfcD6pmXHiLmIgLLnWFEh65Kf0JkPVaAHr89ddOopyP5vwZiY=
X-Gm-Gg: AR+sD13emHmOzCX/4OFMdrZKlIWnGCaTB78JpLyVaMlvjfHWX+0JGGDg+W6C6JH9eC/
	4Ikn53jc924/zNxPZWAfYaxlo5fGmYHfhkJ1+FK80E+qpwR+8BHEu800oWoY07cTTE1XRTVYRPz
	jzh9bk6+d1S7Mc6Qj2wrftXt/xm2klWH7zYJjv7gKN+E6NeJ+8JfMRL4x/gkJk2Boc3jZNspJoV
	/Ygxjk9/JjJXzXxzuev+cuoC/PlJrY3Idawmr4rgADAmCg94JSDCcFh3pNlF1eKozWLXaaQJIuy
	DWVk6UglWb6w4OpRxGkFBcxwEemcIEsGg/ubxEp2FVeoJQhrCFpFfnpxal4uYsngZOS1MnNrUVw
	F1+eQgAmqpaHlY+npoAoxNxaHLdNbeo437KgY/L+psiJv3gHKcxhWm/l4/JBnGXrm9wYtDPazTd
	Q=
X-Received: by 2002:a05:600c:354b:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-499aa1a1f2bmr173636505e9.6.1787217458577;
        Thu, 20 Aug 2026 02:17:38 -0700 (PDT)
X-Received: by 2002:a05:600c:354b:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-499aa1a1f2bmr173635675e9.6.1787217458140;
        Thu, 20 Aug 2026 02:17:38 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b2b35386sm25640585e9.4.2026.08.20.02.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 02:17:37 -0700 (PDT)
Message-ID: <3f078f41-b971-424c-9258-b309a7d5d223@redhat.com>
Date: Thu, 20 Aug 2026 11:17:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/3] net: wwan: support DTR/RTS on AT ports
 via MHI IP_CTRL
To: Peter Hunt <peter.hunt@opengear.com>, loic.poulain@oss.qualcomm.com,
 mani@kernel.org, ryazanov.s.a@gmail.com
Cc: johannes@sipsolutions.net, netdev@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819224927.2274790-1-peter.hunt@opengear.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260819224927.2274790-1-peter.hunt@opengear.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/26 12:49 AM, Peter Hunt wrote:
> Qualcomm/Sierra SDX55/SDX65 modems (e.g. EM9291) withhold unsolicited AT
> result codes until the host asserts DTR.  The in-tree mhi_wwan_ctrl driver
> exposed AT ports but never signalled DTR, so URCs never reached userspace.
> 
> Patch 1 extends the wwan core with an optional ->dtr_rts(port, mdmbits) port
> op.  The TIOCM bitmask state is tracked entirely in the wwan core; drivers
> receive the full bitmask so they can drive DTR and RTS independently.  The
> core raises DTR/RTS on first open of any AT port whose driver implements
> ->dtr_rts and drops them on last close, mirroring TTY semantics.  In the
> ioctl path mdmbits is re-read under data_lock inside ops_lock so the value
> passed always reflects the committed state and concurrent ioctls are
> correctly ordered.  wwan_remove_port() also de-asserts on hot-unplug.
> 
> Patch 2 enables the IP_CTRL MHI channel in the Sierra PCI table so that
> the IP_CTRL driver (patch 3) is actually bound on those controllers.
> 
> Patch 3 adds a second mhi_driver that binds the IP_CTRL channel and
> registers a ->dtr_rts op so that the wwan core's open/close DTR raise/drop
> and userspace TIOCMSET calls both reach the modem.  A single recycled sink
> buffer keeps the IP_CTRL DL ring live so the modem's transmit path does not
> stall.  The existing AT/QMI/MBIM data path is untouched.
## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v7.3,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

