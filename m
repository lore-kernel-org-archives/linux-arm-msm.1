Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB643A0E97
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153286; cv=none; b=dforDazWghipr71Sic49DJk/9dcacoc6hvw8Wv7kuCIKkLaMI2NYg1eLZeP9XmW2J42anXn9Qy6WJlFWDRVzrWvQaKaZxqPTzKYC5Xvgg91YYS8C0+U32W1af7JWZKdCGJ9AsnjRUqO2z5KVoSgdk8t4qUv6XVCXPMW5BJ+fx+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153286; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxN7AG1Ipdv2hzUd9rAjKI/UdMzz5KSPQr3fHE9QTdR/LwTP4k31ThLAWH7spI7a0WIjj+iw+AtKVHgO8ZfOThU7J4T7urfjyFHaes3JlY3/T0yBLyxuBwbg/b0nH1j/26mnaz/eq7efeg6yHFi0lsh1i8naEOkROnlF9bX2I/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic3uAUKR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic3uAUKR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cedda2ce6fso6731725ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153285; x=1787758085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ic3uAUKRMR9niHcAT2iLwtGfyJlpPhMBCt7Gs13q3RW9jDR8nxArW71ww3ATnwoUQ1
         eDXZw9kd0N66quWD5Rou44XVSfFlGoDixgKO+3A/nVFDyd6uHm/bcgS8eM2tPkrPQ0JR
         TXdW4g3qc/VY5buQ91A4rFf4Wvs7H9aK7BDLW8ugQZUSLC4TmW/wXqeNE362k+Nkl543
         vBcQaVeNo0YPk02QAUU41mH2HyBdkBmJPPTOhOmdd3GkaCw8DZ5aQvVHOm2QYa0O8wtd
         4tAxPw5nmZDyblPqi78fAEZEpDzQ9KB25TzKOdDeESazo39eKg6WoGFdrspfbzNlidqu
         j9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153285; x=1787758085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=NT5/NyEHgxwYdMYWet9l837SRSdrdd5E40yDu/sWPHxa6h8KlMXDulhZAg12eyFnNz
         DqAXKXnM7unNWGZpZDNrozMalDgcxDnA/T2TVp9vQhMXg56UBtmtoMaYcYDZjAychqzH
         GGIkiJru0qyed4qlWyofrws4CWUnhCAbLEoxmYq7+v1DvO7ZePLBsK04sK10rqxoWCV6
         H+fGivbSrE+0oriNrBy7LdhSNhCZ6xaZuNWvn8pX0V4McdCPY1a72fhqTV+Zwb21dGTT
         z2ZUWs5UmSm4h2mRJDGsXxG6O5i0Jqu02PgWzx4ETG/9O3CV7KYGLkB6HzSCSPCPhFJO
         Mxfw==
X-Forwarded-Encrypted: i=1; AHgh+RpOA8rwXwuvi1ARW7/TJ4UnLniWJbDFtITyIcLFnGMO9V1anY727HZOWdLNnL5zUuV9dsMSZ1hWz2srkvRX@vger.kernel.org
X-Gm-Message-State: AFuF++mFhvQLjCsQ2JH0ojdUNssS3evI8VjoUNCUitcZHPYWQuSVpeSW
	RSHjlXVE7G4+p4GcQ05/zIfQhM+5dRxrnhN1oFRkb74Wvr85VRzAG04v
X-Gm-Gg: AR+sD11gQvmnCG2GgQgoPbvcLShhQYwJZ2xbiZ3a1MSkT8EFBL0VQgZTwNUOVejrD3u
	BwIm6Wh8WVuNiockQZJoCdqjPmgDEOtzn0v4oDbmyfgDdWFFQwG/TZ4gnZMlBwvLSOqmyR9Xc80
	S5Pyu/WssPz26DtFAsu6AIKP2EGGVFhMLYi4fXvuJHdw0B8J8MLVoAunhiU0O4taOe+j3BNn6L2
	/sMKC4EvUCQlyGQOKAW236c3HGPCpEiThkyOyGTgPy8MhagwAtOWVH+8Hm2FhPEzEMugc0vma32
	Vt4IyeBQwjAphTsb6FFfKRTgYfpb3jQEMVJ0G/EMw/VtEWyjCRAgMK/6FSczpHzkKQXJR+y3RQr
	cxq/YqdgKuu5+FxSHD8CL2RWIC1mzPuUWxC4R6zV3Y4W4t42+7MibWT35VQRopDwkCaRjmS8ccI
	9eCoAX61gxyZw5ZC/W/KmgfeYonTRHlFbWbusym49EUbEi+f4mf/UvkUTmzdzm5yGOoQKSkns2F
	RtNqjlHIcaOmtOKEHyXnQ==
X-Received: by 2002:a17:903:468d:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d601ea52fbmr110193595ad.11.1787153284859;
        Wed, 19 Aug 2026 08:28:04 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:28:03 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Wed, 19 Aug 2026 15:25:40 +0000
Message-ID: <20260819152545.3934-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

