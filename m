Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCBB3E7BBD
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900231; cv=none; b=SnfVz7JrvqhP1QllHlm1AtIEK1o8Oof6Tr7UeBKO1YtDq1Uii50fgEICUFTWFiDrRKT05e7vYdyR9UW3ArVWklptGCx29ES1eIn8DTwWx9d2aL/+dEjLFigfJ6y7vwZDBe/USXl/l03g/iJxdZ4SeAbfX93sKFcLoiun9Ir99T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900231; c=relaxed/simple;
	bh=UHry0BPkquJw/CuJwnGhyuxl/slkjmr1qnD/xn81qew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5FWVtQVIPnWcESUZ7dwePHHNj0WI8HvFE8CQZIspdYtHg9jJ4ik4aFhY3d0D7mwkgUlV2Ed0pP2deNspvBL7inLcujA1z4n/ifrb/Jfw/xXxUgGXw7ailVSGY+Gec5W2PPfjcX00TzrdIdtNkvWoG+isyGW9widX9m/voijACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CBEzo/4j; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CBEzo/4j"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9903fde8db8so213972241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791900229; x=1792505029; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=;
        b=CBEzo/4jeiz4WlID7U/njZM7AWjCMFsKhRPE2lZcPfdbjT5/IhMC7CPhAthUzS/zjC
         7JdpJuzrx/MaN0DflF6oAbENcPd/EKLzlkXO3xhW/4F5syHofVyYESUmZBXMOG8P4d/o
         U0+8nId/s3j8PBkkGKMw9+6JThitqmt/tGl1U5Nh1xq4Hd0djOAhqJt0lU/i0VlyiGGx
         3lIrp+VrVqteNUBHh72uss+6qHhfv911OjNj/lBhTo0M3tCp5OKbWWQv6+N+m74fPDOO
         CCafrXkio5dlBgBy0OeRosZpOR483gn1R9Bmc9hfkBJ3Hjq6TdOR8etcp4eTP7mIJR7u
         MRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900229; x=1792505029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=;
        b=RnM/V5i4v1TueTrV9s7714yjiFAAE2oY5UdWk/g8IXnc6uSMNhHcV53YFDbGg5FnsO
         D50UjH4wgz6G8p8NBOP4s43E6HqxdEfc/jW6IYAWFzpCb+4MRhe6OTACqCadooZlG/vQ
         wQpAKa/qPH6hbff7PKzSw2mr0QJI1Jx0FcppBU9i9Xm69rlSuQyVwbN41mAIAYEB6Ev+
         qCqecJLrRkxGnLwkP65Y7+Bx27X46CboZuFTF5ItUGzSJHDGw6e+vvnOgpwKqjWtvDiS
         e0R4mgfJUO6zRWfjsWPcKSZIHmrF/E7C1Y4PSFJJAVIRaL4fnfuMkf0qsEAC1pnB5QdU
         ykKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBgjaL55O8GY2PH3RiIemJwdl+vO9lpwxLje6BPgI118h1yGgZbP4BXjKna+HJfzps5+Lq/2CkSKBRY9e8@vger.kernel.org
X-Gm-Message-State: AFq9FYLOM25ljo6e/srHi1RKnmL+9BJ05SfqPhEyu/mMvTrAMXySbk7B
	GlmD0mJc1ZFcChnC54Xg8qIDhZI2A+6HSJgn7v9Mraj/eWT+MOGHuNkQv0KOUTuLNeizmdVIjm0
	lQjlC
X-Gm-Gg: AYBFou07cYgDx/lZgp11GC28EJi/wdOfpjw8HDNHzcxOkLZMebPZZyQWs9XwX+azyA+
	dnkzwCoI3V+QngAPOsY2/FB8u0iWoK7VD84zA8EZvD1IBfy5w6BUcNqB2pqxnVsZYEN70R28Drl
	T77e6roObIGZ8x1MHN2K4JcwejgYsMr4shgAy/dcms/YxKaOMUJIlhJadt7udQoXGvgDbU2Y2mZ
	IHfCG/lUpHWTCgY5flUe1P/BEv3KGXPBWcC7V/SH//X4K+8IaClt94lL3+OcZiCIB4THtsWgQV2
	ZEguiyy3LcHeXYPOB6zfcxO7er9vfX7fgERvEaOY4mBrxTTKg9O14tWqqOM2vtCym/sEi6mYo04
	lOmsQiQxFGi0eDj+8XC7HnFVrFOKN1TcREG/k8tC0mFsksRfZDv3eEA7naEbqYxkL4RzSzf52UW
	fqAwoxbeFXRqlSo8GJDkhMHg5+e8/jKe/NTasWbq0qAhP2P/4CNTbO4YS02+UsW/r2UQNvFD41J
	LALyTBVgQkJ2afoMzXaF4TGaUk338zpb1TTpQ1r8NcELWqOPLfP/XsKeA==
X-Received: by 2002:a05:6102:a48:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7cb373fae29mr3183710137.32.1791900228555;
        Tue, 13 Oct 2026 07:03:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bdfb89sm25903626d6.40.2026.10.13.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:03:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGd6X-00000009i6J-387e;
	Tue, 13 Oct 2026 11:03:45 -0300
Date: Tue, 13 Oct 2026 11:03:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, bhelgaas@google.com,
	jjohnson@kernel.org, johannes@sipsolutions.net,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	mani@kernel.org, skolothumtho@nvidia.com, yishaih@nvidia.com
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261013140345.GK14213@ziepe.ca>
References: <20261011132558.GD14213@ziepe.ca>
 <20261013134317.174234-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013134317.174234-1-jtornosm@redhat.com>

On Tue, Oct 13, 2026 at 03:43:13PM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi Jason,
> 
> I understand the concern about compatibility implications, but to
> clarify, my intention is not to create an ABI or a "MSI caching
> concept". 

It very much is an ABI, you defined a new ABI in the config space a
layout between guest and host that we have to maintain forever.

Just for a hacky solution, it is not so nice.

> I can explore converting ath11k/ath12k to
> platform_device_msi_init_and_alloc_irqs(). However, if I understood
> correctly, the VM problem remains identical after that change — the
> firmware still needs physical host addresses, and device MSI domains
> in the VM would still provide virtual ones.

Yes, but it removes the solution of copying data from the existing
MSI-X table from consideration, which is the primary hacky thing here.

> I'm happy to do this refactoring if it opens a path to get these
> devices working in VMs. What VM mechanism would you accept for
> exposing physical MSI values through device MSI domains?

Once you have a MSI domain you just need a driver wired into it that
can request and get the physical addresses from the hypervisor. Then
when that domain is in use the guest will always see true physical.

That part is easy enough, it already exists and you don't need any
driver changes.

The bit that isn't clear is how you get the domain in the first
place. I suppose something like a virtio-msi is a good starting point,
but I don't know enough about ACPI/etc to imagine how to wire it into
the flow.

IIRC hyperv does this, so maybe there is something to follow there..

> Jeff is escalating to Qualcomm engineering again (thank you for
> that), but users with deployed hardware need something working in a
> reasonable timeframe.

Yes, but it has already been years, and Qualcomm doesn't seem to care
about these uses cases, so I'm not sure I see the urgency to do a bad
ABI hack..

Jason
