Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA34342510;
	Fri, 31 Jul 2026 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468239; cv=none; b=KH2Tr3yfI8AZZvKLvJuo96hkGuFmjASfUNGXZRGaGOomf9LvltuEnlEXc3ahvrFRqoovcwnqYyh0qgQuJk4Rh6sppqJm0aYE3IoStoKMYfX9rwxFgkeC07w36YntVs2JGhwIaCS+LwwlwHp/dVZdHtubWvYR37w8pIhoz7K4RJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468239; c=relaxed/simple;
	bh=qBrj9wsZHHhLHOtK2kMuuxjV/zxcxPCIsUNbGnLXuiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l1odmHNXWmJXVxXKRuq0kpMzPktRb1wjDJMJaaZQhuYh0wO/w4xqQ5veya4mL/nwvW5KVhtoHQxSX52AlXFGUo2XsWIotTRYegW677Q2hbLfxVZLDewXiOBQrezPcCdyfIEouZSkC7r8gwMypWyqTIv5uB/Gg4WTNuVF0bV0ZOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZbbfUvF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZbbfUvF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94FE1F000E9;
	Fri, 31 Jul 2026 03:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468238;
	bh=Lk5jRdJF2mVbHwViXugoHFipc6wekkI9sRQkCGgSTdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hZbbfUvFRy4tec6MaDAKrxo7bIA8NYfZdVI01wHX2YM19sa3r/kQDIsZ2YwKVCWLi
	 JYQkFeY+zN7NgFA/YIi0RVdt9gjzjft6d+UECSDNGuARy7BTPny7jOwbyzMGVdB1/9
	 zYDCajqTpPb3/esy3O5jltG3/U9nPNBWj+aTn6CM3PkD3wWsMtFnJzSyEJpw3i9W5u
	 CRjmI5Ikx1ShpbzarWVXuUkHr4OpFRgiqG650DYDz0A5mLo/fwINFsZ9obdVBQFyNp
	 gWSNX1slcvpU1htnavMY+cri858TQCDMUGNwVCykbDJ3pHIlSz6eU/xFcZ0V51zuku
	 WDRXl4BGyddYA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: qcom_stats: Clean up macro definitions
Date: Thu, 30 Jul 2026 22:23:45 -0500
Message-ID: <178546821258.316167.1655886525048311540.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
References: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 14:16:22 +0530, Maulik Shah wrote:
> This series cleans up macro definitions in qcom_stats.c.
> 
> Patch 1 removes five macros (STAT_TYPE_OFFSET, COUNT_OFFSET,
> LAST_ENTERED_AT_OFFSET, LAST_EXITED_AT_OFFSET, ACCUMULATED_OFFSET)
> that are defined but never referenced, as identified by -Wunused-macros.
> 
> Patch 2 removes CLIENT_VOTES_OFFSET (0x20) and replaces its single
> use with sizeof(struct sleep_stats), making the MSG_RAM memory layout
> relationship self-documenting: appended_stats immediately follows
> sleep_stats in the shared memory structure.
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: qcom_stats: Remove unused macro definitions
      commit: 2d361087e8f662c7846e34451ebe19b42bb86db6
[2/2] soc: qcom: qcom_stats: Replace CLIENT_VOTES_OFFSET macro with sizeof()
      commit: 8463421f20f67168132fb1b47571741266d872fb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
