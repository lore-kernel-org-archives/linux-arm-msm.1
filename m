Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13D4AE12D
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052728; cv=none; b=ulblPvQHoZhsC/JOJU2AhEgs0XMDy+MWCNBRNitcfzyG0VHOk42vn3L5b0xou5uOgpLOHpiGqmVYZdn0J7JMVtde5MeSzvqjxeq6kJosucShzC7Jdbrcb9GMdT3gs8zRySDkZYZSU3TBjj2JTIQbPK5wMwJVT27wgyiyLc9ppG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052728; c=relaxed/simple;
	bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyi7kh7bN6pmN2c+U79LqG01fGUIXvbBmVwfvje9XOU9HxVri9EeinhwpBy8tctDhGNP5jeKj7Q+WeoVb9mO0gClbA1rng+7Jrb1VwCFX4TazbjJLw1pFBvoghDD4br0VyddWFv8VNb1M0BWE809aV632EJHa7bqlVTJiEhTT54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJlVG0Ro; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJlVG0Ro"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so16433235e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052726; x=1792657526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
        b=iJlVG0RoylsmHtfdnUUWKj3ZTp0HL7VhAFwbyCK/A8NqXZSaAYs3+rd5DUUEYAKzfk
         s1rCdOa1OoRa/OkSQbCBaA0AdDdIRTwQ5k0SzdOdYzLWfflpSLbhihu56idctutqAdZY
         PB+3vwZ/b1rsGRwAbEP3PRsLQ/7Ic2LlJ+8pmd4LyX5uDXInz7vEYKJMctDkvAndkdVD
         b9CcfMZXyGLymW9mfrhFQIi8sX5Pfvm0IdXBFA5WwOGC11hCpXQfpM8+xP6rBvwUrdMc
         G+qCanUGqUFpFIukNdgIchl7MDp/ROmPd626gsEIhoWGxamsilSfzPzq83y5LjfbK7Qc
         KOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052726; x=1792657526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
        b=IYDnpqFDrbTH72KAZAMLOdcbaGYel9LsYa5KfQV/f9C7kVAMSnV7RXw2LlQML26feX
         ff7Gd9fxzx/HxsEW0Xub9XbT+KzyfHeXnO+JZ42Ms5LwjRfiAmVidybWiZTTE7AKF8W/
         jGXeTDzAnSbFI8p/fQIMhQ1Z/eBqn0gIvTSpOowRaoTpOlRkDIhVNLQQHVknX+KOHtT9
         FAx6qO0Hq2ExmFcXDzHf1l10rY4SUp+0Po960sFfJqYG18Zs3bA39FosAQb+Q2kxHOyz
         DqMGFO99CmlnNyto/bWzxrzn+0ik5+YEaZ39vNVbbHsy7+KiCY9fhr97xGlYpMDsG7KD
         1W8w==
X-Forwarded-Encrypted: i=1; AKwUvBwaUnvTNAzhqmFSm2xn5qI3nxFf6/YNEQwkRTmwVaiIGg7HqyVhD9isDHLkCScn4pTvRAgfZbZEGb557s+X@vger.kernel.org
X-Gm-Message-State: AFq9FYL/NDE9QwlXxWQyEAvyTAMYYf69QLaDrd09e1CgQHglL1szPEol
	tubO3eQJPd3tSP8/I99bLIgDY1shczPDkoqdWMeoPSwQFnYPWOI5Qp296yFNU1sj
X-Gm-Gg: AYBFou3u2x7H4DdYjzkovmD6GsTK7KpJAoKhG9YbfTiswvxHsqfxs7LHrSCzqP9JIfm
	wGaOnUKpxurS0gMP5wrIb4cHjikgFY1xwvQuBZKwxjKOVHm4dlruij1O27CKfYkuRUrR6mXN6b6
	2pwweXZQqhDtCc/TucV5ry1g8GVytoAJBErU6QlXeB4hRNmiuLVpiJL9i334CZAi2mGqpezw76M
	5VBmNWQPPNut0TxpEoBdWNjc5vAAyZdJowpqnnghxWwkUIVFmrgtTOV/SfqrndAEOXx5b52GGIP
	Bp91FGfbklowGzwbcRE34YOn3lwuZ/gKlEngFoa6aX8IOYok40aEdgt9hQ0c/gCa9evNGMtvgR2
	ICkqVQXBPLDa9xp+4XJXPBfHf+1Xq2hLDwI5o498/VBuk4hwu1bDRVQAv2cNowKYQxTr66jT5p+
	tnZdkzBnKR2jRgJc8dmuXmoHVRM8zX7DdkoJsymPBL/fequagB6AL3xHSTnMkND35xAcYSmDc0p
	gXCPwW3
X-Received: by 2002:a05:600c:4ec9:b0:4a1:7739:f9ab with SMTP id 5b1f17b1804b1-4a18e4ca953mr370896815e9.20.1792052725437;
        Thu, 15 Oct 2026 01:25:25 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.55])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67a080sm51822765e9.3.2026.10.15.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:25:24 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
Date: Thu, 15 Oct 2026 10:25:16 +0200
Message-ID: <179205271598.452373.17818636318443679532@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3df5fce1-509b-1362-3b78-8f79337ebc05@linux.intel.com>
References: <3df5fce1-509b-1362-3b78-8f79337ebc05@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026, Ilpo Järvinen wrote:

> Thanks for the update. I've applied patch 2 to the review-ilpo-next branch
> in the platform drivers (pdx86) tree.

Thanks!

Oleg
