Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E05E472F6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145191; cv=none; b=JvnVYFk3wjyB4S9O0N57L/KflA50iOdWuWp7fh7NcqjY26YAJVFqeMXHbjQZwPJJk2LO/FE0FvGHJxSRZipyTJQ2dWblKvPdr1cIUr5e4wkuM6LrURq64RqFPbfkoFYgcBdUQJwoPiq8Jm9dheEgIaIdkiEeGgTfGTzF3juD4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145191; c=relaxed/simple;
	bh=YUMCWRzPD/GCJZY/NypdTrsAkUtkxHAtUWEfKJcLCxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tm0rXnHy25a6epXCW1L2pmShQw5sr6NWzERYvwIcFs5ztl/ir2SgDHfHpRefMtsRw6dsmtTD3j31P/seMkNwyG1y4fSCgDAQc3M8UQkUw8QJu4H9n5uIr+o0YFGeohD3YlmpDlNTcylWnzhMxvzNa/RbdOgvxJzhqJqK6Ur8/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ny4vxMpH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ny4vxMpH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so57017545e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145186; x=1792749986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dzo/ODszSYxTk3F2wSXg0f3yesaVb/VOhamsMvYKREc=;
        b=ny4vxMpHQD7R7QEIzgDAWurX5WK3rMV2L1LbgLctLpoDIBJIzFHzyg+urJ2IRc5637
         JTiEY68bPTZcuGgv+4cApOQhmlZZvyGbLsm8yKhcZn+8caPqM6CC8Q3hDk+ovTPPfkTG
         66gClkLyqCh6iGf6M1LnzuRW5tgiILsT4Db9mEACXeIxMNNlBGAzOW6VTSjX6tOOsSjJ
         wDXQFJPh2zqF1MXNQOnD1nTu9sBzxyn5tANO0V1N/yGI3ZCS6s8cfipjAiQX2hmiOgLc
         NzZ8LqKEHMkdCDbmXFlre3HTzmogbIe/h8LglvBakxalI0uxe+3fhZuTJHAYGVnfwaf0
         HeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145186; x=1792749986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dzo/ODszSYxTk3F2wSXg0f3yesaVb/VOhamsMvYKREc=;
        b=oouXSPOuqNHutJKTfngKtDeAsKZzXwXOo58VNMG9T5c/dPioYqgvxnwu46Pbawfk5y
         EQD3f+1/kLtAZ1QNyYT5u3Re/8X2OGxf8xXUDlnsXlDaXSmQIs3yY10U9TST/9+GjNS3
         +jPugG8WN4CrAkt1WTcdsA5umgmVkQjcDAttaYSbsXH7x911a7MylHfGrFXYYq4cxoQX
         y1xDtz2xl/V/hwKAZY1Fp2mdHVm3lj4Dw50wqTbzSxF02DLuJN5sLK0xcGzC3OO27vPA
         J5fbUH5N13HGx93IepKFnTsn0Jp8weUqxZRunQRZEk2fj2yiUOd6N5Z6SF51H4th5u8W
         +xzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4o1djnha3TaJMbeXFuzWbNxV8WYF7fpJsk7eDxhDMyckzuJ00Tdve+4n3jBQ6av7Dnzy/AD0BXgBwnVq@vger.kernel.org
X-Gm-Message-State: AFq9FYJVm8Cg2UrZds6YudHNlSW4RYOeyUorMjrtyGnxmoiTotYLGlbu
	aniUsUK69iBpsjWwQ0T3ZB3Y0vutsc5cHtWfNlOXgTkdGLTFjvKXywqs
X-Gm-Gg: AYBFou1O/i+MbX22hx+dAbRyvlgKUbVganA8UiKT7YV3LrJaBsaMCeLlD9IvY3iJZje
	TBFEe6I1PbSDIFH6SfsXLLth2wbn1jEY1BCqbplMqzwNGQSxAY5qXJvbkV+SWQV1pElAGFvxpJS
	cEAOh+EI05tK7ZozpZ573z2NOfzokXCD6uxFYkBWSmEdKnG5l7Cp/IcW7UNzEl7Wi9qL80RrhCO
	tIZy+UJ9DhktBFDb6VKGimjGiFU4yNO9aNyn2wNCTNVHZEhbhT06vZeJ7oK0oy1m5uKj0PkqnMg
	3NIEgEnT6D5eqXqoqmnzBU8txms1CG3w2iSmaflkRhIMEazAC+8h7HFHgJy+kYWFkctO3AiYmSi
	YjSZZsr0w1gEdRhyNUzPdgDnYwXI8HaZQejFju9snBlukTdzXAuyOabm7ME7lYpXgI7HDofW8qB
	AtE85fJs0hoHCKbSWsE9DKDWl1rZy4H+gLvdeJhnf9UyickdHORhvbd+OSnQjOb09732yRosaOg
	t0513b8i8bCuG1otZf7FE5Q2eOcBLCb0GjHc99nHSD2l4pnegPJHRD34v9xfRrcUQXy619W
X-Received: by 2002:a05:600c:1d11:b0:4a1:d307:b52a with SMTP id 5b1f17b1804b1-4a1d307b62fmr7356695e9.19.1792145185802;
        Fri, 16 Oct 2026 03:06:25 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm4404889f8f.6.2026.10.16.03.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:06:25 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	tjose@qti.qualcomm.com
Subject: Re: [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Date: Fri, 16 Oct 2026 11:06:23 +0100
Message-ID: <20261016100623.427688-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <bd13910e-ddcd-45a5-a7ce-7e6e74290955@oss.qualcomm.com>
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com> <bd13910e-ddcd-45a5-a7ce-7e6e74290955@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nihal,

On 16/10/2026 15:29, Nihal Kumar Gupta wrote:
> Thanks for working on this. I also have local C-PHY enablement patches, so it
> is good to see this being discussed upstream.

Thanks for the review. If your patches cover more SoCs or data rates, I am
happy to fold them in or to rebase on top of them, whichever is easier for
you. I can test anything on the Surface Pro 11 (X1E80100, IMX681 on
CSIPHY2, one trio).

> Could we add blank lines between the repeated per-trio register blocks here?

Yes, will do in v2.

>> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
> Any specific reason for this much delay?

It is copied from the downstream reset exit entry,
{0x1000, 0x0E, 0xBE8, CSIPHY_3PH_REGS}, and I have not tried anything
shorter. If you know the real requirement I will use it. Either way, a
delay this long should be a sleep rather than udelay(), which v2 will fix.

> For this C-PHY table, I do not see a CSIPHY_SETTLE_CNT_LOWER_BYTE entry.
> Is the settle timing already encoded in one of the fixed register values in
> lane_regs_x1e80100_cphy[]?

Yes: 0x020c/0x0208 per trio (0x060c/0x0608, 0x0a0c/0x0a08 for the other
two) are the settle count low and high bytes. Downstream marks them
CSIPHY_SETTLE_CNT_LOWER_BYTE/HIGHER_BYTE and overwrites them with the
count derived from the sensor settle time. The RFC writes the table's
default, 0x22/0x00, as fixed values. That works for the IMX681 at
2.4 Gsym/s, but you are right that it is rate dependent. In v2 these
entries will use the settle count parameter types and the count will be
computed from the symbol rate, as for D-PHY.

> Could we avoid carrying a separate parsed `bus_type` and derive the PHY type
> from the PHY layer state instead?

Agreed. The bus type is still needed at parse time for the lane count and
polarity checks, but the runtime paths will use phy_mode.

> The C-PHY and D-PHY lane-mask calculation could be combined into a helper to
> avoid open-coding the C-PHY path separately.

Thanks, I will take your helper. Together with Bryan's request, this also
removes the goto.

> This gives us a single C-PHY register sequence for the SoC. Do we expect this
> to be enough long term?

Not long term, no. I only have one C-PHY sensor running at one rate, so I
would prefer to keep v2 to the single table with the settle count fixed,
and add selection by symbol rate as a follow-up, unless Bryan would rather
have the structure in place now.

Thanks,
George
