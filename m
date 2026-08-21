Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E18B4C8FE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328669; cv=none; b=ZZMCHOA6n59QvyQjHsCsWmkYRgjtzFQ9ciaNzeRDFJUuPMwaY31IB2Y1ZgkBKEer0s19FMLh4y+chx4KHNxyxc/JQCfBgHZuL852P2Xo6eXAWjIzqKV0K7z564BUW2iLixJKULpAJEdbcZF983ZhAZhg+WwJ24WkqYZrTZ0Wsqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328669; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2Mv5XiGlqXfJrtPZ2CYYct+25S36G6WiU+Ob7m+mm+B40jfn6a3PzrQ6iwb2b8ie/ghZpdNtQtQiwvAPH94CqQwcZQV3gv34nFEuCNbjzylnyIsz7+Zpm30siehPglTmztM8twcQQ+p3El7Ahr9avewIXATU83o47VvorznIUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcrIhoj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/mKRU2a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcrIhoj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/mKRU2a"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmHZG3172976
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=DcrIhoj+gqo3VxAl
	tAgB5aH3Q1SeXxZuJe0u4LaSmlPLEOh63oYoo/ckaKBnJ3XJUkdDsz6hKN99ufzR
	4rfYJNYug5C7UvsvwIX45j1G2A5Hso7HenY0VGh5L3o8jqLhfMwBNW0gw0Bxaz4m
	oWiBlv0r7efT58Rm9tTWpn10p9fTpgNHi8glJjp1b68wNgK3pKQJV236uOh6K835
	kFQh+odBAX/BYl4UotEWrqXaCyYZ31Q3EMaFLpn5aXl5ww5RfZUBtk3TgWD+UPsI
	ay4aXM+IzfvcWH6dNW+zL4AV60tRtb4v3dUojZ3RysausmqtZ50bB0JwwOjw38CY
	H0eO1g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf2das-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:05 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dafb8e1so1734844b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328665; x=1787933465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=T/mKRU2a+Fkwck9lx6vyWD/BcsiJ0x31YVTg+db9Rd9qDFOPoub38Ig6c4B+QdvwLS
         iDHzA1oagalSBFEfHBJGYidJ+L7C2XCpG7/JI8RV/dMhRtGiUdfOgMtjhS6dszWsBeGk
         b5zIdJyT6E9rNMwKW6JobxGrpdBQ5nkHqyUUmf5xv7mceOhbgxqfL/rp6vqKGlxaiAgn
         BuZWbiHWIzFmgY/3VanOVyzAglShZyLtbBcudHllnNBX8bIIBRBaKMzk72M/OXH8DTZH
         TZjsH7CuWq2llrCbkWg4Pn3u5NyJ7akqK63CV6nJE6u01ujZ91sXVGstICFMdvGot/KA
         fSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328665; x=1787933465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=PDJyh3yphdCquyJV4+0Cw4dKveSOSA2SWuPEtLcka0lYCXRUae26bigiqo2J+NY7rb
         YPIvQxvq7GDVu4HF4LUJOGK1h9bOwq0LXU//+GSX/++hjgBRslFdxHrtb6E7t1Dc9ov1
         5cZINQ87932nrImlg8813ex26iMk+VObA2a/9NnXgkV5dvPpGdBnmHoOJslvM73HBiXd
         IQuPfEv6EbgWU7NpOs8nZ1ZY8S4PxySqao07H4MByMiv1gRL0F6aTOVmqsg9PYOzAoqF
         1nJjE10K+vT5MgWG1qWMZA1pbdQ/wdoieMAqcloSyiYslYCeGL+CVgejRbm7MJLZjQGz
         148g==
X-Gm-Message-State: AOJu0YwTuRrSSuxacA3KbxJzRZbQnupsszsd/jYN1Vx8eZLtDgtmbsCM
	cwrQM9nCFoLKBZUGOnvIWg5+RW3Lgc3M75oB7ShlR+IOUz1X0y9yrCeYHjLIxdPpxopw0w4+KLo
	ngPta77giMxSMLrzZdbrr3eA6egGUpaW20AoHw4673RPmf3DUZI6Atsw2cmjZsL6RWA5Z
X-Gm-Gg: AR+sD12HQKqlwUfx0TA9nuyYKsCPlZrx1bV5q7vyxO8CQdmXFbCX/SyXlQzE6oyDyjw
	v6oM8LJxti37IaqJxndF/JAa7g37w2JgdNrq7goLmCCf90NcbZZzoTuAJNHzBwsXCk9liWtEuIh
	NzDSMSZI8R5c3tgY1zFdefazbdzfApeefrocP6PAz6TTWdEmW7naC6I2lpp948/pX7YcF+wyIGc
	ki+Q6zTmpZGL8fytLhafafY3hG+cfh7gs1/Z9OGYeYfPM9Ik891c5Z4XoVKs/CsZz85OvtVj6UL
	RIOFRdK8tXk6Obm8ab1wB+D1CB264r1cEYPrghyEK54HadX13zmKgFjBnYA0Bc3v/vpndl3mzQF
	naV5VES7LEH9C0rEDWQnneB4PAs6WohK+nIE2qkZ5idfiFcaiDOXxvkSUmGuh2vlLCLcoaVRKta
	C93YQuecOflF2Cy83s5u77zBA=
X-Received: by 2002:a05:6808:6f85:b0:497:d1e7:5e90 with SMTP id 5614622812f47-4b2ef484825mr7959341b6e.18.1787328664807;
        Fri, 21 Aug 2026 09:11:04 -0700 (PDT)
X-Received: by 2002:a05:6808:6f85:b0:497:d1e7:5e90 with SMTP id 5614622812f47-4b2ef484825mr7959242b6e.18.1787328664353;
        Fri, 21 Aug 2026 09:11:04 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:03 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:05 +0530
Subject: [PATCH v3 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-12-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=2sItnI1/4L/9XIOYN3sjBKJAtfnUof413EvY0YP56XbV9w7Vj89ry+ko23SAtQezQt949xqJR
 aNNjt6EqrBDAYsTIf9MkOarrSc5KZaM0lgvJno63rZtiFUlIGrbWl9n
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a887899 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXz/uoVo/W71ij
 n1egO9qkGB3qG1hcPo64AzictESx/vSUP13H/KTp+1hJKy3I2qxh3LcwX6Y3txNLvOlp2Xm0K5d
 UjNNnX6vbqvTkZjMwMDbcQkBEnZinwFs9nnNCDYdn079GaB57OQH6zJ5Lf2ZVvKKl/DP+M+mBRN
 Mq7kZ2qrxwBtP0N1I5O44W1lLY8Q2Wwx3CZoAY8odXJwHZ2b5quc3RyXoWOGvPT7O13XhlHvPnC
 xE/YDiEM6190ZC2Wp+Tzf7PrQrbkFl8XZtBzhdBw7zz+g2++dovV43G8ySMIaMsS1L2LH80HREu
 /R9uGowQIsThxsnhAG7kGlEv8+NBcNuEhzBFyxNrOVXu5/i6cweGvt8Ca8E4w2E/2iFDs6S1Dag
 giUzCmKc2O08qcJUGB/w98vXzc6HMg3A4/KS3GMYaXXO3TXuG7Y0Ij/ATQjj6nUlSX5d9cYGLCW
 lRz5ZV4sWmIxAA0TyGA==
X-Proofpoint-ORIG-GUID: JiKcXJLB8F0z0uo7tDXZSfq6Na8eui7b
X-Proofpoint-GUID: JiKcXJLB8F0z0uo7tDXZSfq6Na8eui7b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX4lP77ktJOwBl
 +MEpws1lV8DgWlZOmo59YJMRLDcnkFhqzisJogKIpk2PMN3E0xJcIXUy6zh8sZPhJq3Hjr61X2z
 XvC6mhe3AlP+De2S1t/qj9aQUVgPrkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

