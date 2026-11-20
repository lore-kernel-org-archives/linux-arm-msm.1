Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212035;
	b=2t4nz43alk7pwppX/FPGA/fRnIS89pgNi7cND0Ms43Rn/N4mmGdADCXazCAPxZTe9hQA
	 ELk/AJROyfXF21Fgu3U3WlEHrOsXYp7BBldeaC4dMsAG00x55nBjR7dnp4mTmQpZv+PuF
	 qG6qOe67hkurypbtp4UWVDwR32Rm64gN2FlB7v2T5Je8O6l5JC4kuGolo+lH5ysLK/T2N
	 ahhSTrtlKxmJWZn1erzjisCWlhbzshyrVjdMfGO0BYetaMM86XUnJBS0tVC/BXtQSTu4W
	 Xzy/Fw6dbabdU9hoj/VkWOSdmyyNa8+NQKGC1NuacSNnVtKEsAOiKaOL+OHXuDRs25Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2xDPC6qU1uwq+PJaTb5Go3aqyR32791c6Eohq6KP4zc=;
	b=acEu8UlxPQIXr5uoxD2N6TL7yvEytKCVdZReBQGUOWSGh6SuGzC+u56zWMqHGwCXsJNI
	 csO21jnQpEwsU6EDQJvc3/vrsMWgAQu0rNPLLyb49uHVSHzlC7vwKvYQqQV58Zfz81a1l
	 j0sjq8WD04VUv53tW1LwjrXewvbalrj2AQ4vByuT9uMIkArf90/JqbbI0tuGZFCALMc9l
	 eNEZEEDRVWQOvQs7mWu6ikbBxplTLDYbEyqqOF1f8zJwogHrCAKgXSDKmmRiT+CY4SONb
	 XAJvnoeiaaM/USNR6Q76LFbTL18uilRUDvjs1MerkQlWzG2VQZdF5cHsQ2fdwWtAgow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CFGSxRTa;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD541606A6B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 22:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD541606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CFGSxRTa
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc91ddf447so491892137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 14:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1795212033; x=1795816833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xDPC6qU1uwq+PJaTb5Go3aqyR32791c6Eohq6KP4zc=;
        b=CFGSxRTa6bXs2QsYxgQ5v5d73J8Lj+epxBHOHXX2mlDR7UWb4MxwQ5Bm1Pr7vzdrwh
         r8USXI5bJ+m7mAwuDd1B5apByZPbv5TxAApGDoJcZyE6XihUvV8Ok3s8poJO6FJSznlk
         0Y2S3Nw1+LUcDT/xigP5IqjMkya5XQmdJNer8Ry7ph2qGx2p7PHSbRfVb2c0lJfxBSgY
         yUosia0gElcX1WJ3sO67PttycNQBvwtTqGzyWL7w8N+GQX3mpIDDGSGjSKvm0Me9P3eM
         NS16tg+468SMAoWp3Xi6mifOowze35Xbii2XDYmvxmnBOjoBv7RR3hGpcpvqkUNzesj6
         B3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212033; x=1795816833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xDPC6qU1uwq+PJaTb5Go3aqyR32791c6Eohq6KP4zc=;
        b=fiECwPWZ4bsDWuea87KvWypmXC9L6g77NCp3OquGWYVKS7gBanbrlbFHi2372fjAH9
         Sz7QcgLDxWwYpuh9632c9r5llgypbctkfLJLeatuT9F9UauZcOkZTRLGE/dWhCGrg6B1
         62uvNymEHC9H/O9zYN2v3HXcfhGJvw/YQn42SPrjsZ0F7IjjSPKwDv58REvx4/SPW2HF
         AZPG6aPBhsGe7ruMdoqJRjR8t8n1DU21WCNuojkN+Kld5s2ii3C6hG9mWp8d/595mgQ2
         gI6hMZL7MdNb2x5cIus9tQShfR0R20h4TSY141tOEt2WZ4xb839R+O74mb3sheEm02yP
         7sWQ==
X-Forwarded-Encrypted: i=1; AL+hErHZ1knN+064D5TZMhpSKWACnxoCpWS4gTn9R6QWIip8+y8xiazcChD+Rm08OJqsH+acxBh3NhuIKDDrZ2RZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+H6oiASlOgj7uRc0tv3LRYqAIIfVS+FpykVenIoiMf2BtejpRZ
	ZBcPcI+0q0suKvpMUKMMvWxtD7zFis7AF92i6LwnZKqjs/K02TfMQTzihxMIBnsWeq7Ufyh2YLh
	RdcWvMpg=
X-Gm-Gg: AZFdTZcDnhF0JsQoQgWQPF9h+sxDPq2/bIEM+7b9gq2zByyW7t/J6Y6q3Br3f4QaB3k
	xbKGzyzE6NFrVI5rs9LL72cgRCtt4DFicNjsHMMA310ejNY1HbaBY/LlOXt7SP0gu9qvfGjcNUZ
	KuQXqUYTGyLDtbDRO5MZp7YHbgFbTUtJJry14jvgIoMEYlHC2Bngslb+mJwnVNiufnfPj9dJyyB
	lvZkFmfmZpNrgOeGjFXkGJS0kpJ16oeMhocQuZme4h1yQQjQs7J3smYgbbaSFgy11tKwWgHKRuw
	ZgcqfsJTwqJPoN3/kXeGIzg7Dm55IS9SBVilg6AU8wznAfVddeVpiKGnnDbljg89WiKiUFc8YAO
	jNLKMnL5qAfZQ5QgptUnZbHRlFzT5CLwslBnEZ5lmyJgfOqNkxWUb0fl8ob+1RgwoncUal1amxk
	L4UGkIASmhOvnduDNSRfLLIV0lXPj2oARD25kv6RIxTrEsIE5GvrkFy54N8gR+sjgEofcHBgEJT
	P9GbN2nkkQrnC4tuU/tpa6jVqb1WelhVsJbVxfbKDcPD7/3a6+V7C7fn26on7jnJYGoyL6tB5G1
	EgKUL6t9OyRLcSsELH62PQdGxZLHcL28s7YFtDBYr/1iz9C13TtV8iQxIYbT8HS97uY=
X-Received: by 2002:a05:6102:5cca:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7d7393a114amr1838341137.6.1795212032547;
        Fri, 20 Nov 2026 14:00:32 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac1:1120:3bd0::422:8])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0a2865sm4180139241.12.2026.11.20.14.00.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 14:00:32 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Jesse Casco <jesse.casco@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
Date: Fri, 20 Nov 2026 19:00:25 -0300
Message-Id: <20261120220025.56887-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com>
References: <cover.1795196107.git.jesse.casco@gmail.com> <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com> <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com>
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

On 11/20/2026 9:51 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Maybe csid resources should contain the parent device index as well.

That doesn't work on the ISPIF based SoCs: MSM8916/MSM8226 have two
CSIDs and one VFE, and the ISPIF routes either CSID to VFE0. The parent
has to come from the media link. CSID1 currently fails with -EINVAL in
vfe_parent_dev_ops_get() (no VFE1); minimal fix:

https://lore.kernel.org/r/20261111135338.27008-5-allan@fatecpompeia.edu.br

I'll drop it if the parent is resolved from the link as in Jesse's 2/2.

Allan
