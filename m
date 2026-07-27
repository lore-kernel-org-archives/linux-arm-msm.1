Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256C3D0936
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180094; cv=none; b=gMWKpv85XSx7ph1S3gBLNv1nazdIHUhqE4jx3CH3Ypd/5rkGVc7qCXUcKrXyT0R06T2ff5TtMu7ifD5Vf9bV4ZMc2vBKYUrCGB6Ph6SIUAhCwMaOFR/pXSphj5yb6qMWY1QcA2eH+StfjiICASWSrhmvHS3xY57gXcZHjDn0hg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180094; c=relaxed/simple;
	bh=xhAoqGx4dzDIjMCZHkOkadtTt+peQwHnuf0iexYofnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bqu28UrRaU8xp6nepOKSORy+jgtpRZ7fUjE3U0bpkxQD2IgRAJ4unIDzCGQTJ8smvQL6Accb3tzA4qpUg8cpP494cqJFyQeNkqcIHpE0J813wvQsjU3NgDxKPVPdM/w8g7EWyOgo+APW/c3WCs7Dqho5WttvVpYZZgELXkvNYHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZFntv2o; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZFntv2o"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb906d6c6so7510e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785180090; x=1785784890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HhvtBnmtBb1lBmAOgmsH8WtJ/54opRSLzTFU/+buwco=;
        b=rZFntv2o8mXFn/MiodtokfF7Zbm/bZROIG9RTT3+Ot710N9sCFrEMslCjipkvoOqlU
         BLFQsxNmiF9kF2UzL1BHDv4/Sbu59txroqG3AUgMi/cAAdjM9Tsg4Rt56ImBWLlGSU0J
         3Dv3uWo5d831ZGLrvT/g6Ib5IyT/07uyWWPdpkxSLATeQwxIucY5F3dOFXRLQVj7DSOC
         dhJAb7VjR1F3Nn5nJkTtyeIrsPDTePrt251kiZeJy2aEKCMlGMywlu/Xf+X0TXxPk64P
         vet2dgRkwKhlrLiZV6CBTlKyUWxjoi2U/uMOP0rN8YSodvEAdyUEfkc4UIA5kM7nyeAv
         n2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785180090; x=1785784890;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhvtBnmtBb1lBmAOgmsH8WtJ/54opRSLzTFU/+buwco=;
        b=lr3eLxLc9RvQ+y8uqTfIJUHPqZMHjqNsb8YteqPrQ0HR3AAVzK8ZSfoNcV51QuTxvK
         PJcSbA2vpDPYGCTKGyHnAfNiRNlnhQAQD8erekIxBIb//pYJi+X1lqex7cHntPXWVII0
         GwgvLNjUKwcn3/DReqiJZp00ZnUkLFs//wqNasHvQY+40HR7VYep5g68n/PANkEF7I1H
         Yi6enBRyOo8SmF8a5ZGxcXlyZ0h1hNdl4FeZ7c3vsxpoAsY9dvt1AGDQF/ENE6kqUXj/
         OA2dVjqsr+aiU3STF5pPvBxWwN5amKywS9uqxKo1Hm95iwWagjswq4sHw3RTNIKVzt2D
         elfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNS4I8QgtKV1U+Matnoql3OiCUQvxz4Oki1PWPMtSA3HjqtixtZejhniUlzpEuW50n20ut+5vBrcwTQyB1@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNZGS8FJHXcJxwEvpYsCBHfXDyQd6EnE0uDOvhAvMFf7vq8R8
	NveA5l3XamG8OFCDJi+VNAS8DrQXIn5TCEB0hqe7+XfDE7mtphbtOyWRjktUeQp7eh8=
X-Gm-Gg: AR+sD118KWqRE5F0SNCvRrhlbWLpoTrqqBKZwSU3bjySPcyV/803x1XHBiaLNhbECaK
	DtGA1GgNVlkFD/4DJTFEAOIbEE8RfO1a1nJTAu08mmwVzPjD7d95EaoWKu84HA7Gkw9KdH2Q9bF
	4My8WZ/3MdiMQAD/1d3FbzxRBI1Y/a/6v5R2KKmkSL+L+9/rdNDXVxkEyGZ2e5H9ySLwLvtRDgK
	kCCGwXMB4COyRQVRrzTNlm3uDM8HswywkjttyEExutSMFfD44hyyenOi/dQ/Py90GzxWVPn6P76
	NUpMa08cfkvsFxD4KruwDczFs/aaeGEPI6ryzOeJEaJP8gGWjE81Tj83/4H1TNgVjGyhKDWzHyB
	NsgkDiV/4dK1crIcLu6yx9lnutVWRgfAA5v3ugiMZLZjGcqL6eKrO4/l7ckqYq1BOn7YqxIu+lp
	j3sVfs9Co4/2WCZWJeWIQMqwpKCUkNIG5XjDA8sAOW09xeBxVeabcLeNf5
X-Received: by 2002:a05:6512:3986:b0:5b0:312:21ca with SMTP id 2adb3069b0e04-5b2c1b015a1mr2341397e87.2.1785180090266;
        Mon, 27 Jul 2026 12:21:30 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be08817bsm1696312e87.27.2026.07.27.12.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 12:21:29 -0700 (PDT)
Message-ID: <c7b0213d-a4c9-4ac8-be09-b449da457230@linaro.org>
Date: Mon, 27 Jul 2026 22:21:28 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
 <20260727-cci-clk-fix-v2-1-c3958f28b045@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260727-cci-clk-fix-v2-1-c3958f28b045@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Loic,

On 7/27/26 12:21, Loic Poulain wrote:
> The msm8953 CCI timing table is internally inconsistent. Its Standard

likely I was misunderstood in my v1 review comments, and I believe v3
will be needed...

If there is just one master, or two masters set in equal speed mode,
then there is no such issue as "msm8953 CCI timing table is internally
inconsistent". In other words generally it shall be permitted to have
supply clock frequency intermixed speed modes for any CCI variant.

I'll repeat the same point as given in v1, namely supply clock frequency
is not a property of CCI revision (therefore v1 1/3 or v2 2/3 is invalid),
it is a property of the mode settings. It's correct to remove 'cci_clk_rate'
from 'struct cci_data', and it will be correct to add (or parameterize in
any other way) 'cci_clk_rate' to 'struct hw_params'. Each instance of
'struct hw_params' is strictly bound to a particular CCI clock frequency.

> and Fast timings match v1/v1.5, which are calibrated for a 19.2 MHz CCI
> clock, but its Fast+ timings are essentially the v2 values, which are
> calibrated for 37.5 MHz. Since all masters share a single CCI clock,

But what if you have only one master?..

I think the msm8953 data is correct, it shall not be removed.

> no single rate can satisfy all three modes with the current table, and
> the DT assigns 19.2 MHz, so Fast+ timings are wrong.

They are not wrong, eh...

> 
> The msm8953 CCI is the same hardware version as msm8996/sdm630, which
> already use the cci_v2_data config (37.5 MHz). 37.5 MHz is supported by
> the msm8953 CCI RCG, so reuse cci_v2_data for msm8953 as well and drop
> the redundant, inconsistent standalone table. This makes all three I2C
> modes self-consistent under a single clock rate.
> 
> Note this requires the CCI clock to run at 37.5 MHz, the proper clock
> rate will be set in an upcoming CCI patch.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

-- 
Best wishes,
Vladimir
