Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5AB5158B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071528; cv=none; b=NhiDCbTEnUbLqkc4Lr/MCe0iu/l9Ze7tY+1Wo9BiaHjSbZ9+YlB4PCdEG3VfF9trN+q2uJDCWmELfaZ6Lu+cWcuH7Ha4N491Ax4xsSonnTXN6ZRFbXQJwFN4ESHaAPiEOUGq9qunxk3wmIScO1EdXfrGh6LVFm0fbTC6mv6xsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071528; c=relaxed/simple;
	bh=X446ITTdhXRNiM7YTNEvusfu90JyYJu+Hs/1GHYcdQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCzmEWeznJj+LLK6XkE+f4VomLfzR9dbi+up8pHHA9cw33aT+pxth22Ram4YZak6o2dHqpsvk9nyep/bW/VA06X7cVfqO9KZTsD6mW7xMayQkeeTElEAvVx6oOec+rOuU2BjMl4HQvhlnml9XtWOkOuiCHiKXGHR7whm3UF/me4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHn2B+wx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHn2B+wx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so422336a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071526; x=1790676326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arHmPU1bUxWfq8Vgi76eeXWsD0/kT35HZWCoWkjs938=;
        b=JHn2B+wxgCUCR+qNTT5taEtfwRMisoJcBUkxpVmNlf885MWu5rIrbewnnwfq9mfh1/
         FB5Ku6KP+F9Cqc0lz35a1ubepCchnX3Dl+m1JXAoYJ1bmI4YaD8gwcaG2LjnYqNOrEuA
         Yihem0CVAK+aVdDUzLUDu6Esi3+KdTzL6iM47tW3tD885VorNSTt/scVUAELDjM4mdLf
         C5i1k4leBNjF1zNH6nM65yI0/xcKxtPP/71YS49e5oLz1Ij3PK7haipQHYET5IFKr7IF
         Kd3PizW4crOR15HubzP1t/nd8ij0OhxM46G826vZL7bxMJyZjWqW5K34imqjwJ29beqc
         CxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071526; x=1790676326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=arHmPU1bUxWfq8Vgi76eeXWsD0/kT35HZWCoWkjs938=;
        b=lu7ing5h1FHCQtDxajqGfsMpJFbICAKwx3TueBqzUOKVVH8/F0tpLvWjQiRXK5C+I0
         l8JVVrv48TlGBdeVnlk6klYnvBQPbtB2rEv9aMtJE/bOyqVblfBChJTBJyfZi1dpAb/A
         ZzCub2ZxIsB0Nd13+f/fKuOA7sdXkRyjzLcBCh0Eldjew6kqLZXVbfSrm2P9J5njCvoW
         sZcg/EXg2DxCF6lwMfIoNrFVjgvqe6gYrhTXJSUQFJnJFzWt9/OY0zx38l8OwRMZoGxq
         gFA6CZnpN21WpONJ9b9h1Hbi5Qo0sMM/Ntqzmcl1EX8s0TA9Jg/7G62zq9z6FqAJDwuR
         +eqQ==
X-Gm-Message-State: AFuF++mvXqgSbdiN0ua5m+zp/TEwz7XnGttddpuLGxWSc7+ooru/nVaI
	NsZ2j/ekVK4R8pXh9jTTRMfj53b0BOSLh8vfDEO66IVs8gGYwbi1yBlC/I5A/Q==
X-Gm-Gg: AYBFou1q8oPbZLiLfP2PQAQ4Ey6nBjxhBY3cC7LjNJ+K5XBQpH5hpf90A5nxNS6Xfiy
	KSg1qjnn88rKL69NNkCiHZPMzoEPAynYA9PX+sf00JEQBploCJrWnRGEkOVotXSZJ308l9fYDhW
	LawZwhtuRnj7Z/kEV5oavD2Kvmza+p2q5m5DdGk9SlxiF7EFZdvldHXn9f6l99mVgtW/KlYAqhv
	zIRz/s3vqcuePM7uQILWiCRyqpP/AM9RtnPb/p8COdxp67c9aZxl3QTNmh4bRJQ2E/mQLXOomqb
	ycyNA51wmvkA/GrL7AIyBZTMTrFiMCnDS+eG9SZnZQhNUYwDGFEk049O0bG932CG640fvNMeu3h
	EuhcwSWzWPAQL9a2IkL/ovpSXz4Sg192OFo9Zc0MEnS5EdrAQJb93c16Cwfu4xQODzkLgpL9lHg
	74V+xnez6lsovVyW6j5tVWtt0x5I+hGJMphF7BXNjsRDDSVg41eunVURJft3QdXkxBHG3lSEAUd
	Un6ParO7ziKUL+QtThrh0XA
X-Received: by 2002:a17:90b:2f90:b0:3a0:242e:7397 with SMTP id 98e67ed59e1d1-3a0732c5224mr1150055a91.4.1790071526290;
        Tue, 22 Sep 2026 03:05:26 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm3984718a91.2.2026.09.22.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:05:24 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 22 Sep 2026 18:04:35 +0800
Message-ID: <20260922100501.8888-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100501.8888-1-liujianfeng1994@gmail.com>
References: <20260922100501.8888-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E78100-based Acer Swift SFA14-11.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5c0414d4af9b9..85e62b2c7093f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1203,6 +1203,7 @@ properties:
 
       - items:
           - enum:
+              - acer,sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.47.3

