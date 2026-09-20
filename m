Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5DB47044C
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923930; cv=none; b=IvipzA5oG0U3hR37uEZr77nNFymII+nrq1RCCXtGlluoCIogtFroOvhvd0iiCygYW8OrDTyze4PS0KI2YxyEIA52XM00r2+7ra5cjbDMuyr6PCpUfq0FclCN8yEaZVDjedHNB87e+owkUfTj++RQ1YoAaV8fF6KMscmZzHeWFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923930; c=relaxed/simple;
	bh=UB7DMGZ+FxW0l1Fy8c9IR09ZvHOP2nrs1Rzs5/zvHbM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HgI8uPhYBfM+i/RSDEaYbUjLOt61y0c2wzDvWhdyNl10JMefUEIKdt5t1xOMdZ8DNn4QxuAXIV70Dbl/VIYABEiCqMU6yntrl5NeJ5h7j6Bx2RsL31jYeT/FYXhADZkkeNWgQ2f3grPOcbzT0pa6NrG2HkCS40wbM2i2EIA7RgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q1G8OZed; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1G8OZed"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7443e0f0bso44265255ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789923928; x=1790528728; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vC56C3EjHy57yP07NvUm+ZJd8lFbjzDpbgEVI6VNNtY=;
        b=q1G8OZedTUdvxYWwPF0IiNk2HTpESpBqxQsTTwA0rFEP+3qCI5Ayvjrwj55Zf+92bE
         GM1Sw4Gr+jZOrEx8Nj6+XZwIYjQjcqDosG+L+N5WJsvIp+0NyOAvMELIbS8xXgXMhWz3
         LBk2apB4zv3beYytxuo4eJp3l0RPeZccQM4g5lus+kj6VOjGr1wDA80O0EpUR3I6wSWM
         /vA9wsXptYREdhDdWAZ9bFY3I2aF0Jn4i6jgHGKYxNxKUGKiZTfMEqZ3KMtu9Cv9zs6u
         eAYRCMmh3Jm/P4JfcUgGvWIAnafXTZnllJE3nWZRXaax7O8XMr9vi0nUKqrFsoOSWizs
         3DOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923928; x=1790528728;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vC56C3EjHy57yP07NvUm+ZJd8lFbjzDpbgEVI6VNNtY=;
        b=jC9K5yVE4k6sLYQbocn7gK5vQMwtISKep+SXSWPptndQ4q3yMA8r7oVsNo4BXirYkl
         1+JatGrHHuCxfrwklZvIgatVilCnJiT+4dP4V0KTLrhB0aWhNdD8cBhczaeWfWGWsiYe
         v1coPdy9erSvnmaShOaWPWRaK4GvpdZoKiRpyj5o/wQAXAuxEnIDdO1N9QFskrGN1Peq
         NyKzQ/aG3qVQ72ArE3gk27LZQzWT/1Q31WnXbtGtC1jMwyN4YI7dpH0a8J9qKVddzlTI
         hUBNf5Jgr9E4sg8mPfjnCKtF7IohV4njOBqVHzqP0rPLOPo0sIzpaCkoKLX5QIEHwPQd
         BHug==
X-Forwarded-Encrypted: i=1; AKwUvBxV11CpE1Do5dlAepsfUXn3nqgkvwnINFCCMXF6bTIzLRn3hFGhuBDQo36uidRKyYyThPUURF5MHYd4lIHT@vger.kernel.org
X-Gm-Message-State: AFuF++lWwZtqA+kI4c215yv4WrdyF2m5Kqy8bwlczeOYl7oA0BQ1x+Xc
	j81VzwjrK748X6ErAWJEB7RLVjILWbsBxki47MN8WfwwB8AE6qTSQ7aAg24/nLQes3BvGKKWBPh
	F5Cxz3+IBhtjlDnWU5voc3Q==
X-Received: from plao21.prod.google.com ([2002:a17:903:3015:b0:2dd:4fa9:1919])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2447:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2ddb1b78d26mr124832455ad.17.1789923928078;
 Sun, 20 Sep 2026 10:05:28 -0700 (PDT)
Date: Mon, 21 Sep 2026 01:05:26 +0800
In-Reply-To: <20260920-fix-ufs-rpmb-v1-1-560b842c589d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260920-fix-ufs-rpmb-v1-1-560b842c589d@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260920170526.4039553-1-stanleyjhu@google.com>
Subject: Re: [PATCH] scsi: ufs: rpmb: register and unregister the ufs_rpmb bus
From: Stanley Jhu <stanleyjhu@google.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stanley Jhu <stanleyjhu@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Can Guo <can.guo@oss.qualcomm.com>, Bean Huo <beanhuo@micron.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sep 2026 17:50:18 +0300, Dmitry Baryshkov wrote:
> The ufs_rpmb bus isn't registered in the device framework, so any
> attempt to register RPMB devices on UFS will fail with:
>
>  bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus 'ufs_rpmb'
>  ufshcd-qcom 1d84000.ufshc: Failed to register UFS RPMB device 0
>
> Add module_init() / exit() functions to handle bus registration and
> unregistration.

We have an existing patch on the list addressing this from the opposite
direction (`[PATCH v5 3/3]`, Reviewed-by Bean Huo) [1]:

Since ufs_rpmb_bus_type declares no .match and no .probe and consumers
access RPMB devices via /sys/class/rpmb/, patch 3/3 drops
ufs_rpmb_bus_type (leaving ufs_rpmb->dev.bus NULL) rather than
registering an empty bus.

Could you take a look at [1] and let us know which approach you prefer?

[1] https://lore.kernel.org/linux-scsi/20260914144943.2571104-1-stanleyjhu@google.com/
