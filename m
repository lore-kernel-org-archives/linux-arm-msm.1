Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483649;
	b=S3Rg8vuzNRySxsXBF6Pt/Z1GMWutVTQbJFBp1D2wDO8eeTRZgkOnQPkLwuEP36zqIR9N
	 MUEyZLm8eEE+QZ5NtmEuyFNxDKejIBZWjH5BAeymv/5sEYiF8LVv0p5ndSQ6zfvVUhUcR
	 7kTnd9SQL8qB4rfdLLKIWFZQe8nZTaz5cqx3WAr4Oqn1umSOqOQWn7+QTCOs2EaGTVt6p
	 4pu1M+5RK8eH/4AXlicwazi6ccnR1yhjU/fe90TvWfXf/cR0KrexUy7d2JXWKPrgopV6h
	 2WU3igsel3sopcGm3EFy0K7ysstya4u+iy1APQOTX8fzoHmKvmbCpKyCe11Kqb5kNrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YeWP7Ew8IEw8W3Drb+1wADQhHaKMJ5pzT2VKjpcBucw=;
	b=vZz2W7Voy0xZL/hoA9B53+nEhKVHQfJl0iFRiddEuTHfhMNv0iA4s77W0i826i6qZPma
	 A7n/4FGEbvtg7ayY18rYEanzvSz/uuCRk97cyI7BzNYt5x4YW4D9CKrorMm4XVfpZIVUx
	 raM1ZT+gT9jovAcp/2jP36TdxnGZISdcXBqumw0t7PtOhCTeBkUe2PbpdhoAQ01IS7C5i
	 0/RmkAySBGVoqRUM1jSJeSCA6U5iGOkG79wtXhU2AxJ4dmrhbB5bmVicqMFy1Fn8fdtvE
	 X+COp1pPZzCqmw4TnLZRKXqk6Qv1dJG2Kt5NAfiQKwMymFGh9rFZ5uAy4HGnJAojnDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9lSSGlu;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AA0606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05AA0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9lSSGlu
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3704d30b84fso5348812eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483648; x=1795088448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YeWP7Ew8IEw8W3Drb+1wADQhHaKMJ5pzT2VKjpcBucw=;
        b=M9lSSGluC9eUBh+le2/2HSaG4obwS415fqaTTfOC/Frn7T52MMUAP056NfK7KWW/zx
         9l52BkP1gdUFngvBcU934Ca2JsCItBYW9O2KBGmiYJZ56+JxorJ5F2D9Q2Y/RehO830p
         25hQ885YT3wbx9bgJg2iX2h90wIXDZ3mEdcP9M0jMCELOMt1sfmDTm7TDVcNJsqoR8//
         BHRmUhrrkhTe6LpYtpolp9NJPDUdmOo0XPM+UlSYWv3jOwKVNnLaBXHpLaNcwa54WS9v
         g/dAo5DvM1qHF+xG6yRSi20/SBiCVwd/5yFsyzNCkCi1tPbDxQNHL+r7440biVIAXacw
         zEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483648; x=1795088448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeWP7Ew8IEw8W3Drb+1wADQhHaKMJ5pzT2VKjpcBucw=;
        b=Rza2UEmIErp1qPnnq5f+32P38RU39fJdOyjCZmUMrzqJe/y5pw5wrl590YDuTQn6Ez
         JA+0NQsE+D0Yh/ji0x2ea0T6/LXGFOGcrVHvtE1itQdCOa927YbG3rP0BoqbYWUWG/YL
         tEWx0n9UvIB0CI9lI9sX5uIXVq3YetCWCd1tQN/wDmlhlOvb7tO03YeybkBLeTvq+CQI
         a1vv0/C0MZwIkqeSDm+LJs8wTg9wd0hE9MHT+PJMhgr2m3fDwbjNOD2DaVojooJ1Xf34
         YNia/GTsgVPxWZbmIdDWja9rohc4A4MQuVRd3dlj69ERT8KLVGOhDKI94LEgsqLZ3CFv
         Kjig==
X-Forwarded-Encrypted: i=1; AL+hErE0z29jEyJAj+Z6MuyTLQP2ySbcOy/sDInYTHfHXhvfHxLRIlDyGDR1nDrPP9jToNRBB20o7+e73nxbluM+@vger.kernel.org
X-Gm-Message-State: APuU4Z/pGKmHGDu0uNMDY58czxS2a+aj8pv8Rn+mX1eLqiGTfN4m/sLj
	MIS8gQKHmexojW9sJba+lMK7ToEg3uJe4dw8aDrx9Sh0Mw+7yBthzxNy
X-Gm-Gg: AYBFou23eUNQg7znX5LT6yzKSO43VEUg6xLGsXilXBjuGrL23WNbzJ6xY6GfQAaORpm
	IYvqkYtgA/g4zBGNvyiO/EOezYWcFjt/NLsvu5rlwwKX/2isdv8bd+/iGpCT/OYI20bCy4x8PEv
	4ssJLe2HwT2/2OMhzSvlFz4BlSUO15A8HXrBLBpKw42bsyKlgy4l+ykfUEbYdV9O7kEF2ZO+dBo
	MyepVL9JQA3kPSWVVw/Q627tJD7BhosAkk1kLaAsYwQaWc6veDGaXOBZUMTy1xfFFKHQ47ZGrbj
	XcYhNET63TxTLE9j7S/949fMbH9LhfXhpBDVbhQXzbbDYE5u5ixdL1/4S8nxjDUm+OEfcvIahhz
	APTYdhjKjlWViwaFHJhd6ZFKPhWquj9bMJqX2mTvDtDS+twnot/ghlTqISCBX4HCF6TBdrfKvFK
	TUmhh1zI3g2MP3a75s9dLVCgam8JeB5hEXYKY4rrDyysg4a5+qd2TydkxeGOAsAp8O/8Mvytf1i
	cnib+7fuo+IGsgpXuPJrUDn4g8ceOnreKtyMlefVxzSvqrc+3kCBrEnqkNyjZ+gyoJmp/eoRK3M
	UXgzA90yzSTftrQZ5dDFI1H5yeyVT2ild3Wbz0VQj/Q=
X-Received: by 2002:a05:7300:2d2b:b0:36d:2704:6adf with SMTP id 5a478bee46e88-3768579df8bmr7841678eec.11.1794483647847;
        Thu, 12 Nov 2026 03:40:47 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm29448853eec.14.2026.11.12.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:47 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	yongxing.mou@oss.qualcomm.com,
	Xilin Wu <sophon@radxa.com>
Subject: Re: drm/msm/dp: hold one runtime PM reference per plugged state
Date: Thu, 12 Nov 2026 20:40:46 +0900
Message-ID: <20261112114046.396-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <2ndbj5fk7tnmexirfulh25kwx6pjzsmp7vjczbhqdxxuw3fm5u@qx5qumdw6ng3>
References: <20260929130627.959-1-26rote@gmail.com> <018c6fae-49d3-4f89-8212-8c6b64a2829c@packett.cool> <2ndbj5fk7tnmexirfulh25kwx6pjzsmp7vjczbhqdxxuw3fm5u@qx5qumdw6ng3>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 11 Nov 2026 19:13:45 +0200, Dmitry Baryshkov wrote:
> I'll fix that while applying

Thanks. Please take v3 [1] instead of this one, which you also
reviewed yesterday. It replaces this patch and depends on patch 6/9 of
the IRQ_HPD series v8 [2], which removes the plug handler part.

[1] https://lore.kernel.org/all/20261024051952.2006-1-26rote@gmail.com/
[2] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/

Thanks,
Joonhoe Kim
