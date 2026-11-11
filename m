Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402340;
	b=yIfXduPU3wvFl36++txAB9FTaxSORMQuaO4EwCYQny29oKRV1jiZue4rPeVfMllOMjS/
	 5FTFfp6XLr3j6wRoPLXxzs+3MJGiVILDRpmZAgOCqbpPbE8NTVYFdq7WhB0VK5uOBl110
	 KLCADEyeysQTnpGYEWeSeg8wUnqoVxLwil4JhP3i8Vr4CnrPgUssPHdpfPbZGuPs7eDdk
	 YIfhLYNqIYTBansQmHKT2lv5pljg+1OJU9Qk3HHvydIujFs3Pc7elA4q/SZAO7TAuFurY
	 /OWLcUt7ir5qkpzxPWtpeLoj4bKF7mGJtXR2TYjVTluouMdTorUGmxx/NaUo7Di/gIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EQWl5k5Bb5z9sN1Rk2HwinSW3Pdya3j3yf455M6otcE=;
	b=1Q/nxXBzm8WV1y7rPJjAJ3lRvOUDsuqoQPHon+xUGsFuc71O3ABrWNbbdeAG6Wiznkvh
	 RMkFc7iLTwuA6QbWel1NUesDwwXdNJta2uPaZdZZl+Irz/LY0B4Ip5S5/TZ26V+Kiu5JZ
	 daOZwt5LcvP8guU9zByjBPmXpmwE5JKWJ2ch6spkZelMGW2DO9fr/BMnLzMr3GZKOKkUe
	 4fjzWVG4IXKblyk/dlXtpT02hDWnal//cjh4faRxyxdw1QoarDkQjkTOoOOq4ocoEbXCY
	 EbpaxCSqPkN8bYqkPKuRboaF54JCOXUxt8p4hAEOOMXRm2KMBDa8MAXVr+BA3w8nQPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NvC/L5yg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=csaEgGHE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1896606A887
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1896606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NvC/L5yg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=csaEgGHE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYuPs1806575
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQWl5k5Bb5z9sN1Rk2HwinSW3Pdya3j3yf455M6otcE=; b=NvC/L5ygkNX5bN3O
	06sEMHIa076XPn7KEoMUaduGu6JAabJZvOxMpehYGm1BhPSk5J+PaxNUGq8ZrsNf
	E8v5ndHOsWpFff65yKypozPCGBr3erL1Yf1S2pcuBFuL87v2wP++UsxM+aSNLJZT
	d/VuEpAqskFsN9/kqLMGd5udCvxzdNJ4XmKlGuDx8mXd3nx3ZLLhrDia9jBBdZsa
	vYX26WVMI1bg9okDpnsqW6o1csnVGGedymqO4HRoVKfEsi4A31Y9KrnMoF+lhUMn
	dZubSgJNY3AVcpXq1cGOuFIVaiqA93ES7HjRMU9o234LbZGPVLjOkdfr88MIIBjl
	y2N4Jw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawj7x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecd2447f4cso915051e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402338; x=1795007138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQWl5k5Bb5z9sN1Rk2HwinSW3Pdya3j3yf455M6otcE=;
        b=csaEgGHEGZp660qi90rRJm0t27KCA/cf+z4VfB2Cl1N41tadjK37e9Cq75swIrlN7Y
         GdD621Xef9/PUwfZZhkUclnF8lCDJqk/WXHkK9rGZKUk+KQ7X19klI2YYFPO81U+7imU
         d0hAWRzGVIo9sRQ3JhX5nKU4RdrQGqGvglqI3SXQFhj4SV8IATbfd80ZVWV4ZamZXrEq
         IcjCiRjoxCoOMkrTUnMZuvNqbT3yqJa9fQsuoSHeO50ee1szQk6j8RYDqEoSpDR7eNJh
         FLqpUeumR+VmGqTkILof60z9YbYOLXJ7ld/zH95xznd9B2U2KWCjKJzNo+Bb52GAetZm
         ZxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402338; x=1795007138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQWl5k5Bb5z9sN1Rk2HwinSW3Pdya3j3yf455M6otcE=;
        b=s0gXvh1cVSk2GS1uw9lZEhArXlzilUYyTdvNcTOA4/idgPhxFPQqpqkZuv/Y7/pPwr
         JaPZniqslpV7xT72ruRoikKAVcfQiTmrqJZnINnTBDY3WNhWe+hxc0YvcRVgSaudfEJU
         L6AWkPFiNQXu97YKi+H0UrOayPFQm1mFBPo1m5IUKhiZI6c6/m+A6et8kHNiqcA/vfIE
         G/syU+C+mhFvEFID5h+5g2pQbxzOpuw7+ut+ovOIcNFPLJZ4+E7NwBREoDbrLb93dPIz
         u/ZL032OuUWxta94G+YAhvu45jGqAeLk+Uq4kOsAdwpieNVknF3FC+tfFHzcgHCx5lJ1
         rgTg==
X-Gm-Message-State: APuU4Z/VgWuiNK0RElAY/tVrVCcWRt24YeDXZN8xVs7Rq4vPPi4UNqXP
	cphz+TkEx6131e4lxf++0l4su9lbItThsegtV0EYBk/9HHYY14Hpe1j5ey36+6C32r6hlZB+YOi
	8tVU2/tvZiaRQ33vWud6hbgb+7U1HPn2amUBR92SmnHQnKjIBSct8+KUGDlqnCXhZlfjB
X-Gm-Gg: AYBFou2SWettiy87QQGVoRIB7zF8arjaEbaIxCcBPLLmhx5uuXA5fraY9AMpW0fUgeh
	Xw0ZxgliN4+whcbny+yjnK7O9HjXsLY6WVTaBtjj9i9r/g5C1Qw4hKDKQt6uDxgw/xbD8bYcR0R
	DP7CmHD8Wmj7SYPFcGmdQgsxrg4/i0ZysMIQsdhgTSB2BB/1wWlxpMIdA9IsynQznxjm7+26u1/
	mUlgbveH03FYPUZfJI4frvW+mVwV85kyNNMOiXRjTqjtWucbLRmzjAEmtkcXo/FmJmmWhX4hwbs
	RE/JPMi19PwNwN0NKfmXmph0dpNVL45QjcrgHltbcPQ65+wJURilqApByb/KNEv9cZB7c59Jl9r
	Obk+9ybVHl6sQuJjNegUo1nmoqFiz0B60etq0BhTSS5U4PmaNpfdhgwrv9cNEVZCvoze8NBfQrz
	AZReR27CyJxtXmC1NZlsvCKFIMcMaOl8m9GMlKY9233o4XlpeYgVHj9taQ4yfyFg==
X-Received: by 2002:a05:6122:8891:b0:5ee:200a:8cda with SMTP id 71dfb90a1353d-5ee200aebbfmr213525e0c.7.1794402338007;
        Wed, 11 Nov 2026 05:05:38 -0800 (PST)
X-Received: by 2002:a05:6122:8891:b0:5ee:200a:8cda with SMTP id 71dfb90a1353d-5ee200aebbfmr213505e0c.7.1794402337496;
        Wed, 11 Nov 2026 05:05:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15d368e81sm391858e87.21.2026.11.11.05.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 15:05:16 +0200
Subject: [PATCH 3/3] drm/msm/a3xx: update the CP_ME_INIT data to msm-3.10
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-a3xx-fix-me-v1-3-d81f50f1ba1e@oss.qualcomm.com>
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ViPfrdASg19eIkYrm3pPJ/m7IB4rdlNRmFNly/QK20=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq9GgZZG5eJUlvVozg1SvFjWYOWtvOrP+He3MS8
 ZTKpYzsOsyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavRoGQAKCRCLPIo+Aiko
 1bT5B/sESP6mItRcWy5C+hS/P61fcKVneQJymiST9tKU5DB17cTE8vJdNQ3sPi67F8Wl7+26Ir2
 s017/c+3kMM7z2yMayfefgUQjX+Kpgg5aycbRI5RNrRZbU09TvOdAUzy57fxjhsrAb1gH2TbOQP
 Qnmq244amrMNd9x1KOmIgmjZAaH/28ENzw1NYkqBxfmRbUeCxoocDcxpuyVBjzA+BGOzOHv+8JM
 /PkMuAkX6V6pW75qHDw57K1+p5JHFw5FrRPc8BW+mbpUqEBI2NY642plRP8VBZQ1z+gT+gnk/JD
 B9TMg8DvZv4igBX8zVxbmcndRBT4nUyx9M6fiFt3Nj6/qUQK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX7lanEr0hxWnu
 Gaf6mXBFH3aN6yhHBDzw38vJJp867qMXMjx1uyh0eB1yZ90BgJ3TqZ535KO1ZApM5Rw8Z0eS5dO
 28495VLzUiYYkL5JXhy/VzIxX0NYBg8=
X-Proofpoint-ORIG-GUID: w0d33c0WByWPufXWWP434U73UyZS-RJR
X-Proofpoint-GUID: w0d33c0WByWPufXWWP434U73UyZS-RJR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX2aXdgVh+vSz6
 oVdBcF41uRGcYc9+gm/4R7rmjTeiEgzRfnJTcyJPMe8qnqVy8oYtrws7l1HDsIT1knDLc8tXAbK
 U6+KjaYmMJUMh+neO6AF2pKgAEClK/H0PVxpIqY0WAIwor8e6eS3qLMG6JFI9Z3GeDZMBwxsThX
 VmCa11c9cbibkhxIgbPLpBq6YXcNO+QeLcfffPSw5pAZKXynsmpXXJrwuV4nfJx7TozUS7T5V+u
 RqvSE3IFAzzLnEzu7VkrSyda7XJXhtTcZoq0AzXFtki7JdKIyIqfeahCQk3tZlhPxMGX6C4KFCc
 3RFZM+oMTA+XmtQBd+I4YCzknMTUlmIfuEtlj/lNZBZV4t8s6Jpy8FLGhLMAwpIoZaM670MzowY
 kNQ+pPrOVEYbYQfKdHhkl54aPVe9N3H2P9dJoXRbmUeQEJINEf8+peCWLoeHjVQIS5ogsW9Xuna
 49Tm+J5f1/hStJ/agjQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af46823 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ypG0q2TZ0WS5u_ylJzIA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

Update the CP_ME_INIT payload to the values used by the msm-3.10 kgsl
driver.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 1de4277ebf9a..1420f18bcf75 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -103,7 +103,7 @@ static bool a3xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000001);
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
-	OUT_RING(ring, 0x00000000);
+	OUT_RING(ring, 0x20000000);
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
 

-- 
2.47.3

