Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29363C7690
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 22:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784156329; cv=none; b=rYV+tbRd7iqlx8vhsl2hCNxVJWMiDc1/QVds3df6f//tzVo65heicENXH9kEVS+mFvQTRTK8NKnuTj25HxMcRzQJCWFZq6Ud/D3BjiXXPGj/D6EkxvhcAhBP+2a8M5ldbKN1fXlhV/EcTak85c/0o9X23UGMQNbk/19ZOdBRCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784156329; c=relaxed/simple;
	bh=kG2F/h/PEEQZLiJEZD5ZWH6vRmxnrzHxv6qCSCD+15A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBk+w5mPN9/X09xNKIv9zRCpjf5L1bURHr58BExtKBPSJrnLhF1A2q2L3cAvVNpsRFd/tYHyDVODA0yJF4YfnvESWSR7TvQnHNWDRfZ/jbRf9259/6XxIGbsE+Ijcrvo2Qb8TB31POALoNmfXzhYP2sCmXnBlT4bQgYJjACLXg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlKKP/dQ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlKKP/dQ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-517dc520840so43324531cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 15:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784156327; x=1784761127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYKThW6S+/ysG3sBUcQ38b0+BGQHjFHSJabT0tpeyio=;
        b=jlKKP/dQZVoBE5EOud86rdOYX5uezG2eHV3BZQM9TPgluRN+YpCkoSQINr7gGLcgQY
         CDG8PeHvseYiG8vYMOYE6+WhcMIvK2SocXxYoODxBpnneLX1v5SweqS3DnLlpxAFC9Df
         Z4hiAP0VbKhncIt+tM3ZYVcl3sYy5OozlVUMOzmWjiyRtG5lG8p0AW9t2Vk0h0p7iWLC
         g6d3oZnIf3oSo4r6jA4+96A3wb/nSoUPBS3MvPgBjyztjxMFYrjn9dwRQncCNaL6hgWZ
         fA5y5kuGXEwUou/d1Txnj68XYoma3oR7ZZ8Uq9p03jJa9CR9TiEHA3Y33E4T5KeAWY2n
         Pj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784156327; x=1784761127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MYKThW6S+/ysG3sBUcQ38b0+BGQHjFHSJabT0tpeyio=;
        b=VQjyJmTGEcF8HC6UfLNAjcyEVjA+O4fAJE6e/hhFEhJjB1pX6plfV75y9RMCwPispq
         hl5K1NKSWlyrh5jIfUzDbZz5/oP3iZyIziZhZzq+aztGkBRvnH/3bfUw5+3isAPOS4Qw
         M/oBFfiJCSh1oBupixd5+crUGGnOZkkEyjxC7VVc2QYgc3rjA666Z4apLlREon/MaomL
         uLlUfHpID8/yEbqflz3q+9j7c+IYElxk6Wh97O7XmtXnAxG86qNFhA8h7XjRBOhiKvIP
         x2Pg4gxewVT31espSLIyVGGyHoMp4+hF0e8P1a5yL2oevKZnnEqS5UOP/xceTJ36t2qU
         L77A==
X-Gm-Message-State: AOJu0YyQEVZMKNJWD3BM8TateUmpcHHbIEMOo7jS8W0f3n5rinukjbF6
	+HsLOOgJG17OUpoSa9d8bF9ZMA+LYKt+Nl2g65Pg6HUMhcE51g/Y6OVs
X-Gm-Gg: AfdE7cmZPWQ9WzAT9HW4NpHh9OkFFV9mU6pFemqe7edYOvenI9n9eCXkm+I6bCTNitt
	RaHMId+wnoBrmuFx5Q0beNHrq9tSwwbGHPHYYJAfUChEpxOYztIuQxFueSGVxejA6M6QF7uRRv8
	oVKtlxcgjL6371ZGV2ZrIdZTNVefC5uJ4T1V72DHAa1yPgrkCftfRFp0WppC5Q/Ic6Xqe+a4k7c
	ri0vHponCsCLjYeQbvnGD+bKqpHsk9b1yita3rNWehBTvt3YyJo2oJYFL8xAQvX3CVQXtRbOy7G
	pexz2DNzDwjE5SfCHAp1JXH+Nhknv8QdyHKYKVBI0aIxOOYGqKmBCKyxMBo1nNLIMpCdzFYeVXH
	7aznexE3R6942xLM51lQpJ0+tARNxkvm0AjNCrJ5dqFCpB3+C7d5OcGP3lFp3YcxMVBbO/8m4px
	efDqqhxDppbeyv+NrAaiyrXx/E1b8Q3LUTQv1gZvxYPBGC1Z/whpu0Q8ZcdgKeU+gibPxHWAobU
	R9DaE2qZk4NsMRU
X-Received: by 2002:a05:622a:15c9:b0:51c:18b3:ed99 with SMTP id d75a77b69052e-51e4f0fd621mr56429541cf.61.1784156326506;
        Wed, 15 Jul 2026 15:58:46 -0700 (PDT)
Received: from ?IPV6:2607:fb90:9361:a991:79a6:af7e:57fc:e61d? ([2607:fb90:9361:a991:79a6:af7e:57fc:e61d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51f1abc739asm12333561cf.1.2026.07.15.15.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 15:58:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9bb44840-c3fe-4bcd-af2d-149dbc2c7c8c@gmail.com>
Date: Wed, 15 Jul 2026 23:58:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] soc: qcom: Hide all drivers behind selectable menu
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
 <20260711-qcom-soc-kconfig-v2-1-4a907e064281@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-1-4a907e064281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 7/11/26 14:25, Krzysztof Kozlowski wrote:
> 1. Allow compile testing of QCOM_OCMEM, which previously required
>    ARCH_QCOM.
> 
> 2. Hide behind ARCH_QCOM or COMPILE_TEST drivers specific to Qualcomm
>    which should not be available to other kernel builds:
>    QCOM_PMIC_PDCHARGER_ULOG, QCOM_PMIC_GLINK, QCOM_SPM and QCOM_PBS.

I think this patch introduced an unmet dependency:

WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
  Depends on [n]: QCOM_SOC [=n]
  Selected by [y]:
  - QCOM_PDR_HELPERS [=y] && ARCH_QCOM [=y] && NET [=y]

- Julian Braha
