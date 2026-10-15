Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D6503BF4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057794; cv=none; b=Rtk0qPxsLXf12ZayrFW2GrAiqvksmToFIDovLrEQBmrfHp7iSBXfuWG7WOBZeB2VJdi6RUFdzqyt067/4nHNnIICpsbuIf/uC7klanr8TC9Ppu5RWPTHoK9/WRYm45VHQhoG4BCfCKNw+5nDNwNZC5emqnjCsjKqAycABSDqvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057794; c=relaxed/simple;
	bh=Y5mDqQIodgDg69CwquzDO95nLQX1pocUdt6jGCRougk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dvyak4XEWMc7bNUyWIV5XVqzsT5n8fPId/EAFPGAPwn8iwteHqU19h6DKfVRh1DwbX4y1qvyH/ugjEfv4V+cbzy76Ugc0PnJ0GQ9+TsKsz5zIClw1m35DNGzJOOMX+tBPHM7Aza6Dus3EheKZirrQd89Yg8lY0JOQPF1M89JcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=KSFv9BXW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="KSFv9BXW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so39700045e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057791; x=1792662591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tngli+sbclxXmwFOjyHw6Lpl/UDG64/d2I1Pa40mIM=;
        b=KSFv9BXWovBKAYr1N+MCRkZ9LSjI2bW0NIqEIeo7BLLzybgi+U2/tRw5jWYlvOc24a
         EKmAafpQ1YB71dvhBXHrwMFr0G2sw8lwTnUkLMhmcct7tM2WeJnFIsWMEn8EIh3mISCm
         pJLhZ5QCi64mDnpstJly+hkmKn32sENY31ruydTfhjzLZNkf4ic7cxd+wT8FLuUr0Lt7
         ZNxz2yIS9blwbmooerWwLRoXnGeOAiuD8HSfxx69A8FxE2Wt3gBBFfL9yRM6dGahCF7h
         cgS+MrC8maea8JOBGeG6poXTUNcePXNt28nFZ4V1Wuk7KBRMGiChdFquN+bpssg+rBrg
         4w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057791; x=1792662591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tngli+sbclxXmwFOjyHw6Lpl/UDG64/d2I1Pa40mIM=;
        b=Qh8Hoa3hZJped3yTdLffIzTuOWpc1gnFBCLufbH4ui8/8odZzSvZ5JYqLIg8f/gx5/
         79Lv6HhEYoEIxJco205/g2qypKoNBcqiyamXtd/nZcSImKolhdMz1MJS7vKcPwT+iPBk
         TN2MMdQgC4HleIrsNPDTa3/xv/FDueck3HzzVl9N0IVIDxBMpJQVAtThNfT1a0eH9vMT
         si53haTs4K53ZEGYm0k2X1rAAqneSI/pqdunu86aT3PH7moOmrw77cKztA8XVFBIt7L+
         cggxgmHTvNrlY5VIM03aTyzJhEf82etuAsrE6GqWpt7fxaDCTpBmQC6gtb2ys4IL+t/c
         PDRg==
X-Forwarded-Encrypted: i=1; AKwUvBx0iQkb4pdO6Apsba3XkhFychNwBj7bsN9iiXgO0DHtxEkKj5I8iwDt5K0mo4UzAGHlfPDj/CDX0chD8dZt@vger.kernel.org
X-Gm-Message-State: AFq9FYLsrteOZE/Ht048Afv+6Y86DvXdE/JqPLBAYshRQ0ayuwZ9cFaX
	774Ensw8GyuZMHeUz0Dr9wCb6egQ0GOlQNdPd/XXs73zojCVaz92d3zav60/iH3l+WI=
X-Gm-Gg: AYBFou25H0rvNvdOy68+2RdF9eJe+iA4iOODz2AuSZzcIq4SkD8m//jR3OR3ki7mgsl
	6CxNNFimnKFVt49Eh4fiIIxdeT6CVHZZj3VPYO+RaiLZZ9NZnG8rKmaKGKzfI9VrpG+E2dioFPc
	miD3wSBSGbR/S6qW0XzAfnyaI5uGrEIAkrjTqEMnCgoJUXgYJD55d4zmf6rGApqqlPVByOW7j/K
	OJhReGB/GeZNK1As6tYHx8aEEGNsQP33lrBropHVVblpHWSuGu69ilHp81yyETu6eyuFWMer8rq
	3EadGcosObgL26/rhVWPUYCUMcMdqXA0pdV8rmCWQ9czBKzM56LrSN4X0pFy8R7KB4wfjSgsHII
	GNQVMWF7L78HgebyavSIFcGoTB3C/nERVUudJLkr9g7zXj40NZPIhqPcShWgEMUMmliWcbEJfGr
	0kxrxh5Mbm8tucZg6px674Kfe85zHDzA7SD8yWLDqTh3pKxXvla0FSGnqbwxHlO81Iy/fC8omz+
	0TyZjcPL5DdcgaoVHEZDGxm6YFyBv4lqgecBaRPnK5K3YMZVcai4yxadF6VYXgD88FIcLA2Iq2/
	So6X8lLf9Yd5ZXkIaXP/I+zjkFEoML875iNO8A==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr345613225e9.26.1792057791376;
        Thu, 15 Oct 2026 02:49:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:51 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:30 +0100
Subject: [PATCH v3 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-1-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs.
Allow their register regions as optional trailing entries.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 .../devicetree/bindings/media/qcom,sm8550-camss.yaml    | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index 4b9ab1352e91..683a19a1f288 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -17,7 +17,8 @@ properties:
     const: qcom,sm8550-camss
 
   reg:
-    maxItems: 19
+    minItems: 19
+    maxItems: 22
 
   reg-names:
     items:
@@ -40,6 +41,10 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+    minItems: 19
 
   clocks:
     maxItems: 36
@@ -424,7 +429,10 @@ examples:
                   <0 0x0ac71000 0 0xf000>,
                   <0 0x0ac80000 0 0xf000>,
                   <0 0x0accb000 0 0x1800>,
-                  <0 0x0accf000 0 0x1800>;
+                  <0 0x0accf000 0 0x1800>,
+                  <0 0x0acf6000 0 0x400>,
+                  <0 0x0acf7000 0 0x400>,
+                  <0 0x0acf8000 0 0x400>;
             reg-names = "csid0",
                         "csid1",
                         "csid2",
@@ -443,7 +451,10 @@ examples:
                         "vfe1",
                         "vfe2",
                         "vfe_lite0",
-                        "vfe_lite1";
+                        "vfe_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2";
 
             clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
                      <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

