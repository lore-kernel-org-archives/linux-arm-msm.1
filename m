Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F178B4D4873
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 21:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792360613; cv=none; b=Ezn3ums21dhhGpVmRR0xk58UOBg6nTB5xSNxkovPjcaIFP1uPped+GbwguIna/YJ/pyO/SjjN/5LBah69/cufxettS9ZYv7SN9GSNc7sayA0ubFcEDgoUf58sm39nX4HkfCK/ZwN5ZaOX26APuBvRsi+j0qLSaM9Lx6oaBZgJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792360613; c=relaxed/simple;
	bh=GPuST2lg0n0E0s++DBETZe7atvtvRXP9mMNzFPHYaTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7flKNoAFqCXmxSakM3TaqkVSRT0MbOeFce/jtaZleS1dgBjCpiaA6ae+tP4JlhuEblVIKgH92rg6nvMK+0k1QRNIyktS6Ft4Pf6xbAFfOGGpRJej0II5IrSLGuwFjaVxqhfj4vTx2IaTR9AUJvT0D+yVL/FzeOiER89jgZT6j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkuZ9Q/5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkuZ9Q/5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so8144725e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 14:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792360610; x=1792965410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPuST2lg0n0E0s++DBETZe7atvtvRXP9mMNzFPHYaTs=;
        b=dkuZ9Q/5Ru9bka7HA3KLJEWF1aipaZIimkgOkFJAHjH3/wRansfkWLXR+GfG6o2faA
         gCBad3VKmOXsdjqj4Cyn1Yp2BjDUynf2fBU5TWQGf8YY45MJeXmJqbduXQ7vkWzVdwe9
         /eOZSB/E6iYJLNdvHpSK5zagER5QSOGnhftVvZUnE/0UsBoyX07A53aaOUjxes7mtqzO
         LNo908+YVCyRSGtkPeT1H1WfY6XZxuz7+04u1mow0sBwM2FxktdqZaLX7UPGaNbKU2x2
         Uqw4XlK7DKTKHF5tMH2f7UuCpKzKtRCNuafVCSzPVxZd/Xh8wC2VuzyRheZIB2fVlvUx
         LFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792360610; x=1792965410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPuST2lg0n0E0s++DBETZe7atvtvRXP9mMNzFPHYaTs=;
        b=dg3H+q3IcKuAk7hBAkmUxeKU465fgT2ApLSByGWF7Gedap0wE9p8bTMkc6xACwh6lE
         lS1g4PlKU8rU1AgqvLrnCiBGvhqXwS1gErCqnbCyw//Q6fGNTpcLf3Ffy2ZIC9ZlDSJZ
         88cllgjgwp9yyVwP5mmDY/gOQuOnrETINDZ9by4/Kl7w7xxf1BlGYIdLahTRz1E3GXda
         Bvc5PGE/4XoJHdwuJiiAE32uvc3DH4bcz0DNl+/PqkX1AmNGYmdT4WIAt7WhC1h3mDAM
         dWdMEMbhM4idzFO0qMoMmxYvCafw+1KZCZ00U6cE88BDs1bvU/va2HW1AXoR3ji2K593
         jmSg==
X-Forwarded-Encrypted: i=1; AKwUvBwCBCTSbWbkwnfC51g5FkpFC4Nf/DMfSA5TJ6XyHvnezrt3vCMKk4G1kDciUT8iTrFfL9ey+lvlYqg8FI/u@vger.kernel.org
X-Gm-Message-State: AFq9FYKZmKeizEYqNxP6BG3ebihmB+1wd2hOF8bN/yLPUvKDhzrBcd62
	SGLvaDmXbHZ/cNGPpp56mC5kMHvAu7zMua+O8agFsmj302J01uc+VA+D
X-Gm-Gg: AYBFou2UxLiZ4LFQoO2279EbZN1kB4OGc+W/RhVZifUs8O5YNhy6zlBqzBZMSgg0mIW
	kVoHNCUSsBipEvZFO4VaIvCcJduyJlqVDFk84pA8uStaQktGlGgRRuDmlb0JjnSJm4UHSOtvl66
	c2XRDsGfhoRIBO7zGbr/Lln6MXNrTyXf0uEP59UnWMRiagZoLfhiyDKOUA27BTmHR7cNH5jQpF4
	YwH8a4RTf0YsXVMPBU5SluNXqnNISmuEjOfzwPjr9hHoHXf1ew2PCt3b3ryztmMXnUuV/vegm/0
	RCtXmBUfAW2lIVx0zkPa0Eyy8IPY4Tk6Ga2JWNNU0/evu7qM/P5XLuhUaw2gcWBHRnfr5kh8Cho
	0Q5EOmPSPOyyhp6JMcqZp4m8rA4RZ//Ehic986EmjhepsTN2s5MXS2/6HhSdjziwOfyJa3stwQw
	QWwIjkPMINtX1OsQlUi9kX02z9EWjk0YlIbaCQWOGD30nOobAEeZhYgUA4f4i1WQX6cStevCiYe
	SQK5GclZO05siiaZZOKiHwlyaiMEyROnT+uTLGg7Zc2a/ytR/HkBvfmfM+HzClGQCWinNSnzE2u
	nMraOlJdReg=
X-Received: by 2002:a05:600c:190e:b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a1d76106c0mr131795365e9.25.1792360609943;
        Sun, 18 Oct 2026 14:56:49 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm278449055e9.0.2026.10.18.14.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:56:49 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: sashiko-bot@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: keep vblank enabled when entering self refresh
Date: Sun, 18 Oct 2026 21:56:48 +0000
Message-ID: <20261018215648.1329624-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-176261@kernel.org>
References: <sashiko-outbox-176261@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the review. Both points look right to me: the self refresh
exit path in dpu_crtc_disable() returns early without
drm_crtc_vblank_off(), and with vblank_disable_immediate the vblank
worker can end up touching DPU interrupt registers after the last
runtime PM reference is gone.

Please consider this patch withdrawn. I will look at keeping the vblank
IRQ path consistent with the self refresh entry/exit (and the runtime PM
reference) and send a v2 if I get it right.

Thanks,
Ramón
