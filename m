Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2763A5429
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855203; cv=none; b=tbcgkMqTuw0HI+QcTsy/jeMF5Tpl8RT6oR7Th6+4xHjG0TFVVgP76RmdCBG76dNV2yAdOdVqDt3AX38t7afUwjK6CMH8ayPAAKdZjj7sNjKFkpS4N1ztFRDP9JYm262Vk0dkQO7iy3YlsR8LnBVfe04Y3bRpouvqWvflYD2pO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855203; c=relaxed/simple;
	bh=VMGWdrA8xlkqQ7sZxGrmVOQ6YHsBW0knpDk5U9KU4SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X9aekz2IbcdyTse9ERB6XSuz4kHSbjFscorFmAUjZTabfDMk27k7S2BpWjljG+rv7YRJt7mB0mvjsFtWpRp8ISf0fBfc3A70cf05/jTL1eu1rk8mEakgqilNM1foRK6famjqzqaYnaEQ1IuEXjdsU1oJnd63UQFhlTsUoiCLSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuQXjMUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlLZldzf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuQXjMUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlLZldzf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LoI71646044
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 08:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CMyFQ4CJKUx0aYyi7EHbas
	259H+D4TOmft4ws/+qPU4=; b=fuQXjMUI737/YIjiKQ8qMPAbgREhjkoYS04zE1
	sbdf7RkDgLzTXOQW3lWo0aUbc+3iquCsn5acWBXI3dhgVOqkYJncadViVZh+YIHo
	7qeVx59794285MZKPa1HF6mcYJCXJe6YmkUEqWx5YyR9H1qrH5E4Xno0js5Io16R
	Y9X8KEcAm91Ymeh61FnJ0mogyJL2Ht5QuVcBdXocNDVR88yRYEzgIKOzV0YI5q5S
	5yOiVZhoLxWsFkSm16hZ/5odu2nC2i5fhqcSMUpep1tJNPNRp4ZqCVp28erNn41y
	3I+NJCh6wJHvVbjglHvYuxiIAr7bXJHosP9vs0rp22to2HKw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugg6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:13:21 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1281dd14aso4180283eaf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788855201; x=1789460001; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CMyFQ4CJKUx0aYyi7EHbas259H+D4TOmft4ws/+qPU4=;
        b=OlLZldzfMvCGLDmXPD7mt1IQ4Y97Aikek5VXe1EYIH/bR1CPFk8D2H3FYJgJOoLs+x
         Wor28R7Dwyg39zKtVY9tFFX+Klfrnndw9Bm8yp40yrPkGPA2jERKm1YLLxAq+CsLy1cQ
         Vyj3sj0zy8tAXXieyfOLMrkRjnsuwmYTO7Hut/NVDk9L2PxSY1cGPMQ0xA8/XLWDuqWa
         BuCSExbEMWCFGcELn8w4tzkJU/hQW9YgaIqZzbu6po+Rcjx8DKo20iVG/5eglrUFbwbI
         ZE66okOzRLcByaQfYtSrBqLzhL+3H6mC4Pm0c1dwPzmJEJt0M0Cen8irpUvgzacYmJW5
         /6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855201; x=1789460001;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CMyFQ4CJKUx0aYyi7EHbas259H+D4TOmft4ws/+qPU4=;
        b=BfYhc+j03i7JUzB9QilkaK810HvCj03Y4Ahm84GEm4+u43cNaYSVOnTZ4lThhkGMa5
         SDz63S6WRtmCriqEk9b1ArSZ+kLu9zsJfTbuYzCS/mMs7A1tOQX0tKgtYZUUStwwsXN8
         gHp+5PTslNEHj9bZRKpTVug5LevQVNU+5StE3zTcM1Th28OZLEK57JZcZ8gvN8+IS0As
         aUiBd8CWOmcP7je2bje7F/M4YpMejUh/LLFdmfeCAMSW3EpYHVBPe3T+T/BjBFJ0jqAy
         jcVeYDq+AA6Vbfv/v3EtRRjkWnkyVf6QItLIk1P0x6Fptpt67vXtLZOONIyaJc60/Il/
         urSQ==
X-Gm-Message-State: AFuF++mKx9yZ4hK32D6U+kdLi8SvUpGFAawkUjDRESZxXtJsQ4E8lWck
	2+N6AeWw7RaqH5pSTPfRZ+zuZFh9riNuJt9VHSHuxsUEqdVeuNj+WJmeJQOBcI9YWT6am/SwYrg
	JUyKZ3ThsOVIdHlClhM+QQcLybLrwFLJLVkuWQxbL91kSYd2j9JoA4JWZdkmEYzrvrkfU
X-Gm-Gg: AYBFou2DvQawIQZt6q7nDPHK1yF5MXE5un6EAE3EXg/2i9w51ytkbrVEEWBDdQuauG7
	AFj80LLbxUH8u01iX0ED5o0J9Gog3jEJJ6PVXhldXiebLygWup9piOvvDgqjskqLt3gaQvORw/c
	89l98KDyXiIOS198KoSpdS93mKsKvvhAeqhBvjRhkVaro3dEBsZCPksDrl/DNMmD1asdIzDDrFO
	PCPf8v8P6QAuQYOD7AHpbpiPe79AGZtHLXsawNzJ8EAbapjkkzOLrX+2N8fLSe+Bpb4QK/QS2ky
	8roFT2Axb6+KAU3b5pZ3HuTy96lSFQ+LW6Z66u83x8Iqo81c3pv9o/2criSi3oR1SMeOAdayNuK
	Aqy0PmzT61kwYa4zwYCUVUyo5Db1kqCIDZ4tY
X-Received: by 2002:a05:6820:603:b0:6b7:46fc:1c4 with SMTP id 006d021491bc7-6b746fc02c4mr15280605eaf.35.1788855200958;
        Tue, 08 Sep 2026 01:13:20 -0700 (PDT)
X-Received: by 2002:a05:6820:603:b0:6b7:46fc:1c4 with SMTP id 006d021491bc7-6b746fc02c4mr15280596eaf.35.1788855200594;
        Tue, 08 Sep 2026 01:13:20 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm31465982c88.14.2026.09.08.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:13:20 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 13:43:08 +0530
Subject: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJPDn2oC/yXMTQ5AMBBA4avIrDWp+gtXEZHSwViUdEok4u6K5
 bd47wJGR8hQRxc4PIhptQFJHMEwazuhIBMMSqpCVrIUdnWmY689C9RJkRqpcpOlEILN4UjnN2v
 a37z3Cw7+PcB9Pyc13oZuAAAA
X-Change-ID: 20260907-nord_stats-ea163d025d43
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788855198; l=1105;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=VMGWdrA8xlkqQ7sZxGrmVOQ6YHsBW0knpDk5U9KU4SQ=;
 b=8L/cd7SrSkBJgMal4roe/f4M1BojIX0Jsl1PEdD+ceTBFuYYyFVrKi+X2vmvZp/GnzIxg9CM1
 6AzYcFhNYe1DX1cbwFeHbCeiCJJa980Gu9nHJk2kenErQc1kpc86K3L
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fc3a1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JoL_3e-GhyZJABErYZ4A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: 4YFbcVTHZI1ngLihuDQqRbcacS2m-8Cg
X-Proofpoint-ORIG-GUID: 4YFbcVTHZI1ngLihuDQqRbcacS2m-8Cg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4NSBTYWx0ZWRfX64f5VapuHEB5
 T2PBrZb3NAlZYh+TV9ryhug4xZdr5cfnX18AVyL55NNPF3/vFnALkalWIvhGlw0uh68O2/dSZKZ
 U6wVK1vYJEBNXGxDKx06smX1epoATTIsCVP3P1pX/AvmBNZ5r+nly13qVqALuCgzJ1tjMaSElpm
 NBagan30eQz9/dCBZQHdlLV0oYBskXJ9lE72Jq4zMGqjRi5QWgAQR2vRRvfA6ebehN9GbWEbesI
 BGyKL4JJGL+N0TqdXQ2yIWhmAmu3r30M7IBPVLtskxIIp1Ds9PXuiW5xf16NSdxX7lYsVg9IY+2
 A3g+mjgwtlbVCVNB4voAHbAngXgjosy1VF61NCY937zGNBGWWfUF4EC1eDu5WVWpjj2g431hNWk
 L/CoBCXECIUwCND3oB5ca3llpXrsR/pCNf8yOA1KQQEaAYUjQeOoyeAoxzp1Ghfyfx+x379tyWQ
 GxuOXbteC4MHKs+3yhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4NSBTYWx0ZWRfX9WIVkB9xIg4N
 YlV0Q1r6nNv34Om00M7HcDcoi8MnCid4Qo2x9Su1iqP8cFZjbJfDZAX6voQTC0imrLAh/e2CkY/
 1aEOPCUTchwez3kTiwWknfq3SbiyzaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080085

Add SMEM items for four NSP subsystems stats which are present in Nord
SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
id. Add new entries for NSP1/2/3.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 06923408bfce..91f2d1293124 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
 	{ "modem", 605, 1 },
 	{ "wpss", 605, 13 },
 	{ "adsp", 606, 2 },
-	{ "cdsp", 607, 5 },
+	{ "cdsp_nsp", 607, 5 },
 	{ "cdsp1", 607, 12 },
+	{ "cdsp_nsp_1", 607, 69 },
+	{ "cdsp_nsp_2", 607, 133 },
+	{ "cdsp_nsp_3", 607, 197 },
 	{ "gpdsp0", 607, 17 },
 	{ "gpdsp1", 607, 18 },
 	{ "soccp", 607, 19 },

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-nord_stats-ea163d025d43

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

