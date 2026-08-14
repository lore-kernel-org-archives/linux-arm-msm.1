Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9321A40DB3E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692767; cv=none; b=HF6GelIVMi+wqPTJ+nS/p3muXp9Z5ahhJTdxK6i4nI5tp/S6dI4EsGbyBTZarDip23upJ7HG88vskraVzyKnUZ/W5QizpKa2CI9qFUnFwYclPQB75C1bPeLMdFsV2FvAFtAJA/C58+9xrdV4n14vBKPulLpn7a2lMFzJILVcog0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692767; c=relaxed/simple;
	bh=KipaZ7f4mPPcv70WXg+eNoIM2CY2fZVm54MKxlYcJC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffCMBj8mpd87mIQoydR/EI7+P3ky+hnxbZliLzj8zv+uwRJs6/9KwhgiKBuJwVLdqS1pweJau106Oz4YmJmjrhkTnyN0jhYjmhnlUURlw/rKR8H6SUB6AyqgbgiMLet4Ew7fr3ezm1bkgdm2rPB/9IVYRQDeEXiKd7qi3FsWTds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUyy9rIn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDjPtrET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUyy9rIn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDjPtrET"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Qp06594126
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=; b=RUyy9rInWyBciczu
	D83Nts2aJ8bcd+uFbYRw88Ee82h4Mmc1YQ3LEpAFFt6Exb8viEB+y71OWiUyyBu6
	yczX+WWLyn7lMFIqGzrBa5n+572VYSlJ+8jPUQTN9vdsxqGtQG2OGEhchTiwQKSS
	pd/YVSYZvGfGUJV2FhqBV4Mk2PoE8mGA5fPFraBXYupkuebaOUQW/6TjfS/zJ3XZ
	oHnjCLvcVNbHwqqakxlquledZ0429PxmB+8S21s1h8pD3j5exzxLk/ETmmpXX5kh
	oVMPXZcHmHs7+Hm6JlTPDKsVZZ3Z1h+ri1Q86B7ls0S4AIpu2jmK2flOXTWvI7bD
	dykCwA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4u8d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so505080b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692748; x=1787297548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=;
        b=EDjPtrETUc+84NuoeS1Wo0r88mMvEkDBOGMqHHlyOEdiAP6W8Dh/sS+RFm0XAMFg/+
         Ip6pg80q8OeMivn5aIwfIwdc6f4BM8ZoxLT1FW4iVQF+7zGiw1IKLPhRrZOUUohhFMtK
         6N9pPcDWauXT6sKSqXTsL3vpZEvjCL+yK7QcACJvEwDk5cxdW8ze+JePL0/9rZ+GUr4X
         FaDsmgplW+4D1k6HDu6NPSOUaXKj16ynjYdOOk7LXgSRDDgQ3zsZZ6znzeC8aYTD3R0d
         TYWzn5YXrNCou7xBw2d3H71CJYa7DyVguP135tOrhDS4mw3c1SjJ2NBQ0aor3i/KxgnJ
         UYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692748; x=1787297548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=;
        b=jpYCE2WEiW0PAECensJXLWkO9BDULZUn3BJg4h2e7Eh7T6Uu8iB/L71iHctQ4j5ph9
         A9TtBhfvjo8upUY3R6jDoP5U1DuawUNOjOa/ALnQDYZRH4Bj9Tq4TwilaOzw0x+Ag+L/
         RKJQ9NBfItIPEm72ceAdzgOcV0YEyqPepwtv+sof9N5DNwpJS3w4VpNU2fFcMl/bjpBE
         MBTd9FkjLn/HdDfZYSrA/z0UscX7la7Qqy9fYi3e6wrAdFIdzyqy0ezhG6z+qgoaZbQN
         mdxuamFYHhelg8cXUEsg0IVSt+txnXOsKqBNfaA1Mx9Urpz+2zInGCuLkiUOKNk4vu7g
         kTlg==
X-Gm-Message-State: AOJu0Yy8Eyu7xba60Z0yxSjEPTbDgg8VEHpkvMAL8u1IgxyymCLccjEV
	9LrzS48DSArT+CsuVbMzjywAkOvWm5SMjboNXdG+fUKP8dNGAxZcLUAQAkitKd+xGQK4NMNcGuA
	j1OUukiSqsu5P9aIIIx7guZGVwI0uLdErnnFU4zCK0pmK9vynYDk2GEXNdq4vkMmzWt6k
X-Gm-Gg: AR+sD12d4ho08bCDFfmOuvNY9ejlXb2mmSDaj8oCJQAtfZnllAneYbKLyl/xBQmLJ3l
	tFR3PEUYX//pYVx+HJVqYmMRiWC/wcnH7QZnn4NzwVa0baLfGPC95ZUoBnTxqYbPlB32pz56lNk
	xGIxJ2+exBkgvzLlUEyNgvVUvY8yxx1qjaKF3R1OHNncNsz71XMcg2fIlBGaHCxVIzuHRZG2gbQ
	K18i7PC1fr9p3h5DFVfOs0mCnFM4MtzpF1qWLnFkUrbwOEBOXTUm+DrphX9GsaXL2IRNLBB66nf
	o2qMkbwMblwTN24kLST/yRMHYdisjN+nEedtVePMsiuYBSm7w/fqL8rgO8GPIsLJgRgy/dRyBJE
	J4KTcxDFuAUKKj1zOh7Df0OkZyL0zd14O5937jDhoU1tY0F3oLf3UWfb5VYsCLJd58z1Uz13UqW
	KQgJgH7xMkbXWfbqW9a5/+bOY=
X-Received: by 2002:a05:6a21:3401:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3cc71e1b532mr4325578637.14.1786692748128;
        Fri, 14 Aug 2026 00:32:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:3401:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3cc71e1b532mr4325510637.14.1786692747710;
        Fri, 14 Aug 2026 00:32:27 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:27 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:34 +0530
Subject: [PATCH v2 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=1687;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=KipaZ7f4mPPcv70WXg+eNoIM2CY2fZVm54MKxlYcJC8=;
 b=IeMzgQyVvcMMtvAxfcExuQ5BmxImJ7KS7ifwcfX8fgmRZDKNbKcdDGODd9Nm/GVl5P3uZaieX
 DJJyOyg9fskB33y4FAgAar4Tgob+7ECF8an3TdKOdsyS7BEsEj/4J85
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: X8YojcQs7F3N7NWRQLeQNfCCnb9MLIfc
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7ec48d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX93w8fVRdymIi
 FtwwS2BKdCJb90s970L0t9QRKZKgbWtE6bODWLNLxkVjN40rjgADa9jExi9qVUhk/3zoq2AJita
 8GWjLqHeJ1lhQIJ9ZFSqsfANXlDPgrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX542PlLrx8WQr
 SdicjFqMbOGo50ty35lhAM64WXqNegvK0ld3yjZHlcKV0NqCjg0KPJB/c3qKkgkfbq80TMwX92E
 1py9/0jSthIv36za2/YY0ZR+dYflhOo8zrqguSXJD9P17eAQgWfyMjvjpmlU6KgHYJeenNiXnmA
 yggZoNcy72oWY97naiPj/H/B6TPLfrBgy/+yXZ7IY65IctxGRproPE0MdDiA5UuDGawH+WvKDUA
 ef1I7jBzESax9WLJPrVtMgJ2T4J7J1RLFDYQtAQQsSQX5JBqcSpnJOx6yj65bz839q+fYAFY58Y
 1Qjx32T5ocIA5Q8AofbG7iCXcubMkooW4ktQFQ2q097bVJ19T2wFdPd1REXgtVjEtjGgNvas0FH
 bIE/+FfhvuQml5EED+/m6zYZ426Fhc5Wq3o1RH+OUdtf3voTblLHPaiBlHVw5gEOE9Ge8qfbVdd
 okRmEdI3eskKpLNUliQ==
X-Proofpoint-GUID: X8YojcQs7F3N7NWRQLeQNfCCnb9MLIfc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..3c7755735dc9 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -685,6 +685,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -889,6 +904,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

