Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810943;
	b=grDJIz8n+nPPvdzcxls2xHThLWrNPfomz4A9sa6G1bgpAONXFbeuNKkpaI2/zyDOgQL1
	 3Fqlf/bY2hKUgiZex26jQTa+mvDzKFB2bc3epXFezTjRz7iJkJSaMcc+GmeP0SNcQHkeS
	 S8qpGBP/NTrksS91p4ozm5S6AykbZQoEbXpWVz7EdDol2TWd3MSaNAoOh5ifzyMzzxjXV
	 xhI0ru9vxrrlUCy0StyJFZwkSg6LlMYk12ioy5uGMLwdHPHoKyki9Ys/4Nd1MpIwnW1gG
	 F2YMrpLeTRDiGtu/v1bu1wpGZsLVecScqZf6q9a3Vw2JhhIUzfJ1K8PSQ1R0XIVCRBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+PRxhLQToLWcXUyw+NCY3cvWXklRjDfoU9EniOYyU58=;
	b=JT5oAl3Z0Jyeo0ZxH0cR1A531jpI2PJ4NysfbpnX6QUAjo6Yds/SDXRQurAcMUrd+q+i
	 mkcYHEXGgRBFSFQhxe3AbBLAgyTVFRlyG38EajOFNtp+We7mfLAJQK6Cx9R4dWCBzq9uD
	 0BHfC5izfFbklSXmRCJjkPZV7UYK7WU/w5bLs0ESuIONw3B6rQEUYh9FaeqL40/oSk/m+
	 MbPord0YAaly4GJzfoRMhR9WBCn60dFlC2B5utM5X5ISUkVwAW6jUgBkhiOIdq2ZEIK/Y
	 kiNVX4joEfMNr6JELV5i2VptjkZToI5W6MkEBm2YI30V73ZZ9lOZPqNyMio7Xb7HVsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rIzRbcbP;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF61E60A2607
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF61E60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rIzRbcbP
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6dde81a6820so1055169eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810942; x=1793415742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PRxhLQToLWcXUyw+NCY3cvWXklRjDfoU9EniOYyU58=;
        b=rIzRbcbPbMwiqGsxcV+MXq9/lITpUyK6c/AJIS4l6eeMNDRT7EJ5s0uou0LSarwDEN
         EyNCuOqc7fLBgYOq0+27E0OWByLrsYp2Fka7Sjemf6EzVJKtVI6BCoq7X0MEIJqG+s47
         gSFivwPIEeNlrDMzXEbsFsY/FfYpvZmwf8H4SGEEr44ZKfDjDEL3U33UzkIkIEDac9s0
         4OqgLOYMhbdlxxAdqJLEVGbgW3pLK9U8Ywg5rMxa5m9Q6QdcWK5Zt+2+3j/j/Oyj0o1F
         2zflNonJsuJPHOmOM6MDKpYY3CJIF/hlZusEz33GmRJnA+ym2RAfd13FQpkxznQspbtS
         OYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810942; x=1793415742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+PRxhLQToLWcXUyw+NCY3cvWXklRjDfoU9EniOYyU58=;
        b=yZlMS/u+EKUdhWq98bmc4e8xbJ/rApWluFulTjpYnqHZfolBE1SXHlInmQW4gdFlk8
         B+xkLcVDQ9xANFu5jLQgaqFCfWqBLMPZTcsHHGOk6Asw8D2tcQruM9mJLgTfASEXbx7g
         grnJxh7/nrUJMiOxu7pxJbECwdJbs4aUsXw9eoLU+jAgjH7KDxPddu3OXhg2sNkH5hch
         +B1xoBi7JAewupdhCL027gTPjs3Srg38SeA1Za8qPQ9hQdNAC88QoWVGvVm53V+J70CI
         8qJVU2p8LIBWAF96fNZW34d7SEWIW1Q4aU+2EHYljRKFOW1TukOz3fUQySxwESKCSXpT
         rqnw==
X-Forwarded-Encrypted: i=1; AKwUvBxd5EMeA7XmdO387YGUaolvN9NW+QZQojvhCfYRcgwdc8RzNJX9tCpQQk9KvKS3AonulUnEWg2GbgaNt7dD@vger.kernel.org
X-Gm-Message-State: AFq9FYKu9hu1373UZc96zE18bKPvvB4HvbOgxr1ol9q2gq8elhfTB+QT
	sMl/UVTxwHda874YNyh97zQvdOb2h53QC4/sYmqnLspHxcS+h3zHJCJnaND2zyemXWA=
X-Gm-Gg: AYBFou2c9yF9mdjwp0e/T25uNRATV88DvV6p86ezA13Q2sP+Hifm/zeXWfF3bIInYN6
	DaAV/ZG9sXIugFaRuOYCTO9Tk9whtJgClu+j1bn94ub51RDpj1n3jrdnHZ1k+KokZuhh4qDSys8
	r0ItGzuXyLU02j5Nf+baH96l6AGTkVzvRZoLl0fQeEq6CxY8ySRRTKOTYSRNzG3Byu/wZOg5eXX
	6kDS2adtLQmu8dpvV3+wPi2wfEU/L7dHUD+sCKBsw8bIiMA5Ix0avVK2HwDU7+eNwzJtm9ocGZI
	CbXai38JTiqQTFiVUqpyq9Lpr8cCHleabtve58vJTAZQXGcsAUHWMxD8NXqxN8ylk7Ip2Mo6/W2
	P+fw24qw4LQdJetIBpuanaDHLQXnMCJHtgTMe/yQcBD9A5UsB07SaMQuN0iu5dEsRT4dUB5TA4f
	9mkGCsCLlU8W77N1EH0WOvjK7GwYpjN2uMkBi2keeqpM1QVKYAYVZY3kBkfJyX5GUfgBbpH4Y7B
	e31O8cEar9yCTAsn0KmXRcfcjiDFygg7ZQZSY0O/oH3LjzY2aTa9mJ1UXwmZ0dgnsSZWCfv7wQy
	Gngu52VqzEmTuYwi7fAS3fo3kA==
X-Received: by 2002:a05:6820:c2d1:10b0:6e0:8fc2:84a9 with SMTP id 006d021491bc7-70ba0dc8642mr260129eaf.15.1792810941870;
        Fri, 23 Oct 2026 20:02:21 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:21 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/11] phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
Date: Fri, 23 Oct 2026 22:01:26 -0500
Message-ID: <20261024030142.13643-3-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-1-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-1-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:18 +0530, Nabige Aala wrote:
> Add the new DP-specific QSERDES COM v8 header file and update the
> register layout to use DP-specific status register offsets for
> C_READY_STATUS and CMN_STATUS registers.
> [...]

With the whole series applied on top of 7.3, DisplayPort over USB-C now
works at HBR2 on both ports of the HP OmniBook X 16 (X2 Elite, Mahua).
Without it, the stream ran at half rate and the monitor showed no picture.

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
