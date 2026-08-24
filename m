Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875F7368D5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583766; cv=none; b=CQa0CdZ0GCcDuUWMl+UZ88gSvzETDzZ5zsSSdwvqp5QoZpXk580DYJI2BSRpGLI6wejPhLG+lr1BVcSYmtQuHZALT+QXkc0ViNtWX6FtdXcHwjzGz63hjz8Q5FVEK8w1d3fOjU3STYgCTX3jLvVRDbAWbxG5MJaiEDPu6jrkN4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583766; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7sEV4JvL441SIES2i/nT60yNv7QqVCrw7eyYRS9ocUPbFOx9QLdbGrqqGf/4ONyOI11FFOz4JfpBDqo+qMAWSY/NgtCYEzpMv5m9aQQ5TgT1expzbdOjuuftcQU/qq94P1cHB5f+VcELEvvHBg+xQnZaChDvdxVIoJuw9skWbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+bh3Wgz; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+bh3Wgz"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f3b01b8996so413630a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583763; x=1788188563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=q+bh3WgzTyTYrKZx8FVskPZ5hSB6vgMgsa8qaI2vc1PLIJrhXXW3E4ZbS0/SGrTzUw
         Ek72S14/jPC3uPZdgO5pXW1A80Q8rjNpNBFUVxuwysCYoDPb62mdC+a1I7Tmh0FtbSce
         RYVf4DrJh6vI2fkpf0FrYF3gNjH8+mNAh528tppZmAbWOZxRE5vMZrmCclT2fXrdiCRq
         cDQYHaQi5Vgbi2LY9PePBwzlYe0DMqeL1VFsxh03Fqz2/0VQlRwUxzEzD/hQE50Kvo6v
         5EVk89sUZcg+uRyHyTSm8TQ3LgU9zVWSMnzLHtNhart314S2m2laBm1RmeKQp1/nc2Y1
         SocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583763; x=1788188563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=sZEmN0U/ckgCQLl/Eyi4qS/aa/iw/kDmvjOJ3k5pAOYI8vjMh8/lNHBNx+SVPYHIXW
         kB4b7uQUlCzifNj9gz+BZiVUva3M45WrDiqzbQrnSFSoI44A5kJbIVBXHGKhWUDZl3bg
         6Mc9Kqrzie5aW0HBOLKT8Jhs/mMiaapf3IO89jIKq8K7gDjLoe+KKrSJE8ZCe2PPRy2W
         YfgEpXMA7Jg61WAnydsYGje4yNmHaPALnAIMRsxK6BAoVNpp924O57q+qpLRgXGgWP4v
         eT7oXvi1N8KGNblRN01Kbs5PNo1/8oWjjlB2pvaICG453VarFRcljKMvlyWI0nLQxGkn
         p7vw==
X-Forwarded-Encrypted: i=1; AHgh+RrBWnMrgBANXjWnNxVXS/SKzYOlh4Q4EHrjjeGR0xpA6QgbIY+vWxKf9na9gDRPmXOSSe2cnDvfCLq3FOAs@vger.kernel.org
X-Gm-Message-State: AFuF++lcQjzj971thTaGznUvwz2UOpaHb7fZ4YUi2wOlQjVLdzIcc6Zr
	lPLrz5okx6jUuOtYqI3AX3cISSo5+v0XNcSwfKfHTFOMl10UuUpBs7Lk
X-Gm-Gg: AR+sD11kc2UMdu2hfZop4chU+7JfOl+eiFhqW7YkBBdBayyshvGwfz92lUGGFYhjOUb
	jt3PsXGgoi5uF4l4wvf2NbkgXq2td5gM4pZggIflK8pMC+DAlBHOatXZzmYXSqEkcIgmE7Uxcyi
	6S/SQTHRSnCR1Le/RtgA57H/WynjvC9OaJOo3q0QCHbUly22H+sxmou3DRe+Oj7LmhD0XYYP8sn
	p7WcFO07T+qxUT0SMcEEmcUjnURdGgpb8Jktrl8OxIC3IbhCHk/Gxmp8UuKL4sN25d+ZQIpYD63
	QiEfIWM6XP+3otKB6o6F4/w/VnFvUt+9R0Pdd4RQ5CRnakDwN/kCCzBRYreo5A40cPTkKHj1MvF
	vxqk9Chdsp7Q9hfd04d5wxyHBtZR37KkSa8Obe3tcXbvCqZpDdFWb5NTThlI4pQwrMaA98mQ7NX
	vEoEnD/Buaexm2Kn8tX1oqTwCKct2XDPUWyy8IAWHBoJAI1YAbYwDc5tU1Zxtb6Ta4lDhA6CcnV
	LmyH86mFpuB
X-Received: by 2002:a05:6820:2f04:b0:6b1:4147:4e16 with SMTP id 006d021491bc7-6b16b39a036mr12301671eaf.22.1787583763368;
        Mon, 24 Aug 2026 08:02:43 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:02:41 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Mon, 24 Aug 2026 15:01:45 +0000
Message-ID: <20260824150156.1310-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

