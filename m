Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C043C7BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450415; cv=none; b=V+rWKbRwI/8K0ftALKt+M3QHbisfIyfciE7N19ewcL802zgFNfT5kCbGeZbDD/MoLCTAULE24kFSYWK9rezmgIFi4FB6j8W0Bi9dP4uOYN/SHD+FKIznIpg2mly0halT+djUR7bN0Dpn2EG+iitPKlmVq6yHhgB1MTrfDBORyV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450415; c=relaxed/simple;
	bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c79dq2FAWIckHBp/PC5cJa2sy7gUdp3VxDsljWK9L1jFkJEobtHnPpM1lidQYc+TWm+vWDacmOqdWaECEypL2vhvfeHbPbrD/j7B0oZDK2kv5eWwHggekUC6wnPOxllR4lz9ivtYOyyAOfQ3sFzhLtwV6klaseb6pSMpzRGcQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2f1Vs2X; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2f1Vs2X"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so2132998a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789450413; x=1790055213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
        b=F2f1Vs2X4HCudTGfDWL3XIaOk6lIpppjkyPTzwO8+BYNSIrvY9CI7zWtDPY5AzN6HX
         Dydc7l9P50X9zeFiSKJ1u9b8kMzsETGmrbAuCXrUaOOGQki9khRgx4tCmjr8moJ7aff0
         762WJfpjpTQxpiBgyXGL9F2Y3M8JCJqgYtjooznT3U6JFhPQoKWTBjwtlZ+YSt5sBCkK
         h+Babg0Td9/IsfR79f5KL4VNhXYV0v5cjK47ZNkLIREAzwj22uwy/hhxNfw2MPWpONFZ
         FFodBHwB7gv3XUJCr/suP9OpJjrLHi5v4dibWGi4q2aq/C/VXO8ALpcNLT5lCUHZYtB1
         E3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450413; x=1790055213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
        b=0Vx9tJ0pGnOfOos4LzSS2QoWbWegYorsMzJLgVM6TafjiBKYWps4/u7O7k52pKpUqJ
         yAnuxUuam3wyelIPT+7cm4VVM1hh06Omq8O9cnWVqT92rIUlH/MMO4wDy9pNod8fJHHM
         8vu2C9WXCqNB2nPNdAxzH2jZrKPEk7l4/Fj7fbisueAbN8ZAl2VWJwhskCFB0h17CmPa
         iVdsS3PPuzsWmBATwVw/JIhGhAnWC6lEE+YPpm/GFLEqGw9F2DyKopVaCWgdQVv2TCzO
         xVyodYFSYBLyNEIG1AtrUNlz6oMthZ0FIyTjl0Fu1HwU0fJTXe7Qpaz3ER1vsN6y0n5x
         Rcug==
X-Forwarded-Encrypted: i=1; AKwUvBxl/gxb5ymlltnG98UO3JcEOEKOS0odoK7WT//HkjJHB+VIx6zDULgox00GmFIZvCJXq4cPWe2E3slyzYnd@vger.kernel.org
X-Gm-Message-State: AFuF++kQsw6+eA5j6TO2/Tiyk9cAAumhLlTrwQgzUtuyuxlqVgojuU6T
	U+TIHySbN+KK9ooulGeLvdtv5QV4e+rEMAnEQRDVYObweU8PF8Ul9xkEaLSESouS
X-Gm-Gg: AYBFou0fbzv77tx+bPKqkxS3r69rY6DlQ2WV4SkGwfpWqz/AOMFFc0isgZrxb/0N4Pd
	C/Zie7qoklgbXuSbG39aC0neSdxyNshzdUbuYA1K1QHLRPCntJAkI4oWg3WD9k1D8HQePHAI5UI
	nB44b1lkN7CPl+dI5unPxN1TkZg6SOTgRPwnFHqznu33cxGbMg/SFXypdTzAzRS7u4xTF1Yt8ug
	qIHITNEbrtsa70zg0pqBSoXN9oZE2cnvM+brgBiDwrW3jAlosGERJmV/PPsmmytf7Hk+++wafX1
	rVKSiZ5G2+WHdKV5eQkiUizIrIFFaELiklDJO/Rm7FaUYGvzbBWgENwcIKDp5kuXVNlddSPv1O5
	l1ArVSqMIkepHBrlTuq4wtre65La/o57CdrsVlvNTnm+rpjeoJbdXxPMgwKPQYaasGEtSzCX8Ex
	ATgsjZYuQ+mEUu3jNBLASQqM7Q3LYFrpzzWR3L+PJ1WL8HoJ0It0to2iewgeakvX/2EYq4CQDot
	4oCKfJYvA==
X-Received: by 2002:a17:90a:dfcb:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39dec142834mr13260587a91.25.1789450413078;
        Mon, 14 Sep 2026 22:33:33 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9baad9sm2944462a91.4.2026.09.14.22.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:33:32 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bbnpreetsingh@gmail.com
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Release the TX descriptor on error paths
Date: Tue, 15 Sep 2026 05:33:31 +0000
Message-ID: <20260915053331.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820035203.7-1-bbnpreetsingh@gmail.com>
References: <20260820035203.7-1-bbnpreetsingh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srinivas,

Gentle ping on this one. It has been about three and a half weeks and I
could not find it in char-misc-next or your for-next, so I wanted to
check whether it fell through the cracks or whether you would like
something changed.

Thanks,
Babanpreet
