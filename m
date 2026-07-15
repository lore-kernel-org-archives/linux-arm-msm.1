Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C994963CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144403; cv=none; b=eQorSGQyC0Apcn0jnJDyv0WlX97p5Lr/NrpcI7Gse1wAv+sDh3JJHQVL3PG+O4uuqb9MchlVBZygqMTLe4Zvd/U6fxm42RedAxjLoTLpQUfjd6S+Crxr7uNi9erpH2OETafjNRrHb3Q7/MhwPvfY636UcUhn9wpCesP0KPe8vRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144403; c=relaxed/simple;
	bh=ZVZQ1uH/Du1E/GLHLvsmgCFfYOdpMFENq758X4InRKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+ML2Nu+LPatPa5Yrsmn24rOAUX02RzdIbhXhfSVl3Qm55bsVe9vgP5SUCpyw5r9KqndZKGs83BSqTpVCFho1sVUneTvwUXIA8w3SVbU9pdQ0XN6mK2Tog7sU+ceqEB+KkhbIoSOm/iY084CT0bZGZdu2V/8TM3XXZo63QdB3aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PM2rhkIg; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PM2rhkIg"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c5382806fso19623371cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784144400; x=1784749200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uz/I9zjdLCZbUHGbjgtmB+dGGWHOROD3Eamf87Tym6M=;
        b=PM2rhkIgPqWdhaWSsmilIYRSry2pe1N9p5gtbaomNT5hvIHmrXLAuvV9lEyboUMJ7L
         +wXhGbYJKDs5xOGnO09hWiK1w+PyO5xTlVJmopu7R/4wtZZZ8HDP0UMKCLRM+rY+NR3s
         QlmonAqCY6YbJDybopniT22nJILq0v8D8TfLXa2yoWEEltQqt4CQhGNdmB7sAxdh3t5B
         i/V3eHiRM3TLtuCXB87BVI1nJpYZksNYGxyaVZUevVjoHf3p0l2kxBMBhP6ufFz3tmdd
         U1g59yJsXx5gdP/m/MljdAcD8wk+rAPTmSF9IBuVqceuoeOAMfFwD0GsYNmaBycAr4TA
         D5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784144400; x=1784749200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uz/I9zjdLCZbUHGbjgtmB+dGGWHOROD3Eamf87Tym6M=;
        b=ZaWV4hBDTymowFaSuZ+w4NGT14GB6C0R6/U+q3+LtYPFwjrW+/4IE72plrf60u7D8T
         2gxzrzAtcBzTasqrXxjyA6cAgygTYc6z0meDkSOdndhBn7fuXE9CSuxOIPYHOvn7o0LV
         oSNEXnd5d2Wg5N/FrEYBMEe8V4c8GqtPKRyXDoTNY134Z8eGAzP4quip10TVuQqZVYaK
         DlQHAQ/rymdhHI+Y1RTJEm/xUth3TeDorSoWEnVfVsdqK/dkqFwmBfb2wRTacSHXegx1
         ekVjDQKfJiUfgb9wq1bVxwYLAlEloDOl97F9G3r4dRhnC/i8vKf7aVV2aV5XZ+NoMUlY
         bK6A==
X-Forwarded-Encrypted: i=1; AHgh+RoDDRAk8j9NjSjvQxbYNKZV+/Xiy4N3jWbsX8nbxoJdOZl9VoPADF6feflDpmtp7tQ+nzhrW9OHlgMk384+@vger.kernel.org
X-Gm-Message-State: AOJu0YwJHK2wwT4vfClALXEubcRR//BymIpHGc2DwkiU8nHrM3d595vM
	gddm+BnvWOeqZ6QTaMFTvXwflmPd7GqtHqjrf/7kAw/yTzlJKf5ehtb1wB6hNRYpPw4=
X-Gm-Gg: AfdE7clszrTARVhcUqh/2IKj2ya+RZdbGfmPQUwXCx/8N+g/OXawzJu60KId8TQqiqh
	p7YiKh7D0gIN3qlCkKYmZYSond9J6K1Xk6c92/O5QRr+7eGYukLY2JfynBUHWJeojNfsHywcUdJ
	H60gwmhlabfqR1yZ7eOM30wEjoKj/NKJ6sxuXj1gaGt/CitGBVnf38qhIDcZPfPhWr/3fvDS7sY
	wSALOOQwq/hPlLPZA0K+SCvYRgafsSlO28pEEPySCaMNEiY8AqGfCsHDdcg8upI1Fw7y7nzsdmS
	qitLB+A0HJUpEcYNC2JDpgf0qxsjpyZsogu+HV75K7dIr1wT79mXrhh9oddovb241h6rtXS55Cn
	R51FUQfrDb4RHvcXgmHD017kbixYd9+KSfxxH/eHli5pickRW2BN7GrNuV8ZX
X-Received: by 2002:ac8:5fc3:0:b0:51b:f40b:2fac with SMTP id d75a77b69052e-51cbf279099mr203782551cf.50.1784144400189;
        Wed, 15 Jul 2026 12:40:00 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caace31a4sm145676151cf.12.2026.07.15.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:39:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wk5SZ-00000000tyA-0hFm;
	Wed, 15 Jul 2026 16:39:59 -0300
Date: Wed, 15 Jul 2026 16:39:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: weimin xiong <xiongwm2026@163.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/4] iommu/arm-smmu-v3: Fix fwnode lookup lifetime
 handling
Message-ID: <20260715193959.GB210048@ziepe.ca>
References: <20260714060930.220277-1-xiongwm2026@163.com>
 <20260714060930.220277-3-xiongwm2026@163.com>
 <20260715193732.GA210048@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715193732.GA210048@ziepe.ca>

On Wed, Jul 15, 2026 at 04:37:32PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 14, 2026 at 02:09:28PM +0800, weimin xiong wrote:
> > bus_find_device_by_fwnode() returns a device with its reference count
> > incremented. arm_smmu_get_by_fwnode() drops that reference before
> > reading the driver data, which leaves the returned pointer derived from
> > a device after its reference has been released.
> > 
> > Read the driver data before put_device() and return NULL directly when
> > the lookup fails.
> > 
> > Signed-off-by: weimin xiong <xiongwm2026@163.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Actually I got confused what this was..

No, this is nonsense, if the devdata is racily being freed then so is
the smmu pointer.

The whole design does not support hot unplug of the iommu and the
purpose of the put_device is to pair with the
bus_find_device_by_fwnode() not to control any memory lifetime.

Same comment for other similar patches in this series

Jason
