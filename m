Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B455443A84
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 03:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234830; cv=none; b=Pi+sp5/pfcuB2qLTIyRHO/vOauqstEJarK2wk1pOD2c5f5POWKJAUJjVw6julKybVACXwDsn+rZZ//Vd4hmlMrCKp6zpw5t6zFBBLunBMbuKZbyHerwaQMNSYYNRnQAft75xh0U/V+8OW/g5gTRbOpLZEi6RZdVDmMqKw+4r1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234830; c=relaxed/simple;
	bh=F4SvYOQlyCKUGia87A34XS8D5c9Kum0774nQtePXGYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEnJDmwkte1hByTf3WuDEsKtmhx7BM9bbILaB2fVSpkfo/A3r7Y1fVFDSCxG09/Qeiv2qs6fajbbtD8kc+Vs4v0OAJmLTh67DCVijxf3XTblhhoHatUsEF39D7UJ7afuc8paXkT41dqW+Ourt3zROTEI3BwsQtSYFXYDa+KRG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhXZQx1a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYJ8ZND0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhXZQx1a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYJ8ZND0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oICX500793
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 03:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nz7mNSdJ3om
	7cMlWEfSsfwgFcE4ZNET7S9/6Z47Vwkk=; b=XhXZQx1as79DFt7/YYreUa9NxyZ
	FCziEo3iZz4hQf4cUWy0NJRo13H3qU4PT7yhJ+vQP5NUZdHpF6V64lZD/xC508zA
	cuJz8U8I0hXKMPnirGJQ2xPMtDNGQyCk0df0H99V6gYdQcblacxauYeQuixqnkeE
	yFGikRM2TGx3lcLu0Ict3TDlDJBj9DL2T4MKbUF04u8coAM7Ijlis1lb56jcoN96
	jRr4m8498eBSXnNJWUMsxx2/xwpzj+gf46DhEeORgc9vQYn+npAEKaOn1bc/5qgN
	mUyMXdQZtJGxlRNnFxX3AWmtq8fZ4phsrErSP59D1wwj86PHszof6S4/Pyw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx10vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:53:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so72119765ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 20:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234828; x=1788839628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nz7mNSdJ3om7cMlWEfSsfwgFcE4ZNET7S9/6Z47Vwkk=;
        b=BYJ8ZND04hMs5hSvr5/qhPIhR15taoJX1/mH9UyKus4tFboJMHTW9xS/NG+AdR8lKm
         R7fhNFfwPHy4LL96sFN1HHVVZu8w+Axpuiqk+nEoTnxEGEQ5b80Jlxx2Ynd0jWXky8Jb
         xUt+g6PjwG0Eli5pSowOsJ0fY0UecmCUF7X/lg6/OxhwdZjBprI1Pr10eIguiWagjVCS
         34B7qyMKwrt3se2SFvzTxCaJoHma8EZz9VlIN/MiMJ3WFOmXSIwjbJHAkEI4yb8pElhZ
         WV12HHnSbnYqMeaWEQ3C+NiMgcrhRIOlB2JKmaGvUt36QYD9C2yWJ1a7q9H46w2KNcVN
         neVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234828; x=1788839628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nz7mNSdJ3om7cMlWEfSsfwgFcE4ZNET7S9/6Z47Vwkk=;
        b=T6a1hUfBB6ezHgYokwKx6NGIlDTJ4Sh1o8EoFN6TP8ptLjj65IvYGW7p44F/WwsAF2
         4YkGCzaSPEkyaJZF/14dxvTB2TPNa07t8jcJYuPtfTOgjeSPUmvHi9Cw94AgYQNHMl8s
         4RW5KGBftfAaOwjo2YOp3FdYB8BBwRJJ4ZOMLQVKy+/kJuyx38Lpye0ir0wDvi5Q9Uap
         xpVy8MyHtaIbZhVURZZZUzgG/5ePVbJ4nOa3bFJAIj5N/cRKI5RtMNcnX3+JKfqJSSMb
         h4omNFWaaV1Mu6XXqZH201fzffZmHPzLqEP8dXaFBypUzOVOnYn/mG+5zk3Z8Gun3zJ+
         w84w==
X-Forwarded-Encrypted: i=1; AKwUvBxgEsTj9w/x8KO3iXqgHS6SBkT1axn/AnDNjwq4VfZKcm2Vw07sSUuLvlWbfdE0Te3R59pjEwi+DiRW4OPZ@vger.kernel.org
X-Gm-Message-State: AFuF++nzzYrPQj7n1IlWdRDiKod3Znskb+zFPjMWObofhLf8ngO8zEXI
	Z0/BQ+nMUMUeG6jeUu2msDGEbQC1zq7ESSJFvkD/NC85+PHJ0ouUUiPr6uXs9DkIOv7zDdje5hq
	8GG+B1yjbPpdImLBx7JTPJNO2MgjwgTZIrRxt8ji3eFyJ8Yx+JKNXik6UuFx2jv07YRS2
X-Gm-Gg: AYBFou3OT+NyVT4Fzs8dOFw1ztcORhy+kri3m01YMoDah45g05GRnHrKFhlPFklhmzd
	gvmVack9isvkzEqOCUZ8BaNv/3egvllhceFHBx0yogmlN7sBZ0lKFeDqXEyq18lOk3jmIbTd76E
	kI73sEfS+mm0/KYbAyRGa8I18jKy+OuA2eJhXhn5oYmZftmP8P8+0lg+o28HrWExqbdkYrAtuVO
	/U5ltvN0wGo7/b5TK7NbrLEM+3s45J5l9x/U0bQHaJvBr0TLXolWEWXPNXbq6h9/hUET4QFgyvj
	S2OjEzGNE/6zWFw1M3AH9sfIvwpqlSchM498cENurCc8vv5OYLhQv+BNa965L5qpmW8wZ/kbO/A
	Jz/TicbWgI8E/9zyrxG7Bj9xS8kgqM8wZUs/Al4vMDafiJIzv8vGt8tfbr+6U
X-Received: by 2002:a17:903:40c5:b0:2d8:d4ce:7e3a with SMTP id d9443c01a7336-2d8e2e5f427mr330684785ad.15.1788234827597;
        Mon, 31 Aug 2026 20:53:47 -0700 (PDT)
X-Received: by 2002:a17:903:40c5:b0:2d8:d4ce:7e3a with SMTP id d9443c01a7336-2d8e2e5f427mr330684025ad.15.1788234827190;
        Mon, 31 Aug 2026 20:53:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm16702035eec.1.2026.08.31.20.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:53:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
Date: Tue,  1 Sep 2026 11:53:22 +0800
Message-ID: <20260901035322.654-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a964c4c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MJwEArL1UJALDHajFQsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX7V2k4H9krtD9
 rp9F6HC1HKcmB5MRhBl76T6LHp1Kk4K2xd2gLiIdgn+8xPN39m+/TXA6EkYepmI6+X8GbElI5yv
 wzTTUGDZ9qcpvNrC7XPIU3HAuBeWtYk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX+42H8C5IuwQw
 rxJOG4ggGAKAlNdgaRXWgR5+oLL00VdJVqqPs58jVspGecD4rgwgLGKQDF/fJhuuK7o01lwp2vt
 ymtSiwEFhKRjes8N4sO4NEJXAyozKU2Iqgnfv8wWKh4rO93ZKGNSV5AcfC8FvBUZzbUtv8TRT+D
 DS90FxRPrZLbyejjscHQQ9SbdbBMEwNVMPpZeWJh0YFeHl5WdDaVG35WHxiHb4NxMp1LIRiUqto
 d9aFnCkJmjR9/sGfFUSBLVfqizsmT3iW97Uu4D/exZAhPns2cDsql0T0XUmiFhFMe2j4nrQh8NR
 ZmiIRbWV74SmySjElWrwXGTLMNp2LLRCzoShW74b1Izsl/wOciHqMo+LFAlmYWzLYdUHUeR6CNZ
 HqcgCVrsknG5kSkY9Mcn39O9SquRjqseuR1ABPUHQSQaF4MuBlojT0UjJfVXxAGKwidcO0zRh71
 LIUZMiZJ6Sa7WUN84/A==
X-Proofpoint-GUID: taqHCc-O9vQ6v-cgk3v7fGYKBEvG-bkO
X-Proofpoint-ORIG-GUID: taqHCc-O9vQ6v-cgk3v7fGYKBEvG-bkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010031

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the secondary USB2 PHY reset which is needed by usb_1_hsphy
enabling on Nord platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 0db284edc4e4..896050291af0 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1877,6 +1877,7 @@ static const struct qcom_reset_map ne_gcc_nord_resets[] = {
 	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
 	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
 	[NE_GCC_QUSB2PHY_PRIM_BCR] = { 0x2e000 },
+	[NE_GCC_QUSB2PHY_SEC_BCR] = { 0x2f000 },
 };
 
 static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] = {
-- 
2.43.0

