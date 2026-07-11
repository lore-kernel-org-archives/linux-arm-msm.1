Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FECB3CBE8F;
	Sat, 11 Jul 2026 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788059; cv=none; b=SHJifzfUcHx0c/E8ROyxuet96dprSBJ5QIb5UGxnFwUQJdxZRn7v0cR17RXiu6rkWMjV8/6b8/obVsMrD2VA7KW6Ei69aAzwAskpUp//moW43/w95QxndVSHVqbwWztz2ZOjpRcTXTWnDR3qTHEbgmybJ5A9r3AjQkhdQSDt6as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788059; c=relaxed/simple;
	bh=7lQAVVqTCdk+oS0mwBqwXnb6/mo4KstJNFyBO2WAKZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EvqD2yg5Kgu+S3eIx8gRxZZf76DTRZVE++4SSAzoe0AWA1QtfvP27wiYdRicMHWElacXm9WZ8umai0Cvigazo/v1FdBmWBm7YuxTb0XRakVDKj7/rDo1WKnsljXEkQ8OQavlG7rE57tz42Y7AMB+5LTwE4AEpWPiAKpYGYd06+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlnJUj2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlnJUj2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09671F00A3F;
	Sat, 11 Jul 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788054;
	bh=osDDlEG2z0Rbu3XY9WfwOYVuDOqxyzd5wCYpia7MA4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZlnJUj2wyxr83BrE4qg/GmZkG7ufxNlVXCY5XQfqPSLznjxSromz++Uy3oIWY3kZ/
	 8OCTyWUISeteRkE6ytc9Pol4WgPmxpgtoPI5MYdI2cfv4uSxJL66NEgPE7bakYBlyi
	 ZtYwwqcC6KzdZk+mkUC3LVH4b69Tvcj7Z7tJKv4hnmbImiJZeRM+MqmMA9+YeRhG2P
	 ZrgQC2dRscIVhuo2FpJZzcxGFs+MPwSRzu6fdbLQQUZBUKobZG4BzlzCBy3KLl7EsJ
	 jAEE4UCKaHyTWHx8s/Y9su3iA8gXgPm3oypDzgRiJY6C8/T5ZphJ4U4emUVxDyqamc
	 1fygnQaOyWaRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Lina Iyer <ilina@codeaurora.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: manage PM notifiers with devres
Date: Sat, 11 Jul 2026 11:40:41 -0500
Message-ID: <178378800454.138068.5206045720298101845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623015501.31129-1-pengpeng@iscas.ac.cn>
References: <20260623015501.31129-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jun 2026 09:55:01 +0800, Pengpeng Hou wrote:
> rpmh_rsc_probe() registers CPU PM or genpd notifiers before populating
> child devices. If child population fails, the CPU PM notifier path is not
> unwound and the genpd path needs open-coded cleanup.
> 
> Use devm_pm_runtime_enable() for the genpd path and
> devm_add_action_or_reset() for both notifier registrations. This makes
> probe failure and driver detach use the same cleanup model while keeping
> devm_of_platform_populate() responsible for child devices.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: rpmh-rsc: manage PM notifiers with devres
      commit: 75e918aa876440d8ad559a11d6ab87bddb1ed79a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
