Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D112649F133
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143232; cv=none; b=G8RBSVNgBxhrH1ZMBaYjpbAQTIk3Bmhc0AZXRwSuxL1EKKRjOzATTS4mJ01pILto5i+v5C7CwRO3kGX5vRLBEz6g3M3rDmzjF6BIsZF2l7U3mT31/8+2J5nBx2CnNLULUEq53ph11u+5sRbF+EhWDAwoX0ggG+0FiGuPj48rF24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143232; c=relaxed/simple;
	bh=nViZvjRLJAYmqpZ2v695pR86EYVgDFqOJd6KL6H4ZQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiJPFK8yrqBO8aZo5Nr/c/wuY3BTvsLkodyTg5CZe7jsKptuMmnqok1fAqBQZ8pzZvLrwsm6smTav9JlIcHV9KkeX7OZPy8rgvLvvzM1S+/XhgprgGYL/FPwELc5EoG88FLm5/NE7uf75VMQ5tOP3OHeHbxDEUQLFcFE7xudtRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+PPDFvu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+PPDFvu"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso1081459a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789143229; x=1789748029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgyMvad3ooLpvm/jCLKD7Z6/JEFk0gV7nLYGOHZ1KIY=;
        b=n+PPDFvuLZtONF09Lb7OaaKopRnHv9cmXKN/QI9F0sOQKks+IQZE3Gbrm4gSawuE/U
         GHd62DiSTD7Lr6QPh2oimyACJa/fRgrxwz84LIlBUGvGtopHrGJJubVXLVLxEqU3xxki
         hzSGp6HUKYW7JqJYjGEwPofN2fw638oaiOCyZirHuJcgKtcspZVd5FpTsqSNcnHKC/cm
         0AjEHVyo7foz9NkyV3br8hAK8jOBGLmeZDGQOl+AJijFce9BEgZwIBDXT9C6w3sh6qwG
         hqUydlWr4RvZ5xRfOGJzAcUZhE04CEYktN6FlCdVV8cKsCtlFLlYl2RGnaVEKWn0P7hh
         0yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143229; x=1789748029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgyMvad3ooLpvm/jCLKD7Z6/JEFk0gV7nLYGOHZ1KIY=;
        b=DqUk7+TwgKj3T2n5Cvz4RXbQkX7cxxYarpLZz40An4+Gx/hPJByNMolQPcrCTgYew2
         Y0e6WDYTw65CBw7oJ0JpDKVTJqiB1+fyoH+JAXhpNqg02wQZb7b7lqDtt9/VP2/OxM05
         L/dsgbw2gaBWr/C+TzxKgOQIfjxgrZJhgh/z+6PAsGt9nukPj17FTVq5Zt5rlEPqUpeZ
         CrGYYjozWqgWW3JAIr96BHo49NEmSqud5MtB9RS0vCVt3y+gQD28JILiq/HV0do9hnV+
         tPFLryezQBhzgtJLYS+yz2dsQfRD8wnhBqsURF1wfbtTI728Ms1tdj6SX3F8WZsGBsMY
         zqew==
X-Forwarded-Encrypted: i=1; AKwUvBxTkRiM2pwNZ+uwBEYC+YL2cIwxfQyaMyfDimkKY+6+xn1knBLnbxP4NBo5ZU8rFkDAAr5Zyh0pkbaOl/r8@vger.kernel.org
X-Gm-Message-State: AFuF++nhV5c/mFY8Zw0eI3L1VOvv93cc7HtJbF8MjN3GGYSkAWnf7eyP
	a4nuvnTM8sboEN8S/gqv9VQbRGciDtVTnISfAjvPKejSptXhdDuLK6it
X-Gm-Gg: AYBFou2t0ir7DnQa/EkD7N9yU5a8cqp8IjubeNmYLQYh0CoQGjD/1+5qLnXPA+sfAYg
	H2+6u/ZVR15AP/DOWJsY/6Mqjs2hoEqYvEMEC3wb4OcHpm2SlBcZQBwBA3TDEOeBMIN78vVKpxy
	DNeIlNairDFOhw5ZLhMuKzQcwZGV4IgBPFxU/TLC2TwHbj0C2AvWENJzPmZZjGFhEqn93TvNZyr
	MsHF5nkVyqntrJJa6gi3cgufwYkfdYjDn95qFNf0whu3BoG4bf2kyHJ32AVc88zZSrpfqxGN2PC
	HYkPDMBxUyrRe+rIYo4qpUsLMsPgry439TsiZoOQVS4YJf2e7WLj/Ml0UjaE0IExzuYseOr+xO4
	Rsr3LnMNWQOhq04qWq1e23sPfB9y2o5xScZtupj92rzQqfvorJzBh+05uMgj0+ZRPWLL4tGfCxP
	N9Vw7Q1OmsMY6h2dViXzG3zCmM3msU+Y5pf3bxJX3g8mUCaEE9tIEHgWNAgsTAYgQxKNmMcmnm6
	dWlpt7hB2SvPp6WVwFF3VZoA+/zja9zyfrUhP7fwIzrvbyjVQ==
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr8571433a91.24.1789143228656;
        Fri, 11 Sep 2026 09:13:48 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm5497522a91.3.2026.09.11.09.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:13:48 -0700 (PDT)
Message-ID: <daad9a84-61b1-4983-bb22-030c33cc6ec0@gmail.com>
Date: Fri, 11 Sep 2026 21:43:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] pmdomain: core: Add a genpd config to support
 unknown initial status
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-4-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260907111659.263324-4-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07-09-2026 16:46, Ulf Hansson wrote:
> It's not always possible for a genpd provider to know the initial status
> for its corresponding PM domain(s). To register the PM domain in a safe
> state, the genpd provider driver may therefore have to initialize the
> genpd's status to be powered off, as a way to prevent the PM domain from
> being used when it actually could be powered off.
> 
> In these cases we may end up to power on a PM domain through the genpd
> subsystem, while from the HW point of view it may already be powered on.
> Under these circumstances, it may also be required to keep the PM domain
> powered on until all the consumer devices have been probed. In other words,
> until the ->sync_state() callback for the genpd provider in question have
> been called.
> 
> To support this behaviour for a genpd provider, let's introduce a new genpd
> configuration, GENPD_FLAG_POWER_UNKNOWN.
> 
> Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

> 
> Changes in v3:
> 	- None.
> Changes in v2:
> 	- Rename the config to GENPD_FLAG_POWER_UNKNOWN.
> ---
>  drivers/pmdomain/core.c   | 6 +++++-
>  include/linux/pm_domain.h | 9 +++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
[...]
