Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67644343FE;
	Wed,  8 Jul 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522673; cv=none; b=dksuyTVfvRKS5Hahb34JbQHZhWqegU1eAJLItNMGx1FDrKCtBccz5QGu5SquJsMVre49UeV5sBnggqqeyDnkWlBbGJWWA/SK7k89u35S3OA52lNXMwUkEf9AISFYXXAUhm+0tsodOjxlBBfVziEZ17lQ5/1G2QJNUIZl9qGTgm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522673; c=relaxed/simple;
	bh=yJVoYGBdIlYxodT9NhCWGLIwndJSNyoBQbMvPxtTPJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=simVOOpvLaKeOFpmXQ6RqCO0bPhGS/1GQS+TI9ypPRsUBcUu3R4SQsGwRU+QSzdlVm4bzdGT/wJxZCvFjp11lA6SFQogyn17feg4XLk7x78BZvcQ8EHRGTccMtorYfCxKqb25LSr8iSSs6Yy56jC+00KzclydsgxyIRDQ3rE300=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBAmk/Oc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBAmk/Oc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361A41F00A3E;
	Wed,  8 Jul 2026 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522672;
	bh=FnTDzU2vRhTxgoSSg+/t0ARXZIRKIpdWN4BA4N6Ij4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BBAmk/OcjqrqUyzYeJyj/S2C/ap75vmoP2veMGXAVLv/yXLFRRmihob0XUc4xsv18
	 SOGaAfYHLw1mZpToBerCzeDpnRPI0d2opoV04KCSScHEHQtxS5kCZI9uguJGDmbaag
	 cE6iaHe95vPVMMGyM9iChJHE+UBRrVyDwEuw5gf5A3kbtqSVF+y4MOJ/PpcEr9LH+q
	 +/EgkPBKFmnTSqvmQ/fCTqLNUcbhdelpHy8JdGP/TEaT4a1hgHS8ZNWoVH3k+70D9v
	 ClkX+0PFv3LDM1xNhdFDybFP9LBdi6L6tdZRdSgLkIXBmOqbJ8tomoLPRb6lwgSriu
	 c87RJEedPbHUw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Ruoyu Wang <ruoyuw560@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] bus: qcom-ebi2: Fix clock leak on probe failure
Date: Wed,  8 Jul 2026 09:56:53 -0500
Message-ID: <178352261565.2235436.16451449129058521282.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620080406.1970447-1-ruoyuw560@gmail.com>
References: <20260620080406.1970447-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 20 Jun 2026 16:04:06 +0800, Ruoyu Wang wrote:
> qcom_ebi2_probe() enables the EBI2X and EBI2 clocks before it walks
> child nodes and populates child devices. If reading a child node's reg
> property fails, or if of_platform_default_populate() fails, probe returns
> without disabling either clock.
> 
> Route those failure paths through the existing clock cleanup labels so a
> failed probe does not leave the clocks prepared and enabled.
> 
> [...]

Applied, thanks!

[1/1] bus: qcom-ebi2: Fix clock leak on probe failure
      commit: 64774dea58969194ea5c27fa639954e551a87024

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
