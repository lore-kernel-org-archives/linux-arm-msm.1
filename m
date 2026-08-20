Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5CA3FC5BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218974; cv=none; b=RQwjN2kTxYoIoPREqifWpLAKZlLwHzclpkN401lEL9rpuW9SFm1SOLjzKztd1QML6O+GJxi5qbO4rOwy9wOiUlkmLJoEmp7f+uDojexvKxjQSVaGfngTemvrf08VGpNNCzH0l+TIo0wX2NV129Rx+QBOb0CgC0doGNCeBi5HAm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218974; c=relaxed/simple;
	bh=lvXJIYHg+Za7wwIfyKwrdptP8jCEhBX03Cv8tnpa48U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzPZBhLSclN2vcAuVvlKVOfwup3TE0dHm07m3ZSBGeFoH03E9K01QxnWRrcovYns6E7TPv8aGhkBEO0qByrVh0XdZDDEgWP5lZaFdH2RRRwTimnzlEBxNf6Nqms5/3JtLZBYUngFL4bXQp1+D6YeryGCpX9aHtVR512qHehBd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmSKwNBf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmSKwNBf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so17534195e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218961; x=1787823761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=OmSKwNBfRXl3HffmJ3Zgtv9O9cXY9ahV1itKzw+q6P9mVQo0A5qpTlh1/xhuVPnzmu
         0uP8UTDiP5HtTjcXSlKWFQyFUE5Nwu+AtoX83t3dhSh17U+cSMFIp26wDdJz7asN8eDh
         kE+FtJD0mxIN1I4hQpwfwlGsfMQVW0oFAvQRxUhWVusgWrD9SUA9dQozJco8/nZllMiA
         qIfzaeNa9y1Gz5WPMPSGm8kyUNdke8z+Wwori8GsBhcrtNlNZpAns7UuP3MqNxJy9x3y
         xQ4jsWhy0v14jt29yau0Gp3WNFCoI48UFhqAduYzMp+qNV82r7hlGNfNyY3FzaypB5Mk
         XtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218961; x=1787823761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=Ie3idDpvwKcoXiq0BYDC7eo0dZL4tMIwISjygsufbVgkg7bShjtftZlikbB7qAoi9R
         GfRtOihoJ1623vqTeTVgBjpa2Kx0P3Tl+p/noLnV5HknrRR5hFQJKNtuq3xhqw3jWGG9
         +gTVKCTt/eivtzH8LF7wCOrtTSmdxAS7Pdswmvq67Fd9k49wCLHrycI2czqII9KvFoPu
         qb7n9Bf0lIgmmAM+AG9WlwSeIoVdY7ih93oQuzr5/1zJ1QynbK9qzGhUwJilC/HbtUla
         jzgxUEoMJgpBMII/+IRC3Aq7Zgs5GxsOkG/nJUZ19DfcLxp5IdLRu0NP25udlNLP9UEq
         zoBw==
X-Gm-Message-State: AOJu0Ywrsga91AQAp1HrkogniqOlQo1OAi+qxfWJRSwlH9c1t9pmyHJb
	HvGkz4rU0SBkQmutCvNoekeHszfvOifDf4CPWOG9vv8TyiLV8hJn9AVG
X-Gm-Gg: AR+sD11W1iNl/81iSWHHcS/Ltbw/xiwfg57syGF1sArVITP+GTjTNxnRpaNmyhJIpTq
	yI3zeBwg5RRE2ShJ9rDiaXMo8EEDbZjfB7GDmLG+QTuSQ7fEB1c6TrXrUQMjpfU6GpEKMl8QMtl
	ayTgkYJCzhWrlnDcCLnZpscwXo09Gpwsb1y+scP4XPGsbz0fvOwa9y+PLdIUhsyhNcTx3emCCeR
	9gY2nYED9xtSIgUaUvpJzq+TbB3wT/VhftLLeSD+8jrUqK54R70wkTgiJ6khfkZPgHEfW6YG9z1
	U1ksW3/Kt4S2VEMYtIUhlwnvU8Is5ZxJCnaVQV20JQZMuMOBO+oTxVPRDQ8zEm2zwPecFYnrTwu
	Ako9nYUprsCfGvxu+BNwpfvE0Mdrh0Hagoq2EeQBu72ZAR5K6ZA/KSj1/E3vFjb0OidBUjty5s3
	uD74OOrgXwp7Y3ixI/E9XVWvIa1jg9JM2/wXSMFn4cL144i9nOlNM3iNZ51SrBX3L2eUrKk6dYC
	+yARNxzPtTN6O6nArRB3Y00
X-Received: by 2002:a05:600d:19:b0:499:b4aa:3d70 with SMTP id 5b1f17b1804b1-499b4aa3dd7mr11458805e9.14.1787218960974;
        Thu, 20 Aug 2026 02:42:40 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:40 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:24 +0200
Subject: [PATCH v2 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-1-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
In-Reply-To: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add vendor prefix for now dead ecosystem company LeEco

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 136681412501..dd0762d3334b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -947,6 +947,8 @@ patternProperties:
     description: Shenzen LC Technology Co., Ltd.
   "^leadtek,.*":
     description: Shenzhen Leadtek Technology Co., Ltd.
+  "^leeco,.*":
+    description: Leshi Holding Beijing.
   "^leez,.*":
     description: Leez
   "^lego,.*":

-- 
2.55.0

