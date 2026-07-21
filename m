Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7443C063
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671400; cv=none; b=oK0J0oN5DkdLZQqOEhn9CwhUB7o2r3sREasaLyHRf1KYAESzw8WrlN7G2AKQ/oOP8qDKP7mSIZeKE1LR0SLRvLRWuRLNx2YuUY+0PTZo3DyDHkuRoc6rdG7+z3Wdt+iBhXmW9kViKuDyGNbmXlum4lvtfAJyvWRj97EtG6XUM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671400; c=relaxed/simple;
	bh=NfxTc9u1k/pJstjrOpPCWnueH31m1uLTJjV8FglwT7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDq5KnBkdGZ6dBiiVGN4iQTXk2T/6vuXII8L6YJaVoCL3ekTuNonVY2b3aLNsribDFMOqq3W5QdwMFWfYbQQfe6tSKgSs4E5aVlMmb47A43mf6CAKq0UmioAmVCYFbKl5PxTIqxM+yBUysbnVASXMX5Z8ny1M6TMEuZMJORLxgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ErWd7r/+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErWd7r/+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b966dd74so51763315e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784671397; x=1785276197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87xm0pVIVbAME9LD22FELQ5TVcZbO36WZnkYbB9lXfg=;
        b=ErWd7r/+Ctjkavrf0kZB05vkESWKbzK2ni8ddrEFGhGpnbX30C6w7H47QQGn1Yz2jw
         rCXGuCG3bk/ZZFKLn7cOfFCAvBO6GP2FQhvzc19rpi9fjWh9aE5XZoIiF96LonGuKjrY
         8h5ZOsLJKFUz86CZPETBxGOPDRDEvuIaFMgHwxUKGi/8h+d9SwC06ZNPmAQxHqEeO0Y8
         kB91Jslvd6UVuSrdp14Itm2/IzW9hgnTUsSey/G+DL340noyCaUj/pRvEwWoIunt6iHf
         /D/qTXpgd0n8gPUKtZy47MrMa+YJZNjXwQk9xQjWSlH8Ri1zs365mrrvboDfjVTNYQSh
         1JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671397; x=1785276197;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87xm0pVIVbAME9LD22FELQ5TVcZbO36WZnkYbB9lXfg=;
        b=HvLbX1qWLt0Q+ehzrHau6crPLNYkhifDGXGt6UK+AB7G0Lsslz//3vyIokMfyLUUWh
         905AFheGs1Th44PJQ0mi81WROW2Otc+JIa1kAVwM+qtR8w3l29qo+qxZljDwDHMUzNds
         L+IaQ95EssErxB06jqIOLvJ2LtVzVMUbTwncxd7OOCrPyIe6b0UlZzDcIJVAWcpetQFV
         dXDQlyFIeM/LVZXruFc29nloZ9YqEteehX/xyG82dmwnNWSh2EtJJf0a2p9Ez3RXet/C
         v8zfeE+1agZywCXNil9VBC4irGve1tISrlAUwgYagfczUq+YWhx53NDpaHDFX3lYVrd1
         XzwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLwKs2fRlOK+RSZm+tKrC7DLlVtRtQ6Ogx5k6pqgQwiBvJRmOipE8P3TGvH68nFNPMOlAcdKolKKOC0PeK@vger.kernel.org
X-Gm-Message-State: AOJu0YzpsuKxqkbVLhtIxV7D5L0U3iSoVf269W4YWqC16wuJDmO/cpFW
	RTRlbiGNBTcG9DF97pt45moqxhOsmAmxX0D8CmOR9k5QOkpB14sonNNnGU3on7JzYJc=
X-Gm-Gg: AR+sD10ckdek9L1V6KDOqXXCfoZ8yyOs/m0bPNhgzB196uKazuik6GcDBlISnVXdeFV
	LwBfFZrFSPwVo0G5nAIDUWPzDlm6RbPgmbfv33w+sKlzchkcl5/KeFoCF1wcK/3Ja5w3VVJ/8tK
	aQz4bm4PjYpA9wlXECWcEc5DS1CbM6Ap+DKAIHdOR1eVolyiuDHJXcLnKGstDF/q15ozagbjVp+
	7RX/fDAtPDUVT7KuOstLNmmQbenFGeZEgFGXem0K8TC/hOdmg4Hpj2wBC0yhPOw7VPGBpnNqjct
	6Uvuo61wq5ZydKKtpw7Fs2EKg3/GcZFJePzFhWXIljBa+TocsX1dUG5S0Vm6EpXq/fynNqwsbuS
	vop2mZsTj/z89otuAmPK1ikbU4/WmWrsqU2We2jKwvomfyXjwoMAsGc4HHHuiQyinDd2TBzQPvu
	Ge+3j1kcKKXd6RMck=
X-Received: by 2002:a05:600c:524c:b0:495:4cb6:71c3 with SMTP id 5b1f17b1804b1-4954cb67f3dmr236177625e9.39.1784671396789;
        Tue, 21 Jul 2026 15:03:16 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edda9bsm42531829f8f.31.2026.07.21.15.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:03:15 -0700 (PDT)
Message-ID: <58d54373-9544-4d97-834b-f0ad74f70864@linaro.org>
Date: Tue, 21 Jul 2026 23:03:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from
 QCM2290 subdevice clocks
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <aTQi_PnCsL-z4uzSYYbseiwJeNmXnvMEkkIN2x-JtN7_TgDH-v06zQ4-Kw9D6z7vmaZpb4uxSS9at2WydfKoqg==@protonmail.internalid>
 <20260721-camss-version-v2-3-b2440d99085a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260721-camss-version-v2-3-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 14:21, Loic Poulain wrote:
> Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
> lists. These clocks are now handled centrally as global CAMSS PM clocks
> and are automatically enabled when CAMSS is runtime resumed.
> 
> This avoids redundant clock references in individual subdevices and
> ensures consistent clock management across the CAMSS pipeline.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
