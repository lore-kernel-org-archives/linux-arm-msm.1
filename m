Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3FC42CAE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299926; cv=none; b=g8UsYWaWbVMkYnR4HXfPKojqqaj+p/e6kjywYgAQhzM5UVbNOwTQaT0OvHvDbuVrqy10XZpoNiEj83bjvttyK4Jd2bA/WVTpt9RJIV20aqHuakIJwPjB8rNg4oXQxMpChoNE8igz4nFoFaOsF5WPsSMpkaqh/xZGiBbNdWBAxbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299926; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWw/fMAPhnNz3LlrRuAcs4D3fSzmfKiolCBF2WPQtINvxPfb0NIb51LyJRyV1zIVClDdNZZeKqia5ynLpboVUPYUvxdI2Git87mUmHH8Ikx3WJvh8b1PqruRl+iopc/MtUCuYTSrZk/NfpsTRFvG5VOz4gYwWVSb/4HW6P5gsIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGq/HyY3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGq/HyY3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so524149a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299924; x=1787904724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=MGq/HyY3MnZKxveRrcIzbnWrjqUppqiVVrrKF1KiHvkT+rXFPB7d6zL0V8Tatw2qxk
         kREhUP7ZryQUcZI9NByYfZiL1DqP1Yz1jtS5UBoG0CnerIF1t/nbD3jHW0C+xx/5DcXH
         mnnphyn98jfByy24RH990KdGKAu3Nw64IQV57PEJRY2tRaOFdPrR5eq3qVW2nqnXqjS0
         O0ZA+LJxoOHyAYJqgBR/B1EUNr8wEhsJhII5Bn9+mQDJ5DL6YRoTKFx1E2nu5X2KyeRV
         PNKrvJ3uFWS+gWtM+ST+o46tCdPidN+CzoXU507V4FWOimOjjN59QfjP0rV1lvvCSOD5
         7oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299924; x=1787904724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=iskYF8P72V596itQJFVMTkh7xklQB20bfYXu+42MdtwxsMNevlbswt+Dmz+zug/aqg
         7TUi94DXutT+GbqRmG0+7h9CqUOEuXNOju4rqExVeMRBzHFmXJAXSJGREA0kVrGpIIPY
         FyCsawiB3opXJd9dNrhOOeOyKUM4J4pxk0Byvw1xVz92wIiEoBU2wARSDcmeX4zwPB+I
         DBJ8OdCQDSjk9qR18Bg8sJaFzxOyIrtC2tzIobvFhqKw2ODZryrDVOh3D1OCQTlLsGNI
         xWKLZnSlfDCN6JeKp2QIbqq6RwqENfJDD7RZBQBwygkgnXtzf7Rvcpq91y58Msq7ONuU
         qzHA==
X-Forwarded-Encrypted: i=1; AHgh+RqMzXzIiCm9wjr8QZDtf6iqa9XNp4I4a93c7ADcNvhv61t58IsFKO/2pJwkDWbI4vxFjI1F0mJhA85i44kg@vger.kernel.org
X-Gm-Message-State: AFuF++lv5fNVZp+bXxGNJJhVjoBpkiGmPv2sWszecBiPy+I9i/C2yZ+Q
	RuVjr4w2jPhTfKxtw0ce3bC/KGzjUcZ4pGyAaW5unBZ1J8g+hDTlyjZo
X-Gm-Gg: AR+sD11Ao/qlHcl3PzjIQEZylPLi/+2H0ZslLqRK5tGbgmzE2iudy17GiwgqM3OWQLg
	14ytS8JRDg8acZv61jTm9JHeWo3xiUNt2ms46vNGN8ol9Mcm3P0tKPYX6ZfaIgDbrltJ3cJir4V
	IJueydv2LuFPbzBL1Wa+BGIVFqiYOzLUcOlBlUe6VkEKURKxMl4L1vPfCkpXGpIomiYFXZZ2jVY
	9jEa8J21LFPJy27FRCMCzPhfuGCeJX7qImStlD+H/fYCQdzM6UOFCNNAf7FxYAHw2Sv/gfwwf1U
	tpV1YCIlS2LzlXp5xeNBnRC9LPZJyhmJ7UwSfILrvfaap9d76nTum5qwvXWWYAvMOm3848HQhLg
	5oemjI7wyc3EZ2x/UJO+m6rLye6vVES/QBzdfm10mreEjbzmRwxM8ZM2tc0UbhPnJJS7UVU0SMD
	zmLLXFvN+nxZo/ruYERVNy1rumvxkR/uuy8aZKcLv6ytxuJOkLqxcKwcZe3CFZ5NzQqPD8EfUVj
	oWwLdaFQLGh7qaRSUllrNY=
X-Received: by 2002:a17:90b:1b03:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-395c39cb2damr7818751a91.13.1787299923915;
        Fri, 21 Aug 2026 01:12:03 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:03 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Fri, 21 Aug 2026 08:11:13 +0000
Message-ID: <20260821081125.4522-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

