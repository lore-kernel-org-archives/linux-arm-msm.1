Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532816;
	b=RU9a9MMgzb4AVjdV6kQgMocqdACy2CozsNn7e7H+PdQ4/sJEJ6G5YKaq3T+2xJvpVmjv
	 yrHQUrSUWekRWWMdcDp7P7XHeIubZjqaY8YOooUbgOp9mLrFFWh3pGayTE7Cffcy358xz
	 VEH/TiSIxU3U7bYUffXg3FpBeGPQYUDd89ONU/zZ7I1sWBWuNPIgAHxU+2mmczfqLHHKa
	 uD66iOKlTXtZoXhO/DwGWgr7ohFGXvgqmkaICrlOV0XKVjTfM0M+VRCWY8OXU0Ae4a4Q4
	 VYqnjAxE9h2/tOhAQ9F09kLgJYiOxaCOwllhB6FOP6bvySuo0R4GloyzTSeS7pPzrvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
	b=Wc8ba6K6A41jwWHxi9gFOc9fPm1jvh/k5kOysOLHsaHrVpf1Oh8ilyDAeS5fgClKE4GF
	 uHeMaUueSLQG+BVxelt4JuosIXUmj2/y+AmIyowL/V+XSHYPpz22jhit/3rCD01o4uqWJ
	 ErXz+N8hBVDiSA/siwdyq2jBOzeCTKzJnoaPhNdSr3hOCNTjioUv/znmFZ2CjeQA3aJi5
	 WMnYLyWXUjs3Ov1NDBUaTgcqHj5umUylZLo/i/om7S+KY+Ge+Bh6BZUZcebDwtcXA+DJv
	 RwhiDyZFJ1zeaDw4crBKPVNB3siGfrsW2BYOvw+yFUyo6vlZ8bOJQKjTzhKm5DlAfgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RnvlXEeB;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3C606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B3C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RnvlXEeB
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so385324e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532813; x=1796137613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
        b=RnvlXEeBifVUQ8kdEff6LkQT0iyz70rl6qmjWB7cGMb+fxvMLZcUQdUewCAZK2jgmZ
         uyAgNcqJEA5LZ8AbCqx8z06KyYov8+5GFBpKwVpH68tDoeMhiczdHWCew15PiwmMpgcz
         63BCA+qvFTOHOwepNqqHoeVWxlkn57Et2BzKO/VGFZIQSLn/u39cU2pDDs7GwfK/+AaB
         e+tTpY24ekUpmMk5x82yMIvNYkk72dtSxs4D7JYhY23ANxn6czXwNZov6EyzWkFwJLVi
         ylMcBN1nY+hckUjtnojsNQkE+uhtJmXYSzrTycddqnIuT0/B5336xi2hqVMpTLoDQlvh
         kpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532813; x=1796137613;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
        b=X5aegWm95xVuXL0kkAuoNQdjtquJrzukwDeX9hJhNcjudOLnDSYst1aJLOaFz0dEkk
         VTMzcXUUuBkyPAEt7p86ihdyGDuXHTAt4b4c5Tj03bhDZcM9T5Khl9EzNqhu9AnvFBTr
         fSN+5A/lxvoAqRzA0j6XCYSPgpM5u6HXXUbYu/XdbJAMshz2CL7+8c1Z1Uz6vAoRDfUG
         hGtn3fkYapQp4MqujSs3vbOs1clfNWvkin09EOmu8XQCFX+b+4m+93+EwD6ZQoiaYUYh
         U9uQBq+rPJtnuc0FgHdOcV2WHGbvqmgN96IPwcR0krrtkbUkwdngZyui2XLOJrrpqGcd
         56/g==
X-Forwarded-Encrypted: i=1; AL+hErGjFk6S8f9O6mY0Ha5rCyXeLaT2NdsN2E8YPbBrWzlodoNg1wjri7InEKB4DU3yJZIz/sRPcf3u9EL3r+ew@vger.kernel.org
X-Gm-Message-State: APuU4Z8TXQiJGecz+aH3kBSKzYRElF/582KQ1j7iTlJDBVk0GMqWDzte
	s3a0CddlOjNTAyRJkqYlsHjkZqTKprNq6/wIrqTjrJyiR+2Nq3gsyJL9Bg9Xu7q7ET0=
X-Gm-Gg: AZFdTZegoiT0fQEv9KUQGGX05Amhv85e4qe6kcGZc0YaAFLu+1AM5eC+6dySBUbpGep
	GaAyxyudcUxhF+sM/merYNCKN3vZ7o2Zf83slI+HwF8U/++iNtECa4zrkFJ9ovIn/V0oKUw2naH
	8FmRSCSo5NB3NQT3JswCq5eSGXPfpj8NSPepSWaVkr5eVkJNBAXCxH505hG13CMe/0ysO18jmKs
	3opb9N3KiYNCCVSmXC07gA4XnJkmKqYqI1xkLrsKXl5rvektwRKjta1HIr1h3SNq4LeW40N/szN
	W7ydrDVt9ujnSm6vqmbyagX5SoDqnqwfxiSlf7+SFP0GIDE4a0RXLi8ZXW5N5V9Phd3hvEU/W+Z
	oYF3/Faz8O9WxIVJSLXRI/Oa6RRz4A8oOSjDvQvUSW+7yckZgGRqz3LegxuagUFEklqGhmkQBHl
	4666uFrLPNhO/8Vw6C+Atq/GsRysM/3mfuJVzGhrr4i1zv3kj4Dq1LBzfEBJLZo8apas9Eav52c
	e13MZBNs/jxN6ukGYUzHH9khBtjXLOsNqvLdCanY/wZk9JPqBV8X1kSiFO4DcNLPHWiM/C+BQim
	5YjwVvoeF7odlDvp4d+hGOw1u3s1zx+MVUXvQvOf0E90URRodjfDTrZolDnAYKX1XwzMoEVthEC
	SFJmluTleexGPyPkVK36rfSnXWIc/
X-Received: by 2002:a05:6512:23a4:b0:5c1:57b9:90b2 with SMTP id 2adb3069b0e04-5c1bc685e41mr4958216e87.1.1795532813175;
        Tue, 24 Nov 2026 07:06:53 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff98c6sm4038388e87.25.2026.11.24.07.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:06:52 -0800 (PST)
Message-ID: <769c2dd4-1517-4a45-9694-b65e7b4bfee8@linaro.org>
Date: Tue, 24 Nov 2026 17:06:50 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If we
> find a real use for this we can turn this back on. In the meantime drop the
> definition, it only confuses things.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
