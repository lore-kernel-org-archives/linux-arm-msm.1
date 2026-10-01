Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5A841443E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835134; cv=none; b=hwOa6uiwOcqPaanoAZ7rREtrm9jE1f7BxU8CEAP1sz8/5vqhY2VtwLWj1EUQA89CY6/fTiW4olD6530s19Gw2sWemCifmg/+OtjUoHHLdkNRPwvipxTQqM363wrHj4SdJ9E5j7bVLGLBn+8XRcINoRLDeIpjn/NpnrkiIyGtsmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835134; c=relaxed/simple;
	bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nj/zLKnSj87k/NofvTvbYGff8AGklQJiEle8+OelzmdHca0ydYrO05ghmooWKlgdc25ma+I4g7LKCFQfnPPXsIdFleGyA3CSAwz9OplLI6yOq1PeBqtl4EO7aDbBLVsALqCm15E+O5sxWYi85Cep1jAvyaQlfjQZSegWT7IXB4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F88PohOu; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F88PohOu"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8484f12cso59680525ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 23:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790835133; x=1791439933; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=;
        b=F88PohOuSLflNqgiDJ0r5rx0Y6H3ckZZH0hbjrRMoS3nh9/a++qwpRc1kUcu4Pb56Q
         xx8gXpNjHgcHoCpcq/UalorW5D/S2hVsj8HODObscFrWlIMcZ6N9oYZXigYH6gsGSRJk
         CI1dbXdzDi+ihqDZlE3LEPY5KU93p5F8eikyYAjU7F6vOx7ITEnNsKy5O+7RnwIoUDV+
         aQ5IjwUS0OyO4Riji4aerILOcxxymGBhpThn+2b0xZqos8FVny6UzbrLzAxM40STloGC
         RAytSX+uqOa/St+NTyoaLv/E8gYxvCV/gajmj5KjVoB5d1F9GDrNXnlOgwLaHr+1gjr/
         7SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835133; x=1791439933;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=;
        b=0al6qlwfCqVCIiqWqYaFRpp1rX9nb9+Na2DOel4gbbsVFxfC33Qph8/SWpGK9YAU/P
         gSVEOxWV5Qwz78M2MVV0dQsjYqLqoWMQVG/fIFfdcYSdB6pUIgKEoN5OzKa6hoMWxuI/
         YnRnGenz0pdCUPmAaD3/ur0A5k5rv4KclFINfxdXq4uwj2cxHMPfsU7R1nk1jPElK5Rc
         VuEJY5W6/r8qGyuruO5baysZ3JTP8m8Ba9JeVMlWwErSOWdEbiazypEKsuhNPD/y1k/y
         Y6qXuJSiY1p5Fl/7dY38xOw1bABVzpExNTIh9bqjtjfDhA1CNwg1r0iTlLJRPVO0Iyfq
         NntQ==
X-Forwarded-Encrypted: i=1; AKwUvBzANo1cEIf4vpwyJdv3hToECLeUTCYbocqQNAeGPMCQcPgMjmyNTB0W1pAn1gzfhqF2snO/dIo0PMD1uPnO@vger.kernel.org
X-Gm-Message-State: AFq9FYLQNcz9cp9YxGqVQXVVi9MKS8HaxE94VBr9fGV90Qvvfx7LjHm+
	2o2y5k4gUjFAM3ASrLcqfmw/+XQfJ2YCrNEBPMqjZpaUdWR//yDDLh2bCwC5dmfL7u7H6kfnSf6
	JDdmF7SS3NYOCNI0X3WBWzw==
X-Received: from pgbfq9.prod.google.com ([2002:a05:6a02:2989:b0:cc7:a60d:9a9b])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2c10:b0:2df:ab36:f145 with SMTP id d9443c01a7336-2e2e4bd212cmr32095185ad.68.1790835132740;
 Wed, 30 Sep 2026 23:12:12 -0700 (PDT)
Date: Thu,  1 Oct 2026 14:12:10 +0800
In-Reply-To: <20260929100946.693962-5-larisa.grigore@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929100946.693962-1-larisa.grigore@oss.nxp.com> <20260929100946.693962-5-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001061211.4142384-1-stanleyjhu@google.com>
Subject: Re: [PATCH v7 04/12] ufs: host: Add common Hibern8 TX FSM polling helper
From: Stanley Jhu <stanleyjhu@google.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Pedro Sousa <pedrom.sousa@synopsys.com>, Hannes Reinicke <hare@suse.de>, 
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2026 at 12:09:38PM +0200, Larisa Grigore wrote:
> Factor out the common logic used to poll TX_FSM_STATE until the TX lanes
> enter Hibern8 into ufshcd_check_hibern8().
[...]
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
