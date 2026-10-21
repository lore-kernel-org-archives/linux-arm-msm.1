Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615979;
	b=VFNp7GZ73J5y8PSUtzdJWUUOEIxmJinro1yL1tK9CEy5+BYr15vi+Yphv5V1LTkVb1iD
	 Pvcopin9K2cX1Whzjzw7CtqArMlJ2dH0VYQGuzwEMBEPFXSi8R4fUdpMXUUZG9zb7QADZ
	 v/GGg+NPfW3gB1+2pgL5gU0mnLeuW3ggCPo5fk3K4b8xxai4XPaD92umLhDmS3+n9yXT8
	 m+BHMw0mIp39p0YF7QZy2X/nDnFg9J6xL9bBVqtHPNlNOYvZ52dDfVxeemtQbRffkp4Ey
	 hxWrw2VNDUPcSLhjjxONa7FaG0NV2qU/s19mSTjzzxiYzsZrYgcSLGHZ6IPTV+yr38w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
	b=gKErcU7PxeMyFbLYs3bnaY2dL6c8DDKsX6iS6PpN5xnP/YEtZsm025EubQq759WtMAAB
	 jgjMblJWh8jt+e53CP0X9saNQ7cpP0+T2PuB7BEMRoCerzYVzOxy1tomTz6RROdP1Mdkd
	 NNvrCUQ7VNX4ovNgdnKR1KSEyvW7+HvUmEesx4I5XwijI4EEXsXgjNpCjsJSfBQ1uCbCk
	 V96tak+jd3OtUlkasPdrMky3dU8XvtooKrkOJ7OA6+pb9taR2Lz45k/17qk8eSQiHLoCn
	 X9wEzcGb8g8lRD5c6F3TUR44SXq3rvuU4hqJSY+M35C8G8z0FaJ3lEBDZfUDFPwTKEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oh5UQABZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X1paq2KD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E95606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E95606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oh5UQABZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X1paq2KD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeJiA1360181
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KmJhK2itx3o
	q5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=; b=oh5UQABZn8+7mi62HCOeGELqaz6
	w2COYGLt2+i+GbxbPH1GzIbU8Mt8889f2oGZ3xnYmsuLXIuGmsebzEUuUtA3M0q6
	jsR+MRZ3h7R37k1hp5/WklkHqtPTtwdfPzisJPUzfxPycX84f2SMNL0emUm8/Vx4
	JOkOrpgEJPAX1ntlfmhwjh+9ldytBN/JxmrYG0bGSXYAGEPa+RRpeEWRGj2Zwaty
	ZSGmSnS95QQgEy4z0yMECVhYmfy6PQgr2faIYqfF/gze+k37VzEE7ZkxogtHIRyk
	MvDb6db3BIrMOHnRabKXdUk2LoobnaTHQZZNq8vM3gI/4Vf1Gs390y0UbJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vstwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1189162a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615971; x=1793220771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
        b=X1paq2KD9aJCrGNg2yYW5vvNPxZftgGhGUMMTJaqMtYgpDKfwn0Oz4L3wb+0eyk65F
         pxMVUnmLsVTTZ453KJuypC/c/vZ/0bpBjRGXs7qdg3b2AE/fU2IpLA40sS9aOSLwu83i
         gE31y+sdH4DVDYl9ZXOJzMf9E8+k+Mjmyg6b+BKv1UtoM0CeJr5d/qwqCQ4kMYTWWGb6
         remImznMRmoMCtNNOxpvgaGfIBe7A85EByn+O7nIwNCS6u+okiHWhBVv4ZQDU2Nm3SH9
         yU5uMRYu+yjPt2keEahAt0YBifH+g3tlvIT6YZRYucZZuXMCQ1IlQhQRhXmt7wKCDV3Z
         HmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615971; x=1793220771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
        b=ptkTOoh7iKUH4rgQupG57KLQ2dNZdBQfiUpV7XtjlghWxLEVNSRQuwtmnA8q4KxOIU
         vpBAv2oO91TeQJzwSiiJt1gyQpSBqjdTcORUkoPGw/Il6oDbjiq0oD4VVcR35eR+NWE9
         rUBuiS+t7O9ImbIi7B+o70Q3jMcFyyFWI9If3wyg1eZJyCAzTrZZlXz5yCcdVFgo1OXD
         CAO0bF6q6/kucv8LZrd9ntb+Jgr43m4jTNKmKyeXSf3OIDDbYQNLbyP3Hfy5AcrpLwpv
         G9IneXp+lisfO4u2HEgj5EOGS4+LojXG5wbqtexf2mIFyaVozG/1JC7MGhcX5184UYTT
         y6tg==
X-Gm-Message-State: AFq9FYIschvmB1Kj5uTzazBS9HwBnKKo8V1gxCjoGgM6CBcoCp/cnU8K
	90RrcN6svWtPWhVmhcWfefzvqJI0xwKXpDHdD6C0U1zYzN6HocbXDb/WTz4j9wa6Y4K13EM10do
	ZVo3WI+K0Xh0Cl357IY34zYdYb/x5Q6nLLZVlie9sjAoy0J+yOk4MGWjr+YjQzOC8i1yp
X-Gm-Gg: AYBFou3juhFX16UN0g1Knj/tjeMQecT1Ik1C3S6M02tZi+OstVn1CPyQbnrwAXj8oth
	uIfHhmhMAxn1OXMKUu11Qf6zdOFxWfk9t4adXv1epNyT8hZgbwXM9H3di/1ah6lNsV8zsD+IIp4
	SweuXUNjoJO/lTr2mCPVyU1HA5zsjTa6e0RWuF1umuyTLo2AXOJwmOOEoIRE1bk104EF2WHT3vJ
	IB2m67BPHQRRNDog4f7SdZad/ansVMlK10lQwB9BdzoLAT4zUwo7rGiH0zOmRlj7CcVQm77nA9W
	ETK/Xldm8QeJqyOM2eeq6XtXdOBONs5dzgd4xdR7DS9WsfTQuMXtxDDv0lXimSmQRnj4NqnctlM
	O1NrP2++pNj3EufT6kqQZNRMAMYCtrrST+p6M8mchgg7Ux8eZ
X-Received: by 2002:a17:90b:390c:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3ad86c792aemr2590086a91.21.1792615971339;
        Wed, 21 Oct 2026 13:52:51 -0700 (PDT)
X-Received: by 2002:a17:90b:390c:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3ad86c792aemr2590049a91.21.1792615970792;
        Wed, 21 Oct 2026 13:52:50 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad83482f35sm2965909a91.1.2026.10.21.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 08/14] drm/msm/adreno: Fix PROTECT span length
Date: Wed, 21 Oct 2026 13:41:33 -0700
Message-ID: <20261021204244.67160-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: M2jE4-qF32_lThrha1qvWesE7BZlNrcL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX63Q9IFMd2adY
 zdjeQh7pIYCYguEPTHsXH6FWqDp6t8HrE+/ZwqTt1dwYMRdPRcwGFtwQyz/mQbic6K0dW6FUiZt
 YvkY18fAlomBcupxyCf8YXcZ4d6/2Ug=
X-Proofpoint-GUID: M2jE4-qF32_lThrha1qvWesE7BZlNrcL
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad92624 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXwWmZWt1bPQed
 JpRm9o9WQ97jWN/9ZWfG9QEosD5Y05fTrEDekTexMoG4sE6iXeKrd0hIdONWMFsoIFxGXwHGnW9
 tWRAMi1qpgUW22QirNFUEAor7MA4WSPPkG/OYWgC47O5Tj+lZydj1bfrwqzVBqMeuRfXPxMQbT7
 zPH3Qdwr1bjCDXU///10l2gjBmvhu8EDnzjU9oKiuo2FO3slDvLw4pn1+47oUnVhxqZjozD+vAQ
 cSlcXkA6e7U79mUx7y2Ew6PwL5o2gaIH0TtysQ2siPdOgPLQ+1aCOz1bXBlrZ6L9fQP+Sducb6x
 8EinNCBZMJ1ty0whTe/XPsn8K4RIVphf0NFYgYnQqwK4zGOec77oV06um58GEoyQQVXjNWJoK8n
 elxnj/6g4es7iB4fzR3uplpQCMg7pdbbV8lTk2Cdy2rLdPGQdq1nRHXbhDIbZ9oRalSp54OOsLe
 yiGGgWJe2Yx/yQMdwTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

Don't let the length bleed into b31.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6b23d301c144..c49301be504b 100644
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

