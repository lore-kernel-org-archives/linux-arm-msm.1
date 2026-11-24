Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489606;
	b=MSuMKxod6XNVvC6ffM1P1/DFk12cVuVak00akswHPEuBormv+BhqpgxF6gwHdugCTI4u
	 KuIWra28Iy3Rj1M1AX1uTkIZzm1YYlpOk9HXmLE+cS/laj16XLs2wj9h5eQQ7znq+Ey1u
	 sBjSC8JwG7/1B4xwzI/ovw+Xt9e6JfjEYK1snv3nRRxzmdqY+T+U+3DW0QDX97rgI2BSm
	 GLF91EcXa7dwmpTxyXM3kvX9wP1aedG0aBC/ZdG46yOpEj7LMXIsvw+fbktgVJ9i9U5OL
	 ICzSpKaWTwspKsRW5+Vz8JPdy5dxUkSpbX/pr4XC+0y+EynuwZ6gjoCRU6kMfryjJDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489606;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yu7XWjdcB3FrFp5fh4tNhmpBZj491YNS8CW9/bACFIQ=;
	b=XciTYepjj8j21tqod6UtYULdfs+dxCcq1/9KMs4E/mPgDTtA/cK87u7Ahf3NVl2Jr69l
	 lNWdqiPz3BRsIHQlAh7iAfs+jUlftqVwwr5v7hJu6b3Kw6yLfaQrGYIn01mie9Yl+2izQ
	 SEIfiVy3Aq4bDRL7bxYtn0KXLQsq6Xf6gNGjTQd6GB7dAmZboH52SSO2QYoI/zTYhCrtv
	 LYJbWCeNyxWX09MdAtscK0sFePgF2xbvWKwIZK7i39+NEVnJErDXgV9BtJWZHgMkdZKqK
	 3TqmlGIEcqL3Ma7nmXT1gWLWIBLYh40GskMHzapE+ttkkXeBVkUHMCwKl9Y8/jhop0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsc75njp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1FF606A31E;
	Tue, 24 Nov 2026 03:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsc75njp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719DE1F000C6;
	Tue, 24 Nov 2026 03:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795489605;
	bh=yu7XWjdcB3FrFp5fh4tNhmpBZj491YNS8CW9/bACFIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xsc75njpAB6rLKxIN0opjTCCX3m2uWghW2tDvRKQD8zv7l+qQz9uSd5N0YrmLJIeg
	 WKsvkwx2ZeXqAfvCsC7bX7q44O42jKZwcrIHfiqsBXxpNFztkM3/2VYFVsW8k10sib
	 RhLKV8t3xpvTlkO3Y24LxzPDmVtHtWLm91FKuMWXI3XNRoXJ0Y+A0iUl8ejGgoBkGI
	 Jqt1dDeuiqnz9YSY1IcGMEEGN/OfH466wZ+klrV4qWtcQgfeO94MUz0ao7crYT34xF
	 M7YObgDHk7AcpHtarCoCFyjEK0H2/sTFcCoXvuRLCdnagsmgcNTp+FwqmGe0TLS5Pk
	 hKDB8DgRO2rjg==
Date: Mon, 23 Nov 2026 20:06:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Julian Braha <julianbraha@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: Build the TrustZone memory allocator
 into qcom-scm
Message-ID: <20261124030641.GA2738970@ax162>
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
> Tested on arm64 with allnoconfig plus: Nathan's fragment; ARCH_QCOM=y
> QCOM_SCM=m SHMBRIDGE=y; ARCH_QCOM=y QCOM_SCM=m QCOMTEE=m; QCOM_SCM=y
> QCOMTEE=m; QCOM_SCM=m SHMBRIDGE=n. All build without warnings and pass
> modules_install. Without the patch, Nathan's fragment and the QCOMTEE=m
> QCOM_SCM=m config fail depmod with the cycle above.
> 
>  drivers/firmware/qcom/Makefile     | 3 +--
>  drivers/firmware/qcom/qcom_tzmem.c | 2 --
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> index 88ce74d74c3e2..74c655856b0c2 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -4,9 +4,8 @@
>  #
>  
>  obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
> -qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> +qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o qcom_tzmem.o
>  CFLAGS_qcom_scm-smc.o := -I$(src)
> -obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o

This basically makes CONFIG_QCOM_TZMEM pointless, it should probably
just be collapsed into CONFIG_QCOM_SCM formally.

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 3ad22f8fc3e5..54b9abfb6aad 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -28,16 +28,12 @@ config QCOM_PAS_TEE
 config QCOM_SCM
 	tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
 	select QCOM_PAS
-	select QCOM_TZMEM
-	default y if ARCH_QCOM
-
-config QCOM_TZMEM
-	tristate
 	select GENERIC_ALLOCATOR
+	default y if ARCH_QCOM
 
 config QCOM_TZMEM_MODE_SHMBRIDGE
 	bool "TrustZone interface memory allocator: SHM Bridge"
-	depends on QCOM_TZMEM
+	depends on QCOM_SCM
 	help
 	  Use Qualcomm Shared Memory Bridge as memory allocator. The memory has the
 	  same alignment as in the 'Generic' allocator, which is used when this option
-- 
Cheers,
Nathan
