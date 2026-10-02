Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF93E717C
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 20:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973341; cv=none; b=aM3pHtZyAM6iYMkMq7EBVS4gPY1A2vAI0vrbeselUreDM6GfDhUxoWKrX41ue6PHDmF8EDsqxYar8+S+8VatEg10V9fjXVDeIJ1Jy3ZVAwA8Xe9w8qbvUDynRBqMEx2odXIUBRfVpmKE/mfG75tPgwAHooZ1Hw4ImeEQ+otsh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973341; c=relaxed/simple;
	bh=sIj1ezOBqpeeSAMqVw7HYdm1cxc9CSBD5YyTXljllaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXfkCsJv9sZDA07re4hZuN5R9ATPOUdsq5ecXB3T6GYi4QjAIJwIlA7FtAA0SSCo6+1XGP6eal/aDRNFyTsbAKLo3VdCy2XWplqiDqwltwWay16JFJzKCOWnCpfhc+7K/YtORfegxGptWn5pqKbuWZDSnXSYBCcFBcYujN+s5i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl53dz4t; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl53dz4t"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e402001e8so48418766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790973336; x=1791578136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIj1ezOBqpeeSAMqVw7HYdm1cxc9CSBD5YyTXljllaQ=;
        b=cl53dz4tNptD+9Wr73P9EY4rRMOunUmiyTLAdAj1jgAs2km/eYeKI6GoB79AzDSFjW
         /KAH/Ninya/7trsAJrYApMSlSdZszCgxs2hVHN+qfqp0jzTSVw7CX/6iu7lkO6XFiCFh
         CLvBuSg4sDXjkzITcb1WRlF7YUdlFJd5/UGywJhbtzzOzgkxlXd8Z55xmO4N/aaKP1w+
         kEoQ37FpCYV+HcqFB924T4zSE8R1CeEipbs0NLaKSS+CnObtOCVVDf3gADQhBojXyNcu
         5eWGo5wRZlYlqFeMi/alKPrYelB4YdTN+BCgqiRbuHtCcP7d9Lh2jKQPsPeeR1B0BDgY
         UJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973336; x=1791578136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIj1ezOBqpeeSAMqVw7HYdm1cxc9CSBD5YyTXljllaQ=;
        b=DeWY8jFFiAg7Gybi0N526tjXnOGA542mbD7GtxokYMOccU74p9cVhOcyjTWxXDlLaJ
         bcbQUKTG+eZXZRQxp3KBTgPtbzWxcp57NWOoo++SFSfY7l5DfvQiZR7Dpps94G341n3J
         bA7PHNmgqZbsvFk+2oH6EZTd7MH7Vaiit0a+PQxRfVI/wHOmxc3msC1ZIcS3h0A6yPwY
         ffYQiRvGf/3y7AuaIf40RKQ1dRrFx26kgshVyj+QfBpxiFrWdx9bnSU48xept3ZTyoCd
         j22PggMK2OCTTHSxUxFg5Rac0LvDxn7yLdDmjMpsc4a6uBH6PsfZU66TYdxU7Es2mP9O
         3Q7g==
X-Forwarded-Encrypted: i=1; AKwUvByAQp7ItVjBdwvhvTuxiSQY6XkfNCKjY+HQAJw1eKs1w3sqxhvcC4X/6Amb5GmHOrWbTGvNn+1IEjGzoQN+@vger.kernel.org
X-Gm-Message-State: AFuF++mGSs4WFLJpH4t3NQZFwE2r4nPZkXdfsNHjrIrkTrZ2ILl1qhed
	58X1PWyqsHv3rMLfRE3x7+I8+bLJDFSl1z3M5eQ0RBLtC4wLGy+rlP1f
X-Gm-Gg: AYBFou2d1TZLMc5hKvNGjyFjIslsDdZ8Z/hbpUloIQNDmZJUJ0+uapuOmcv9lp1KrxJ
	8SwrkHBH5CwRyFHu4Qsmgij04q65zVaxTFNLibaeN5C4TogSvZ9RqdcphdP3svdW44Ds6BOaqED
	HUULCvTermvKAJ7tjuaK9dT94rD+lA58lx6zRLIGpAuFX8/DZXV1vQklLp9ZYUGDa5noCTisFnu
	a4dhINteXo7Qs+uYNgvWWgdy602iDYxE9iAO35mPsZAEVbwdeYY1aub2dSmMCyNJS3zOv1QEilW
	KYLPKeucZ7wR8bcvfWObRfvhE08vSJsOw5kaYN4qpGLA6TQtiswS6JH/r27B6TtLjfHhdX2V8Zp
	TvjULFsOpIIqxVRIx5Q3uU/kfxn8Zt7RtP7Zhy5VQ/ImvYmbPKEW9GmgocslHcACp7XxfActPg8
	V6jjdf+isBLnQWjw/TIW0Ntd1OOIKg15/NvdCZDa2kd8wscJk56u8v8i4Eqf0JXIl9bJmlMWdzP
	uWcd+guwJZnWmuHki2JBJ2ZXkKYEeoNmozArYI/V4rcL8SfWIQ2kE37dO/3l30slE3gg2LWW0T2
	rNDONBq/v7ABATW4m7YmG2MbN1Ueh65Q0w==
X-Received: by 2002:a17:907:6d0f:b0:c2e:4196:b167 with SMTP id a640c23a62f3a-c2e4af2bd94mr289331866b.18.1790973335924;
        Fri, 02 Oct 2026 13:35:35 -0700 (PDT)
Received: from localhost.localdomain (83-233-130-206.cust.bredband2.com. [83.233.130.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4da9dfc2sm127854166b.5.2026.10.02.13.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:35:35 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	netdev@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qca83xx: read resolved QCA8337 link status
Date: Fri,  2 Oct 2026 22:35:22 +0200
Message-ID: <20261002203522.1219-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <7eed302b-d455-447f-9ce9-f15468b9792b@lunn.ch>
References: <20260928220749.857-1-yongzhao.derek@gmail.com> <01a62e77-6c4e-4665-ba46-26d12b1c77b4@lunn.ch> <20260930212348.1919-1-yongzhao.derek@gmail.com> <2ea832eb-33f4-4bf3-bdba-5d983038d012@lunn.ch> <20261001181634.1508-1-yongzhao.derek@gmail.com> <7eed302b-d455-447f-9ce9-f15468b9792b@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

> The traffic failure was however because of the error with setting the
> DACs?

No, sorry, my last mail was not clear about this. The failure was on
a QCA8337 user port connected to a NAS, not on the IPQ5018 CPU link
from the DAC investigation. With the same OpenWrt 6.18.52 diagnostic
image and unchanged DAC settings, switching only that user PHY's
read_status changed the MAC speed from an incorrect 1000 Mb/s to the
actual 100 Mb/s and restored ping in both directions.

> Reporting the correct downshift has nothing to do with that, as far as
> i understand. Correctly reporting downshift i would put to net-next.

If net-next is still your preference with that in mind, I will send
v2 there.

Thanks,
Yongzhao Chen
