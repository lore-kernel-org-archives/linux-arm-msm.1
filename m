Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573213CD8BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187319; cv=none; b=eoesMZDmaO7hG0jp5A0OGvv0oA6gE5ln7iRytYz6UsRG7vQ6GwzQ0ztLyakCeaVcteeaGYeJqX3y2lCBBryFanXeZ6V9djhoZulzE5Ys9prvUcucoIzo+R4uyl6m1Gnbi8M+qwmPisLGV6+VYh9MCcfdAP69UHyQrbzTjzwBGdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187319; c=relaxed/simple;
	bh=pf4S8ZgH9+PvvxDZQuHR3QM0QpM39DDVDjfBr1JlGr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tT+TU9pErIK67w2G77hpbPGdsH76kn/H8C2ABTnAmHYkudVPu9CjFoGwMj2n4adCbFZraRk9r82Ee2TiNMOmfgD3B0VfxMociT8eNwUbWBWZ8Q8jN/pMBBJmvgKdnr9qd4px/wm71feFn5HRgTqfmg6qgjNEdJ30WN8ivKwNvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q19gX7SG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q19gX7SG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49e73611928so9186525e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792187314; x=1792792114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pf4S8ZgH9+PvvxDZQuHR3QM0QpM39DDVDjfBr1JlGr4=;
        b=q19gX7SGtks2o2Mpeg6KHckxqyXr9UlqpXJwlz3xAnPyjRLo7qxcuFE0g3JUtTZVo0
         1isDvVo99qq47af98m2wG8CIlzhz21kTMUPkGOmTteMDGMwgtsIkYQVl7RSzFiVwKZHM
         rFhyIcVFoeNg5i5XWkhf3nmVwZ/QCvbeqptNd3Trt+X7Mg7UDKwJN/dw3/QXyYOAFCGk
         uZWGi2rjHhL9AvUUEVfLbSvF4wCc8Icy/+Lzkq6an/0RTMhZh251VWYKWwkUE/EfE7Nl
         tlX60sqstaTp/WCaxI1A480tyykm/jnwcq+zFtuxmrf6sTH2qONpkYUn7+l/tRAThl/m
         lIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187314; x=1792792114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pf4S8ZgH9+PvvxDZQuHR3QM0QpM39DDVDjfBr1JlGr4=;
        b=ljQKhrVWaTXCabEz1haUJQJ2MYgIMzgTC6QsTENLlbRRM1zkBN00upC85w5rJjQvdC
         rriQ11PJWqo94OADFJDkNP8YyLAG8Me7/3ODDmeiSww+kUHnosjQ1DT+zrTAo4pblEut
         EfJ7gFMvN/+Ss6ocWCs8QOwpSzB9Y6Re55rkbrCnhCKrvW9zUTPWxBUZ+6NYzHA9CeAi
         1gqkC7BTx33EFaYnk8SGpOhOIAdjePUvMg2Yt/D99gUb1IbUVVHbvmiXOFnkoTMZyLoi
         Auad1tOIZsOkSZo4etcuA66VytcpPqpKtw2eNL+z0cTYOcpCoMlh9e+htVmn/NyIbkrf
         jaNg==
X-Forwarded-Encrypted: i=1; AKwUvBz9fvxr/GOjoecjNER+UPKAaAez2LNmXKngoAIxobPL8Uh7idSX8l/7jU9d2ayBUhF9IO8ZXzUag/+BwvAA@vger.kernel.org
X-Gm-Message-State: AFq9FYLEJj52VEkEUPtkh8Lu38dmToWd9Wey7eB2oLO1iaMKGUP2W9lL
	kmSOdWt9m9+DySuqQvzc/kkJmC+QFPe0Na9LSk+963VwXOwBIRQerCCU
X-Gm-Gg: AYBFou2wDMVjmF9jbAdTswbJWEXwVZ9Ee4XMctgOXAjcKQDU2TIu2/PSUupMdyMjcoS
	lr2NX+ygrU1LBIGHH43k4bVUoBgwc4y0UcaM6LkOMEvAMI3EMfKejygBgpOVU7V5+bw0dHgZ/Lk
	c6NFB82jsCrno7uXjzf4DSkYa/EL+LTeVX/tDdqsZCR3PKTTtVE3BfrinC9U+5OXBy23pB+8xaj
	EWyCFHGnbNH7uit1ZhOru0ciZVTCkigSYAvgciGohFUqIQm80XjW1U/8+2NMTq7wu32vCX99Sfu
	qy2YihdyZVlGcR6TZKFaYrN1ShD7Ihr6XZnlFmPsdFWeJi7eXQBNRqubPqsgxsNShx2A/JAVS0x
	otzUsJo7ui9ctBDAurHYoPMBUmyxCOdct3aFFQYf597ViiBG6bhaHka9Nv5Kod3rOWxmkqkFBwJ
	fDoTqgeYRR96idlVtN5MfC2tCtD0USbPStWU2ehp5wV0XJHAlvo2pMRGx8Fg/VgrjN+bt0leJVc
	5R41coFK8WkR1YnOdDDf0NMMYtnzD8dZSvONOMv+cA/weMUu7oKUbwJfiJ6KHfLShte1c51
X-Received: by 2002:a05:600c:4f88:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4a1d75fe190mr20996095e9.9.1792187313567;
        Fri, 16 Oct 2026 14:48:33 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b35a6sm169959455e9.6.2026.10.16.14.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:48:31 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	tjose@qti.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
Date: Fri, 16 Oct 2026 22:48:30 +0100
Message-ID: <20261016214830.967217-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5a90fbdc-7106-45e3-8fca-eaf5c60e0337@kernel.org>
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com> <5a90fbdc-7106-45e3-8fca-eaf5c60e0337@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 17:09, Bryan O'Donoghue wrote:
> Using drivers/phy means not doing CPHY inline in CAMSS. If you require
> patches from the V9 series - you should cherry-pick them - sign off them
> and the post them.

Understood. The two CAMSS patches need only three of David's nine
patches, and none of his CSIPHY C-PHY tables:

- 2/9, which keeps the endpoint's bus type in the lane configuration;
- 4/9, which adds the CSID PHY select for C-PHY;
- 8/9, which lets camss_get_link_freq() account for C-PHY symbols.

The other six program C-PHY inline in camss-csiphy-3ph-1-0.c, which the
PHY API path does not use.

So the CAMSS side will go out as one series on top of this one: those
three, kept under David's authorship with my sign-off added, followed
by the two CAMSS patches. David, is that all right with you?

Thanks,
George
