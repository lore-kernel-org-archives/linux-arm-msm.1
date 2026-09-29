Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6378F4FDA6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677393; cv=pass; b=WQnN8mzZ/7oQ1YykO6vn1OCZY0xIXYFm/f7VKkZFCIFQNEW5b9LIjbAMMMgskXMd8+6iRiB6cwUV7kSP1SzkHYrtiySfcYAI7fsxj1J4WqjrAhxoc60DMTy55ZYJlJT8lSruiTEwXqVkHFuACAIeOWSywCecIIzIswf5dlRUTi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677393; c=relaxed/simple;
	bh=5yvYIcCf7rI8QVQ8cPIbS4698MdCz9hYgzlxspOV094=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUuWai5WF+sXe7xW3X6zPm3aoRmHL57cTYRy01vmRXscRmlyGnLXHKrHdsuME3xWDH4rRm6f3+oJHekhiIN6qcAyhhkDxjhoiyoF6siI2i8IJ2CqK1OAOiqZ8ad+pbWHzLVzv8sRy0uHrJJDxVEwG0ksNG01kY5rzolJGfvJgyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7fAtBQc; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7fAtBQc"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so2119164a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790677390; cv=none;
        d=google.com; s=arc-20260327;
        b=KX70EmYQRWSBMl8wPshQzXYzlz2fSUvXCDQz2+pRmBiVfpqJM0zLpjQCJ58NoEzuuS
         /00yPVM28pxYU6XJAoHJUFWu+TmSTnb4hNh9V+W5mA8pXloc++YS6AWjUyNqXaV/DRH1
         uepGlol7INRGydz3a2Ij8zbDkWpvRgRXI8dHo7ohSzt98Pj0pHDbwKanIL8RY1DvNw5u
         NQ2KDfLBEbvGGNc/6D8FtI8MJqoRsxrTEs82tJLO3wGdOLtS0k9B8/oMXRhY/SXlii+s
         76eoj/u7EK+ikvgMN51eFsLFmHdPDbc5Qta+0eklRkR1JLoVnYTz0BM9pfr/nlw2UyL8
         wjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3sDqKn5ySRU084yOTBxE8fO8xb+zYKz0ZWYKX2x8q9Q=;
        fh=LqF7y6wqxwg8mXZk5GMFCTl66YG+tPjEHDraUIM4Q8M=;
        b=Q2aCwPIcNpChAqHmXzr3FayCrB4JLo4JZxQN4sCNSZnczAJw82cS/KbybqD5t1ajdI
         xXE8e3jNixQgRkPCEUf9LHa46xnEOjQZdr3o7L6ezGqVwaJnghX1SLB9rf0uaLRBM2mA
         lKdMbrbyC3npKVWVsny3FUrE+GiJ0AVV98eixqyto3hLLg9XpQk+8NmhqrHsGtUFd5hQ
         8GxG3pR76u8DX8hkSx+RRIbauU//DIw076tFtUiY11CP3SkhNvaZlf55yoiuMtI0KG97
         RfoqaIcGCdOt21pqg3nCdyy/9IpbEZn+9O4uaeZ8JFmV7JNcV/5abNaDayUB2HpMyCvB
         o9vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677390; x=1791282190; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sDqKn5ySRU084yOTBxE8fO8xb+zYKz0ZWYKX2x8q9Q=;
        b=Y7fAtBQcpEJwhYi2DhYwiOVfPOIN/LogLSKuwSq8CL2EGr8wx55Ipcu6qPAH4tHfcv
         pPNdLR83yvAXH/mYdvgKH1mc2i9OcpEX/wkJF/jKU5ZLlZOQ9fdUzg8tS8Og7XjPaHmv
         8+ayczraCNp4yAl8qZwYPUMgGhEi9YNaeGlImjP+d9VP8TbUqPvdW0zBiq3zMfM/RzPf
         cfRUmnBWljZIw/ownnlU9uarYxdIpyMG71uJXI58chENQ8zJL6BTgBTX3drkgymcHK0P
         GG3klwXOaiOiHijSXHvhGiIuxt10rD4mPqqkMm0DHgFNWWeav9d1JL+qxQzteyCh22zz
         K9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677390; x=1791282190;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3sDqKn5ySRU084yOTBxE8fO8xb+zYKz0ZWYKX2x8q9Q=;
        b=H6vtKFK0Hh373iNRQ80bAIUVtSVm8N3GSxMe4z8Alaq+chqjFzSDIYmkiic/w+0w0w
         BPKv31wK58lW9/vOZFltxuyLzQ5reRxQD75zw2Mu1xjmjzC3JYea9Y00B4QsGabUEGvP
         KErfPn5p6YENm8bMCeEd8GHCeFc6P3VBqV5a4jRHymrH1k2VxEd97AlivcFHyAS7Yo1m
         7CWKZXhlKrwkYyl/FDhGa/emBiu9VQmcyIiQ7DUsf1idOeg+vZbfXguX+l7aUhq4u4qt
         nSiZw1RKEburrkGfgl73osWWPN7R6QtKkrfv9l8kePo8rKQ10M5ORRrfkT1gHl86QD6V
         NK6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNc3CbUN/dXCeSgNYgbuDWP3CZxOUTIjnoihvuDhiWZpcvb0nD4sqj5W4Nlp1tyZeBJc/KCPEYdGXuya7o@vger.kernel.org
X-Gm-Message-State: AFq9FYJmGPtqlSZ7Un5qarFuvgBCQVcZob3Q6wAsSVqglurdSOF1qKHo
	35WzrqnM8F45An7bqVSd666nlJsF0Y+atZ4MvCc4rcpqvwTovHkTMgoRCtqctlGg+RkqMXUTezP
	Rz6taLKbV1MbxMaT7hQHuODcvOn4nZ/A=
X-Gm-Gg: AYBFou0kQfBlZ+m9gjlcO+RW6AiU/a+918+1U0/TlkSI3PgJ4ZIDWBsKIvkpXMF4N1d
	Rs1jBFDyUHJxbV3UCq3zEJAPJMwdGCIyOmMRoqeL9UdUWoJMbWKbI6s4Owb1s88P+3OpepCHtB4
	knsh93fzsLgG+JJoq6iiERlE7mcmXBZlgAgCwuaGDlZR+L8iJ2ZRrnIfauHsniw/oMs9yQcDt4M
	9iHWS0mCHehlNmsf8pO9YiTQ2kEWyyAJosfhCwrHDTcRbPstHHLP2IiybKiSVYxoiNjuYmYn5di
	gfvdIzJjv6Zs5ZqUR5anQ2v4k8+imDrOqf7Acm471KImrArKJ4G3wcSy3H4nzJa17GMobJDmmLt
	BQTKB8nY9dLbxWAeSdy0fzbxzg2I0FvBRQU9ySvTGaYYcshVpzhic9lAAiUyNv7uE01hRZfFIPE
	usZzvnANfmhWdGXRKMJsL5ZQ==
X-Received: by 2002:a17:90b:2884:b0:3a4:b1fa:7235 with SMTP id
 98e67ed59e1d1-3a4b1fa79b8mr141852a91.65.1790677390435; Tue, 29 Sep 2026
 03:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920184148.31541-1-mstoretv@cern.ch>
In-Reply-To: <20260920184148.31541-1-mstoretv@cern.ch>
From: Antheas Kapenekakis <kapenekakis@gmail.com>
Date: Tue, 29 Sep 2026 12:22:59 +0200
X-Gm-Features: AclHuK9_Gwlmf3ZnDmAE_IUdVkrv2ME6zV4G41dDg_SEHlLGligGKipP2rOV9RY
Message-ID: <CAGwozwG_pR-bsEnk60=-7sxXcQm=YP0rV51hvG5ZTVtEpDYErw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Add initial DTS for Samsung Galaxy Book4 Edge
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, abel.vesa@linaro.org, 
	abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org, 
	kirill@korins.ky
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>
> This patch introduces devicetrees to support the hamoa Samsung Galaxy Book4
> Edge, and includes the X1E80100 14-inch SKU and X1E84100 16-inch SKU.
>
> It continues the earlier patch series started by Marcus Glocker, and the
> previously submitted v6 [1].
>
> Supported:
> - Keyboard
> - Touchpad
> - USB type-c

On the next revision, specify that USB type A is fully supported (16
in) and Type C is supported as initialized by UEFI only

> - Display

Consider fixing the Touchscreen too. If I recall the goodix driver
works as is. At least on my device. Update the dbt. You may reference
my oot dbt for this.

I will add my reviewed-by/tested-by on the final revision and that's
enough for me. You don't need to give me more credit than that.

Best,
Antheas

> - HDMI
> - WiFi
> - Bluetooth
> - ADSP / CDSP
> - GPU
> - UFS
> - Suspend
>
> Other features (such as the camera and touchscreen) are also confirmed working,
> but for now need multiple patches/changes out of scope for this submission.
> These are tracked downstream in the meantime [2].
>
> Changed from v6:
> - Updated to match current linux-next
> - Use 14 inch SKU as base for the dtsi
>
> Changed from v5:
> - Reworked DTS/DTSI for both 14- & 16-inch SKUs
> - Added Galaxy Book4 Edge to QSEECOM
> - Removed UFS node from the patch
>
> Changed from v4:
> * Fix previously missed commits:
> - Improved commit messages.
> - Added missing clock line for ufs.
> - Removed invalid microamp lines for ufs.
>
> Changed from v3:
> - Improved commit messages.
> - Added missing clock line for ufs.
> - Removed invalid microamp lines for ufs.
>
> Changed from v2:
> - Squash Makefile patch to new DTS file patch.
>
> Changed from v1:
> - Provide the patch in the expected format.
> - Added missing bindings.
> - Removed sound node.
> - Changed regulator syntax to be consistent.
> - Changed touchscreen node comment, and removed false pin definition.
> - Rename ufshc@ to ufs@.
>
> [1] https://lore.kernel.org/all/20260322160317.424797-1-mstoretv@cern.ch/
> [2] https://github.com/zensanp/linux-book4-edge/
>
> Maxim Storetvedt (3):
>   dt-bindings: arm: Add Samsung Galaxy Book4 Edge
>   firmware: qcom: scm: Allow QSEECOM on the Samsung Galaxy Book4 Edge
>   arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees
>
>  .../devicetree/bindings/arm/qcom.yaml         |    7 +
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../qcom/x1-samsung-galaxy-book4-edge.dtsi    | 1537 +++++++++++++++++
>  .../x1e80100-samsung-galaxy-book4-edge-14.dts |   28 +
>  .../x1e84100-samsung-galaxy-book4-edge-16.dts |   31 +
>  drivers/firmware/qcom/qcom_scm.c              |    1 +
>  6 files changed, 1606 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts
>
>
> base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
> --
> 2.43.0
>
