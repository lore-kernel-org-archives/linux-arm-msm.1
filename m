Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657076;
	b=qIDG5dPVmZCQ3Q8kOBftoMejP7Jp+RI3Nid9jKOMxVQqP1KnmikBOvKPm/EEVUYwm6mW
	 5g+ErtULwjNn9DCQMxRw+wvhPnnOH7V6s4YyJpw/efl2MfU61bxbogrWvty35YT9e3rhB
	 ynpiGAmS/2XjzBE+W5CP9Y6nZQp2sc95SS8BMH75/NZxc60vy7t/X7NwZs3gR7be6QLEZ
	 AVBdG3MN+KBi4oBBqewAxH3uMvHxvCZ0omAf8pjxLYhf8sZe+McoOJUQymb6DpTulGEZV
	 r6CDag+6i7D0h6G5n5USeDTErax6ZPewKo08EctJ0b1rH2SUMBWwBiArx1Vs6Iox4Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657076;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m6mM3IDpZjo328CSxZDXpZGEcjx2e36tzzcU3Aq+/14=;
	b=LSJ6OeKp/+mb/VsIkWgWU9dhQixJrCEj3OWs2cextomHCmmMLJlyDfTdbL2ZOKryUFX1
	 /5L14jZeo2sOSvM6AIWKhKz47wlGYnH0pTGWrPc1SsNuPZiJgnVeRzPGQQe+Okry0uR7Z
	 U4iVWU85isy+eZL+hbBBZmuPuPyCEZ3s7Mda4dyFLY/PHpdok3E+2n9A/Jriwn3ubNVle
	 +jkjSUX3STw+kjlWwYLk72kt7qoGktZnnbzMBY1lZJwmFxwDjhhpa2Y/a591Ktr4J4p5V
	 W4hpvi59g787/9p0qnr2gcQOXWxpvIWCFNJndkO+TIIx99TbWINg7BA5ENjHSBFK6Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NR28QxSj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LdWJHwFf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB392606D805
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB392606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NR28QxSj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LdWJHwFf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K69RP3292637
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m6mM3IDpZjo
	328CSxZDXpZGEcjx2e36tzzcU3Aq+/14=; b=NR28QxSjwj2j9QZaPCOLLFBTzPk
	CuizNoLQiTbu+BxXd8M7I6MwsfWY5n7gfoddjLEPkD4J+GQ8813kpleoC89gZJnF
	xoVh9WnAhQzP9x9IZVbGD8riBtDKli6OGgm4v7izL+XMcbe6GN0pEDLPrtey2MLo
	nPLOyE3xjKazNwbVE5OAFxq2kwVDNhz0G4gxhkAjbXaDcpZeQG67rBcOk+uyT1sE
	4Rkd44Nj/ACt/JJjh5WMERXVtgSRhIELweDNzjB6FAbWcXmcGHQd8Rkaq2HrW5Lc
	HY00AgUJSIX4MF+CLpgiaqun/RErZY/c9CfLiORchZkryaG6Su0MBDbh94w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07egp6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:04:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso2324702a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657075; x=1794261875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6mM3IDpZjo328CSxZDXpZGEcjx2e36tzzcU3Aq+/14=;
        b=LdWJHwFfAy137Fzd5ty/lB++RleNKb7Zedo+3GGDFi3pejIKFZuk+GmBfqGgOAAY4U
         oKPT9CK0SO7t6G1DMITvdUMphp9bmqZ0mL5ijKYKum8+t+pvMuZgQmu88xK4IUHF415G
         ca5osZ7vzPro1EGzw2cQw/9yulHrAjLg5zqfIXqmyqOQI7lxlXGj/Ab2E75GIfSIi/ay
         JoPqN1KIvZamYYFf3e9nAu5x8t9Du8SHVZ9bDy8SF92QTlECm3GRMXKritWGp+PFEBM9
         k7C/Z6PAOz6gw10kWbIuvlVv71J/pNcVGvd7eDLuX5hfJzAZKzVi0IAp6rHqBBhIO/68
         JjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657075; x=1794261875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6mM3IDpZjo328CSxZDXpZGEcjx2e36tzzcU3Aq+/14=;
        b=gyTxKWmEPT0/UBfZhPXoit83/CCLmtiO0xFHYeeYRzC15ZHgU+umnV2/SCXJ36ALhy
         BNgzZbbcvliz9sN5Q42Gc74yy7EOYQrtcCPZRyYpoemNAfel4UeptTCeEWiXsyOWGBce
         bV026l3N71lBH5M0iHcUswdr1HK7a/KzEQKVw0i4McFJABATO4GofqBjHTVKd8OFV/x6
         4wW3kor/bArpk3VOy9tHjiyY9nOrtIY/o64gikC09gbiw1/GDljcDwnyXYNb+JM5E/Bh
         0YBLiIRLo6r2sdI09xycQr+dU6srYutmleEdQXJM3YhkZ5YKMIFJrAbFjp3GObbKyCQG
         hnzw==
X-Gm-Message-State: APuU4Z87Osah2pjzLPEt/Kpl+ZZTU+MKFYCUo7TYej6qaHondKaw6927
	8OxAiLH98zofe1yZHMMex0hvF1OmzC3UC0CDuAb78plPSVEKYJCYtxMw6s45RgOBZ9Opimv7jgm
	Z8prZs7QcvnfAtzRub9jQZzZPwbRBA4W429yMcwt6YkVKZblZFuYPx67T6n0QjzCk6iiY
X-Gm-Gg: AYBFou3E0vnQZJs/qUe2+LBI1YfxOqC2BEL5PjcONb1V4lfTMeAlkRPeRx4FzyH8sMV
	0ylSb0IKy4QjHDIh4Y4FT3241KjqrxhKb3i3wDyePTQGM8S2bhjOtvVvBiCtozyWl2j3wr8j962
	4AqLPX0rfm++X2T1+P9A/OpWSiJQQxbUmt3FCDs4hBZ158Tiv0qvdpgR3NeUIfcOg4jKRalF4Mn
	+APUKmaaHw2BTTowDsMffmlMh4Onvnr8DeUaZK6XtXAEL45WbIZERzEg2F7dL6IFqsoR3PBzy8c
	kmUuvBt3WkY8YsLl8Y7pFh4ieAtD9jn8VUfzPyo9IpWnkZezbwRbJb5d3BEWIkDBSaaule8CYMd
	GbUkMMgB+cv2BZhMHsXlGG5TPBir7JX0VM3iwDthMOS5x1/hzknnM7ZWpfKTg+3CIqZlT788Occ
	NdYrgwmkvs0MAxKSxXXatfuw==
X-Received: by 2002:a17:90b:1d44:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ae896f852cmr8159923a91.16.1793657074707;
        Mon, 02 Nov 2026 14:04:34 -0800 (PST)
X-Received: by 2002:a17:90b:1d44:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ae896f852cmr8159901a91.16.1793657074272;
        Mon, 02 Nov 2026 14:04:34 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f5dcc3sm9501074a91.3.2026.11.02.14.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:33 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 08/15] drm/msm/adreno: Fix PROTECT span length
Date: Mon,  2 Nov 2026 14:02:52 -0800
Message-ID: <20261102220405.30730-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXxVtSiF4cP2El
 Ujcn8CdTThellVAPUmps6GbfpwppVAdqXjKqHgUjOfSYljem29owH3ujspHzE/l+c+eDrTGSx6j
 +ZJXHyR+vHYmlwn7UQcGFeGVA5CuYUvM7kW1h7f/ff+iJgif8TX9+GNwMgnbM7QD3CNoqM74Qvg
 zb7HuMqy/aTdMXooceEvt1lIhcNLrQRVhjMhBwlJsZJfnKqVRmG4qMf41l4TD3R8uHwZhLnabLN
 dWfo/82/s0lH8noz/wU59wgmVl/muYOqx/pzueWcbs1lLMx5LbnVZbHEacX+++GayyNtpa1txEC
 +16aGZmLeol/hroois+3bTrNSg4MkB6N6vaDsx+L0rlT7g50IXCClxWGq1KRJvcNaE5mTBjYrOo
 Gh8qICRQPVYbqW/o6NaeGfhuAkC2pj9jFaaF3nRC7P7eesd1P8tlb0uHF6NjW+soudypYBrGMxZ
 tL45d1wC2Ag0SuJ93Cg==
X-Proofpoint-ORIG-GUID: R5o0-WWfAXJYxImrd5aeddORRjItRNJP
X-Proofpoint-GUID: R5o0-WWfAXJYxImrd5aeddORRjItRNJP
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae908f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX9eDorkBwyrQQ
 J7ISSwkZHigAoaZl0Gqjp1XNf7LxIfewJbLmG9HSdOdDYhBxcqLZalSbd/o1YGU6OR7SLb53abd
 Qh7pWkX3uKlIMozDCTmZM8a7M6qR/2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index f8b9ceb588dd..6c28ba1c011b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

