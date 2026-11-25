Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623261;
	b=05m8XndzlIPI4vs5knyHnNJEx6XqeEntmhqAaETQiX8es1yrA3PXtmMldDi/qkvbFnDR
	 q2y3HZ8uEQxvyz1xnMRZWopBYkOysbdKWSuerx/hqPBaL8qEPWFAfZ0WsCRn8eL09fs1K
	 Ng5tvau4QZdXyc8PUGkLoG/yh5uJxmzATqcW11rtmg1p9w6tcNnn8VW1RZbPSilcOtx4R
	 ocP8nATTKcJy7AFthes8VNxzxcteR9wLystXKWCW3IMtrcmV44iqUlzUhWPeFvcd7nGei
	 CjIP8RVeLomuqFkeeYL7zgaxnb6cdLsx1wE3ywiyPbTL41Fy+Tfxu5uAjadM167V/tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623261;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=97fIQHpa+8FojcBvz29QJz5a/IzxoOUozUYcnaXlEBI=;
	b=kFBqg1IGfJ1DyTKbPRPFgqhwTOiM49AsdmjDQejPhQ71P4oVrPVJuCpleXjN6F/Lq/a0
	 31yhg+p/ybDiA/n0kZA/dOwkTBAiATr6/NdJ70J3CvshPEBcfw56ZvMdUCJ/BIWAxPmEU
	 QwdGJFfWKfrRNF3wNvcrIfjcKpjgG2cFKcC0pgATV7CfWNryAM+lovCCk9/LDc4x1Kq4T
	 t9kHpK7ic7TR/OMFnIUzu6VK9wTmkPVsSJua+ltwA+fUAMtdcVxGOjTND6Y77dy2LqrTH
	 beEaJv62JI+Jq1JKHSi+AxLapSrjYqYb7NDTXw2uP8e2684ETK5aCXxJ0I6rkgXDESg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dinKVx6l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9DDE2606A31E;
	Wed, 25 Nov 2026 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dinKVx6l
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BFE5D1F000EC;
	Wed, 25 Nov 2026 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795623260;
	bh=97fIQHpa+8FojcBvz29QJz5a/IzxoOUozUYcnaXlEBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dinKVx6lCUjwB7jO4oyb47NfEQDiRmDcTF/cRc9hPFJICpNIMGvZC57sFKUL8Hacm
	 qsMJVH9BpVDQNi8ALr+0ev/bGRIMA2Ru5yKCgRos0QQp/ETUAdvrD1jgxGu/EvpsYk
	 I8OCYFRkKM11pv1XbLQu6B7L4dFN5peZOWj05ts0CQ4mFVLeBVZZFRDVvGZCNPHg9W
	 JyXZvzhUxqCdIiKJPFJ2lQM7vP4FRPYJkLPasYCpE3LdWPNFq2mEBT9sm/LO4TsXLz
	 hCcKFybYX+GMULeBCcfYdpqhOfEvNGWWzHQYwkmAennaeC0tHtzS1Eng3iSpQa9mjl
	 z+Xzgy+w6MrQg==
Date: Wed, 25 Nov 2026 17:14:17 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: qcom: Build the TrustZone memory allocator
 into qcom-scm
Message-ID: <sjd4wjq4umth67x42wxvzcevhjqyfdxquk2drpudyuwzmyiu7o@gvmfua4i6fye>
References: <20261124135913.3358988-1-sashal@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124135913.3358988-1-sashal@kernel.org>

On Tue, Nov 24, 2026 at 08:59:13AM -0500, Sasha Levin wrote:
> With QCOM_TZMEM_MODE_SHMBRIDGE=y, qcom_tzmem.ko calls
> qcom_scm_shm_bridge_enable(), qcom_scm_shm_bridge_create() and
> qcom_scm_shm_bridge_delete() in qcom-scm.ko, and qcom-scm.ko calls
> qcom_tzmem_alloc() and friends. With QCOM_SCM=m the two modules depend
> on each other, neither can be loaded first, and modules_install fails:
> 
>   depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
>   depmod: ERROR: Found 2 modules in dependency cycles!
> 
> This has been possible since SHM Bridge mode was added. Since commit
> 35abc3cd8ab6 ("tee: remove TZMEM_MODE_GENERIC") it also happens for
> every QCOMTEE=m build with QCOM_SCM=m, because QCOMTEE's select of
> QCOM_TZMEM_MODE_SHMBRIDGE now takes effect.
> 
> QCOM_TZMEM is selected only by QCOM_SCM, so the two always have the
> same value. Build qcom_tzmem.o into qcom-scm.ko and remove the
> QCOM_TZMEM symbol: QCOM_SCM selects GENERIC_ALLOCATOR itself, and
> QCOM_TZMEM_MODE_SHMBRIDGE depends on QCOM_SCM. Drop the
> MODULE_DESCRIPTION() and MODULE_LICENSE() that qcom-scm already has.
> 
> Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/20261122051636.GA2630332@ax162/
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 
