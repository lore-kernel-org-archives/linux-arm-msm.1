Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7133AAF4C
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 07:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260547; cv=none; b=ZUrdNEXNzGJscn3JTfqXHA/UBrx/XPblft5fCRkq3lNhIS3ykQ/tlQ8+mHeGYsUcIvZ9Y9VUSjN+lC8Yv0vxt6UbEbJNy+XL1J0W/mJXA+RNTiCdkFAxC1e1ntLN6veNv7xYj+j0pnOiicCv/DEYpO4kqbc/tpyGbhMyJF7EvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260547; c=relaxed/simple;
	bh=cOmOJ5dbV3GIQe056RBD75wdCBDJKgyApOIxb4F6H0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5UxOE5NEoyKe+02U4N3ZbaJuG7cxhjysVwknrAha5PSy38WT/iMP/+1ama3PoieoonmFyUuxcDOVLM0Qt9StaeExvcWyTZ/h6zIOVL89r8JFrcUqzS6N/dmLdX9DKzZ+dOE8X16Ehxz4Ux3HkGCuywAPBbvrNCD+l8WSA9hhSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqwJwB+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBF8MDD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqwJwB+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBF8MDD3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795epIL1964166
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 07:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=; b=GqwJwB+/+9nhdaGB
	ZAhT2ftoHgMggjeUqgrE+gwShf03PhpseCsxHpmiwbIgqgxyReeUssghItdM4uEG
	Rl1tQH9uDo4wdeLDuMUDiOUV61OrhVXdXHaawHsZ/eMVi488Qgw0uRrAl/CofYCG
	ghhhrfhvWUfSGbajJJyQ+49mfRWrKUs5awC+7X2JiHUZ5Zz4vhMYJDteMyj5rNs/
	z4yBB7EXaP/0LMgzr00n/mlVdaq3WOvIS3KqvW/9D2kAFTfSq0tCzdttzFwQB2oI
	VIMjGLrkQazqamga42pZdKhSnONe6E+gA4U8CfH9ZdEBBPsnQAWLYY19ieMkRe1y
	FSZ27w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1jesd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:29:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so2139993a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 00:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260543; x=1786865343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=;
        b=OBF8MDD38zA9TDACSBvzWbhGFsowAFXN8tfp7kHCt/a4scAFOdrorzqavoTx+Zh5/h
         PQGoNF5wM3JcNJ6E1VHfwGY9iLyEZiWZb688ebaCZkJTbpd7tojqLPCDNJ+ifMq463Xv
         NpHMYIha6K6t4Ek3NeJ7q0OpptE0xcJn4j2fKZFkdzw2ROFwHBOA6TYs/XM7+7KfnP2x
         bzpDYoZpoNv+KPe9a60j4IwgWHAkZMTudQXL4NbMNEBh7vqE0cGABwNbQcW2f59I/WS4
         BjAJ995VOZLVCKstA9qm+9ygu+dwWQPV8tSvA5j0o9P7Yh+hmvjK73mRr9MEchuoxFqT
         Lz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260543; x=1786865343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=;
        b=XPs2A8PRLrik3zoiSFwthcZJMNu6uQPhikwQ8a0f8ylVVm3MGZPjiE4h0smfcxCoXj
         L3LBQsYLryNJVt7NmikdMT2kPUJ8i635gVoAukdJanGVamS+xvK20b5GJvLPIuxhPy9x
         r54XCbSh3TmT9BWSPSAuUxepmMXB1PbVKy6hMEqh6uf37dZf6fuBeRV8mtPjxsG6sDWf
         t6nwpHE1MNUgxJ8kvmnD4IIuJFrQEdGVpL5Nyae07J1ezHLy7dAsS1h5eSLp+aco88nY
         hnwSB3Wh89RHuvSqMsp/fmTY50S/KUEzYcjKr0Wz2fG4Dq2S74vzD79MUHYieWe3f2n7
         AwwA==
X-Gm-Message-State: AOJu0YzHZwqrDPp+iE/URmJ37ZDc0+TQ9kex0+2u1lQGaH3T39WKJXKU
	hHZBqaBx6m47Bj6zUgO6zMD14tBfrChefGR0dfNDrGYh0BUCgtaS/o0nkgeSzo0IGZHKi45CO9a
	/w6EsOJqAzaLLH2veGZmNg3YU2ctzUfJs1ZWMHchYJe6eMXzQO1NavxS5khR1Dw61N3+2
X-Gm-Gg: AR+sD11b127dbrzFBf4+wRV260NvXZ4vmqvsWMgWSJLejU7L8rLiWpRqMHMvqhBJu75
	M1+uYJbk9uqOzzOguG7qkeAG2GQM93vlfsEyFNWrTPUl2cdGtHDLuMPCpqMejQhpo/y2Z1XefbB
	C7qd0M5YWago0NyU3PPXpTRRv9bzCyFJo7asbCIOZiSNFXkbzXBdwTGf8dRG9esRHRj6osb4lO/
	RCKgU+Z4Y5Yw5VTRakZwVsjZvvL9O0yTYkJAltb8fnlHWFjva3IvoNMXeQy92wNuxC+qo5teKdm
	GP5Qj1WgdyfcCHEnZciMu19IP7fjT0jjRNomDeH2vgJCuvayHBfxT3HSeQg28fWc5e7m1z9pT2R
	Qk8LP4A9jiAV/p7NmRSCv+fKqfRUMbZfQ87Wh5ounvRp56gPQ7cbZB3gC6+bydr9fjEthfr+3XD
	Ftt4CaMEDZ/atNkXwmBlkT0WU=
X-Received: by 2002:a05:6a21:511:b0:3c6:62e4:91eb with SMTP id adf61e73a8af0-3cbc041f1d5mr18614630637.24.1786260543527;
        Sun, 09 Aug 2026 00:29:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3c6:62e4:91eb with SMTP id adf61e73a8af0-3cbc041f1d5mr18614587637.24.1786260543008;
        Sun, 09 Aug 2026 00:29:03 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:29:02 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:12 +0530
Subject: [PATCH 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-13-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=798;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=cOmOJ5dbV3GIQe056RBD75wdCBDJKgyApOIxb4F6H0c=;
 b=l9PLOYb4vo1eA2JQoI6YE2Ad8LxymxwZEW6f34g3FTwoT5FQ3BB/16Tuu5NJ8iklopEAY/w0L
 LUVNBTE2SBZAMvWNUOoGpSC7suV44JRDq7COOt5gSNJL+BHPAxztARd
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX5Fe6MFHuNRf7
 YwAgA1+xz/sAw5IsBpPB+RMR0d4hkNKTCGOJ9Yj2J3uxrQpskLliw6OEdYJuVas1NFDVINZxlHy
 cEkRecqELKRcaNfGiFzIQDGZIa1T0RNdjhlQ3oSkZeC43B64jvBbYhFeW8uZSgiWvRZH9jFCLrT
 BxdqEIdUfRwQWRYLR4dv9DhGwi6IZQ9YbhfJ72kdK7Fx7l1qvVhOkAnUa5X1T4NCCXAqwdFXAzM
 s6b7jEeO5ifnJNWC360zPDASx5rIk7tBW/8jI7iJpLGTV9OfCSWOnh3dFr1ntAvUupoyYFJsxbv
 +I5xis8zlhX8psMrgGUqfzDllB/0rLPmlu69n/HUyXYln21FRfvGxSv7LYIJK+TWKNbzGfeAhBk
 6iqvbb7HMAELaQLYpav8ENzuMmPU0jX5GfSmcpEHzqtOiuvYYiReZkqYSkj2EVZYfXvWhPqMUTj
 n4iPyuTL2++aSFSUHRQ==
X-Proofpoint-GUID: bdiTydEj4HsUwi3U3lA877LK50TA0VYO
X-Proofpoint-ORIG-GUID: bdiTydEj4HsUwi3U3lA877LK50TA0VYO
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a782c40 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=01DA1dDmEfGoSNMvxaQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX6rtoni45weM2
 K4p+Kq8A7B0uGjTkWvAo9MITNNoj1xytKQU0FjFkZ/gjN1Hf+tcCW6Si8zo1AMyyyYJc7YIV6Cr
 /7GT7vog+e9c/BKXQ+bQ4Um5MBV3Q/s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

