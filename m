Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7238735D;
	Tue,  7 Jul 2026 03:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394521; cv=none; b=amkekdWuDcJXXf1BJ6iyEYQih92ysG4nwQ/ZmI4UplhaIAjYmgzE3u24fEn0VObNzd/+YfBvfsu3b5zcjih2kOD9a3YKxHyOjtePa6RL60NNCnufJuLYH1QHSE+ru3MEI6f5OFCB1NsWkzLOYB6DoSuuoDLwgOZIIA9oWMohPB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394521; c=relaxed/simple;
	bh=Q6XPIHfjrifJf7VZxdRX6ZKVDq2u/4S5jcHCyElqagA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKNqi0hHusy8WFFSciatV4iYtAdfJ+GICuq18okVR5jnvy9MBCbAWW6d4jRSuHV0gvjc30oUJRsNddRHSzWnGbQ+GLyG8gHxGgxKg5tsIZsEqkmp/zkUcws7Vticy/kSdE5r6gWYhWL/GTUYc8Rwqkldu4bQJkLd69lJjvkKw3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2sRc+dG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2sRc+dG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CBA1F00A3D;
	Tue,  7 Jul 2026 03:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394518;
	bh=niQ5NEziIOMO5/fJwKtMRgyL+MmUzdEDKvALgyObSU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h2sRc+dG6zZVe7C7vjFo6iv3pZIQKD0iUfzfWClG9HygiChdkAWw6scaWcgahmN3T
	 tRUTgpNOwfe84QkNTyRm8QE/uLw++KwHJdCK8KQSGc4SS++Bxr8rpAV7w8de6YTo3u
	 ZuHmv9uTbmK64PMoQ6ADqaGXkuEz/2cIuKfK3D/u3tsV+vKXDDQGpYB+wKKXapt3W+
	 mPjGWjWYc7EMKg27vOatfF7jEREUFIUIAmTbKLsbkzTD5Wa4oRxrUUJWcASYQMuvjl
	 JKfgTf2WwCOmyDb/KlgwXMkXHU649KMX7YIEfLKRfvLeAYxWRcBw1kL6IbuLMHL59Z
	 baAop/NPKCyAQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mani@kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Support IP version beyond v3
Date: Mon,  6 Jul 2026 22:21:32 -0500
Message-ID: <178339449911.1938770.6350573817446573406.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521131229.11199-1-mani@kernel.org>
References: <20260521131229.11199-1-mani@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 May 2026 13:12:29 +0000, Manivannan Sadhasivam wrote:
> This driver currently supports Inline Crypto Engine (ICE) IP version 3 and
> 4. But this driver fully supports v5 and should support upcoming versions
> as well. So extend the version check to support versions 3 and beyond.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ice: Support IP version beyond v3
      commit: c709c76f4cf1d8646362f5a00ce8da1bd8ed58d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
