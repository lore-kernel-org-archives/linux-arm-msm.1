Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212ED3D25AF
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378985; cv=none; b=li3ksYCy9KnXhvI/jtCszsMsI+SWTBw4PSQHR5Io/DPsxL+LvgYGCqTCWaw0pXPM+cgFfoKn/BxWYrZuxvdm+33EA0q6alq9BndqV3H+Sq4nK2rSKzr1ku7ByH7rGskL8l1ZF6tSiI53E4s2DDJbMSiLcB0vl+oN2gdv/zklJJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378985; c=relaxed/simple;
	bh=TXXW5n3a0Ki9BYV30DPXfzeFhBoYd+H9eTT70dASRRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZzbjx6qyH/8X5Rs8fiLAwDlMfepqRnD9Col8fP/o+lnLgUnmE7HZ4j5VojoouUo/FeBkH6XbYROOcdOCu0SRuHMeDsEhmmhFT5RHER2KqojuV4tEj4h6N3loH0a1vGgj9g18hDoN2v3IzL1Dudg+MnlJamgEHYyCLUxyuFgZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cz0meRht; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cz0meRht"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-88700d2cbdeso121751b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791378977; x=1791983777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/dj6Lb2IvVTeq+ptx1rfH6bD+cptgUsmqXSt2Gyxeg=;
        b=Cz0meRhtEhojw5viwOezkSaV86kQz9M0J04sfvk5RAM9VYoVsKAkyEBTHx7B3l8yc/
         xVF5X5g35VeE5WinuVcPhGNdemupZ96cBhmEmTUNVI25QBcEbWim0lLjbdpiWKaJXrk8
         ECLwNIAqY3C2sP9LwaVE41UJVqfiJ9wvdvqWnqOfi5fJsZT0p/lC8jh1SrQ5e21S0W6k
         zrSIncOTkhsiIBeKrCZfLp+/4lW9eicyMSUNjblQ8Z3rvRclBAf759eGOXtGyUFlHJ10
         5atpIKF4DXUoZJZUeKw1jy9KLb+clVuAa6A9mmDogZ9gSorIrxA8VcIJ7mA3ZA9FN+k4
         03mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378977; x=1791983777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/dj6Lb2IvVTeq+ptx1rfH6bD+cptgUsmqXSt2Gyxeg=;
        b=2Y4XcjgIFT2DDcmTFNnbSb7KfhyZxTY7fTaup41ZWVV6skoo/0y4lFx8Ar1ZQ17fno
         aLQl/FlOeLUW9evsW0Jfx3BQ6cPYP2D3cLDWiZl2mA2jYNYcvoe1n2u6WmBmLd/AVIo+
         1yItVXqxMmwiQPDeS2DiQgH2LPE51fEFmVA9GRmeIFf7AIz6OimReEMtpMy3aD0+rLa7
         BryzwaFj+Hcsb5or5Twq1fOBJ58KP/DTXpZ4vMf9DHVCcSzxuPs9acqEpQVi4ZFDt1H3
         kkrgZ9Nx0KRZijGgAfZ3V+oXWAedVowJZCrxINAwpj9M40hTEwrhoe335KD/WirIPi15
         jr9g==
X-Forwarded-Encrypted: i=1; AKwUvBxlQqpGrEdSdzdC6XEkyOFJzIiFyU4fjobVv5Tp5ovSCDRtCkFUiLqNO7BrrIp7G6T4MibWRQy3n/yyxZ9A@vger.kernel.org
X-Gm-Message-State: AFuF++m9nqh7tXHHyVbD/bQDo1oCPygxurjezabBVGbcxlKtmoc+Ph1W
	LJpYdN5rD/5leY+P2C+RE62UtQTlSqVhjlWZ5B121cS0WqReF/Nyyby6
X-Gm-Gg: AYBFou0WC1pkWGrbNRLN0JbeEG8BhSgjEJn/B25dZIwDu796JvoZPAar3jopqVwRlaS
	EBstQvh6z1HPysUvlCQrb04mPMRvT5RtzwJLJv3d2G8s89PRz7ej/hE6l/53P9bzlKrwB+KSLrP
	HA5T0zB5XDsU3bmTZ3YapqClb7NllHw9pg6lKVcWb3dR8Kt2EpmEM888PHMYlm4BYf1mT8dxUNF
	cEOzQPOEieieGtiW5sFVqZ/qO15vGluoYBwaGcdBRKqHIqoq73yr9HEy8ufU0d+wmCBj9fJI3xC
	j1JptnVsrFVF4m/XQ/0c7b6UR+lkPaarK4a/jj+ta92pw5EgUvTEHDqwDYJJYRHExzoaBmDNtUI
	cBETNWjXglY52vxMR/Hp1yKDk/8oCefvYfHetUvT+5eg3GJMmqFZbTiE/cKr/XGdiGt1k8otUkc
	Jz/HBo4XddUXqNkQfisktEsvNz4eirSnJgIlbifx09koJr0X0sQ5RrfBY6SY6EhUZRKLvgy4zrr
	MvSpCjsckzASA==
X-Received: by 2002:a05:6a00:4803:b0:888:400:7fcf with SMTP id d2e1a72fcca58-891b3b4c652mr1740386b3a.3.1791378977074;
        Wed, 07 Oct 2026 06:16:17 -0700 (PDT)
Received: from jfliu-sfa1411.. ([240e:36d:b09:1810:7fff:6550:13f4:b6f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bba97a22sm80118b3a.49.2026.10.07.06.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:16:15 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: abelvesa@kernel.org,
	abhinav.kumar@linux.dev,
	acelan.kao@canonical.com,
	airlied@gmail.com,
	akuchynski@chromium.org,
	bleung@chromium.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	jesszhan0024@gmail.com,
	johan@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	liujianfeng1994@gmail.com,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	pooja.katiyar@intel.com,
	sean@poorly.run,
	simona@ffwll.ch,
	yuanhsinte@chromium.org
Subject: Re: [RFT 0/5] drm/msm: DMABUF_DEBUG fixes
Date: Wed,  7 Oct 2026 21:15:43 +0800
Message-ID: <20261007131543.7634-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

On Tue, Oct 6, 2026 at 6:09 AM Rob Clark wrote:
> With DMABUF_DEBUG=y, the page information is stripped from the sgt that
> we get for an externally allocated buffer that is dma-buf imported (as
> opposed to an exported GEM buffer that is re-imported). [...]

Tested on the machine that originally reported the breakage - this
exercises exactly the externally-allocated-buffer case from your cover
letter:

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer
  SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y

Hardware video decode in chromium (V4L2 decoder capture buffers from
videobuf2-dma-contig imported into msm and rendered by the GPU)
displays correctly, with zero arm-smmu faults and zero io-pgtable
WARNs.  For comparison, on plain v7.3-rc5 with DMABUF_DEBUG=y the
same workload logs UCHE translation faults and a __arm_lpae_unmap()
WARN storm (~470 traces per minute of playback).

This is also much cleaner than the translation-based approach in the
follow-up series I withdrew - mapping from the DMA addresses is where
I should have ended up in the first place.

One small suggestion for __do_map(): panthor treats "map_pages()
mapped nothing" as an error (panthor_mmu.c):

        /* If nothing was mapped, consider it an ENOMEM. */
        if (!ret && !mapped)
                ret = -ENOMEM;

With the DMA fields now populated on both paths this should not
trigger in practice, but it would turn any future regression back
into a loud failure instead of a silent empty mapping - which is
the failure mode this whole series fixes.

Happy to run more (heap-exported dmabuf import test, kmssink scanout
of V4L2 frames) on any revision.

BR,
Jianfeng
