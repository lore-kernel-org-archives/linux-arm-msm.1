Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9448E372EF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563141; cv=none; b=SGivrwZFcwvzh0Eg5GICsePCRm3tCKZafJQenph175MiNUCdHNJ6Oxq6xzeowt2WIXgYgfRPg63cz82nGv+8cTV8my4akDgnT18/YvwjQrvRg5E/2024GgcD4XFR1SuREzQVqGIc6SvcUm3Lse1wgRn4sEB0/ha9XN8Pug1WI7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563141; c=relaxed/simple;
	bh=WhHWUx1lkpZdwfjQMtwcJicNC0V9nwr/uenYypZhCYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uigjLiupaII4WJ23Xqh1lqT2UurJ7jEhvZ+6X+qUXa1PiFn2MZk7FoWP3q8IBhBXgFLNaHaT5EmkBT2MJxsV6jNuaYyBccxwWS0D+hT6MF79IA/D8ogqmzEq9GDXuMKtXObJKwLR3BtwBz0lMAIN+vc5dF4GmrOYkoTJVkwjViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MiZts4lX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MiZts4lX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8520161fdb9so2908000b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787563132; x=1788167932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pbr5eP75HMWDjVi5kSReXoq3ufPagXFdRczlYd+lCws=;
        b=MiZts4lXoJkLr5HBI4HQPY7610zQ5iyr38oxrXtio882yooTVihC3CZYo859or82nk
         G0mMU52DSVGVcAAIKiSZAmF1E4ennLMXvMTp9ouo1x2Ilz0HU1pL0T7SZQGAzcZMOxi8
         VH8G39IcfEKDPR2F4CsGZKbs74ypLf0tL8LBYhAzt2e+vmF+vDrFBMvXY2kM/PdACuDn
         2Cpdh9ucuRtkG9hp5oWb/NCoL/Zns/kqcnBNV92ml5YIU55tm6aKVfIXXWuiXiWqWJJB
         jSTVr6Nn2H/V+eV/RYHBf23K6K23G3Rm4+KWGbbYAAMOb4VOGxbVf7FtmGTSTjZwKnEe
         3iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563132; x=1788167932;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pbr5eP75HMWDjVi5kSReXoq3ufPagXFdRczlYd+lCws=;
        b=PMBe1fYrTUPOMDxmUftcEgaYP8rp9fmemU8Z+7x1g40Fw1VCNvq/wyoy8DNPKsKesY
         Z4/K2p5/94i0C6AtUcqLpj5+AovK5M5GFtlSXSCeOlvwQGvhXTB3praTAVvfWfk40LE/
         FBK+huJeN/X3ClncZ+ua5kxXzhmyKx252Jys+k4mbYflyxZrqJ2ydKkcK7TCRtqNCeCT
         AdUlrRFsZA8WNA7yJtyZZGNPjOjoMoW5Y6/PBtAa7cFJfPXpmgvx+RvyysGuJ4P8I76j
         9UEy3CiqXCek2UlTJenyGhnsHBAl8TY5cfxQnNkpq35S88XhOtaDYaYrha2YreR9uyfR
         hjzw==
X-Forwarded-Encrypted: i=1; AHgh+RowAEMISnYHPK92U/ehmUQNseVSVnsVLMsK+6/aUpmhGTe1WsxQ75QGmXdtSMLhG7dNG/ZRmTNgg6ckSJs+@vger.kernel.org
X-Gm-Message-State: AFuF++mxcleDC4ixgjx0pQ8mqGaRAvZqXFuh5AIqdQQqwUPFP77dU5Xt
	CLACaaIe8/X/qKS/KAbnPgQgQC8ZLvsxgNTT7p66Va21fhnKcugQ2h2m95UXcjwgkeU=
X-Gm-Gg: AR+sD10QHuSghGSuBn8BueCLLjims41vSKTOkPpywzqQgOvAdIzPGT82DXvfvZ2ytyZ
	vpq+8RJvZk41KmTANP8PYce5iphyfQs7j7QJwNC5xQUZKILawPGPXpxX690SN51kCDkFgEDkWhf
	y6ONA1k33WSXeZj2Lx9pwJe5/SEWMEI+SNDT5Rp65tt/BGry7z++xEG1/HZNmHUhi8ZaMsQki08
	73zBN54tpxa18GTIzLc4PwPVmwVHQDA2ANqQmQCTlGdqBfHW0NLjo7bv+kM8UUpBdxj94JKLjn1
	f0OlYF8mPrOF79tLMsJ7Na34g6cTdmu/+3YLsobZ3PTAaVvpr2dzpndXHQAzeqG+0nCmWnRY/z1
	w11BoEi2JKr8SmTAV40y/FDG9hULE0Xj3b1RIr5repargi5LTrnNv5p/SaRhdb2u5hy1oYLNTyv
	2bs8T4SXmeecx4xOKvRx5lKs2dNMOlbjHLHkplVQY+g9SVxO/NpnUbrK+6mtXADx+3
X-Received: by 2002:a05:6a21:9981:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3cd2ffc1753mr40291706637.12.1787563132361;
        Mon, 24 Aug 2026 02:18:52 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm36790685eec.30.2026.08.24.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:18:51 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:48:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	rafael@kernel.org, konradybcio@kernel.org, tglx@kernel.org,
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org,
	quic_tdas@quicinc.com, danila@mainlining.org, davidwronek@gmail.com,
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
Message-ID: <aowMeGkWZQGmSmHx@vireshk-B250M-D3H>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-13-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821154030.2514-13-sreeshankar0910@gmail.com>

On 21-08-26, 15:40, Sreeshankar K wrote:
> Document the cpufreq hardware on the SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 98eb36bff..2dc2c265c 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm6115-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
> +              - qcom,sm7250-cpufreq-hw
>                - qcom,sm8150-cpufreq-hw
>            - const: qcom,cpufreq-hw

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
