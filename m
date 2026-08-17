Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D3B22A4E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952308; cv=none; b=DORNuWfxOF2HQcZUdbtZ4MuDOBr+X2ikIY6Y8KDaAWsNXVyUocwDxzy6XibLqKApT23S51ZUvsehS2XxT+GQhLNzuNV9GiyolbYKf8wnEVu88DqTXwUU8KNcgsWXfdL7MIZtnVOqeU+xQgPqsqZZ114/y/K3fWrg9RkfXeCqJo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952308; c=relaxed/simple;
	bh=St8ucU3ojSXInIoaRiplnocZp7Q2Y7UGXGTdomltuLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SROeE08hB8+eafHPcSWOSHczZIaus/05HJQtrYk7Rvv48Xh2LCP2KNB/bzajDqfcvG2h6nt35lRGwF/7JIKo8Ev4kaboJOCIWtxLfJeHrgIrLF5ovooNlgBukQ+kN7IV603ohp/gXrHImS2DMn9TleZ//Rgy3ILYDxsnwqVtPpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTlKXa3l; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTlKXa3l"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3722510a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786952306; x=1787557106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=CTlKXa3lJQy1gm6+RhkNYGze136244NSFzlyESYgqj/F8mdyRmSkVB9K/Ruc0oYAPF
         Iq6pSrc71cfgHVFP2KfT3z5cybQg9j8pbTKdq+qYOtaYA6THS/E22rfIGzGR8IK8+L/f
         qEpuu90itRVRjYJOuLFDlV3duSlPvrHWteNVJyvLaG1H1LdVIL7DI0Z/5kKGMRBQPNS3
         GSxCQrzSgovRh0vWXxca+TrRAZkN/rIlgUEVVArbOX6siI0y6H8W27F2mKSf9/PJgOed
         6Kk3EE/XWQs+BUi7DE1PiVrkJZ0f/+ehYyrwd6lMKeE+WWNanK7OYIvJBu/dIJrJmQ5t
         RBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952306; x=1787557106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=bC7rbwjYaBA2M5tophQLflnZS+cMwSw1aWgbgRHagDWUsl49Ykwu/crgCwdkZWjtVd
         sjv5JC/Tc4fWjXYAoz9oliEImhNB5kFuniBhbv7HuOYmJewC9p8MXskcCmbuWaLeNzTl
         VoWPAYnv2DvZ3GCVz/kSaBxhhFQmetfCWBruFOBM+YX0M+HBFI7wrREG2/BdRN/dKXJf
         569lJIqEBsBHc2qZQEA+JjNufHTKTrNUSKDeHF4AY+WwVAKlv30dJcCI+F5neVEvPzG2
         xXek0mJsumzWJ5bIRR3Z4orvm7a1q0mRTsCC9DVeqREj27PiozJqOMvN6FlpFkh4KWPB
         DllQ==
X-Gm-Message-State: AOJu0Ywb7IX4i+sLeXVieE9fKXIPFkuzAtEheRydfxs7zic9+hb//F88
	HkdxnviJm6i7WshfD3owN8241Qb4aenHZvMrtlLGXSJfle4NOOcaBL778Oy5cA==
X-Gm-Gg: AR+sD123bdUhbMGuIeAed/I1/o3n4edrFHXkzwY+ZAChQvfqv0OSvu/9jYYRojQCV4m
	Ov7MMmEqvhEyh3qUwWgnoH0o124Ye/p0q5ZVA0ynH/VEi8rMGBzisMbiYDw/7KE5YajH9LDF3kQ
	yKiqP7VRG31xQC7eeM0HerSqSd5ChDOGeQir1nQsEfjctSDg6g57Pzy4HcSKPJvYdQndpjUdpR9
	ZvJJ4xRi3N/oKy/b2t4rxs1aLzdxx/HI+kFB3VmUuYan4nBScgexXOsbE0JRiPIpKb4yz7K3ww3
	depjb+QI37KrWqSHxDObJFDcfW8i14EsU8/cOjH97TV1vYmstU4NUhtAD2E36XddAiErIE0NBpL
	jHQe11Acs/hcUMywDaqsOSmkbZ9bSfS4ZrRm6IbCGbUz5QqZn3n947jWjMFQwOzPRuSVWGd5gEB
	y8H9tzju54fLgbCpw+GVONw1cCG3llLFYp4E4Hr8s/uH6Y7QSxR28jlX403dDRdhTLPbF11Mgup
	/OaGzFanPFF
X-Received: by 2002:a05:6a21:1f88:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3cc720a1c87mr24876321637.35.1786952306331;
        Mon, 17 Aug 2026 00:38:26 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267cc91278sm3359088eec.31.2026.08.17.00.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:38:25 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Mon, 17 Aug 2026 07:37:55 +0000
Message-ID: <20260817073755.2087-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817073755.2087-1-sreeshankar0910@gmail.com>
References: <20260817073755.2087-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad..54b1f8e1b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -449,6 +449,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

