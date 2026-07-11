Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DC3C3451;
	Sat, 11 Jul 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788058; cv=none; b=L7d3+2Lb0ftxlnXGIaVkD95udTQFNIa3qcfjZb8j45anN+s4iR0pFlgoZr0Afx9eDyajpUHhjhMrbpmmyH7V6pkVGeCts4xM1YFZ5ohtJ183c4biUWcburh5jQkr2E3z+69EEuw7+KpH8P0Uf2UotjWctWqDP/UwhhZ70j+m8gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788058; c=relaxed/simple;
	bh=Qm0dwyYF1p+AfwFruiP8NNbyeHOFzwPvV7o0lSwoIUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AWV8n3IalAyM7K0/wAFrVfQ3Bxpbl5lAAH/Qkwj4bFo2KK96pmrHKZOIDiyhtw9PislE9SBoaCkeVcwhRy9/UIKkZIAMRvDBIIin/oa2+W1f96FPKg645+KeImKE+G/ZhoeDV4LKKRKq35UjkaZArW6RNStl1/w2727TMbKt4HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUnlKhGZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUnlKhGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930A01F00AC4;
	Sat, 11 Jul 2026 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788055;
	bh=whzJt6Vhv1jhzZApuy8pQLYJ33OkfBpmMcQ/isuFQ44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YUnlKhGZzWUfior3gmETNva8REnt+prLJDKH0i3rsywiTEOCBzHsilgZbIrZJ/Tsl
	 DjiKY3ZbQgzOO+juU7B07LNskQvE9QfdqWt/QMOv70EVRY5cNe9NYlhp+E+uHTI1uQ
	 LI/9/FqKbbvYZz719R0MSL8WLtGh/syF+kazUM4OkGBUNMf1ZeECjm2TwXaobdAk5W
	 ogT1zVukDNJjmbUhLcBX4M+xgOhBQa7BRh5uTv6DfgaXnK1LgG/PWWsYLixf4h3C9C
	 4KJMjdNEIJpxe43AXHrSHCGBCXjDURE4PxLXICd3izgHNkg6pTMB623j2Yfq+6qwuP
	 9vG3NxrYvkiaw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: qcom: scm: add tracepoints for the SMC call interface
Date: Sat, 11 Jul 2026 11:40:42 -0500
Message-ID: <178378800438.138068.7175582268598977713.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
References: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 May 2026 12:08:58 +0530, Yuvaraj Ranganathan wrote:
> The Qualcomm SCM driver is the sole gateway between the kernel and
> TrustZone firmware. When firmware issues manifest — unexpected error
> codes, calls that never return, or WAITQ sleep/resume cycles that stall
> — there is currently no low-overhead way to observe what the driver is
> doing without inserting temporary printk statements and rebuilding the
> kernel.
> 
> [...]

Applied, thanks!

[1/2] firmware: qcom: scm: add trace events for the SMC call interface
      commit: f6bb2daa4584229af155c2488b83151999315293
[2/2] firmware: qcom: scm: instrument SMC call path with tracepoints
      commit: 41329e72363c02facfeae063ef304aa7ced68c3b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
