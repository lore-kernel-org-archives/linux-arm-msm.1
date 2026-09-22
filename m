Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF637F75E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042294; cv=none; b=gH4U+mPP0eJEiuk7EiJ28u+C4JdsWbJn2388Ov3MBt2H8+oUkux0o5o1E89WeYZhNkF4U+kvXxX+075O/zs91xrjAXrYFAt5J2iaotX7qScIthtIE/nWe4cVbJ88pgyz48yvYEiD69IUkXNRg3G4rE0iyafr3I5qYTRyMmrcDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042294; c=relaxed/simple;
	bh=R8K11s0BndL6LE0ql5BRGc7vujvck+7Af7FsCOsZG98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCwD72mY3rWtH2QHhI/vnfOCtPOanN3M0Ky2Mo7RemSbCFzz12tYARb9+7SIuHf2MOOJAQoa1hLoD1vb2pgn9CwY7egzdCg8WgHX/LDsw8ILZ3EH4SWu3c3/PNK8j6K33oQT+ePo5xTvL2qlnNAUfAKYTAJrEgANZROtpJtCATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsIUay0g; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsIUay0g"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadeb0so280947985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042292; x=1790647092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdHhQQ9Rh/yme+QeCJrihS365SLLVixpmNHdxOf0vqk=;
        b=qsIUay0gORzqajTzlYbEE664AD+a1BN98rH9nEYFjFojy8vgmUBMVKHw9TFQF0PxXp
         fEO6jEpKOxwN5yZv4cer2u9+T/hOnD+onpUipqTejr/GNHqk2pk4wHRc7PXqcHbeA3Z1
         QzOzcoUl6ZkBmaxY5CnGYSyu2o2aFOs4pgzjKBZd2sWASJzMgcb7h2DO2pQXQJF55tjN
         ZtF933QNDQM+NwCAdcK9YTDeqpqElPl785HIdzbhbdKp1pGiC+3OTU6OcjorCq6TdhfS
         O0J7FgsgcB7TGEyrKnZbXmva0xpbK9ga7LVq6zC370TgTVi8Xs54YvY2zduUg7/PTzcc
         STeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042292; x=1790647092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdHhQQ9Rh/yme+QeCJrihS365SLLVixpmNHdxOf0vqk=;
        b=cS1jBRsxauC+cztuO490dt9uw0FCKEbcmlgbUTp3wNMvRsO4MSqu5wkBQ7s9a1A+Mm
         HkUaDgproBROhvWGYr0RqmpCl160B/IgsxHZ/Es5bU8pYTe7O3uY7FlE5PtjsjMup26H
         1AJN2F5rXlXaZB1tyNX8DcwnsMPcXehbIhNlzw4WcMcN9/phvcN7NQoxS5buEYnCU0I2
         QjHDdk2VEBi9MnR+96s2gmHkNGERfCVZxItZLArlCmENjxtjr0zDpu3pmhxI0fLLtYZH
         J+M2mZ1cb6RPZ4OxuS74ug35dU5H6EIU31DGCqtDSB5/S7nYIzaJX0k8Z9zWsmiJxydL
         MYjA==
X-Forwarded-Encrypted: i=1; AKwUvBxCMIlhbxsOal4HxPzeTVGpL4SNjv8cg11DvW0JUg+FUU5Iu6umU5UHHrQKagndHlwFSrfFeXkPQ9Y8cCtz@vger.kernel.org
X-Gm-Message-State: AFuF++myyc4QWT2J+oX6audTeQaoVxbocBwY+DqWblcs4sez4O+H6Q/S
	d7/p8ENvueVEg5pvtzduXMWVoLGtDSBpDwbOHqyiJs5Jj4oiB6NTyKtB
X-Gm-Gg: AYBFou30T7TFcbP4TG5joEPSLjkr1UH7D2JVtSuWSZQB1DOZmx2fx7XAr23bK1/i/Jj
	X41wLWx7CVRo9q4HCatNs4WTjdstjHnbRUKPu5z/RrPPmlB7FpYCNCQoe05jwvXISQioxpdUlvk
	OAGiy+IMtZJTdqDIDeJr5+/HtQJsATTP5eEIHy0zb8fFDiRPYIt5lgr/AugjJ0j9jqgXEz/3R1r
	mS5nZj4FtcNUV1SEH4y8H9sn4PPS6WRwCwngqXG/HfCfxCRpXaaMoQNqFxxB2Cm9B/GQaZuV5lU
	vqHbNOCfL07B7B5ndCKPc8LPqUdDv4Ud6lY8EbVwVsBu81xC+AywQjFA4vqDevKxfCxgrIyDqQ+
	HhwHEF1q+nGG6rAu0rnhd7LUOCRLCfMzR4GuS3umFptiy3V+vJ4mX0V7IF0/sLflYU6ABFj5Yv5
	lJTt0JJvCLEdNCyEWhIqfuZmogHeiTcWOa/YjPAHWx3D8+w/nmO1tN491CfocMsYAVW3TYPQqoq
	w==
X-Received: by 2002:a05:620a:4412:b0:939:46d7:4b4e with SMTP id af79cd13be357-93c15d76553mr341481085a.7.1790042292116;
        Mon, 21 Sep 2026 18:58:12 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d19ff89sm16781885a.24.2026.09.21.18.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:11 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 04/11] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
Date: Mon, 21 Sep 2026 21:57:54 -0400
Message-ID: <20260922015801.32373-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Audio DSP on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 7e8ecae8e6cb..f0f6fe1f560b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
       - qcom,sdm660-cdsp-pas
+      - qcom,sdm670-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
-- 
2.55.0

