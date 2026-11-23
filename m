Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443498;
	b=j3PWODGMdGR3x+wZ3iq//nzcvRAwhcJeSOBrDVo04zxtN2bCS7VVcaIiOkp/sqOaEQlj
	 oeoI0qSYiHK6RYqbDDws60lRE2Vk+eJKqRxv5TRy43xRKqUg06WU8ihTnkx4Mf1ejRuRx
	 FewgAmb7eOGcwm6JfcR5Kp2WozxTBfcoL3wKhJaT5N97iPPwQXMbdhgTZrk8qjjMtx5Pa
	 J/hqmVN+K1zU/wlGD+mrNDhU+SLdb+I1Ek6KWq/PmEpQpcglzrde67/yGfpAkIPW+X+a/
	 KpWcGaZkg1FqSpAMnoLN7hLDGfg0ZwBqOSmpysECw+i2I2UvTeaocAteZ6wwXb3fqlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443498;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PUVqmxnQ7HR4VrpZewYNYzB53YPHv8jMakK6f/4a78o=;
	b=2JfHcN6R7RUN4F6zyexsC5xTp8xNFe7Cte1paC8+Prb8Km8qpadeTZ2bb3zCd6zfSxZa
	 azGYd9TSqUqTG9nYCACMqaolvRVhb1oFObVbupL+E3MV+5tHTsFknVFLF3Or5LugfuTsk
	 Pf2pJqdt9XGp0Rr9ZpVwmjmmWu79kw0h1wfNbMIU7hbzRW0Lhx/0S3nvwaASw81dRL0si
	 93hQjzHxZRPYbF0eLV+YThsEKamJIxVIv++GdkKc5+tkrqIq917+VZd+v2ck2oSdlNX6l
	 IZFgqVZMYBSsVL6nJpAIGvlPbpz/z1p9Shp5KBm5YQ1+gEDUAEQqixkfG3MNvZOZ/Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhI6uYpj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6C2FD606A327;
	Mon, 23 Nov 2026 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhI6uYpj
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E50F91F000F2;
	Mon, 23 Nov 2026 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443497;
	bh=PUVqmxnQ7HR4VrpZewYNYzB53YPHv8jMakK6f/4a78o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bhI6uYpj92B2HRLotp3qq7BEhf1dlKmsLgXqayXudlX4v1xwg4daM/JIJV8odiD+4
	 KvWUI+jVPPVJUs0JnVPydTR6Yg8KW34H1+Q8fQtM61CP36HMmefVR1yxDZA+UcKSAn
	 wCWLsc8tAw7xKPFWr0N0iAyuJMcP+QVV9w5UIjFDbCXKpDesMGxvL6YVH52aNlot0Z
	 yb0v7Qo/5jD+NBbqIqKnur2HQkQ5dzLBn6pfLBqt1bzgEFEy4vy5X8byQQWfPfxHep
	 Z4j7DNs6u9lswZjhFf+kpDAsrOqVsHJ5xfdG18NyK160IfpKd5DyhElph8oRXVcNe7
	 ltolFeDk9oAwQ==
Date: Mon, 23 Nov 2026 15:18:14 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: Build the TrustZone memory allocator
 into qcom-scm
Message-ID: <5opm5625cla4yamlhadvmmel2t4ilzfu2x3fta32fge2z2fiui@rfifnhocq6dy>
References: <20261122152843.1113882-1-sashal@kernel.org>
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
In-Reply-To: <20261122152843.1113882-1-sashal@kernel.org>

On Sun, Nov 22, 2026 at 10:28:43AM -0500, Sasha Levin wrote:
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
> same value. Build qcom_tzmem.o into qcom-scm.ko, and drop the
> MODULE_DESCRIPTION() and MODULE_LICENSE() that qcom-scm already has.
> 
> Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/20261122051636.GA2630332@ax162/
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
