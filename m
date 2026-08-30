Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864354763
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 04:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064197; cv=none; b=ae3gXFJnSpFG8StaJWJKi5uYagBHDmdjty/TO9l3uoSrGeu2GtlZHyCEzkzv+lziZT1RudR2uuC0OCoFddRQH7CjGUkaGgHEAJeUfNp69L6wVgiXSQMosxtSKAxWTxMtxN9NwM6r689K9NaQ+r06iNiZ8O0TBV7VQtcJN/X8EAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064197; c=relaxed/simple;
	bh=EAI3JOs+JCMxPPkSxM1RxVGsJmOpMhPiMMPtmQnRl1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htZxJQX5Rt+Ka0kMDG47AzwElO1jLsBoSPCuKa38Gu+PWe44zMn6VD5hk8guDODYKc5kNj/f8+VkwwG2WkNyHInxYpEpxkNEZ1weEW3OshdXs7wHXPrEutwZOW8Q4Tz9bHfGbyxiIxKf15EgbZxhX3kF5GiHWy6VoG25goWytW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJbztE79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAwWbqpB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJbztE79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAwWbqpB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2RRd13608191
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 04:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2Ypq+zHzRG9sSeo6mIzzYr87CJ8FSfu9/XY
	H3Uc4xMQ=; b=pJbztE79UsxfwTIV12RgLeCYCBP1KQrT+nKJqhwJHAhBj5ANgy0
	5o1T6O7hJ06QwHTKndOjg/1m2F+rr+qab/DsZP/z4iddQTq9llz/l6uyD6kXPa+y
	48lLLn2Z0+5b/QT3MkrFhKr96n3Tl3UQc6xIKmknQogukXNP++hESB8J4pUJhwgB
	IvZ/NBfcoJsqBOVFK2K5OvC04Op9T344V6EpVKQZ2Z5/8VtCgscM37PKf9r6dRBS
	AeEa+7/Cp5IWGwWulDS1W3sDsp9hBdmi8RL2hQWltOjy6EKjRBrShonNsNGnfzLu
	JUEEqQLjY3ZqOBGit5RCafh+yIva1KjctYA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwac92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 04:29:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so65836435ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 21:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788064194; x=1788668994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ypq+zHzRG9sSeo6mIzzYr87CJ8FSfu9/XYH3Uc4xMQ=;
        b=gAwWbqpBD5PHo8u6O90pqk76Hg8b81WK3iGGgORXOIt3399V59s65u7rpMn0sk+D3t
         nq3TeXkVB5vn9UYeea7JAQlbNhjjqqB//kjokEaUAl2MqH1q3PY52q0CubHiErwA/fG6
         opjBZAE4hHhGCEh5j9agNv3pwX9gWyOr9qrFSeQUgK2jxzcFi6q0dGcDcaP+BFGA9+VO
         JUa55/830J2Omjoefsffrg9n63323PcfYO7gb6bZZrr1Pi5KS9jKYV6swZ74PP4m3mb6
         SOlb6o5tiBHjhufxF582OCUi11mjjrbVbAH0Dnfht89GPhEvptda3onccJ41eNo6gkQS
         I3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064194; x=1788668994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ypq+zHzRG9sSeo6mIzzYr87CJ8FSfu9/XYH3Uc4xMQ=;
        b=XgJUhg1pr09rTeBKZsfXHZNde7jafnB9vi9cyEH7fd4P6c0mQV3X3cyUg7M+TI/87q
         a9DQ48CsBJTd8rs41IWG6stG22ogC39YAJpWWd5NUgm4s5bWhLfd3piiMIdTLDrfQ+ZN
         O9IV3XoYWey2m2fYTMiiNFjuiU3t/GbVjG7cNMZjmUu0Xp/XUlJAqJtQDqpQ3CUGLcMA
         cso9kUeiVou5B2Bg+fEhTb8ZYlwK0+LV0P4DzxfVu0ttmXeD49O2vqIKOwUiogJ4aHEF
         4hHsSfy7/RPOsMDhKF2ZAdqIhKH5DyvrsoZ58NG+L45hBdAnL+dAQK6GOot0N1OYvqW4
         iSiA==
X-Forwarded-Encrypted: i=1; AKwUvBxSv8p/wITVS9QThtJzs09OEnvBZmA+xflb5iMpytZrqkPEC1fKa4AkBeIaa3YkGXqml95iC9LAjxmh6ghn@vger.kernel.org
X-Gm-Message-State: AFuF++kTMdc3ldhk+vDgDmK4ybukxMVMWgoLgNYqeD5lgtV0a5FTfJsb
	ngnfjf6OHiuQQrM8o6YHoAAq9wm1lP04Jjqo91g/pOkVsPmO6WA1t72qlskgBBprP2Pn1ybXS4H
	8Ww/mjYBg3LVJsd4BV88CiXO7L2iRRz6a0KgfhtMKuoeKQalmlPvibS5JggQHm54JDecB
X-Gm-Gg: AYBFou1BRMSALIP+hE8aay09CKykeiWij9y1RGZLFhiGM9n1HpIEUKZ1EJiEPYalquQ
	VYpgxTh/dd1VOsjVA6pQexOZYRR9Pm98ShmRCZnGd7MMaTb8EmgmNkSPwmCgVTSvzPSX0ONR282
	2MayMDlmwmByXrGDE2G69GJVd0hhdnS+VLK9D3hYTTtjSsGfN9kE0T/XsciPDJ3G01v2uGVlJdi
	heJsLYK4IMhijO94DbWwnITVEFNqijs3+0Mo6kKD/VCGb4JisYoQfUrPmRdTv8ol6CaEueodbjp
	dcItnS3qNb7GHgxJFqgai/0SMWEjnhXlvf+xWqcx/lEev4OqAt52Wmfu+/foh+q1AITWbzio303
	AXfWiX8MWUjs57ppsFEOQPOYw4C/ipwOeGa66DSN4lkAQgNPdDNOXTwn0l9Y4
X-Received: by 2002:a17:902:cccf:b0:2d8:d4cc:5bb5 with SMTP id d9443c01a7336-2d8d4cc5dc3mr173428105ad.21.1788064194089;
        Sat, 29 Aug 2026 21:29:54 -0700 (PDT)
X-Received: by 2002:a17:902:cccf:b0:2d8:d4cc:5bb5 with SMTP id d9443c01a7336-2d8d4cc5dc3mr173427795ad.21.1788064193688;
        Sat, 29 Aug 2026 21:29:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm6078941eec.6.2026.08.29.21.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:29:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Add PMAU0102 GPIO support
Date: Sun, 30 Aug 2026 12:29:37 +0800
Message-ID: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nRg_5eCEYXsmp8XUUMPaydB0-T-w6UtB
X-Proofpoint-ORIG-GUID: nRg_5eCEYXsmp8XUUMPaydB0-T-w6UtB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX8r1tbcj64q4s
 3hwOXA2mw2HYsWJ8NBDkV60UZuMmEaW3K+qARN+p0oBAmVpbxRXoebfYVJuXP5egc1aWIByOMEC
 Dq9GGJHSTbSL5QkaSLztYa2QjE/XMIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX1lSfo17dga91
 S5XDZh5ynIohn1E+j0Fs45n8ITfVsZEY9EwG9ayjyoNb0zEhmxPZayoaaS6/tqqzZf4j0VtHGIj
 oxIVxfGJprS6odtvI21FOMmzwR0Cj/5zXgyn8rLmwnAIcHPP31rfWaLbUV3KwU+IRLSrWrKih7R
 /R2jeK9UWcKimIiuGxHx4qOmss3QfUg6jKJzJLSpZGFyGg85Ht19a0vxJlGXfXDaIl5TLTdTzqw
 cfNGVZfJDX4/b3B/8FmHP56O1BsAX5Syx4GXb5xRZNBlYwMD47+TrkVjeFjJrN/iUSGELe/Wel2
 nrtoOJGXFlVxtAz92K00EkW7ljAw5kthw/VQQ4O5cezv3Gl1T3ZrHQTXWw3oZit5kNhqj8U+a2s
 VVSXFcfFb8+jQznbtYfUIn2xTIKHOjKF+gQpZjuaTRSwRS0cbUHCwBA+m4q6XDR3DoS2dy7ODcG
 p+tLMLcLGvLnTiWWsgQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a93b1c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=hlDLkc408_bz_Y6qeTcA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300035

PMAU0102 is a new PMIC used on the Qualcomm Nord platform. It exposes
a 12-GPIO block that is compatible with the existing SPMI PMIC GPIO
programming model, so support amounts to documenting and registering
a new compatible string.

Dhruvin Rajpura (2):
  dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
  pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 1 +
 2 files changed, 4 insertions(+)

-- 
2.43.0

