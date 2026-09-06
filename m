Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9336C4CCDE5
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709246; cv=none; b=CCmyc4O10FJKc9IyzqW19j8tci0EvI4WcJGeOrvQYo6SUd2tdwUTgmXE1gH8IvJCc0UfpJaT1tLg6WSZ8Y/tMx/A+su/6sIR6TrnJ3ckMNA8Cq4xHG5VsF5cTYieQwhz4xdiLw/Mg+cKGfhSwHwN+oGDTPI36YMcIGueeY475B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709246; c=relaxed/simple;
	bh=EvrbSw6riBn3WFQnWMdTkjWQdPI6Io5eRWlEYnSUdh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QEeRpiZZTl1dsraIdh6bj4hRzUF3bOOJq61X19Xg7ZnT7jv7S48XFWF7MAtisCCLOqyTAfzrJj3BLLQLBjqRNNUz8R8jrtFMMbeBDnw8Aib5LgtPnRcm2RftkJ02RSJAEdgYeWLJ+TybEAsfV0Ww6Mt5PwTMB7hjjZZ9Orczngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhcHMYSC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhcHMYSC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4859245e493so823403f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 08:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788709241; x=1789314041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zb+fQYyrJ/70MX/Kj2ZYXqK6NS7Fru2LZRqOKcxD/0g=;
        b=NhcHMYSCIaFbAk2O8fs7NZp1OOu8RY1/jIzrmLmc2EolExnGgY0/SZxD6w/SyNBmAn
         XTalGJ9OsMh4cjVfNIVrE2cCigbG5mqnlGa7lt7z/LWysor+ppEU40AeL0eON+xATdAh
         ew4bK6vx2RgGMB1/v4Xtksdw+vuNBel/45OexV3v6kU+90nDQ0byYp0e8OjHbtqhYQR1
         N1jM+XQUIGkXBAHhEBl+7hfQWLzdefnelVlH6JW+XgjJi1wTOz1OVRBnu+XB9IUC4d/B
         7eEfDxEt07mTSrTJe6HPdxYDGQHtiIj8cYCHJ0qNKKqktLf34lm4KXVKNJb5S9AW6bK9
         WgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709241; x=1789314041;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zb+fQYyrJ/70MX/Kj2ZYXqK6NS7Fru2LZRqOKcxD/0g=;
        b=VsxJcc0L1UBMfVT354c1zyR4caiLxWHwHLXDMaESjHC9IBn67UB5Bmlo1F7CrxTAzi
         1h652Oa8+/fg2Tf4KBf8cuR/sCECFYtX2AISDY5ZuF7ri2a4+fU1gMQSoW7dP+OJQMSo
         HUbJh+0miUxa3HiYNkHibgLusondES8HjLtTIyM9v36Je+WkZ75ckTS8xTBZf31fGLDk
         KhWZpyBfKzkzxfj59b7mgpflpzp7T706IffLMwq3btcWDi4R0aISzHzuIB+YKCjNmqDK
         IP/ig8WeY/AP/lvaWI29LPFm1ScUShJRbNV4KjmSspysfCCyQg0DgLFT72s5EfrkSNrV
         ZDDg==
X-Gm-Message-State: AFuF++l7yhw09WELG1Gwpdakd73GTz3cFpEos4dO4sxprdx/fijQUWTE
	wwWJy8YfydD12KecNtk4kJ7OR9/bGaQTnV1dGcAFGdbZlhcBjPGpGFbPYSQnUUX5b5g=
X-Gm-Gg: AYBFou1/rvFf8oPGrN731XjRLTiMbkhOttAEmCka0GqHROaIaBZLTuTssUagPEGn10m
	zEuzC7Ls9aZ5Uds0edBUAz/iIoDmGCqpCNwpZqGgnSbGEHCjrdvf/IOsfpzBm26e94AjTPhYVXM
	kG4knqQPP/EllFMH3Cvx/CxMHwSZT2riH/QfRqode4Us8Sp8a6MkvMj11LW8/Bzg4VRdchGTS3O
	EY1+4gjzEWh48sWLVCad+/zhYw7/fLxYWXNnuRP9rUv7kVU3lItfzhNta8O9dojXyFk8+jxY8PD
	375kaaUwH7cKyQ+BygvETavlUfpkwxu4CPX2EIj0qshqtr7iafRcpfv6CH5Z9RNtCuDRqtgY+l5
	mCytLWkstYwN/qkBYJkG05DGn5xmJJw4f6Wi4Nt50+WUIMHeykzAReHf6ej7VWfsUyRNuaofdGc
	co7BUK3rVKWXN7B9zPwus7ofBrmMRYhlKR2BTDiq4UzJ07mh3hn1SauuQldXCHQ9mjw6LeuIIaN
	GxLoFoNwKsux3lAXmxDU/5gF9+s
X-Received: by 2002:a5d:5f51:0:b0:485:8a47:5b9c with SMTP id ffacd0b85a97d-4858a475d7dmr15641422f8f.57.1788709240790;
        Sun, 06 Sep 2026 08:40:40 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm23825319f8f.10.2026.09.06.08.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:40:40 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] X2 Elite Lenovo Yoga Slim 7x Gen11 support
Date: Sun,  6 Sep 2026 17:40:21 +0200
Message-ID: <178870922140.5716.3695070640167210897@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
References: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Jul 31, 2026 at 07:59:43PM +0200, Konrad Dybcio wrote:
> This series brings the bits necessary to support the Lenovo Yoga Slim 7x
> Gen11 laptop, based on the Qualcomm Snapdragon X2 Elite (Glymur) SoC.

Tested-by: Oleg Keri <okerixx@gmail.com>

I have been running this DT on a Lenovo Yoga Slim 7x Gen 11 as my daily
driver for several weeks now, on top of linux-next, and everything the
cover letter lists works here. 

Is anything blocking the series?  It has had no replies since it was
posted five weeks ago, and both review points from v1 -- the duplicated
&pmh0101_gpios node and documenting the single-compatible reasoning --
look addressed in v2.  It still applies to next-20260904; glymur.dtsi
only took three commits in the meantime.

Happy to test a v3 rebase.

Thanks,
Oleg
