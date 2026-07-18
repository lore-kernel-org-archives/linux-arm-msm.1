Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41430F932
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 23:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417339; cv=none; b=B68+83xU8N+34j4MyxR7vuEILI2nIQkAsK7+IQtyLuKOBzaCsotFlnrHrI3aGKd2+xoSED2KUhoOlFyf6UF4cIxm1IyPm///woDHUXXhHiUV3G0cGtZOvkd3hnFeJyRhUXMVIpYkEiu2v9653uUjzHPphxYQVR7f86SDEA1xqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417339; c=relaxed/simple;
	bh=jo9g2GDI/6NeeN99rn8z6/28nXe9vk0uAcnKw2N4GC8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eQjTSg3w8UE/WxRVeLx6VfoaeIVay+ttEJvgcB4BWXvsUQo3JO+gQYlGSOJnbXitACmDvX1xDfYG1DLYM/iAnqomc+C4Vsq2P5Xf/TnoiCw1oB6CYlRxNFMv18JtOGsmKOJeGp3jGK1+19zPExwxRKm0bBoSU+2lUpFi8T4oQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=frmobMaZ; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="frmobMaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784417327; x=1784676527;
	bh=jo9g2GDI/6NeeN99rn8z6/28nXe9vk0uAcnKw2N4GC8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=frmobMaZIxC1WXm021Mj8/MUfvktEd3tKzb0XjBD6r+DWrIHHlDRUYl5JJ2MR6CQF
	 W3WRu5hEK1ixmqhKTQseGv1FDg0HhLQmQyD0MI0nksmwiz2oyfJqWWTKXbr39J26iv
	 ZNK+ZG0ZhVRNQEp5GnsbpIhpXkA42YgyCDcIYfifzVuiKVjXddIW4Qp8f42Fp/Dc+0
	 3mIIJcbZPxKOeCuQNmjUf8qin88PeX/D8AYJWn5JsorCXoYVg3I5ijMENcZDO+3nRh
	 TnHAn1WLKzgqJP7zSQ//MwjvrraQCbl8REO+JxiuazNbGulkYC2yPepEwrDcisgqBN
	 ADuRN6ucmcNhg==
Date: Sat, 18 Jul 2026 23:28:43 +0000
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
Message-ID: <57bece3e-cfa8-4ddd-811b-eae271b738fd@proton.me>
In-Reply-To: <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me> <20260713-sm8450-qol-dispcc-v3-1-56fd05822270@proton.me> <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 4b7f46a2be7eeadc0406834d95ffbd1b2879a764
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/17/26 5:02 PM, David Heidelberg wrote:
> it's likely this change will be safe for older sdm845 too? Comma.AI peopl=
e have
> it applied downstream on top of 6.18/7.1 [1], so I'm wondering if it's so=
mething
> after testing on available targets could be enabled for 845 too.

Hello.
I'm not sure, since the patch you linked modifies both mdp and rot clocks
while I only had to modify mdp for SM8450/8475.
Both clocks would have to be tested to get a verdict.

Regards,
Esteban

