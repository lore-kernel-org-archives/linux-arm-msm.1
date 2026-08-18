Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4BD41A928
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040514; cv=none; b=Sgq37GeX2UYliAzKUDip4yqAnVaqS6b7Y12D1W2vuccTc9q23UDNOjLbnxm4M4B7tNKfc+qd66qt7JEEYCWF7tKpGfq3AlQ/oS3LbYyeuU/Tl41wFbclQjgk0QsRtuGghOwqdQs1djOjq4IV9IUpN3/ScwLZz+GSkb+y8cJ4aF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040514; c=relaxed/simple;
	bh=5rxYfB6fEA8QV4OQaA+5imSOiEABtOgJH0KumSHC5aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ip5dZACeNqXQ/XuAHUcKWi+QOS8Ec4w/sObPNDV6BH3OXnlWY2wXawETylXP/SBn7cPR4WoPr2oC3lqjD224LkrvJ4/0pSM1UrgbWLonJUGfmFCin3W7GczsTwkqn8yKnNfORWkpFXYzTDPcAllTfx4JAoYkcRx9C+l7ncODeuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffgphiyd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffgphiyd"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so579611a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040512; x=1787645312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=ffgphiydLPqrMkvk8Ocx6DiIu+lI1/7goj88H6UgB2YOdr40c99aKs+YYM4Jz96h9S
         jq2/DQtbrhaFcyOAQxNLORVNArEAtRuoAF7lMpsfFqm3785kaoMyBrY8W3JxVTynw35F
         HVMxARa5jXZgkXFu1iZ48mBLAMquJNr5mcBcXkAus8CxW4oj5XfEG0Bsz7ecCJmtJzBI
         h0CMJ0IdVO/UfeVozGIbQMQQCcRr8BYwb/tUp9BsDjO4iEJca4z4GANPLq57AfgXTnny
         ZSia6VPVULPEQpySkyAXGCeJ3wgnd0PmChD1TwLPTmO35xt0g7TZyIKMNw7JKC20Prsv
         vqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040512; x=1787645312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=OPlUFlNKs5iv+mJwAzYIlKUL34evv4NXzicPJCdcBIH2Q4oYrRB9EEP3hhZKGDj/mF
         rxAAWWxWsUE2hFnFH0Ygy2wkyWzqGvgcOZaobYwcQYsZJ75ngvohNKz3M2aZUshEsvEj
         A1BZ1k6oc/BuRDYbykac6rKDxrDiJIxxD5QnmHIKyc7k3uDE4QyE7UJ+N/7E61bx+ali
         m8Es05qmJNEEJw6fv0HGmeOYbuOES7vRYTDlw7TwBko03/9eHgI4I1qGuWlCLoRvDWwW
         0/ai50//sTtdFpRxiPHGVIHbYvRaUHdYSmuthD/dfdW2Gzo3OP9CcDG7RO7ZXSs5akTx
         lUHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+5SZDaMCXyV1Qi5XZcD5g5hWDTkepxNCYOgr88sS6VFnopOrFIWe1Nr8wDRgT3hBkvnhavbOKlqgtocUF@vger.kernel.org
X-Gm-Message-State: AOJu0YyHz4k7Cux2eBIRGb/QX5cKELOeZImie2wMxKbs+nUF5bW+8Tqv
	ozvKVVk+Iu2UdJeb1bKgkcZ9Pk2/yHTf11LKhjU/O9clBRrtA017wE1b
X-Gm-Gg: AR+sD10GBT7JLjpo9chbjgxuHmosoGQlhvJ77WrR9WTof2tl5a7gHPe8zijuCymlPQ8
	3paGd5lwo/uFrlkh8lsx8+hoPGoZRfugFez8IJ34qFr1d1A9LqeuQbhl6/F1DNps+xEIvk4FeAm
	/XGDxvPkklkdaojn1IlDoAW6saEGPot6d710quROoqwmJVGmJ0MVJ6uUbBjZrcS5btFXSOBjoJ2
	J1GPQhAd4QerPRfE/M0J9RKG2A4MdMiWI6zKGkhWo0L3OYVSlWG0hp+gF0jEPsKKOs+1Ulhb5NI
	nhe4Sc6T/F9ertGXt0OdwDgx5rtKn7Hi0BHIxboSjYV5p0eH4zxvxixWQpmjv37wvZ825z9T94e
	KAttcUhMsjOFuWxYFbrkkQjJKUwS2nr7T0woVcuT815OMZbew3OlE1mMI55Pmn+F8LfIFPvDw4T
	GnHKXxBacu49W5VrRc01WRAMRrACMbKu7rRzX2VpeWg2MWC57l+0sUkPndNvvMEkCL2sLbKQHB+
	eN1QkNV6to=
X-Received: by 2002:a17:90b:2e42:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3955f1b64b4mr5407158a91.18.1787040512026;
        Tue, 18 Aug 2026 01:08:32 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:08:31 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue, 18 Aug 2026 08:07:43 +0000
Message-ID: <20260818080754.4362-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1af73c0ad..3c1ba5168 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -208,6 +208,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

