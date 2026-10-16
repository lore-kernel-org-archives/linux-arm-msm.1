Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80944AF66B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162534; cv=none; b=Ben+33T1hzey064CwYj5MkJZsv1CbQi3lIYLgAQ04/gDBuNeIsARuVXlfuBS/g/3n92EUZIlDmZJeBLvJ03RukxsnVllldByhCByMfI4eqErW0Qa0ieaDVHAJy6sTyZPH1vE1H71jtatY/sIS1JyEHgtQqEDdmqQrH2/DKDCe74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162534; c=relaxed/simple;
	bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYpeHMeYP5+VUK0EZscJGajmaIonGtHoQU7BFoVemPnNoi96jnhzj/3ZwvS1s8ccWWatAUqUus1SF0T9BHCJJXvS2iCCAh7y3y9yKcVvc/zoDysypVd0jei6BN6738xfdIH5p2z1ilAg/OSifCUsLrSAsM256zmzCVBhAL6Vtlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azeUESbq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azeUESbq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso250185e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162531; x=1792767331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
        b=azeUESbqOBkDCpB8Ky0uytp01D9QkVAe6Ab4e/Ah1T+BBUuzuQ8UQkJFiztpQcR6b2
         U4UQ8giy2ElHxqgO5vQ9/GUyQY34xHj/TgsIzPMMGnH5yoZi9zCqLYqHQFdFgGRQhhUn
         bKurq1chu3Bo9AwGSxRGgmalbZT47XBG1k5LkfVPuK+mtv2vAcyamAb/kaYDY3pzkdZ7
         en+w6JNs9SL1T4f7cgoKprq23cyP9Tfn+AqOp9ShkeVWaJuxQaxmBf1yO8uO7yZTpvGZ
         Rd+7bvdiWdK/iURLnTYkhm9mrzYWp/DwutewQK6ldVGpif/5IhSgYDliFekEcm0knlVa
         356g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162531; x=1792767331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
        b=PyG2dFp97TIh3zdH7M7ZaWjo9cwX1Qjz30WieERaRIKLNv19jIA0a7la3nNpSLl7KT
         aM2/UVq9RRBct76V0cklkeJS6jBuffm624JJYp3lMjLLhEKfStZr6pu2z+YVKMXn4gAd
         XIga2vh78LMAbqHovxXZqEKX6AU01oJdTFepiElpK5xTGAQOrFcQdYNuLS5/CXHdMg28
         csdLj0PHUSokwij8WvljkjgP0fx/P7yJC6jG+z5qhhje3xq/+GtmAVF2arbnPXBGZm4C
         8zn+emALQSQ1G0TGvycECuZhQfrH0gWqKOVaLmU+ruIPNLLiKtY2UBT7p4BrJF5DhgT1
         OoEg==
X-Forwarded-Encrypted: i=1; AKwUvBx2N3M8dIAEse/o/SpAwgbfB1n9cdqnEhF3f966m8yZQxFK31BRRDfpIK9mDgRxb9q+s+WiI5PMPxmlCYhp@vger.kernel.org
X-Gm-Message-State: AFq9FYKKRalWyzBi9GvmMj1XenFptL1vg26FhzVLYwdsQkNOdFmJNN1D
	Glb0NNS33UsUCozBe/gCoJ1ejfO32uGpmZp0n6AMjYhTJsMK3Jl1df7y
X-Gm-Gg: AYBFou0ehTxDps6NZeZkhHRevRwhidLBuPkq4E9o646NbxLQxK9VZMzBVEptCzyWSfY
	KMCfYgNhjjtmEsVYhajDFXnIrBo+Uv0bBElaqOGjcAwXuTFMC+ynIQVhzUEhRWJ0cHqRgXXXeOM
	NtE4m8oxufRp+QrSwD481PQPLZbQ0WZP1GFwoJ8vnV8APrE7LQQj+8QSi3doHLYBhIYTPeHtfNO
	tk+UkaHO4hZMImY4YMq+RPP0UAhGGKUY96vRrGg4qBbzm7SXARC1Y7MzoCUGD5VwGHKZk4tiGqI
	Mnk8Atyh8vcb8PTSbR1u62ZJNWP1LIw1nHqS4umL1N9+P52AWEFIB6AXFJFydG9dlpC5C2XPw0L
	vcJukin6YJZUcG5jLxy6crnyRyoMhJfnsjs2gfMf2RmFa1quB3SIFZBDmgCKodyv4ezKmdekX2A
	d07qWlX6W2AKpGhcGfC4FPzgatuefvOZUPGb4VGn2WspNThu3j/o3/wHZvSlpWgiUVnZc7ovNIj
	VfJlrRzmS+FMi7fagje8WivO9odoIeyUfARkptuW2qj6N6Jo7KT7h9mpXHaZ/JWqXJTzn6OcRp4
	Rv2wy7w=
X-Received: by 2002:a05:600c:8519:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1d760d830mr1162945e9.23.1792162530858;
        Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm6324206f8f.5.2026.10.16.07.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Date: Fri, 16 Oct 2026 15:55:29 +0100
Message-ID: <20261016145529.36811-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016070018.11932-1-lsa.uz@pm.me>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261016070018.11932-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 08:01, Sergey Lebedev wrote:
> Through the media device
> one test fails, Active VIDIOC_SUBDEV_S_FMT, because
> ov13858_update_pad_format() never sets the colorspace. That is in media
> next's driver already, not in these patches.

Thank you for testing. That failure is fixed by "media: i2c: ov13858:
Set the colorspace in the pad format", which you have since tested
separately.

Thanks,
George
