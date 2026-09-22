Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED17B46D571
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099508; cv=none; b=HTpzN3/dOQ9bMcKh5PNlMa1dpYWi/MFMMO25PYY0IiQjc6CAtUbBug6ol7akAGHaf3A5Dm6GxZ8wL0Uc6rKgwwih/PMy8EhRehQMX1LdT+cIQpj5qa6j9KqQx1f0OPkpfafAopoJy0zuYGe9EE3K9ImV58Vfo3Awm4xH+Mk2Kvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099508; c=relaxed/simple;
	bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uuil+q1Sr6flMdeTbgJGtf6t+LuxoEVbv/8axFNbtGvx2kO/Lv7XG7Z3seSVtw+c0bMRTEoJIATgpu+W8RB0ovKu6zXLlw++ziBPIZC42/OOGsh5WE1wjlw1gtKIFkK07oEtkRUvdq40pUK0KKILoNjALcSDhalqP29hg7EV0OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4ur/msL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4ur/msL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso354625e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790099505; x=1790704305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
        b=T4ur/msLvaIvLk1TDYJtusmbXGtVSgX+6zHarAzlEKJzmwcgkHjf5tt0izYJqx/G87
         iR5LLMMPup68k08zxxYu+R2EQTMiseF9Gt3P0F6HvWja0A69sXpwzKMIouOLG1YFrbM1
         RXBkFq+u349ag8qGr2ADCUjXK50cKnpCgXi35AEdNMGxrGsWmaGk2R4Ib3dUEE5yOu1n
         X/Mq6XVCrV75EVPZUBZPUJgn8NLgow1aiMluLhbxOTCh+yws4GflGI+GLUZwzV1EtCMO
         4Rc+ny2RHizoi8ORV6zweprezCyFGxsA6KGdSuT49HitXDzVKNF9ZRzy2Uswjr/U8/Au
         k+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790099505; x=1790704305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
        b=L3g34y3yIQoNtDIDR30qcRvUYIG1u2Gj1BKBqK8qBC4eYu5+Cm/CExwWpql0pdy9H4
         WXRBmmbiKEP1EiIfbG9kTjYjKTUBhWlGTvPcvZJGuSxqLmrYDFm7aqHoH4ghLkCxayfy
         7L0RB6AIyj0M9iN319v651/AKR3MX5MCi86usXFnvx8w6YemHlF2Tg6zsPskZQZ+Q46f
         dyv9aw0kwuS+3Ozf6PL6ETYehQSB5/0cAsOmtq8YPT3dvhQGn/i1/Jwv8rqKR3RBvoSq
         Qdotn/MIZwnZRkThSE/0Gc1/0UKkvmPQ3QfLMwZHgSIwObBxz/OrCftUX9qd6/BrXZI1
         reBw==
X-Gm-Message-State: AFuF++mEnmHNmV2CX0Gij6gz/T68/0LshNf4oohyr9N78GK/2XgihHtE
	GVh0Z/j22zxpDBB8eGK4HAqZ9EqDeg0h2DYqk8BxxQOXs5RTdD+bggXI
X-Gm-Gg: AYBFou13Hurq5vTpFFzS6seoHkkHVQh8sk2G6H4PBFPdYxyh28D4qiOD8VEk+odV5xY
	etFyGQNcLdwsjvwioeovnoxuolCtXULuF46PmJWC8ao+KK7ufhEkcHJ/wD4+kJbtRPiKfGmzDmV
	fwBug6EPmlKTaI66EbfhU/7dKj79v/uWC2fbltP7OpVE1Sp8IqquOnR03tWe1bofjyrdEhNZbzx
	WbYxVLBxsBmQwZK0u7t0+X7fthS34f4XRYqzVcX6LdmcTxtIQ42vwCmPEYlkcnMyXmY5/fLNV1a
	PzvDp0rS20eCz6pBEeIiZiPuk7o365TvRCI8YOxDimhjU9bQded7yXnVjh1YpTzYBB2yoKkivQO
	4LDGlBNpPdeRuEq6OXiLiqjAqmSFF/Kn0/4yxyfHbDAYkDMPwcfixzV+YktZuzYeJj2lykxv8dh
	AJEWH+YCNNqOELpQ96nAXkzmeG0D0J/S0h6gZKZsriHO+wd31/kCGGCOc4Le52wtYj85MkYlx+T
	GOfHRo=
X-Received: by 2002:a05:600c:83cd:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49fc573fa97mr180249605e9.27.1790099504457;
        Tue, 22 Sep 2026 10:51:44 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde18555bsm8294835e9.2.2026.09.22.10.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:51:44 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Tue, 22 Sep 2026 19:51:34 +0200
Message-ID: <179009949426.334909.8218450300346111724@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922165737.260443-4-okerixx@gmail.com>
References: <20260922165737.260443-4-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Konrad reviewed this patch on v3 [1], a few hours before v4 went out;
the patch is unchanged since, so the tag applies here:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[1] https://lore.kernel.org/all/69636cb8-5867-42db-a8fb-aa8b2d9301e2@oss.qualcomm.com/
