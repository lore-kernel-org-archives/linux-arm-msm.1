Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0C4D0A1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360015; cv=none; b=LBwy+pqlFVtsdORJgP8IQCC+VrBvFfXVJ/kYohGkXznC6mHorV1hx9CmljcvOtMyqpXMgmbE4NeAZ9RldZdu3Fzd/VEhUKYGkjiKprQSRAxX7YaCRP3zF3DEuuknQ+eXK86L2xqUIK+LaNNuyG2T21g3g2CQeulivmqx8XJh3ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360015; c=relaxed/simple;
	bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M941wTCJw70+YNPYHKj8tkgyp81J39RbjWFVdJ8VuX1rKPe8wkLOKjht02OPLp9KaIbrE4vh3AwqiB+hZUtYbqVgEgtkJgrQ+g4/tz/W9zJbvqnH82z7ci4ZIIRoYx7qk7X8dXOpcQh6wcyyGtqKp8L16zdzu0MRSV1yEZpo4yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=jUgYvHah; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="jUgYvHah"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91071ba92a8so7677686d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790360013; x=1790964813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
        b=jUgYvHahIGtLjFSWGaODdXohLdw7g544iNlxxuLC/HWV+0AnhtplD9xON60klLVHd8
         RUkKXcp/ZBrIBNSRa05aqMfkzhPT/RovLtKRy1t+kvNQOigG+Wboq/hQliV0heKb+nzg
         KhsoHsapwVE6llOKCG4xvtqe46dohfMbTprU9893lBhABvBphuHZtyfAwd6P+v81Q/5W
         xpseYIcf51sEmOy4o2x470L6AhB0aVMU8KD5hnzawpeYRPgjjS9iPNlTqtXqMpwbhyFF
         0YgH7XY0dp+NP4Uf+5DRPOy5udy0toPbzbpwTKmCMejvBqzffHpkgEpphfeByrIvHzNM
         ZAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360013; x=1790964813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
        b=frQw5Nj895SQ6fFIhqf2vpdq9m/nDg+SMbCTKlSIFkR2CwRfGTo5deQMAXlkDrk3hw
         ainKCee8lcnXje3NP8/WAnZFevTt3lDr4iWY4J2FD6IAJw29ZZrK5tqNmQmmtWt3R7a4
         wkcbdFa1SFDfx+3gFPpmsfHcVkhlbvZmTdk8QTI5Niyi/+B2qRBwIbAGqxU41JzpkIjj
         rEIpwkamqV9jVz5fbnnYKbqixZtUTjyyOM65H15nPsUDQu+HpeObbGCNKQM2k3Tkv+KS
         sGDc9CQ4B0ujJzQnWtJ/+zc/Bg/BqgdNs7cZbZdDk0abRoGSN+5iysTOlGM76IzPHNlO
         SlFg==
X-Gm-Message-State: AFuF++nlilVv2limCZ4L00PQnLRV52bm17l2QDc+DYABFAvUTEA2Tjlb
	wAqFjGla8uPvm1bTUvb+tyY4OTNPe0fPMFQVJxrdE0KiBBWsdFszQJc6AZRiEcXO0MU=
X-Gm-Gg: AYBFou3fFnQ0jI5LavYmEI/m0iFtWir1b/D2+ZMecp/xb3LOrZNByB3CkzECHBkO1zN
	RZGEn/r/We/TPZ7jM8HIUgfHa4ZwG/ihiXwXyVtLqqjJNnXDWB+tsf5u/gz8N1tXUGb1FntuGlG
	c6EoBv1YBOURm4BJ9gvAvky8DoeKclXFordL3HFskO6KjyFA7ud72VfP42EjzYWHq1sw8MJ6QGc
	fVQTXSR1dsFnDi/v5FA+Gl2U21XQiUiAerHNVoRvd6b8Utc2ei1AMmpyaeNF3DvHrfXbcyAEaqr
	xj1DWoCAtBJwGoJg8gmAhRbt7wEq8NzGyuPdUhAsfVYo1z/McvrGEMbnPJrn1L1PiwQwqXR9YGE
	5PTLlvYolfhaNEyj8/BEJc//im90cJ9nRhdrbMpBc1Lb2RWh9sLSbIMHEhgFOqt1p00iOKcFP0V
	2+2NbvSsOE5uQPQtJEaDeU4m1I/XVUyhhxagMADKUAaN6W5EE=
X-Received: by 2002:a05:6214:212c:b0:914:433a:59ac with SMTP id 6a1803df08f44-914433a5edcmr9586606d6.38.1790360013409;
        Fri, 25 Sep 2026 11:13:33 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dacc41sm22471816d6.14.2026.09.25.11.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:13:33 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block definition
Date: Fri, 25 Sep 2026 14:13:30 -0400
Message-ID: <20260925181330.22794-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 14:20:29 +0100, Bryan O'Donoghue wrote:
> Add dtsi to describe the x1e80100 CAMSS block

Tested on a Dell XPS 13 9345, with the board DT for it [1] on CSIPHY4,
two lanes, and the PHY API series v20 and CSI2 PHY driver v18, on
7.2.6: the OV02C10 streams at 30 fps through libcamera's software ISP
and into a browser.

[1] https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
