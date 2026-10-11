Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3244A730
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725162; cv=none; b=qbE5HXZNY6CZKhEUX7d2uRr57EN/TdyZUTOAS2SH/Sr8yalXm5SJUFS+st4GfXGfz1T6q3QnpEIuwYjp9qza/wc0McVho6E7j0EttvohFMMSFM88TssJfMP1NzkHKhYCyA3thXWS/s43eLqeQPCOh8QGuVuy/Z7GHAy0r7XLenw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725162; c=relaxed/simple;
	bh=6dWlJcRUVWB/btg8a37rt2O6Z0fre4eW+YeyFdlAyHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPlQq7E56Y1VKFphoZ8iaL6tMsYcjR1iDslQ1k31B28pdJBnX1EE3yAlSqrsAzYFwfC+Cw6BnwN1026QM6/JNZvG+5AvLTqY/xjBT2+QkSi62dDdgl4b61aFscW1uscUqZWc/OE1c1nKX59REJ4pRLTb4fKkXHF/KWBPnnGQwW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BdV1us/K; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BdV1us/K"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53397554beaso12861871cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791725160; x=1792329960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=;
        b=BdV1us/K4yGbQYecpLYWTOhtwex1AEvi0q7ntKiCc30ShQbZK8hgkZnbGHGUT7nukm
         hYaNkSigDgjqfJlb4NOtg4jLvdNeu+Q2lboyEMB0K7e3oD6Oqs+gKDC2+VyrKOygrt5L
         4C85wSvleT2gF2qlYy9BVihFebhssA6HcYlztg06Alj7WNHfsa5PTHJLzYckm/+Fy3Zp
         dbAKei+ZuNK+1vj95tdu4ItfUwOxbdVCpliHsbXmfPR3gdURie6FUls0GBcztdw0M8fC
         TJk70w3ZOwN0kSS2z5A+3Z2LNYiQDoT6aim77KLekZgDvqJOdrjw2xBTYgD8Zhoe37il
         PP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725160; x=1792329960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=;
        b=C4OFKPR7e6VddNSZeiB2xeex6/h/4BmRrN8QEqA4LolLkPJJoYeAhyO5vCCBYOSiZS
         rx4K0YU9UFKD5o2ItXiOxUtMUf5A8HeN8FOgYlJK7cZeTCBLzcQdFk2D1a45e9RtDbtT
         YpfLKlCSRj/u/rVdleQlItjGgblBrTJrWKs7RydKjAvICDzhXhQb0xusyDvXIrPl7jNN
         KWoDpAN+0mh70+s+6mvMV9S3vDxKzhMYnOC6ay1T/oNsq2HfkgzX1fdvXaE1Vy6WAKTH
         38rFYAsSQJx5cYW61WIFsrZIp6mP3d32rDnUXqeB104SHwW68P+zuoav7/LQaf2Yfdgi
         mHWw==
X-Forwarded-Encrypted: i=1; AKwUvBwBk1CGH8rNaaN08J9xM4Z1yjgHX3X80tYnUlTcQueXRRNdyeLN3Nzb3KD4UMTDPU38F7WnU10HOyBCbDEL@vger.kernel.org
X-Gm-Message-State: AFq9FYJxZxm3+pwMtwFHXif9ukotisvOE4qp4auTNIQtiH8ooF6clGBO
	4F5slQZN+EbETj2XmUVIxjpcJ2kQvo2XOS3sSJVzWMI8hP4hGTlqWe9ZebYwllN/SkU=
X-Gm-Gg: AYBFou0DZ/o5Q8QZnpesh93Y00143xJ0plitw5YT3sjDgxuo3gjHW6rNQa6RxhV/oKG
	SqQXWuWB24GcH9MUWjttaVGhj9Xk6x3ix34NhShNaz9R/fcSKazAxcnBRPkPSo1BJXETVVkvN7Y
	aJrucOTRRdKzxZUXPdhq2Aas5T942zVZ+GyqinBlSGTHKyTwzDo2u6oLgmAcY4TzG90Icbx92IO
	kHbMFEqRiv/pi43L+SPDurJAeabMVoZDfslhQJ6uIOYBT1e0ZU38eHv9UBUT50P9COYF4ipDKDM
	/NywemoUrd8topqBjBt1xko/dRAgPryjsppO2GscC2BMWxa5mVXcmIvrh9b2RG06OTnhd7JqCN7
	MOPxs8CmfpwmmGWlx1EUmuPsMGl5v4VEm/tiymqppK/RO9kHxnbo7ZZ19xOibZ1s53jFjV5mz7L
	bbCbFlYaRua+eFT0YB7+2jz2Cx4sr1328KVre5i4rHRki5uiEWvL2YXnIyrX5rsEBluWMm3OsmL
	I2pT8F7T4nV2gY0vyOxf2ymIGgRhsXWze2EgjWHmWGwXzJQsH+ZKKpLQpb1cCAtashm
X-Received: by 2002:a05:622a:e111:10b0:535:a5f9:752e with SMTP id d75a77b69052e-535a5f9789bmr75892511cf.77.1791725159958;
        Sun, 11 Oct 2026 06:25:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e80353sm71122656d6.1.2026.10.11.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:25:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xFtYs-00000003FEK-1U1k;
	Sun, 11 Oct 2026 10:25:58 -0300
Date: Sun, 11 Oct 2026 10:25:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, bhelgaas@google.com, jjohnson@kernel.org,
	johannes@sipsolutions.net, mani@kernel.org, yishaih@nvidia.com,
	skolothumtho@nvidia.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261011132558.GD14213@ziepe.ca>
References: <20260930140833.576941-1-jtornosm@redhat.com>
 <20261011075425.516927-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011075425.516927-1-jtornosm@redhat.com>

On Sun, Oct 11, 2026 at 09:54:25AM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi,
> 
> Since no further feedback was received after the last discussion,
> I proceeded with v2 addressing review findings (Sashiko):
> https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/
> 
> I remain open to suggestions and happy to iterate further if needed
> to get this acceptable.

IMHO this is not OK, building a new crazy hypervisor interface that
only works with the broken driver design we have today is not OK. This
is not some "quirk", it is a permanent new ABI between VMM and kernel
that has real compatibility implications.

Go tell an AI to convert it to
platform_device_msi_init_and_alloc_irqs() and then solve for that so
at least we are not getting trapped into a completely broken ABI by
all the hacks here.

The whole "MSI Caching" concept is fully wrong to be an ABI to a VM.

Jason
