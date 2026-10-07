Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD1287247
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 17:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394188; cv=pass; b=gpY3HeCdTUiaJ6Qp0zEG2wzTTFPTQKlJveVCedL81Bll6A2n8494TYsCycn9MhK5gA/joHAKS9yol4VUggAESvbkaYKaa+ec7YVklebbgQRm1EBAGlBUj7pCEeon681u63YADGnLk5QFjeA5r4TeJfOhkI/BbVSNA/5XjTlvn1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394188; c=relaxed/simple;
	bh=zTRKIT0s2tS4ywlRW4Caixv+Mc/Gnk/vX5KSCXqaq5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGVnUobtK4ej7mvHiRzDP4bGsGRXgyWnRxFYy3rZj9+spJpAF00eI/Xy6WaDTNQ5G163AbRf5U0nUJu4nkxf1AxTPPpbD6LEjagCyUI9d94BsWNEcgeB/ZMb9CprxImX12DT974M6RZoBF1KlEcFvGr0a7Q3Zjmi+GpG47Bxbs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGaUx81Q; arc=pass smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGaUx81Q"
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-824040a3379so1977382a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791394186; cv=none;
        d=google.com; s=arc-20260327;
        b=YvRPE0zewRAXG93euhjPjYnlblmeix3K1iCjX6a25Lilp8ldLUzdew2IKbDDwnj349
         bonCbvSGskn4uU7IePeTQdyDzxEttRxkJ03eCw81V5yoDrb7TTNtM+zgi9DFlc6m3t8m
         VSDci1CI7pmM2LovGq+Av4l9fTIdiYcS+STssnLi2JeKDeNJqhpNNs5EN6sYuQAiNRtG
         CdqzOnPo8KBaczayEnzS6YpnjyIdN5jbBtFNFeD4T0Y3LWV5yOz6ukQqpY3C5+/tt08A
         tcuIiiVzgT+7+WzgbqZA4S2c+mDVXb2yRYi5/TCGKfF1IqQyKVc21maIneRaOZHl4Zpd
         n6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        fh=PcHX1jZU8AxMzPJmO2ACtQME+cLx2E3nVTJc8syWp8E=;
        b=I/OeEVBWNWfSeSxc1d9dpcZEbBTPgwCqPTcZdqV5ZjZ3DdXpGZ7HczefZhtMhLivd1
         Wze1ng6MbZOXYnzyNR869KmI9MFrozWnj3hYMJRA6Pd8RCs4NfEyDdL/768sRMbrV8Ee
         jUfTKnR13DY30kvfR0NGwS1ZqUROQxE3OU8j43mYWsPuXsS+Z68HFrBdEYGeGez1GEMB
         6/BN2zT35K03zTuwc3PQn84XAWhBN6F5xjvZKsALWSZ/67ZqgIsYP5F3uHkRSXCDGFS3
         sGCOUgyw3FeiEhxd8uPrbYp8KoMu8PZunEeHrsv0uu/l/xLcBPDlxyswyTpmFbH4WPMJ
         lt8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394186; x=1791998986; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        b=PGaUx81QKnvLqC7bDwSMY/z8Nqbmf6a+1L5WRxFb1rx2cSujFAT/MEQJMI/RJL3y07
         gvUq4QLJn72zWMVgplmXC/SPFxlPh907Oz7qJrTimqwdp6Zxj2fPwpi7kq8vH7WuMPw0
         r8tmDJ5o5pFgd9+E3AsxKHZ+Xulw4mkDKh5YoiL2geX4CdCL7Un8D5AXDM57+gRU/nSx
         B/fIoHCxu35V2tXPPG6N4suOCYAOqmI/fZSjkyVrEcFIL4doJgxXJbi/xFrlMOwiXkW3
         N/RokhItCo7NiV3XPbeFqO1Jfzz83A1bxBiO8783IXO1GI522ttLAjnPycIXu8AmIwx7
         kjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394186; x=1791998986;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        b=jH9q6p3rch1j5VFKZRlNK08cc+gKqz3jZ+yLuLDdKVlN+/61vWKLlFGaDrVdB7AAYe
         hN7kZp2ghhZjt/KEYB0DxZCxdFwD5qFlYNFT6VJvFS+nX26YcK8tU+G8NDJ6qj+qv2SO
         sfg7z/g5rzr+yZhtNjWBoVZa9XwbyFBfnE/oXVUX9vvMSlpQyZulrE0ama4uSG+6SJAx
         jgo2kxVTWWATYCnlMVVCNfcNLhBFoWk0IKKPJCSGfM3iost7VDR9a480r396DpCmCmGM
         qL5fQZPLMZqzO9ySCUQWmZyTkcy+ql4FGdkHgxH1WtntZao9MnPqvThZQE5pXq+vMQgm
         oNqg==
X-Forwarded-Encrypted: i=1; AKwUvBzVWUzsHTD7XBgXz4DO+zFskFgZFNVqO91PrAmJpc6AOCYH2yYBecKvmiqyYgzoE2WoiHl1C42wSugaFZ/I@vger.kernel.org
X-Gm-Message-State: AFuF++npRxSykm/5uqqqrrzJiEiW+kQKYnFO1jTGP8CtlJTZH6m2NxN5
	fuQ3E5/ym97slHX8J8Licdr+c1fmuWHpTwQbGp+KeOUc4LcRMudpuQOkEESmult/Q1BZQcjNqRT
	tKH6u8xjy3eiKatgxlG5SSJqqu07YETs=
X-Gm-Gg: AYBFou0OEBc9NtKc3xU5bZfDFw+sNY3Sbw7MAZOU7fdS1ppjriLeDfCFHs7+5B8gTrI
	Atd775owuSzh492XU2b0WNvKYbTb+LBzpyeY8XFIT+bLJJQzjm2k/ghK4QyorjB42w8QM/Ck2Ax
	PpRL4EPRWuVDT25Y8yOkg981gCEcZKn5Kp9s77yTYicxcCF0k3itWEWVqYe6tyCpItZhr/I7nYJ
	eBA638KmCydOTONjpsr/lVrJhslxGrVP4Lb2uL8WJJAeif3nClCNx/7/VFyD/abUM0sZa1Y7xAD
	XVCGqrnHAHTl/e/r9RB/xH7T5NJzU6jy/XFNiY5G1yuomz13cLkuPGR7TcqiGOAWY0Ub1dV92Aw
	0TRNBN5SQGeF4wQ==
X-Received: by 2002:a05:6808:4f69:b0:4ec:ba7c:1dbe with SMTP id
 5614622812f47-4fc4729811bmr3186518b6e.66.1791394186597; Wed, 07 Oct 2026
 10:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
 <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
In-Reply-To: <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 7 Oct 2026 10:29:35 -0700
X-Gm-Features: AclHuK9vHOpqv4f2YdIvTFbohefG3iRaIeqgIeMjJY_8igy6Stps8jGud7-4xKQ
Message-ID: <CAGEkeHd_KRRUZ8Kqvmf2BWF8stVg=_FSbx701ibS=KdoAy4FZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil <hverkuil@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +       if (!iris_vpu_watchdog(core, core->intr_status))
> +               iris_vpu_disable_irq(core);

If the IRQ thread records a watchdog after this check, while
disable_irq() is waiting, it skips enable_irq(). The hard handler and
helper would then have disabled the IRQ twice, but the next power-on
only enables it once.

Could the helper recheck the watchdog after disable_irq() returns and
core->lock is reacquired, then call enable_irq() once to balance its
extra disable in that case?

If you use this approach for the watchdog fix, could you also add:

Suggested-by: Hungyu Lin <dennylin0707@gmail.com>

Thanks,
Hungyu
