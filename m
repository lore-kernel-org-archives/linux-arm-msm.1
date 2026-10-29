Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300351;
	b=gZwc/veoDsrbBrDDW7nKNjIoH2F2zUrWc1fV7OBdkTUe4NNINAV64RVmH5UIxtLC+obf
	 d0f4vfI4MsCoMeYMrL3ZChJHZ9OtPAHcIYj123Cv5yRvRTa+CBN5JXpPzaX/0WkCT+PYC
	 KkzZEqANHsKhRCJl5Q2Hj63dikMASsuZRWr4uFzla7K66asByGQZlhSxCSRjB55Xy3t+T
	 A9aGaVxfD/4X/k3k7y1AiFqmreUNyPTyjo9Dk3VTSX8JVSMD7iq5CmGQ7PikFarat3h6T
	 WWyC/1rR53ZZT8eIB99KVIrAaWOMAUK9MtMx2BN5k5taFWpnlhlLzvfcB+E83g9sI2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
	b=Qy679hMEd3vemXeZNTw8w99K7JFdgTQArwz35p/C8Kz5Wu6ja+EhrqcpMfJr13Ky9Wfz
	 FK4bjUQ3a8JvPBvJjWl0agQf2owOGqsrdrLPGzye/Nb4WOVI4rOYFzJE1wrAx9DzsS4lE
	 yWX+lNuZL1p/TqIWBIg5Ibzct+U8+dnXilLfEbeaZifhjBA4B2T4s2TlPwFsO7uTkkhyS
	 DCHz79h8ovovqDYkhEjKwlMaZ5uw9gIw0mDCoBNT9zs8oFvwD8ggkD8NSEay7zFR8Qqm5
	 ap4N5+W920VV4LOqrHEol3RHTnn4h7x/oBaxJRl/7kArNOws+KHQxbb4K4XTKz+sNkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKHfFSVm;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4056606A32F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4056606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKHfFSVm
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so21099995e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300349; x=1793905149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=wKHfFSVmSHenG0U1iwKgtGSi1UOPPzW6SwGJPjDKQxqwGUCxJEvCn1DjSm7x+7dlBI
         tUKS5X1HwuZkVolpmPhJFNwbLcWP4O2Ey+tlKOMSKe5uAIMYifWViWBMbQNK0ytgnkU5
         TxpYpjDnhF0RjngKcgEl1OEsxC/rdKP63x/HzurTG3ZCmbKYurx/pMsgnAebRGdPVULt
         X6kw74+yrE1gmuUM1siaydpKy5zusToKzYM/zlLOoKSiOrcEwuwMelyy8U+A1MF4630N
         +VRIg7uYp5Eams5/R4YrzMxIRDiBSFhS3P/ldIwkkN9aFhmNkbr/qpcLWvL6VVYZuboa
         npsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300349; x=1793905149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=wk/IA3HnSxrdfyPUsSaoybMTCnr8YKDm+jEOb937pR5Oa1SK//A099XRpQa/PjOu83
         aTSR5SCPcOROvOoSbktyoebvcBJzGc11OKkN70ji551trsQkiAvynCClcOFKa0Nfp10c
         eVY5hxT+2kBJWKx1l11n1Sv+gUPD4+lHLuT1duhCy3y5nZ+VSQjK0xuNNmHDkb5YjCG7
         sL1kWuaeaVg8survSOEkUZEou0GyuVYNdK0rgNhAgH/ynTtUgjUZv7SVVkJCkbhxr1FW
         +a47+NLHileAwWFjaYyeUWvxbt+jS71rZAm7eVjBts8STQmJ0ITvOqmgczmfjqfewXYR
         VieQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8hP8agmfuQ7JbXE06DQtskIyXh3FOJDZLB6qTQAWqy0svCduBWHtcZODaQXGpreYPhzwwj1Z6UsMTJ8CR@vger.kernel.org
X-Gm-Message-State: AFq9FYL7QtR4zukajqIZvRkjR7sXm9IotIxxkNxZ2tvxjCaiH9SoPO/M
	WM70Ud9ftQmHk09Rpm52aNJ8BKNSg2p7XBO/MkrhVu+gSuX9Yar9eSPw
X-Gm-Gg: AYBFou0ZT0g/TSsmbPTaZv6FgibBGXBvhc4ciVhbGa4AkGvPWtmYluH4jh4OSIM3h9b
	FEiyWrDGC/QmDeIld9pKaogzShDUE+TnoOdGfDE+miuC+cP1lQuHnzb8Ow2GV6buDhgwtlM13hw
	om3HGdMXRi0/eGBhi1I/UM5ncxCdJ6uRSeCQ32uJGtwMDgxcEqVw3l0wzdwXGHs8V6pAgDt1r0H
	MnLRg/otHiJyaWVe/uXgpDck/vbypxozGqONhYl83EOJDJ0tfYRPRFSSlBdSll8ScyohTFoco2v
	qm2CrOqW0Q8Imva+7RcTxqiZDBCvxDOoGOQCfQr+goMDDP2z0WunP33oYT3y823ji8cUKqTm3bk
	UFl1TGES9gp2QciKpiGrjInnDv8DdKkNYH58c5XgQVt14EZnoQnbsA/Z05egnLL6udjOk+Pbgsx
	8zfeEneMfvTF9BIdlnpRrr/8lIn7hphVcx5tZnwJTThBdsFOT5Ha66xXZ+qyvr+rztSTSF1xglB
	0if4x7DnmRAUcG+6IypR9EU0XD7/fCeJpPTAqlnLybfFGJMDXIVmmtP2XPXy8dq8zcygbxCOfgC
	XO0YcE3fSgdvzqBFlc5aAIr6qNj+pBJ46wDji6tm5uWpngaiXjI1kPa/5opkNHibVOXSoKkLwKv
	wMyE6JUsGjHp5PUK7b6fRhAxAS0sJGw63iPEptrQKlrxXngVM/3gOl6PyIaQq7WmWNtx27LtCP8
	oWX9ujWkDJOtlb
X-Received: by 2002:a05:600d:4121:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4a96836988amr152798385e9.32.1793300349381;
        Thu, 29 Oct 2026 11:59:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm4933955e9.10.2026.10.29.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:59:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:59:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Message-ID: <auOXeGVQG0UHeoQb@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:

> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>     return now skipped, correctly proceeds.

Pattern C is mostly bugs so this patch should have a Fixes tag since
it fixes bugs.

regards,
dan carpenter


