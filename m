Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9291E5372F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120573; cv=none; b=gKXbkHyBXn+JU4o/ZrnC0hIGJWeaOb+bKQWDMNp0vk1cXSeSTLoRsIivZ8IbQJ5Hc7YefAaAfgboa3YaVzhQEYZHoXqqwmOy/VGt/XckM5YsqQpksyRVNyvP94I/o8nwyDIfxN8gaKSt9DxEV0xMtpFEbv54gxMLSbY0tTsqepo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120573; c=relaxed/simple;
	bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Qw4dR6iUcNLRmcCCmLqcuhQ3lSVJTzNsHy99FvYMEyKD1GmzUzmpGWDbDtWBVx6OPGLpbxCzn57/MrdCCs/n4Bi7Jb3+n6IJouJu5UFxgmYCgzHZd+1CLwiLCQJ8I7sN8TlSQnVCkuncpqoq1O+Omi/ZbX843qonOenH6YDFrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSDzEFGM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSDzEFGM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso3990785e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790120569; x=1790725369; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
        b=HSDzEFGM2YohWr/MDjTgACY1QPYz4/ayDnN4+JXyMvv3WG6ODt+ElIit3lU0SGXh8N
         pKm49219WuLqDKO6zkx3z7n6cYy6389e9ySXqVw5Yc8HH3ib5PNZNhm1C9aI8Sy3aHZU
         qsfWmTS5Bum58vXm4KRtJ/ysfWfHqiKFcEqsx/VKMcrrI4lHoRFdnN2K1hZ1Cri5mCNN
         UrlbDr+qP7Ot53QCDhuoaI/hRg3GKOEeQ81Fw7xocHbLXr7EHCGZqDa6vsA1Wc9qDGt/
         SjwxS1EK7pu+Yv8yS7+GtgxZBKQrdKrNEv77d4u8OCtHDgcMRlu8Pb+hBacyxx2u9Icu
         TqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790120569; x=1790725369;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
        b=MwjRBnus8NMF7qVRqWRss6UomjYROlSb45GoZgENHxDO9uSh2t6znJJSlu9Q1Su0cP
         yqK20yq45Eya0Mj2JEbRmKv2VgJZ+AVE8PuEW1REk/a/b7A6rpS2EdEK6jNtToGbJTHT
         mSnLhIb012l7okozctK6Rp6FVm3qJT+Hc9ZYGCtsJkpRQAAP2bkdQGd5jzEhSJsqftsj
         oB57SlUp14Kzgyrkb2SHTb18MWcKnpYakQ92BJLyFKYeG01t4S9TldgzTxubbtMBsDRr
         ZdpORfSM4E6iO3RrbTH2XNTqIWN1x1fY5aD/qm5h9wkKDG7pX1XWP1zNqL0c073wWwk6
         GnCg==
X-Forwarded-Encrypted: i=1; AKwUvBxaC5ylpaSZ0swpsBVo3R4HN5btxn6ycPU6s9h9NSlHCSTaSb/bsnLiMlNVyAKphjZihz9124q7yTjBo5pI@vger.kernel.org
X-Gm-Message-State: AFuF++naT8PMD+nvB64W7xQpFAnaAgIvaweSZ85w/y4RZvk7nxcVWDyY
	mTDCMy0sheVCNxg/6BJ+2QnsEBRbgWX0qlyAYoQ49f3C+xixr7edRHlY5sZqWrn1DiNJ9gAjlqx
	MNPcQM+c=
X-Gm-Gg: AYBFou00PszQ0QjICHHF2HubZwG136269RH7aweDKdWVOVcpWxOKY2TJl9atPrw+Uek
	pPz8RlvOy86iluNiG68PzMx9DVn59SSXrMbMpp8giO3v/JHJLcXFL0q17bO2DDWXz6Pq3kDD99E
	YTCPQifHKJIzObYDZWAMgoTEmwp0G0QUedkPjMB49H7dKhCRbtCuYzqzb6lOAezdXRtBOEmwpdh
	378MAjKA3nBTurHCuqHXx1UbbBxtqUGFwmDXG7A8Ca2rTZTeDoxTSS5bb6zWmaJeWp4M8azDIc0
	7TmTgpGruvLkQi6l9iQZFsd/ECVNVsuaYXJpeAz1/tMiziTnLjniSSUsWNi7muehGWczR5MHknv
	ijytv2MtOAOrJnzOcmvVBPLz0FNcoCNgY+Wy7pRfEySccisMlNjbLgNYFByBgHSQ8dqGSwVouaD
	PTkavTI2pyzCLoFbClz7PSuCYHzZvYQl53Oi/9y06i0+VLmYUmtJ7cHRYP2SX5651vt+pXn8NM0
	tPL51hLdbi2rLnOz7ad8GKeSSjxe8hqnwSsX28A+uEDFe9EepDEcaV9iiY=
X-Received: by 2002:a05:600c:1d2a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49fdeffce6bmr10454205e9.3.1790120569165;
        Tue, 22 Sep 2026 16:42:49 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c0f6csm34892415e9.3.2026.09.22.16.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 16:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 00:42:48 +0100
Message-Id: <DLM8S42Y6BG5.JH78CU9NJPIY@linaro.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> For some reason we ended with incorrect register offset for soundwire tx
> controller reset and the regmap register max was also incorrect it was
> 0x1000 instead of 0x12000 which is full register range for this IP.
>
> This was somehow compenseated in DT reg property which got it working so
> far.
>
> Fix this by correcting the actual offset and max registers as per SoC
> documentation.
>
> Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

