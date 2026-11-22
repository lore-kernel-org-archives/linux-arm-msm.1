Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361333;
	b=SQ28balA5jt4T15OJs1JqltBz/anFTCE9rVAlJDl/h9yecTlNlogNJ3yJ5u1DXY6vUCb
	 aRW7lR9FhsgES34NgtF1g8apiZkoiSBNSTWfbZ0STG2MeLqsgPrNu0M4zQPKAFyLmoG3k
	 Gt9nceDLKoN3OWfxH6PjNhBgE7u6Gbf0n4DzrIjpKzNG2EissWyYjz8dxOYppatbWpM+R
	 2ldq58cTu/ByKUZROpVT90g+gMR9g6kOBh6pjXdjoJW9GMNiYWOjX0kS+PtRI0XwbYc9f
	 L0B1wD20itymdEC6z9MksTqnwztvKUfegwiMS11DzHSOxWoltMzH8qxuzYA9GyKsnjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361333;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Gfv7At4jjMFwsxaAXUWVk16GpR4G8IeI7Vs3Zb3cbx0=;
	b=Jqpy5BzcM7WUUPu8l89eyeou0FV69HsNmnNx0ukA39VHDv0c9ctrMDqquFQiyQ3uh7RJ
	 6EPY2SVyquj2IQxKL7oEicSQe79zP5SE1zIsaM/lhS82utF/oLFvEEEoFCK6k61mW/rwJ
	 SGA6LPDElEu2BESdfaR/7bs5I/vXXxPFEvzwQLWt5PN0m0yzFxvIiOLaR0YXO0xoYFQL9
	 sOqm6YzXlDYdV/Y/WxbXfWiULA8J+5Pc34ZDUH4JwJCDxkZ5ORJPfpsHl+Z1bTblvmNyR
	 sBVGeDNIKBf7/crnAXrQczIdbi0BndJHiFXTntldhXOCPhp4LbIY31ZhYHqzXbMh16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PevB3Eay;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2B606A335;
	Sun, 22 Nov 2026 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PevB3Eay
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1872F1F000CA;
	Sun, 22 Nov 2026 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795361333;
	bh=Gfv7At4jjMFwsxaAXUWVk16GpR4G8IeI7Vs3Zb3cbx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PevB3EayB2WU0Z12Xn/9X6nSf6oaVcfHm1xavecXyLUGgIlfHKG30DqDXZ1CtviUQ
	 Sa9care7oznI043Uz0SN098ku0fXyDAPkz+N/u3glNz6mTU5Lq/WcUdtrRv4ioG8zs
	 3Ms+ohlulC3b5jvf2EqtlnrWm+zx28Zte/z+pi7IoQhy8bHZycuAyHH4vJPoegk7Ch
	 M1eWrGiQXVgVn1iTi7Ea5Jro67CUw4XC5tF76X8CKbSfy37Fttze2sobxtZO3L1/Hk
	 DDc/Hzrx01lzJ6dTUSvWtKFYrdl/kO085rYg/AWKpNHPdaHn+H10syI8TR31rEREjc
	 2u3TcYk688E/Q==
From: Sasha Levin <sashal@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel test robot <lkp@intel.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Hide QCOM_SCM instead of depending on ARCH_QCOM
Date: Sun, 22 Nov 2026 10:28:50 -0500
Message-ID: <20261122152850.1113916-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122051636.GA2630332@ax162>
References: <20260913173049.1168963-1-sashal@kernel.org> <20261122051636.GA2630332@ax162>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2026 at 10:16:36PM -0700, Nathan Chancellor wrote:
> This now allows
>
>   # CONFIG_ARCH_QCOM is not set
>   CONFIG_QCOM_SCM=m
>   CONFIG_QCOM_TZMEM=m
>   # CONFIG_QCOM_TZMEM_MODE_GENERIC is not set
>   CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
>
> which breaks the build (or install if depmod is postponed until then)
> for me.

This is older than this patch. v7.3 gives the same config from your
allno.config and depmod fails the same way.

With SHM Bridge enabled, qcom_scm and qcom_tzmem call each other, so
they can't be two separate modules. That goes back to f86c61498a57
("firmware: qcom: tzmem: enable SHM Bridge support"), and it happens
with ARCH_QCOM=y too.

I sent a patch that builds qcom_tzmem into the qcom-scm module:

  [PATCH] firmware: qcom: Build the TrustZone memory allocator into qcom-scm

-- 
Thanks,
Sasha
