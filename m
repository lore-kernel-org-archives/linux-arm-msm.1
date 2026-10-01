Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F1433AD9B
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 23:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897124; cv=none; b=FXWgHL8AhwLZVQZ0PflZSee33T6Arxq2sSkvLHAO+/oyRAEDUPiOYPpAofPrboJu5RFC7OmHDcTEykB18dXoyMYc4bR3miljLhlQhbyFQxJP3AfYEr+CQGbICFaO9HecqZt4sB2xnarCwiIqMkODl+xPYzLDiQZuCXT4epADyS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897124; c=relaxed/simple;
	bh=4V9v+mjG0zhXxSWO26pcKQ89+JAT4WwWGoWGEwE6vYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVd9wilo/jZ8hhsVEEtoYTQdccEmtur7qkNCiUNZi5J9z47XGZ06genVzrvAkTu0VhRkX8k8e6AHZEsSyOoZDqVfmTAb8KSmnyntQGmuY0pbK4jdT7Z9iLjXczqrAolY+zOnXdmVnEL/sTQ31wr+nRHZnVqaYyjlZmcdZeNWq8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPUpa+l5; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPUpa+l5"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c0da0145so1472673a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 16:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790897122; x=1791501922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4V9v+mjG0zhXxSWO26pcKQ89+JAT4WwWGoWGEwE6vYw=;
        b=UPUpa+l5VNAAqFFK1x7+Ompf0QrdtM1LnN1styLYSPvFPuJrmcSMVM39buyGCrM2hA
         ZQEtXF6TOFQWrIb+x6syj22dhuPPjT/x7eW4XyLEuP0KKstQv5RUtiu0k9IfnkVspjJ2
         dvd5rG+uA1WZsdCaL7RjGbcR+F25DwDRRz2qy1qahOPwF4JoD6EgN5ysqQMRgWKbb3ae
         yk8hoD31VbzdVTWpFS91pAKVbEYFLqOrnAL9kCKTFE613EM1xd00O1GXSzoblZa7vy8z
         pxFeB4TSYtzyaeNb1rOuV2k0VRrUJ5+ATdojsCQ1uPlowOmNq3iBOGhS7L4WUkl3qi41
         4r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790897122; x=1791501922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4V9v+mjG0zhXxSWO26pcKQ89+JAT4WwWGoWGEwE6vYw=;
        b=ljWJKBZfrE4LIsLi8V6IS3qa94BTp1uiAynAXhN5018uotlyCX/g1aF2XLINbJpclq
         7tzJa+yMsu/ZFoLjfpE4L79gClggxtC8Ex3pmrwWZh68ZM474v9W3CDtxcBz6ZZPbM4G
         FsumYQwQQzgMvk+Uv6h1XFHp4vsB42W2yNlm2F/tT4/uXfghkEtpzvNREY2bKGap7zJj
         5+q3Q8RY3XOjcfG6krn6w9NpqyhF+mZ0dltIJ40B++PUpCOKLAXELeTbENT3/X5Tb5Gx
         YoK/t9F+GCmXDmmPxeMlkSjD4Hqb2C9fx0GAH2x06INaywe0LGSbp24esM+E9UrAvIyV
         waEA==
X-Forwarded-Encrypted: i=1; AKwUvBzjMQYEahglBy2ZBrPcY+MztlK+TC0L/JtC+35hFs5nGiDkZ+mGvdcEfnRpCVflDrhTPBR75WL2DPwo3TFO@vger.kernel.org
X-Gm-Message-State: AFq9FYKOcEcYDwhAGFjumgNM+/o0XOEr57eq32PA7MZwN0ebbyf/NX29
	L6YLWqAP1Kfcwa/XRWPDDTtmjbqwhHHzFaFytoogEa3GkoS/lwemwKqP
X-Gm-Gg: AYBFou13Y3ohVMRrJiIoPzspAK4aZ0L75CK+LzLRMpQjPAFsCWm1Kx2bbYR5wUp0Ycg
	45iRzz2QQNY0EFssK7zltvxBrogKvtC0MoIPTc5Dubs/FLBrGQmrtfa+1A8du00YrK0i6ipLwGn
	Vl0DEFKlMJ5hs/phFOw9JGwfkTQaOGsh4ZdDjW3MP2cYS7c7S1mtSVNJTcMwX7TVr6OZh3YjtWT
	tfJieM1FBmZw5J10wPv50DwbvrBTYOmaSMjBKYG01zMqIOTWeo9anPPLoopV2RvXQDPYnWyPSRb
	Yjl+oTxbgxKMsH8E7c7B9Sn2dMgHQhjmlV2QfwAfcUkTiUHE3UDjA88dnYZlfXRqqz+iZRkll/g
	ctyHZXb44KEPILkddCuyINtahVm8e4wpxxgxXt+4ecU+AVg8XXr7C2NZvyhL+bnf6teOYVafjuI
	l5IynjrwfvaRvSirNqYJyOgjgg3oZ95EotNZT3pb2ZLJGEamohPD05LYHEmGy2QLvelZxBBQ==
X-Received: by 2002:a17:90a:da8b:b0:3a0:79e6:b45d with SMTP id 98e67ed59e1d1-3a6ceb1393dmr859415a91.54.1790897122430;
        Thu, 01 Oct 2026 16:25:22 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd5f0baasm271958a91.2.2026.10.01.16.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 16:25:21 -0700 (PDT)
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
Date: Thu,  1 Oct 2026 23:25:20 +0000
Message-ID: <20261001232520.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <6c1c602f-2b6d-40f6-8cd4-617239554b15@kernel.org>
References: <20260820035203.7-1-bbnpreetsingh@gmail.com> <6c1c602f-2b6d-40f6-8cd4-617239554b15@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srinivas,

Static analysis, then reading. smatch flagged the txn->msg check in
qcom_slim_ngd_xfer_msg() and while I was looking at that function I
noticed the two returns between tx_msg_get() and tx_msg_post(). I do not
have a SLIMbus target. The -ENOMEM consequence in the commit message is
derived from the code rather than observed: tx_head only moves in
qcom_slim_ngd_tx_msg_dma_cb() and in the re-init path, so a descriptor
that is claimed and never posted has no way back into the ring.

Verification was build only.

On the stable tag: I can send a v2 with Cc: stable and the "found by
static analysis, compile tested only" wording.

Thanks,
Babanpreet
