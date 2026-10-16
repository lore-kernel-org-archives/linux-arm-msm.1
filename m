Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0352509F13
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166944; cv=none; b=gAh0b2gtOJ6SzEgR5U0mG+yN6X6WEbNRGUMrbanMLxo9aj02/uXMbaezrvwY4Ysu7dxk4I9jQQ7bgK3ywrR6k23ODsrBQmWfrgFdknrRIlKuS/nJ9Hm9GUyC0tCWG2CJzT8bXjZF3BvaUc4GJXVSzQWMo7g582MOycdMUEDylkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166944; c=relaxed/simple;
	bh=szFBXro/rSTYjHAQMGTLHw3nMlQZ07NIOfznFY0g0DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2QCdjcNZw1WOYV6A8bgE4Q6b0P9F33+zACRcNm4Da7XAm3TBuUNgjCb4VQ9IgNKLJO9tdAkFs+fXjjN7XieFv8/CHJnSxBrho2S2E9UvYWRnIugu6hMr+uiivXVNHvvfSFali6FNTfsdu0jurPsgFUWkJOVV/YDjS1w5CLxbDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ6ck7tF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ6ck7tF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1af482519so1382205e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166940; x=1792771740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttmMFkFYZs1qc4FswsXiJbWUTRZVrDxwrIXbqrFBdtA=;
        b=rQ6ck7tFRCG3pt0ihngKB1LKx1QMCaQSwMi8mZerNB2iLRCiXLinqLgpkK7jx1C/5E
         CQL+zBj/Ejh/sznP2RmZqyuWSLrWcrMWhsp5cT+SYM8y7RsY0Kbwg7Z7/Y6sae0Bvmjv
         f2qTZnwsx0W+ZYTThDNffXVO6d4KT1MzOYKMfRzK9xJYYnnCbLclALkQzSv8WiVtCpyh
         0UE24mdWcF4OsBfEAYVrTqSmEDVdIPGD7+TFx8YPlx/ew5n/GCQa3wkkiZfyo+Y14USZ
         5hSGDeQwk72UMp8uF2tEbvKq5Nj0Q9MVzFTdnWSUP/hXE37fEMkmpX4nPE1Q3i94h+bn
         Lbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166940; x=1792771740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttmMFkFYZs1qc4FswsXiJbWUTRZVrDxwrIXbqrFBdtA=;
        b=Ful6qrEyHYCtZqVd4Mz67QnvDf3GhJ0Z2LAnbKmMW7VaeXd5xLPmcbVepb+31at6U9
         gIopb+DHVXBcd5ZP4gA81HGh77QaXeUPz9LrKuX8x0xqMkN/+yHWKuWc6oJ3TmSSTwb6
         yqfAVc/Hz9Fg/MMqEWx7XIsv/Qt4FMD61k76im1pEGvPD2paLg8U8O2TxlJmxy/4OP0l
         ASk3sb3nFjbHYPIW0ezDDqyA6Rr5DPXRgXWqrSYsdy+YFT6vBcDLQCUWOfbk1ZaiN5dF
         Z2dXBWrVBgbhmfNHBrJydLJwwlizUab8ww2iTDuYWoJDq26Q0Zle5xmVnt0TcCIg3zws
         9u2g==
X-Forwarded-Encrypted: i=1; AKwUvByAjH0pN2jbrBDVOaNMSLjHP03T7JwdVfvWL21SAsKkR7xhJuDG44P+xk86+/5L+wkR1A6njSI5LT8/NgZY@vger.kernel.org
X-Gm-Message-State: AFq9FYL3w4pOpJM3mDb1jZxkeSBg6tuQeqjxmUPubXUgIToeezM/oaTY
	pVbWIp7eIA9EkKyxVsIp20W7AwGkPPATXDSyWJAQMR8HR8I/KofSQOm7
X-Gm-Gg: AYBFou3bGjIpqlpUAVQpcbbOdtvNUIERJizWTXP5KHW2DJJq8GTbD9JMDq9uRZkMBE1
	JqZcmJWZsJyfXTJaEK6QA84tQGsvLx3koPGX1Ax2gPfnEd3KfDvtEzRtURyf1KzX3VDXdpFizjT
	vXpR6oqfblJIjl6mZKoB2cXl6hG1Reh+aRqp9Chqpj2EAx3V93nsznfl2fTgf1iAhzB/HNiKqIW
	Tcj2pr6TgV9iFB6snuhJsJsZ5Et05lOiv6Vx5DaHUQD/D84fTb/Z9tqSfrftmZp8M47HxcT3wgy
	VIn3QRcVbiFFy5M8XCItSfMxkuJujqEaVC+n8oMaDmlvOnDDe3epuSXy8lbpKv+qgBrmasNgMBe
	ENt8EwkwmpsSxdKf0e1Q/eeh0xFQIijLeS3h/8jyT8uDvw2o7usxAc9B9iSAtabkmrJKi43D4ph
	zro6EFZW+3SbA5qhp9ZuTvvf6K1zPHYyos2CTg8UQB5Gpg4MU3F7kEfPTwgWmvIhI6AcF1Mzjnz
	r86sjUIUd3mOsTwA0kFcTgDD723TCpnrA9B588jit4bsCuXxvNQqETtYk6KvkjLpEXgveGp
X-Received: by 2002:a05:600c:e548:10b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4a1d76607d5mr3809095e9.16.1792166939897;
        Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm6779011f8f.8.2026.10.16.09.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	tjose@qti.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Date: Fri, 16 Oct 2026 17:08:58 +0100
Message-ID: <20261016160858.193572-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6564f9f8-6ecd-4912-b029-c92dfba792c1@ixit.cz>
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com> <20261016-x1e-cphy-rfc-v3-6-40a346a72153@gmail.com> <6564f9f8-6ecd-4912-b029-c92dfba792c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi David,

On 16/10/2026 16:10, David Heidelberg wrote:
>> +	{.reg_addr = CSIPHY_LN_CTRLn(1, 26), .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
>
> Thank you for the change. While the lane being decimal number is completely
> fine, I believe the register passed should stay in hex :)

Agreed. In the next version the macro will take the register offset
within the lane in hex, e.g. CSIPHY_LN_REG(1, 0x68), so each entry
reads like the downstream header. The object code stays the same.

Thanks,
George
