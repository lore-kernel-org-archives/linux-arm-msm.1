Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E641D5CFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781031; cv=none; b=d1KG2pwTYpV7uhSmPtA2I+70HTVA81c8m06pX/gerJwbYCFlfbrulfw9YRijLTvwh+4W1ArUnvlCM2v0A+Rolw5pfGvpyoNVU9UihjOQNQ9zAYGF/IWFQQnrWm18nQOmOJG0tg12upAi9bH8Ii7Hl6OlHEfYWgQEw1rR585eMJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781031; c=relaxed/simple;
	bh=0OxRhuVbi3oxUlatW0tIcyIVYkE96Nbu7bqC/b0fLyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0x2j6wJfUUkhte8eXrvNNWvubNABqbzmi8D7hmlTzbwUrXIoFLWFCH5aPgh3rJQbM9IhKzyfE0emWDrS+uxpUVQOzZwfWzkPBWhm1xF+aIZWDVfTevhzpS+TGi1imWOpm2PjdTSLZxbJi1EB4X3KJ2yHEtY7o0oWTXN15JUCpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he0CNuvm; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he0CNuvm"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8ea203e5bso4678611e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781010; x=1791385810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPmto+vUBoK3BPeCZ82QESLiZxY5p21rVFK/tfyP4vM=;
        b=he0CNuvmm7mjhNkF4WGGazuow9mh5t+GmnSTZSQy5jsvCel0poBTrP51IwdlwBLnJz
         SOl/VdtAqwaENxDFiRJhFspv8fOnReUXgu1QoU3fPJpQUvQltdg9KSBwHLnw1jXWmApV
         xOcG8/PIYF7JINRm9JaI9wkkjoCI0VMKH+45R1UwoUUR76LiJBm9fC4BxYPIGyIwrZLE
         MsRxtkJjNgUG89WHmbwNtXugRbmNbzJSRU+Xf8opZxMshnembivB8FS79EJpauf4cx7c
         kLRSSR1LMpWgkQ54bUUXCf7KtLFC+X4LNwv1jPXXkjnpT1nEANYfQTKJtPM9HdCn7d3J
         f2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781010; x=1791385810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPmto+vUBoK3BPeCZ82QESLiZxY5p21rVFK/tfyP4vM=;
        b=1vScaWHOfBxrNwIRvr8wbU/Y1oA81Iajv0ZqCJA02sh9Shlsn1PODxuHxYrXUE7qqX
         XPsnJRIFm8fA9/t29go40vZYuB0TABb4RkVrpHeMfuYD4QZzartWkRU+riMB/s/Sa5Gy
         2aw3bCrQczBzHkTWKMWnFac4GMjDssGqC23DzJDuRrK502hkbVh8wUIDWTSFvDIwcnx4
         Zto6lfGDQnN8fojAK0W5q6eNyqdp1jywo/Wx7v5IZXgXBe09BukDj7iZzXb1575IhZJs
         VGENnwkkBIFNwaUJzh4/nhdoYWblip64hEr/s2hrA9ZJjwg7tjx/kGQOvu05/VsirLgr
         pzwA==
X-Gm-Message-State: AFq9FYKLYdOFBLq5SP9bm0R48x6JkZ6C37MYQy1tF7sor1glbYeJyrGC
	cnmb4couJFm/UIYRGZcKeYIjd93h97F6ogNf5NPSfzEFDS7VIkwtYI1A
X-Gm-Gg: AYBFou2frx/e3vgobuAtarzgw6C0FtPThVkhWQK7jyD0K2odpwhK8tdH2L2zuSfNRF5
	7VIM50ajl8wLmwZIFIR+8s1oXIpX568BMtgjhS41hSisaXotiASyeNXZFe2x8vIEVAK6/8dT+dz
	tuytwFyShnyU8RLfFRvdDNsS1u1UyV+o75enDWA0Xk2x1Gq6lq+VH9pI8UgOSxvv7talwbocrr0
	QiSIS+VdIDowp4SnQUZv/7UuZ/ISC1ZScMhTvn/3X8SLfQ4CBI7VpPVFRYpX9cqYhXJicf8Y/XF
	sHBEpI1rB7a1F5fHTJocAzJvqhYkayAiUBAh5sdw5Z8vKDevHTXVshrTZFmTnMqL+slGiPPGilu
	bsNIwmT8IlgwNgn4JNvamcyERYIMsKsgNbVupCJBRW85aOW7lKA0fcnARiE6WwZvwWlkowtPW8G
	nGK2AL0ZKzWYMaaCKaFTOOxBAAkoDs4My2ziu4ropVNqeMfw34qydkETnjsdnmXEHLqIxwvLe6Q
	fRkA6Qm19oQ+oCcm51qAfcTdjXrNls=
X-Received: by 2002:a05:6512:3ba3:b0:5b8:f955:29e7 with SMTP id 2adb3069b0e04-5ba402c323emr870452e87.6.1790781009538;
        Wed, 30 Sep 2026 08:10:09 -0700 (PDT)
Received: from [10.249.180.52] (m-37-0-171-147.cust.tele2.lt. [37.0.171.147])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faaa70sm29075e87.27.2026.09.30.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:10:09 -0700 (PDT)
Message-ID: <82fded25-6338-4aa1-8bb1-a49834cca8ba@gmail.com>
Date: Wed, 30 Sep 2026 18:10:03 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH RESEND v3 0/3] arm64: dts: qcom: sm7125-samsung:
 add initial device tree for SM7125 Samsung platform
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Vitalii Skorkin <nikroksm@mail.ru>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
 <179065170983.2673486.1587443995547415765.b4-ty@b4>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <179065170983.2673486.1587443995547415765.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> 
> Applied, thanks!
> 
> [1/3] dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
>       commit: 0f14172198733b780f22d546516ccf8a7ed77733
> [2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125 platform
>       commit: 6320b4c31b70a39a06de27a8019a45632beef32a
> 
> Best regards,
Hello Bjorn,

I noticed that the patch for device tree compatible documentation was
picked up, but the patch for device trees themselves was not. Is there
any issue with it I should resolve?

Respectfully,
Erikas
