Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DAA40B105
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791712492; cv=none; b=KjnSjIt071LdHJX/UqNcsovWQc5eUasIkCQU7gfJvnmTFvmJXAkBaTTFSNnQ7lPfJ2i+B2ENJD2JRLiziupX7ssFRtiCOBTNLiynWya+pH384kc3QntUHuNvf7xjDYDoaf3mFn9En3m1Yhnp6SNQ547HIZjGzbPh5htH4+aXljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791712492; c=relaxed/simple;
	bh=hj+ukPb4HHMPPos0n3Rz2Fh8QZI+GgDEPHfKYAC7lmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRirDK6FTaaSFgZV412qUwZFmLHXdqD+dTDq6xWVEno/yxJGQayKRqkXxXq3LGGiDJX7tocjQ+ItBORu/Druyl3l44+nl24JME1kJT0ruqC5OTOtdEz3F94Sx5hgMcEq9NYsuFrqtqcn5giPeNkXbl0VM4lAtUix5c2+WzYKhgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sE4uuFuZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sE4uuFuZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16c399641so10271125e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791712489; x=1792317289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRjXaHnkBUD+ve12tt7bTvLX0p3FD2oX3FmKCTtwdg4=;
        b=sE4uuFuZOBZTMK7CzigpIi35DVsEsJhfVSCxDsiQT0XXGdTC39xyp+GtjUBZjAkX2z
         TVft+1PmgeLBtW3Z3MW2x1I+BGZ5gcXyDlr8A+PvDFW5OhX/5iqoXxPciUfOIzP8DUTa
         u4U2/WJoJFzB4vG3E/U/5ZGMX3azcDsOGdn65CSHCs1/A+in5wQEMipLf9qWiVtZvMyE
         tnysTvGeqoTWYyXQSHiR4LgAL0foqJQ6BL1OHkATHd5S4TYZMzV1FUS/pNYQOeCe4m20
         bN7/yiGlhCz1O2kWTE/0b/W0Ex3ppCjvVWVIIvQ1AHRevNlib8qUfA4AerqziETAevKq
         gKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791712489; x=1792317289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRjXaHnkBUD+ve12tt7bTvLX0p3FD2oX3FmKCTtwdg4=;
        b=Yuedmvc8t8Gcp9NgPUKjEztkTdmxApszZ4DJRIgRGEXnjzcx+APm+xeStFKC0ZbOZx
         3E7BuFSN3tsjuTloYHQkeRuqs6TLrQgddNW2UM5RndBYpvMIV0+MaEDm1KzbS71xfmZ8
         cOQt0h7bMqunNpQ6yADxYBBdXOkjYqT6QvvcIem18P+/d62lFcZCet+EGLWNvdCmyr67
         I9SHfFRqC/PJ83MJu/QHr0pQe6Kklty4Xw55ZOpO8ojnRhXUyv2oxeIQBhSEk5xdKk9i
         nHKXLAH+Bu1KIEQLen6SVEEAK6b391uUmv90vqERdLQbiKpxXwsjKk0CCftc2v5SaGNH
         iT6g==
X-Forwarded-Encrypted: i=1; AKwUvBwB+/m5BfiyIthmUpHIX0Ro2HK2HJGwF2MUWUB5V72ZjTZlZ0zx8JBZPOpKpNO/qdM1YfZg7S3OGnBRgm2j@vger.kernel.org
X-Gm-Message-State: AFq9FYIZSRSfetLsg756CY2KKKf2ngBZyVezys24mfSSDAkSSRYCcL8X
	ey/yLIB9RrJnHpS34oRGLcTLJOJ0SPJ/K01QLZSaGPPCtf8VG6B4V/y1
X-Gm-Gg: AYBFou0zX24uUFqkaJWtbXGdeKh2h1MIAeHp6Ogt9RYh8d3b65dzrwDQo/iHNJT3XZe
	8BCg1o7/TxlqcdTYtAe1rYi1n23rQzG7bmk857Ifn6qJ99Q+HPf8+h7wWQuwFNDeFavTjUYueVM
	WJcBG3C8lJwRYsjtIAlJNrX2j7XUekRC11tWwbkQPQJ2UMpvcgsWjUMXVbOiKKpgi8v7nV9FFtb
	lndAze5+ys7Eu1jUSyq9ftv4Q9pBCtnMCHpDIMpSM2KL92hgMgZCc2aX9W2bdtiIVXdrpK4Y7MG
	FJY/YVRKU8KuLefKfFF9W4VMFSBeOQyIwUBaTEreggcX7chIFQ80vYZZvHf9VW9AlAXIWBabMzq
	l5Xct07iOiNL/9Ctozw7dPtacTPWKz7EkVJRW3nFQ1ZPx/HOPPLt2xd8Y/jukKCI8uxNd/9lEa0
	EaDCagmzeRcJBBk1MFT/G88SDdY7+Uausb86pi49HFLwzQdHLZXt+ran0hXfBdOCo240YhM1Lt0
	0Dj6ZROIGdTabU=
X-Received: by 2002:a05:600c:4e89:b0:4a1:96cd:2f64 with SMTP id 5b1f17b1804b1-4a196cd312cmr57392225e9.1.1791712489134;
        Sun, 11 Oct 2026 02:54:49 -0700 (PDT)
Received: from localhost.localdomain ([151.27.249.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm377837785e9.9.2026.10.11.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:54:48 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Nothing Phone (4a) Pro
Date: Sun, 11 Oct 2026 11:52:20 +0200
Message-ID: <20261011095221.24767-2-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011095221.24767-1-oleksiionchul@gmail.com>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Nothing Phone (4a) Pro (FroggerPro), based on the
Qualcomm Eliza platform.

Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..36617b485 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -81,6 +81,7 @@ properties:
 
       - items:
           - enum:
+              - nothing,froggerpro
               - qcom,eliza-mtp
           - const: qcom,eliza
 
-- 
2.56.0

