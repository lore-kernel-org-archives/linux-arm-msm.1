Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2A541A547
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238815; cv=none; b=SSJdzoFXCC1/z+Xff9vJYP7I5bWkHuY9+k7YHgImao6ijuKaLOAQtj17VY1LFGHIlNNLvBU7G0Yq2XANyj4rBGAZJlZYeaWL3PxGtAGVwpbuciOcas8ObAZkfTDjDq3g9zB5EfFinWjyIxd0VDLz3EXXTcPyxg79fLQXqW9B2qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238815; c=relaxed/simple;
	bh=BLYINOzG+j8wRTKT4ZsVkwaDP7ZaJIacVlW2Zo5nM8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVseG7OFW7zMn/DTwbYr3Vi80qQtqzHO1nrTMQkddPxt0/vpgF23JNEiZQai2jnb7BfsyyIGXlP1MwDY3MNVlnv6S1d31wz3VC8Flq0F9H/thc1aOQahJsl0cHi/8Ipdvm+Yckj9upI0TczqfPZxgNurMLmlX71VErLHl0439QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knCE4RrF; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knCE4RrF"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc44f8f356bso43903a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238813; x=1790843613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRXNlYLipD/yiMI1wfZqSuy2Z9Ygn/v9sO3rrHh3+UU=;
        b=knCE4RrF3Xez7Q0aGfex2FBlUJNnUu9FCOrgEZqVMgZsxjLqHn+OhdZutlqNgThJqg
         nii5wujQoV9iajaOWEL+BukKczLX96HMYE6QNDkjZyCnYl7xKSGI7CbNS+olohywgfZw
         zQLnmb3MNfPFu3sF/lNTI1MFmrmRG6vlJir001pYaqrg3pfzePSDML3bzCii+QKSC+kO
         cN/PAqQyX0OIx6gjQ7FSysQayJ/xB99vuY14lCcyHJFKl+T9eSqCEKnROkQNFXJtFE7s
         FjNuTywqDilwNTLhrhLMAejG8bxmrbY54T6m8lObuCB9pOmoLB7UVRLK90tTOf3CkTsw
         T/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238813; x=1790843613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRXNlYLipD/yiMI1wfZqSuy2Z9Ygn/v9sO3rrHh3+UU=;
        b=jW8aDx541wYzCFLihKbZBRM8n4cU6Q3idrwqbTLJleAXANW/u85o/50nN4c0UHEwD0
         G+Z32+JGkZhQjlE9TfhSTWxRybbLEpnQK5ZJGnJ9GLwA7Kk1SfU4z8BUSYBjHGCVYlw5
         6XtE6DjUDm+eXw+EkhDnDuiUGjrezhKtb+5OKFJ7n/+E616vVMnaGVC+ZPyJW83l3u12
         Cw1WO0EgkV5CtvfOSS0suLSJO/l/YNxFurlNIRi0+dqvb94adnALf3iyabfJzIQ+mUSK
         X+9Ageb5I9qutic2Tr5d8xR2YU/6E0md//huzMZ0DwlNmrYXyQwajI/u/wp2EnylgKiE
         JBcw==
X-Gm-Message-State: AFuF++nhPRLxx1zPX360ZyMwy3GG/L7zSYNes2ol4GkJ2jPmk+1CXTsu
	P1paHET7ioIoBUuToDAYR+64q2KNOXy1tu+Xsyq3mPM5fjUJeyP7VtEojW2Qhg==
X-Gm-Gg: AYBFou24jGU6BB43MRVFYZxsiSMgKNw+MbW8K4pk9tGoCEup6zk8+J5A40EkhvlV08W
	R13iHP+oA+uMtM6j1cCpwiNShiigiRCAS3KGFfR3qah/hhR09AENDDQM0C+Hy5d+0RuY9zArN05
	TC7X5SQHILwFXx6dzM6CU6EzcbAepqPocQC8PM3bdeYe5sXCdGDauH3cpib9aSPSDy3MbF5zONC
	9XwVHmPxpntEZfeKbx01VrMFSbPour8vDhXy0hSnIiO988SH5hGcoaPVLPUCuJRNzNrq68ZMthS
	XPv06+fKfimRpE15ugucyNwLZLj/wRBUt55Q9nvV2MFaurQ5kncYmDJqamLG4aVv49NJWzKaDQ6
	pBMapeWGq6S9mEn+Tyu6FHkq40Fcy1++aVgpihDmhWbF/KRw5CjOEvHGPskF0dHSO7ejIJfbXv5
	fIY1UflBXX5IUq62Raw5Qj4kkTmPV/Zaml8wxLgNXchohrcrCp4e8Gilu5Cpv/sYf+4Q3CKo9kJ
	MjUbnRnMsX2nLG9MtaIy5KL
X-Received: by 2002:a17:903:1663:b0:2d8:d29b:c1e5 with SMTP id d9443c01a7336-2df7d71ee93mr26583735ad.0.1790238813321;
        Thu, 24 Sep 2026 01:33:33 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d8asm22659015ad.9.2026.09.24.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:33:32 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Thu, 24 Sep 2026 16:33:01 +0800
Message-ID: <20260924083321.33129-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924083321.33129-1-liujianfeng1994@gmail.com>
References: <20260924083321.33129-1-liujianfeng1994@gmail.com>
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

(no changes since v1)

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

