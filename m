Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8225B09E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 00:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790208906; cv=none; b=gd9syQADkKSJgr2QYkVU3kmY7zzhr+ULQKXXKJh68SZjtO1mBE28OxqmfOWgB03cmu5JbKCQOYX0Q/olnue1/5HS0tab5ujcqu1mciISDUfo2FgZHHMkvg5jceAAzxkIhjmisdlZPh557gM/MB3Jl24bhWbcc0T1iqSue5UTHRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790208906; c=relaxed/simple;
	bh=WKFZzddJPny8S/2jVPh3aGYDgMr+XgmdNOFSGhxbJFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpswtEDs4FrSEII87jnSHW+rbE0sS30MKbnKn9cRel7hwRCSKOk/0etGtmX+7gilW9e9eNlYc7M+uz0Zze5m0E9VWtKwNNBId58xm9AaiLaXyQPkgrBofONZp4wzfO84aqF7EAcLEyW/QF++rePmzfALTcrDJxRXmzxb9JErzDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IgTUwv98; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IgTUwv98"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-78a338fe106so383442137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 17:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790208903; x=1790813703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gjIsmWZd9CC+h5zUSaWzkTJZkaeJqJLSvYoM6LHxRv0=;
        b=IgTUwv98UMfhFh3tgwRReXKifkq71BdiXPKINx+IqA9CGoYwJ7Lg3tC4Brl9Lzmaz0
         Xm+MDXGYFAp6JyHma/d1JQhIh+BQrF+M+lvnUxA0uDO0xG7cd8I/naqmouVXiaFzS5c6
         mSTDXH3Z32PYZ3bD67Fh2TjTJIosZBkz5PJKs8vWbz6sCqYc6c7bBirS0KgRxfQlw5YX
         SFn/RStgwgDZuURXA5bJdUwq0y/LBtSR+fKv7olh0tRc9S2l81C+pk/UvFDjFwSOzV82
         xHdJqdfYb0JaDnvFs3ikly2ujMCtSVHC9I+Wm2HZyYFii+cgpW4gppUHuXjU6/evjQwA
         1paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790208903; x=1790813703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjIsmWZd9CC+h5zUSaWzkTJZkaeJqJLSvYoM6LHxRv0=;
        b=aTgW1N1DB/jFlWDSDp8BYJK66oRYkp7lEC0a3KY0hu1oluRjVtcwqC+lkQXGizV52Y
         aJvATplQhYj/vb6IUI/jIIL9NniT+xtLdXYxiBh7lXgoQr6JpzXxYxzUksw7N5nWSVPK
         ikzwbv0SrV/Co9QUeTP9MR6vciNltL5P9q44vHyxLAx417BD/OOlDURM1ath9wl4eIfc
         fNuJVKF7hMv1rPKlip4TZPZFrKhpL9AJdQhPBZlvE7naocu9b0r1nBtC9bjRBgXkKiyx
         p8/EW65pS4DZa0RUxamhw7VaTbOAGrdVQQvERxM0AF9i6NAr2pHfazI9PUTP1FnXSMNx
         siWg==
X-Forwarded-Encrypted: i=1; AKwUvByBVA9NRW0CVRXX1AsR7i7/pYeGRf2fEK2lo1aSuEaw6AEgq2P2n4oW7vOv2KmiSNuuo+8FmPo5GUjpDGTs@vger.kernel.org
X-Gm-Message-State: AFuF++nof+B/ekXW6T2JprubZ3CYM/j8yNyV3CIkEVSdt7bVgjhvJVTE
	JlEE5pOppMBL220i9I3EJIO8NQoPINGywY/nJoqvwByx0myYebtLMya7JiXi9oWLpOl+yTNovDr
	EigIX
X-Gm-Gg: AYBFou19I0GBR+R0GGBLwZrRerwxPb5QHTktmihSJu6CMnPdqSXJ2jmAjCHRIN6aqVn
	qIuMq6fOehXG1hEQJypF5aegFfsPZtlq7exkYeQa5Y4zqt8V+e2RZEZ7H0ANs0Als5K6Wrsx3TK
	2Rkf3sKALABf4uLlO6whwOmd5j2HOF1prCAVPb5gVDOXlSvi4a4fhIKMP1zsWMylxLJYSgrYNof
	laKlG5ivmD/j/9ge7/o+Ygv7iJihNER6U+Z/FK6k2jRbdLcD3a+L8vMpZMs/X487XGcYhL72lBf
	grs29xD2TXArBtkdeUG3C4oOyk3xV+NYyLv+kRCVrtEAJcYiw8RndDTZyjqbuxLi+nJ/VTSPOiC
	Sd6LoiiW5MQssMimaoBJUSezXGRhpUfiH3YAheywE+mNfNVEX/Gja2e882b9qGmnlT5bGDZz7uA
	2IqFRW62wj0FGqI+ZZphR93DBDrGh6jCbsjzVCJzYaVF8PeqLb93vrKK2YVIWjBf6XQ7sVrGeHp
	paRqeB6sycE97ltLR6+7BgiHgjDwDMrQ6Vp4hD6dLUQWXBi2FyxKkkW
X-Received: by 2002:a05:6102:818b:10b0:7ab:9152:1c6e with SMTP id ada2fe7eead31-7af1eae9c71mr425311137.27.1790208903588;
        Wed, 23 Sep 2026 17:15:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9852a2b6c6csm211091241.5.2026.09.23.17.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:15:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9X78-0000000ExXK-1vqU;
	Wed, 23 Sep 2026 21:15:02 -0300
Date: Wed, 23 Sep 2026 21:15:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260924001502.GO1540250@ziepe.ca>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>

On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> 
> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> When a set of consecutive PTEs map a naturally aligned contiguous block of
> memory, set CONT on every descriptor in that group so the hardware can
> combine translations and improve TLB reach.
> 
> Advertise the supported CONT group sizes in pgsize_bitmap. Callers select
> those sizes through the normal page-size selection path; io-pgtable-arm
> then installs the corresponding tagged descriptors directly. A partial
> unmap of a tagged CONT group is rejected before modifying any descriptor,
> so a rejected request cannot leave the group partly unmapped.
> 
> The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
> CONT support for hardware with implementation-specific errata.

smmuv3 has this errata, it must be disabled there too. I didn't notice
it in this patch?

Jason
