Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795798662;
	b=jKv1IFS2sMxXtbHNgdMkg3JkytC3Qui0VPsc27r9uUhooBUa7QQ210b6IoMlV51dNy9J
	 xa3d/pRo2cvpLl3Z7PKZQit+JWuiMkiTEsH2IuswPh/a1K2/HXVbCd+XNn9lWstq/du64
	 RSs+mrF45VjQq0ZE1AdwXDerM88Z1ywu92HSiDCqiWiyDFkhkts87joTVt4F6vFN8OwQR
	 Ven4DmHp7erOMFKDpG8W6e5/MYOLnIMUlgTJ0oTRUbQwHz1y5IwVOdAIktDI5ivKpkvHC
	 iFBdlfcbp3E8bdI427xyZkMlcMDMDqMY8iK50P5X7F08taSec06r9ALI2+InD21AukA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
	b=ZHcLuEyIQzQyud0n/XX5AexV1OBMcSZvivvg7MPu3GXAIRzYFXUfo7co2GRQ/OSNgqIE
	 jFZsUWU8nZYh9PIXtW3GjeLbQoGOIHdVJ7Xc/rooo6wZJNfsyd+3m5WU86RYlAsGAepmM
	 N4aUuXLOYr2sW9IB0kMchdfG0Iz7wkbsFPVAEP5I6gN4Eo7si+0C9EPS/R6Opysa6KnrH
	 AmeXrvGZ9bz0cxvarnxF5W4/bA6EjKDZ7PAOzW1zp1JriEC9ve9aJ0hGpAi0h4qFvQeyH
	 8DuU1+v7WEwWWIEIOdoJBCXIruXDjGV89QRei4BuJlkdt6pBhsmdCqmwAyqQFm5LKDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f+CjY/BX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A28E606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A28E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+CjY/BX
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5430f70c827so96931001cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795798661; cv=none;
        d=google.com; s=arc-20260327;
        b=gqBRa0EkP5NItjE6t8j/PBc/fpMfTIwQ9F9HWHLqpAt5PJjuEprgkUMSRVp2n/h9hp
         HocNf3SwRjsOs3CM75ROk6ppgrjbLRgtSOA/BVunCMlJ+5MLeWjGzC8q6kn19i8h9pH8
         9Z33ODbgr5LEWxdYEKNh+RrAXQ22PHLfnqaGv9muSeUqcfBxDdZEJoTDHS1y/jRqntYo
         BUkFHfch4cyQrkZD5lML19qHfSyRInGptrypK/gzyDRPI9pXr4I7jpz3gMkpwWT1AbRD
         FqEN94+7LVT5f1G7KjDaOU/uE0JPbC4Sf+H8nWS7XJDODEkvAFPHjRRGk374qMwURXhU
         wrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        fh=b9R2eZGsbkWlWsWzNK1JIPkusNUjTRfZXYQvn1F+OgI=;
        b=WeJXTyFVSMxv+6YcHHBmqatX3tHKZOuG71P06DVGCWnKW6PpQS+eifumO9y0HUNVu1
         X5Yqfo2cUwDgHciRevmK1FqUTdq68jW9x8IHTTsqkzGOmHx9R6FGiiLDzotqYC3dQRsl
         LuMn+GAl8Zl9lyvhQ31GMWfSlTgcp83ExOn86lhqmuh5eevDMwX3sAq9zHTAbHovqOjS
         rrDqirbcP19mPO7OCB/uODO4CAZh7DOJUzc4NQpJapsDbihpxibQbFuTPaCrS9Yb1tBE
         cWjCrLnYgySCfb13uTBomnoKZq/BS8jvpWDgEsutvujOhzT5w5YI3CZhGaL9dXtVOA6l
         v1BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798661; x=1796403461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=f+CjY/BXcpKl6jzX9OALdg1mfYorM8PIZRIjW5rU5+YXEtkDEecpk4tbM35O+h2l+Y
         3BySmVV+mW3zLErChy3JX8Fn4SNdfz8iDIA4tmhi5DY7Ki6vPLJIZlQNQrgRm+e7BiZd
         Dr45nSTD78QTB0+Gfx0Yfaf4hrdQNxxnzTAPR2jV1bMjf5ntnpwz9kaD04KIpjR0LYoy
         t5Ky+I4vi9mo4WJ8lucIof1Cx3aBixtmy2uew8gN82rbCeH7WFL4MYtu1i6S9NN1z6hf
         dQrP6ZJu+O/wvnlHDys73uhLW4+ve2adu9/IiRkeEDmKKWgUl7/St2Op+kUmSiTtTpf9
         B5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798661; x=1796403461;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=seTrlQ1s+25jr/KZ+3JCjHfVGV4PHGvb8QKISTdGOT2waCcVa6kP6ZHrQiReoIsXEy
         HmjjySk0dONNxH120kWk1q/fJlKN+ObX5BAoYlKF0HWK/IQ60KWDsbQkcVHP4sp/peiO
         g/tbMSDdBn2wlCje8jOWy7Yf/xsdIzdrzUy00Mw2YK0jtKFyLKwrN5FFropm1i92x88o
         SYLPnmU+zWDTy4X8kuUI51GU7JnVZ1IOexOCVqSMU8n1FFPLeJHBZI53+UenRZs9i2vr
         Anjg2w1HiUixM3CW4HgRu4bBqcYSxDRNSsN22C1reF3KvMiP4LgZ+87Ts3RE9gCr040l
         l/Sg==
X-Forwarded-Encrypted: i=1; AL+hErEN4xa9Xvevb0r4Lc7v26VrOts++e9aspTtrHbJyTVBOxCCVqD1e6K8TmbAT0Kw8jw6uxbe+v4H7FSBQAws@vger.kernel.org
X-Gm-Message-State: APuU4Z+DMtMG0dGUBa/qMFzER8J9KuwYLOiBI3MxI6Gqn9tsbWgrA7ND
	N2Yn7kIv9fg++4Tp01+CTP41eBhd39qyimh7rl80b/RIY0mTvL7SuyB6TNQhGt/GPtzMia8aBRD
	dWUZh5RXcxueJgBbQGUBIjMA9C6McPhM=
X-Gm-Gg: AZFdTZdreoECtNHR1AF0NLojZdvytLRPEsaWXhUqBk+PlXmsKoGJBLifLUjQVmVbP9a
	jeWjgpWbX41Yx37fV8E8qxFLdtjk0Y25p2tM25UuFXeIb5r+aUowrmkQaZVzc/YeDeGUTWxtx+j
	8his0DRqM1aeGMhYvAX6E2FX07GQP4t5n4xycvErANrPxMjh+Dgh2Ow9M+0A6TdMpFsui3OpyYL
	lEPLZtX/6ZzSf3kT3VVtc1NZGzJb6xnRhRfw1+ROI9/MowMestYAR94FxvZ2doRb1MShlaDyqGE
	4AU7hJu+XYWlqzLby9l6b9TAhG/7IQ9+WPi38WDAf9w/ZTpdhXcthAsbdEkFb6HgIuUc/IlqucR
	VzXgt4MPqoHsf+9n9FQGP7E0WVyXaDy4+sfQN5M6TP2v1P77FqAlwnvjHWYRXA6YQGLw=
X-Received: by 2002:a05:622a:5a1b:b0:535:384d:68ac with SMTP id
 d75a77b69052e-55d769e9f2bmr449322421cf.13.1795798661145; Fri, 27 Nov 2026
 08:57:41 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <LKFsWplUk1yOr4M1dEHqZ20-Oo7ya-QA5qkF8u2lcfPUsbJYq0AoJhyjIEBwg6PPzlPSMYfqn6CB-sQBOuQDKQ==@protonmail.internalid>
 <20261127134507.125513-2-hikmahgumelar@gmail.com> <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
In-Reply-To: <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:57:29 +0700
X-Gm-Features: Aa3M54oyapQeOF2CNR5heqj_kowOsQNp9ESIWcAwgObVTh4Yt2mT_qD_BbMY_SI
Message-ID: <CADA=zOPBRrzdST4rwNwejXF9cY8XJUFMXc=+FR5AQMiFFdKPBA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the clear feedback on the commit message.

I will keep "leaving gcc_camss_csi0phytimer_clk stuck off" and drop the
board-specific reference at the end. For the rationale, I will note that
comparing drivers/clk/qcom/gcc-msm8953.c with similar Qualcomm GCC
drivers such as drivers/clk/qcom/gcc-msm8939.c, along with testing on
MSM8953 hardware (my Xiaomi Mi A1), shows that switching the 100 MHz
parent to P_GPLL0 with a divider of 8 resolves the issue.

Best regards,
Hikmah Gumelar

Pada Jum, 27 Nov 2026 pukul 23.11 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2
> >
> > with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on
>
> "stuck at on" or "stuck at off"
>
> > MSM8953 platforms such as Xiaomi Mi A1 (tissot).
>
> ah I see.
>
> "leaving gcc_camss_csi0phytimer_clk stuck off" you can drop the fragment
>
> "MSM8953 platforms such as Xiaomi Mi A1 (tissot)."
>
> > Switch the 100 MHz parent to P_GPLL0 with a divider of 8.
>
> What is the data-source you used for this change ? You should describe
> how you know this to be a correct change - the code is simple and
> describes its own change.
>
> For example citing drivers/clk/qcom/gcc-msm8953.c and
> drivers/clk/qcom/gcc-msm8939.c since they are very similar controllers
> and the 8939 does it the way you describe below. Also "it works" is
> another good reason. Inferred from your patch but not stated.
>
> More accuracy is required here.
>
> >
> > Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> > Signed-off-by: Hikmah Gumelar<hikmahgumelar@gmail.com>
> > ---
> >   drivers/clk/qcom/gcc-msm8953.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
> > index 8fe1d3e42144..8aec5600e837 100644
> > --- a/drivers/clk/qcom/gcc-msm8953.c
> > +++ b/drivers/clk/qcom/gcc-msm8953.c
> > @@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
> >   };
> >
> >   static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
> > -     F(100000000, P_GPLL0_DIV2, 4, 0, 0),
> > +     F(100000000, P_GPLL0, 8, 0, 0),
> >       F(200000000, P_GPLL0, 4, 0, 0),
>
>


-- 
Best regards,
Hikmah Gumelar
