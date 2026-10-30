Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368463;
	b=c0A/90zqIXM+OiHRA+fwGdbGOIyArnePfFzoRWKKAgdRK8vD/1Pmph8CG7sxN1nmh/S6
	 XogelNKGX97KWLh5iYxTGaIqUENOf/U3970a0yGzACndyYUmKBANCOPyTFnWsoX/YpRs3
	 +25XU7PAv0hhqlW9y4vF1CXanCmYGxKu0tGKtFueyrZq7GlBxjKEi66Mp8NIOPRSCSDGS
	 7D9cnR0QlFNey4h9KlEj5bcfzW+opnOKmj3dJ7HSStvr8q4fiyjhs+eeQe2BBqM1OMsC8
	 +vubUgTddrYOaAZoZUv0MbVY4zVbJ7EBlycS+vFZkLyqSmUT7WVwC67VjvR+PFKOplg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
	b=vHYDEKR+Lh68PPe20yAL62CPtVWaVyiUMjARJHrngzzBPJd7yxNGqMzbgUfCbyHU2hCj
	 L6gXYtFRkcEZ4fChV/mKw0xzF9W7A3ixBSF8s/XgmTr6XgbqkPBs9MKV1Xk1vvsR/FUh+
	 JJ4wYd9iAxoNICgyRNfwl0i6TM9xL/AmazCtlMRqaVeKIBQbTz2kohFgmvF3yRYiiUKQR
	 XxU43yFB69JCipF1irEmBpbpB/KKV+ZDCtMYR/tddMQbtU6dfNfsK1OXizk1HYgUz/d6L
	 R5WVbMRd1XelqDbASL9GnqEQFAQljl58jcaizJhsCIrXXa8gYuV/lLIa1doysJMr+rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWaM6t2o;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4CD606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWaM6t2o
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so6152505e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368461; x=1793973261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=XWaM6t2olUZqZIxFriVejrYzehUyFljQN5E2CvGc2lNTgSVwJI5hIRBfuMBSzYJW1b
         573FOamRVec1VCMzletpzIxN7E3qGFoLJjVRSWtq0Lg78fbMdn2eGoHbT9tpuw9eKDkb
         hOI6+H/tt2KyetfMO7tK4BJUqLfd2n0gHAw6pZ2biqL5A1JuXRWsNqOeHLx+rByImhzv
         RSfl6WCRNYCVJIXSK6BE78UHY+WWI6kJS+Q6a9blv1tMTv+RJoO0dI7kE9Lcm5F7Frgm
         VeeaM21RYMDPzOqVzVtvdhncwp35WhxDJvWrR+HwCT+mVTFh8BL5Ke8mkmkbnyPnrd9h
         LJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368461; x=1793973261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=R198fV0YuGRUrLii99FuNIHzrCkmbd7zMxJK40OiZJrRNd7ElhwaK3xrQwNbIWrHxi
         /fYVdEpuuEyxdilRPDHtWKxdSDjrHvMQvf3wbjVPhUEnX3tulWAG394vAjPhhSXDUdV3
         Spz4TCCVo41uSlgDhFs2bLEC8kNPjNmr+nvlKi6+eCnVZyM2ebqZC3d1eTM10/sZlMDh
         8+OrW2Zmm3i2NouBNiCB48Plpf1zIFtgqpcnS+Eww8uxIt/xcDzjTsGO457g8zPBxKLR
         DCdCGyMU939QdZb8PipBHgwmZr0XjL7xQzDMJACV0ve5Afb3fgqJzRaPLEOPFFCKvcZE
         5Hew==
X-Forwarded-Encrypted: i=1; AKwUvBx1jKeu6PSzMOx1mLwfMZ3bblOAmzRZ3y69K0xbZ3aa8PtGILRJ0OfxOU5fpcJ5OEUlUCQvObNUjmKhFwxN@vger.kernel.org
X-Gm-Message-State: AFq9FYKwWD6CB61K3mX13QBLCafOyHsfIMcPO4vACvRLhLWnnOAMG0RS
	oMonvfQNRzgGpvZT9PtwdZ9aiGaOjfMhV886w+r8/nvDh9nF1wq/VYHO
X-Gm-Gg: AYBFou0ypnFILbrP2Qo2SIXQa2gWU1hHUdAejweP4+/EynPDHKiSIXoY3BVl/UkYjOl
	k9rc0MqutZo2A6LDryLyBdv1eONUMPI8RTM8AI4hq4H1+oVdbY6S2Io2W1N/jcmbxbtdjHNiOkx
	hTVfRk+ULluT8a8RwYqit9VBhZ4JQxcTbkDGfHsE3pqTXFRZzS/t7ovqQfMicq5nigY/iGXUaDF
	vRfyNsDAZMlmLX78YwKmswhDHH1P9Ddv6mNuqV4IuGxxMGW61pE2fEF7Vy4xJ0VqVfIS9hPmAQ4
	4Gz9ShVokLxwClhyzisxSyIH2rSrw2vlJVMR+3jW2Xus/851IhKYWnrBbTCkFrvJydIjyqSKz78
	DlwB51UusBNQN5uDdxA6+xIFqPJbt91ITAQwSXhhy9zuF6cGMm4n0EaGo7ehG/qk1rYtMJ/daJp
	FTOCzXrbS9318fMXDu3nfDtWVgDuDlzpoE/SPEHaQU2VBxTJYSefi9CtBgRj2AXYTEzmqdTOlQV
	Zl6RU1qn0Sm8otZtFDiam8BbCf8JmVjXk9End6MTdjxGzvNiafDiITSxqMOfTvb7sgqESYDnRrY
	EwBZDtYiTKN3VnZ9p7zzWUax3PqjZ0yTrwLYMhYEHEen4b3mynOUAWTgl/PUlSRVIN+O9y8RZLv
	FS7mfMLvjwxjjmTXO1sRGudTqtXi8s+FUb+C7tNZZm4xmcuYXdO/p8flgd2xntzIdOwA=
X-Received: by 2002:a05:600c:608c:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4ac190497bamr46672575e9.28.1793368460933;
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm34613455e9.3.2026.10.30.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:54:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auShiOI6Hmla6XxR@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
 <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
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
Content-Disposition: inline
In-Reply-To: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>

On Fri, Oct 30, 2026 at 08:46:07AM -0500, Alex Elder wrote:
> On 10/30/26 3:57 AM, Sakari Ailus wrote:
> > Hi Frank,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > When CONFIG_PM is not enabled, all devices runtime PM state should be
> > > treated as active.
> > > 
> > > __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> > > pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> > > stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> > > should return the same value as the stub pm_runtime_get(), which is 1.
> > 
> > Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> > otherwise the same, except that it requires also the use count to be
> > non-zero.
> I think "yes."
> 
> I think the logic for !CONFIG_PM should basically pretend runtime
> PM is enabled for all devices, and they're all ACTIVE and effectively
> in use.
> 
> That implies:
> - disable_depth == 0, so usage accounting would (if enabled) be done
> - runtime_status == RPM_ACTIVE (power is on, no delay)
> - usage_count > 0
> - runtime_error == 0
> - Maybe ignore_children is false?
> 
> This might not be complete (and could be wrong!).
> 

We could add this kind of information as a comment somewhere?

regards,
dan carpenter

