Received: from mail-lr2-f7.google.com (mail-lr2-f7.google.com [74.125.230.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E973844AB6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 07:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543431; cv=none; b=bBWsN4WKQsXp6xqChrxcVzv4mG1mEB28VPAUIY6gfvzTiuM/KncTA82hUox0irRpXdvk5Bp71BCMIAaRtEIXd05W3e/iVIHSsvwoepRNI5Q5k2yvbCD8tH7mp9gLbnS416o06+JhPrlb8GFxyWKJxTrGW8PtKPmtbhJbIdV3QaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543431; c=relaxed/simple;
	bh=26ZyPfXDr0ydxB/B4Ow6i8CWMvrXaZY6rIcQsB2FM8M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lS8aOS2pTZAu7z0lQSFmTCU5RuOQ3LcqK3T5wNrDHGwU/VlnBbs28XseT9T3Pi/P6WRpA3V8j90fyd8xTnDOiIWovub3zmcGzvMP1LWRWVUX9Q/QJU4MZOhQh2s/tWpDhv/pWfNNmjL8111zvsiuI/6x/JteUV0CEpzoEDnPfNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me; spf=none smtp.mailfrom=mswin.me; dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b=TUquNnAG; arc=none smtp.client-ip=74.125.230.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b="TUquNnAG"
Received: by mail-lr2-f7.google.com with SMTP id 38308e7fff4ca-3a5acb204daso23297741fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1789543412; x=1790148212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hX02l29xxBPtjZbljOPENMYFyeAk17j1fAbszM+KifY=;
        b=TUquNnAGugpC+DKatQgMiNQvBpB42oF6T7vmDUjYwBxeNMnFyiHraffkivZ/8/maJA
         e51B0ypt5P7bCJ8s6jufVmnBNNwJ46yStJqCljcnr6NrqJ2IVuppgnfzSUqVpknGBXUY
         0ZdbD2jdyw/uGlbMh52LbmV+WiEo7g7xTBYnwGvHqQpyyGsI1HOgr14JPLpPOHhhvcLV
         rCTQmM7cuZo9xLJ33Q9RERdl8PtpW5jM3Qm3sUhEBxjBRdEFFb819pvfefdvR/n61EWk
         Rv90XkfTLdKd7TTq9BAgNLCf01U0Z98PL3ogcolrmEuqvHxk7yQZ0Ad2MK4OQ/ojh3FU
         3CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543412; x=1790148212;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hX02l29xxBPtjZbljOPENMYFyeAk17j1fAbszM+KifY=;
        b=dBRM3bO9RV38YE4VmjVjjaCmp9t54wpAQDU65/3VdQUJqHK7yIPhrONUikOcYHhc8s
         mfhfjrZJEAhiKsbjiFZFkv7ZqhQeYBG0FeR6q2WwnBQq/ghuekeJ4FTPHmRiZy/j32yz
         V//iyP34Qvos/Nv9zQjdwlm5JFanCetdfnf8/cQRO2P3C17RJlpNNtMrYhW6CBwrzaup
         mQQPuRerjwYmvnKi4xXhCqZsRHssECu6Wlc0L+RPAdlbk9dXklhVFRWRX7u2YJJZTLEF
         dq3h7tdMqPiU5Xz879YVNUqmO4HrOZU2WXekGX1W65iaFKJ8lOk04g66kIk4vHJhIHV8
         A1bA==
X-Gm-Message-State: AFuF++mVA/CfPolHSCfJGWaBaAsOZizk3eNzTnTPqSBK472bRMJc1HCH
	6ToVBXnwLcBVH5YAvKESxsKRo5IbVSMOQRj4HYhWyswRfp9FQOdwRTqCTG33hGfR3gjXfAavKrv
	wJOM1W39A+LDwG0E=
X-Gm-Gg: AYBFou0ZFnIsaukxGdzJPXeMqVncA5XW5F8jfKZaD4zzUdUAVIsp4j6oTe3hNbvKbIo
	hibSeA2rXdGVMyagKPaAGak5jQYYNdfzDOh732Ic7pLMVkIrIZAnfOeTfiyJaIjUiLd6brj+PrD
	tRdzAmm5KDyv3ywwQqMgVKUsCpAHJicrm67bTTXJ6X4OeJVNHRMbfyHxZBUtKQ8UevJRPhsgJAj
	Ceq4jZtJOI8sijxfl7ZhzzI2/gqLJ0ev7nKtXp3ZbBRO3g8znTcBEj9vEpUFxl3ebBKUnKUMfQ/
	uBvOINbBYvbhxn3k1RaP5GBEXXWkQFrTCAcPCKvWCSvXOZbli1YHyweHeV1FMhfW3Tse6FpPWN/
	/g89cXhRRnjRxfGPafYwxMyxwqGxv8/7+RZi7bW8w/G5oppAByfceFDqzWJt7m4K5vxEOwoaMwF
	3pquiGH+cFjdetn6xBmQCb6srJ4Zhx7dMzYQrarLfdPntBBnHHpCWHPTIbhrG+mLNlzjGYxg==
X-Received: by 2002:a05:651c:19a5:b0:3a5:b187:c7a3 with SMTP id 38308e7fff4ca-3a5dc9b622emr3320141fa.2.1789543412297;
        Wed, 16 Sep 2026 00:23:32 -0700 (PDT)
Received: from [10.122.136.195] ([84.47.187.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafa9510sm3846611fa.24.2026.09.16.00.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 00:23:31 -0700 (PDT)
Message-ID: <c34bdfb6-1aab-4af6-8e1c-e5855081d36b@mswin.me>
Date: Wed, 16 Sep 2026 10:23:31 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm6125: add TSENS die temperature
 sensing
From: Roman Linev <admin@mswin.me>
To: Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821030325.1823829-1-admin@mswin.me>
 <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
Content-Language: en-US, ru-RU
In-Reply-To: <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Apologies for the noise — three copies of this v2 went out by accident
(only the last one, with the full patches inline, is operative; the two
earlier posts are incomplete drafts). Please disregard those and reply to
this thread.

Konrad: v2 addresses your 2026-08-25 review asks (0x1000 TM/SROT regions,
CPU cooling wired, comments moved to the commit message, no sm6115
cross-check reliance).

On 16.09.2026 10:16, Roman Linev wrote:
> Arm64 DT patches, against torvalds/master.
> 
> Changes in v2:
>  - wire CPU cooling: #cooling-cells on all eight CPUs and per-CPU
>    passive cooling maps for the cluster-1 CPUs, cpu4..cpu7 [Konrad]
>  - make the TM/SROT register regions 0x1000 long and drop the inline
>    comments [Konrad]
>  - drop the sensor-mapping comment from the DTS; the provenance now
>    lives in the commit message [Konrad]
> 
> Patch 1/2 is unchanged and carries Krzysztof's Acked-by. Abel's
> Reviewed-by was given on the v1 content of 2/2; it is not carried onto
> the reworked patch.
> 
> v1: https://lore.kernel.org/r/20260821030325.1823829-1-admin@mswin.me/
> 
> Patches inlined below (also against torvalds/master).
> 
> 
> [PATCH v2 1/2] dt-bindings: thermal: qcom-tsens: add qcom,sm6125-tsens
> 
> SM6125 has a TSENS v2 block with 16 sensors. Its register and interrupt
> layout is identical to SM6115's, and it needs no calibration cells
> because v2 self-calibrates, so it is generic apart from the SoC-specific
> compatible.
> 
> Document it in the v2 list, bound by the qcom,tsens-v2 fallback.
> 
> Signed-off-by: Roman Linev <admin@mswin.me>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 5a8f767..0ac3fdf 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -79,6 +79,7 @@ properties:
>                - qcom,sdm845-tsens
>                - qcom,shikra-tsens
>                - qcom,sm6115-tsens
> +              - qcom,sm6125-tsens
>                - qcom,sm6350-tsens
>                - qcom,sm6375-tsens
>                - qcom,sm8150-tsens

