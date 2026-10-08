Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5573A48E4
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 03:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431551; cv=none; b=SpgVSmGGgWf5HBplejrs27h+s2xc5d66ZqkJ9zpMTYQRWyTfAwZA2IVycHdxrtjm5AwdoPzaPMrb/Kz+WchOKucXw17e0WMOgb2lRMwCCNxSyHUfFvyHLi5UpD0TjDgVBqD3YC7kETHTss7r2455fqSn+4egBtXLKFbKcRmbveY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431551; c=relaxed/simple;
	bh=+S7+6b0tE0OmnLFC+QstPEqY3o50EFg74OIiryzh5ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHUIDxZPa7N54F/I4lfaRdhdQ5Jo1/BeezafdvwKstccQtyi2L2h5iJguz9CcMS0XcjvT//bw/R4k0D4bRQ3sIQUpnmEVfrlmiX80x46CntqFvA0tTLdfo6ip6mS58bzuAJQMqo3UrGWIdsOhhjeC3JTlRaQJoKByMjnKMzkUWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c+JIULFa; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c+JIULFa"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-885cd98d226so90047b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791431550; x=1792036350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vy0poknliGswHcpdQnidx1yFhBPlUDC+lTCKJfWkmRg=;
        b=c+JIULFawh9O9VQ87fwLeM+LvkiSl70/x6DXs5EcnJs4AIMY1GEWJp8ObgBPZGJB4x
         Mv05UncODjqv2XyRjoBKQVbMrhjwEpgHXgw9TY63vhs/aUwuE3SSQTJZSrZUcCc/8UiJ
         ddvf+4LXB6MROmkpIb8AqBcLQdRz76QjzjoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791431550; x=1792036350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy0poknliGswHcpdQnidx1yFhBPlUDC+lTCKJfWkmRg=;
        b=rYrdvS1bhtrqBF+BFyQulpSSUaPXyYt8V7wkfWk8F7a3nYhIU7jOgDOQsQcRCfrk/I
         ryp3mmDurLhzz/Gev9N0dsgAExEDMiYFplws+wrUnpobAU6Hiy/+u1XjGp16BlrKPCUd
         is+qlISg+vvy6I9EiTQRf7eoKYa5Bfxyo9skn1ME1zDJFpCPXlN0eoMB8NPjAnTkoUY1
         AgrEQgIzwtHJlQZUBjNEVG4zy51IscIRDBV4OvF//o+RWdKvYq8Q5BZREkTQxKSHFdl6
         aNxF/mjRWc4zjlPBLLk/1uXOGsZdpTUKrTxSx3iCXSlxrm5QKJk5k3bPjoLYTGRNnkoE
         blMw==
X-Forwarded-Encrypted: i=1; AKwUvBzfi5X4UMVzWH/dbmXYEyIvoo9cPBF07eylebl0/M3Svva6A8VJgXoGxpdXPeIQbDL/EtCyB3uTILo06iqm@vger.kernel.org
X-Gm-Message-State: AFq9FYIqUwzOBiRPFwFXMbeBtjnEBkcpfqbh7sg+TIV9UDXz9h0cpXIU
	3L68+l0S5BPz3cmPYZkG2wQxKd6BxTb1Jd2G2C9q3cAeTApTH5gNfaDNMjdalS7T7Y1b9HowE8o
	2u+A=
X-Gm-Gg: AYBFou1PrnLFwKdbM4pMaYD3E8Q1fK3gVPsV3QnIzcswV8frYP5+ZPDGZ9YRn/8Q1L/
	nh2UL9uXAZpqe7loDycPH36cKWypLAtpT716Nv/FQIzpiGh/tos0Ji/46/mfj9XkqWmS+Gf9buW
	zeAw0+ycVpFupm+pHcD3PFpVJLeCtzddprYXl0+oJ4RkVfCIrBh1oJSRLjGyRaNMk7ENawbMj4c
	5R9yLbCES93ZR0Lfs1jhInrBIoLhh4S185Rf2iCuKeeR25jzbkMXXZ1kW3RNE98cwXRCiSVY+Bt
	drratUK7EiKNP8YajNHtC6eUnT1BM51Dzfv4qEx3Wx3qhzFrfSbCx+sHhIaDBd+SLvz96r/8X2R
	5QOo69wWEBWYPtJIfIpEGAc70aa1inuc5+q+TZ+ONDRyfs1zakdNm4jq4wE/dCtB+ztV6rsNLSt
	nCFIq29SDgI9cfKgbMgsJS9jxyCbmC2+x/juNEqbwQpy3qze2zYnaQPK2eFf0iY3gcyAADJBblT
	F2q6scCqQXuGjF196rwxuWcgUg8RB4lGlL2AQ==
X-Received: by 2002:a05:6a00:4b4f:b0:880:f22a:b123 with SMTP id d2e1a72fcca58-8930d0045e0mr655238b3a.36.1791431549972;
        Wed, 07 Oct 2026 20:52:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:97d3:292:91b3:138d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bb49a188sm977281b3a.33.2026.10.07.20.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:52:29 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:52:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Georgi Djakov <georgi.djakov@oss.qualcomm.com>, andersson@kernel.org, konradybcio@kernel.org, 
	abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <ascS2nPCSQJxOGDS@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <ar3yt8Kl3WUV93lP@google.com>
 <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>

On (26/10/06 16:53), Oreoluwa Babatunde wrote:
> On 9/30/2026 10:43 PM, Sergey Senozhatsky wrote:
> > On (26/09/30 07:52), Georgi Djakov wrote:
> > [..]
> > > @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
> > >   	while (backends[i]) {
> > >   		if (sysfs_streq(comp, backends[i]->name))
> > > -			break;
> > > +			return backends[i];
> > >   		i++;
> > >   	}
> > > -	return backends[i];
> > > +	return NULL;
> > >   }
> > 
> > This hunk looks unrelated to the patch in question.
> ACK. Will remove this.

Thanks, if you are going to add qpace zcomp backend, please note
that zcomp API is undergoing some architectural changes [1] (shouldn't
be too much extra work to adapt.)

[1] https://lore.kernel.org/linux-kernel/20261005122036.718976-1-senozhatsky@chromium.org
