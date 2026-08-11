Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E23F4854
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438114; cv=none; b=d4ELiG7Zy8DY9p1pwU6iCSQ6d/2SGOIMVCTch2jz88S0dyJ9uVDSjj6HFvF/m+39QPiJpI7YE5TrcEC5H7CXbGysmn4rsEgWttdX5PhW2nAe3DcZJzV6DgYbkmIHxKi/2woUCA9GFU7YLiSX08re/zFiBmnnMsEl1dqcfcaG464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438114; c=relaxed/simple;
	bh=Vr+pajHFnIxD0QyiHCR6FJH90ILWXHCt3QnNj1iiwuE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=Amy0e4k8XMuajcpPOnkoQ7c7FPS2UdlrROGXU0WeURhId6etuA/9yjq5dulWlhKjTZZdfFALP5SRNM64md5t4spegWmJ+ku+OVGd0ab8CukCi9tLF0xuzxBUw/9pG6Zf1TCF7A9aY2jPVolzBBPLcb+sm9empxfsExHD55qUr8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdiPX63I; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdiPX63I"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso782711b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786438113; x=1787042913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr+pajHFnIxD0QyiHCR6FJH90ILWXHCt3QnNj1iiwuE=;
        b=XdiPX63IsEi8FMfoEs1jDc3djqila91IzB4bTdD100yqc5ECMYU3TSJJCmBhSTcwsC
         Sr/YAcFfl9/zXMs6WSueCQtVsfnv4tB3Um7I05ACEHUtUKy+VPaH8/Gq9Pjt2n2eurFG
         TVG+2noiLceafD/hXKwmF7/VcRWtddkTUoxFGi0HfPW39pyWP+ffxHqHznRQKr5DkLh+
         91uuNnHD0k8Qum5saDcUutOOZ/xWVo6k4pLlkL64g1oPXYNTHtRHTJugAgSgUmmqFK+2
         cAFAnypXcOCj4aIoHKrw5HxjzAsS+t8vo9oYD+AmlXyN463tWE0l39Tr47Ga95A8Jjdq
         miIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438113; x=1787042913;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vr+pajHFnIxD0QyiHCR6FJH90ILWXHCt3QnNj1iiwuE=;
        b=W6T3HTfXxNXHGPrGnHgZsN2Qhe5gnjnZhpA6oTRXnOJBi7N5EmJGMw5yr2tUdJxeMx
         EkczDa3YeGokaHj/AIcu8wT/d/AbEzWmhr7XMt7uTyMBI14ql9P1kZ5FXatlhWwFOqtG
         sXkwVmU7l5cgcyy6TnIGL7sGXGDJz8KRz/bQhrw/xsWpTD2tK3owOI/BsGndYIuX6/vv
         XfyFk+MaScPRxHLugG59I4GdDBWb/m9mqo3hpjDcgwHIyFbrfTPF9WBdTvebeoXjrdQ0
         BQ4YajhpGx4SQWD1d6CymeOo4nAD/riqsqok6ANNA2ymhhBwxAn0v/DxuhqhorB3UINR
         5BuA==
X-Forwarded-Encrypted: i=1; AHgh+RrW8umaxE3I7pQx4auJx/qYpIwyWuSD1bykbEoItfEMBmCsfBHqcFx7m4vnZ+r0Nhz5rfpcY8eyaa3wSqQz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7lzRY+CDegzQtBZhhFxthZtDVCY0cpzRmDhWPo6BXXT+oJQ1
	2z6u4OSyHdxnD/3rWcDkRYpIyrB+cDmfxZAQE8G46+1LFYpH/ZQn/tY=
X-Gm-Gg: AR+sD13kN6Rj6a+H9nV/eqn9bMtkuDBFOCDBSRF+DsSKmbhQvHwNRoSdzYPeI4wfHN1
	YxHCBOXKqjXz/sgVKXvJAPJLmpgDRlMcvs22Y5ghDwHXEZ0cBs45NPYmzl2TqPOT7bNGGCzl5eu
	i6/lJXCqC+CpTmRS0HPdx5xUKoL5EGis2ruwM3MI/X31QPNVmVkZux2VMBxwaX28WBLLofuLyMh
	cOpW7ToJYIYlrg0HHqYGGPiNwBDsYKX+WzG3wFmFMMHurUqanijY+ObmDBSb6wkUMHjstLOycEq
	nG+43PMHfDRmvCpcxSA0eVlZQjdQQSf+7wFni4CvLZZhBlDGEIPII//QOGl/18scK5uRzYfGb3o
	xGwA8fCAhX9GFxMHtLwT1r/z4T/QI1H2U5w4W0juIrYQzQOOWb/3vBPPtuAjHhAHc7jHYJysNKX
	z+ZNoKlIYsm/Waj+MO5mWyz+Ea9GtZeqomuURZfceTQGog33ctRJ4mXQ==
X-Received: by 2002:a05:6a00:885:b0:842:3c77:5996 with SMTP id d2e1a72fcca58-84fa887253fmr1605922b3a.1.1786438112862;
        Tue, 11 Aug 2026 01:48:32 -0700 (PDT)
Received: from octoberrain ([2405:1200:418f:8400::5d9b:1e58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa91b63b7sm353541b3a.22.2026.08.11.01.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:48:32 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:48:22 +0900
From: Robert Eckelmann <longnoserob@gmail.com>
To: vladimir.zapolskiy@linaro.org
Cc: andersson@kernel.org, bmasney@redhat.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, m.szyprowski@samsung.com,
 mturquette@baylibre.com, sboyd@kernel.org, val@packett.cool, david@ixit.cz
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
Message-ID: <20260811174822.1f4bcbf8@octoberrain>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
In-Reply-To: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The same problem also exist on sdm845, esp with sdm845-hdk I saw
similiar "already unprepared" mesages in dmesg.

Doing the same changes to drivers/clk/qcom/dispcc-sdm845.c, fixed these
issues.
Can provide a patch for dispcc-sdm845.c if wanted.

Best Regards,
Robert Eckelmann
