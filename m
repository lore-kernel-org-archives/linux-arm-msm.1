Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC59B3515FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583809; cv=none; b=E4nm41C99fw5F5fiHwrSTpcx7yKJhRYu3c+Va/PkaLR+dL2aao/UsTe3w8cHy0E5e6ugZHJjZws3O+NJPt53hIBqE1UrKV9z1KnM9t9lQ1q4SOxplOJXI44LuZfpB0zv6l9AS6zH+iochShl2kGQ/HbFCqCVEfHrqImgmHP7Y84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583809; c=relaxed/simple;
	bh=RqUXkvq+UXggpnZUmpB7u7ETkytsnqwUT8y6iZwRB+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvlECEnftT8CQi92/t6KyTgvlIcc46LnhrZqUrGdc3VVS4+/gY5Rp6ZRAcVGNVftDfm49Z/S76nMnX6owoLMKhoME3eGVgjfhcpCVotqYmLmIS1aZWRS8Q8gIRoTpYCE05VUuKn02aM11DLQKf4BexV5tDNjvbnhWscABIJo1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwpDAi+6; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwpDAi+6"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so279774a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790583807; x=1791188607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCSsLPZpBQSxCmBHl7x2KeIrNsy1qqAi41MGrgkLwNo=;
        b=XwpDAi+63NsW9c2tCeImVzzVprOgOlUt2bqsB0X/EQfBoH7OR7c3pNzxkMvoliMkFv
         9nqNpHf2I4RxUjxJ+1laHGZHs9SvxN/+hSHtXbyhr2x+8bi3jum3/zmx+Etj44mSCCUC
         hAKmcdAeC6sSjU3+h3IwnDs2nLsn9CnwzKHSwcUD5fKy9GAucyram4smdNRME37hR4h5
         ldo0fKdFkj0LK/N/bdT8BADu0BFwagJIlb0Ih2biKsL+uIbV+vg8dZx+jMUsl7+zPTGR
         WR++GbQONzpjEvCtmHbo8DfuY+7kWko6wEvq27l8B7RlYFk9yZ2tHukuD5blb9hg3VHE
         1Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583807; x=1791188607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aCSsLPZpBQSxCmBHl7x2KeIrNsy1qqAi41MGrgkLwNo=;
        b=x4vhJnj6P8ZuF/ZUsYrk9FBbvRrQg1VbzTJrbNEspvrTScRuwUtmwFXrQKXHZH4rW4
         QVhMQoeYNm4mM81rPt+gY7orSuCcSaUefRb5XTlRyljrXkgvks7/uU0gtEmpHXCiA1oH
         9L4qycdcP1XNXZvSlcO3YiJWfrvGyG+k0FX9aMNDgu0+yobg/fIrFDMJDCOWyqvyZHS9
         h0QVblghLu2NjZhmqnz3qatjqBJ7LpPEiUfyOo/MVPzk3IFl1hD1ULLcDaWVgkHnI5lP
         BvIy4wjamVprHqtSJGkGdl3qrBTdMJXg/7si1gWsAbBoDhjhhIHmvjX03I9wXDDwss9N
         WChg==
X-Forwarded-Encrypted: i=1; AKwUvByJUOiEsP7ywl5K7I5/ePoLvovRJSG70ehKCPpy0krB4/beyvbQbdVod8MHzu2Ph3Yl8D5HB9mXN9iYousg@vger.kernel.org
X-Gm-Message-State: AFuF++n8XdncdGgqHNNQzBxuw+pBR+Q2q0Y5Ovtpx/858rQp4Nr+HKP4
	K5K4mccLKaete6Xy6kOCTjKIfQiy5aV5tSpEd1PrVfpehNz6XsJVXuwG
X-Gm-Gg: AYBFou0jgbzNgW/HRtdGizcg57HsMZPcdtypR++I20MtukjuZTm+ZK0JnPCh4TmcCHI
	ikZO9mfo9qwVBD7Pf70kJmK6bN7ckkmFGPfxLm3Ju4gaDed8ZXz2sKsdFmwlAg7a4dUn+WGZOjk
	BNuKpncv6bXklFBzMI9OjfyFSOsdDXgBYPJAdxbCAB2hrd3G/rf8u5QQyv3hWE2m0eL3lTVlOFt
	c37TGFI9zmc70ahmhfpDRN6stiiqPIpZIqqkwXoslfjTIxt9bEy/P2tYs9a1vr8jw9P+UHt7cJX
	De8WpcpygMMATn7zwbaXqbRimMFjv+EvIWw4hNA8MuMvQeFW5Sp8gMdM5z+3hDQ11r9tTGfJYz8
	QVSKHx5D9DIs5P6uQZl54K5+txBYa9W42OraA9LcdUWKoE47Uqi40PRBWET/SsjPvGCw17CKXSr
	8dlvbaHHBxQjZBpsRD0lba1Hf4HZILNcZKcRRhDo6hqOW15MAT9olIl6Y/tAWlKqCkNoeub5RJZ
	czMUS3VdCNSYw==
X-Received: by 2002:a05:6a20:4306:b0:3de:4f5c:a9ad with SMTP id adf61e73a8af0-3de4f5cbe8bmr5554848637.1.1790583807126;
        Mon, 28 Sep 2026 01:23:27 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7ae09698csm1436154a12.31.2026.09.28.01.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:23:26 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 16:23:22 +0800
Message-ID: <20260928082322.10078-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928-spiffy-calm-mongoose-828a04@quoll>
References: <20260928-spiffy-calm-mongoose-828a04@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 08:39:55 +0200, Krzysztof wrote:
>> +              - acer,sfa14-11
>
>acer,swift-sfa14-11
>
>?

Hi Krzysztof,

As I mentioned in the cover leter, both Swift SFA14-11 and SFA14-11 can be
found in www.acer.com, but the UEFI firmware reports the Product Name as
SFA14-11, and S in SFA should have the meaning of Swift. If you think
acer,swift-sfa14-11 is a better one, I can update a new version with this
compatible string.

Best regards,
Jianfeng
