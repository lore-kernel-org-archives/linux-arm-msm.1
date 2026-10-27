Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142326;
	b=1h07HNCfT0IVUjxkIUTfe4AhRMYQJZ7Yu/boUBB3DEYMJWkr6e36LxxLIaZRg2vlOGgV
	 oUdx/mOf0UwdmH3+timFjuBJYNCUO1VncQI2EU5ZKY6cF5FOnng2jgSsb9XNx5daI1tkQ
	 l/W1j2YMxL0rAhgAHaWoUZkMOFKPOopOALOnzPlNkfobgRUNz7bLT3vW14naMTCWYFtGh
	 q9ISk81t6s9FXGil2WA1qZpL0tFfPlRQi4EBxLGaxv8GW50kYlhFo1s2YMI8Uwz65gWlY
	 AQmv2qxOVrZOi1n4p3uod/Yo45K0CE6zRhFsfZHWL+9GyrM3heCmBynRxG6eouOADcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142326;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
	b=2zrnY4h4WQiTEnSOLzmXmEa16B+yuce2f8EQnAB1eLdNTG5VmtfQBpI3Vu7ykEaY8mLx
	 4fiH+98Womm0PenYkUeRI/DDBVb8YP0L65C69I1q9pwwZ8lAYIpqJlRBhrUelOuz+Z1zq
	 7cogWw+hDEdsEx2Pyzxaxoxg+UbwgGn92Dqla/iC6E0aRmP0NengjjfbTFVzMSt7+/d/l
	 cCnr+6IXNjHHPzaviwWKZgvd1taqmumd+DTQEj6MWEtdjEHt5wGGft56vt0qZG4BusC59
	 ZxSgNPKJp3xYNvjbyfrIzzAQFd63Enx5vu0svqsAXt80cBJVxS3zyZsAinqSe8hFHrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FdWgw+Pp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K1H4yb/+";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23506606A338
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23506606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FdWgw+Pp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1H4yb/+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKtZs83299148
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vX8c2uJChbI
	30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=; b=FdWgw+PpXn6J/CF4tNwu9METkaf
	QOA+pcwLyluXjhQF+3OJS0UDlabDf2o2G7FeMUNyckMZmcFpNrv4p1XCVqjux15W
	sScjrlgYJH3nh0atMIn2Iqp5B2Lb3pTq5pRijRh6z5Yw4v5dvLR8yjDXroRSWkF9
	KZkG/u9ITM0/UiQg22jZP4pBTq9n+AiaCQuy+Eab/cd2RySO1XXJCxelOzCDHIRi
	GQxSqFlXMH0FgOyNm9Bj7Cq/svdlKA2//r8N4lZmrR2SxLv6gYwdhW8BZazEuvQC
	sGXdyc8SH4grJKVJ8ZmTQFIo/0d4E64Nvabgtnkvqzh/EXZ7sCVYARIlRpw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy671hg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae59682799so79777a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142317; x=1793747117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
        b=K1H4yb/+tpR/xSU7qOCjNVJxIHpO3Mn2adhoIb8Gdc5MNVVrAjE63BdTWF04XDRLA1
         QYa/u7YlzSMC/d2X+1tv5gAPMX70jmqAk/X0yBTdZgQE3PRg9CP023dUe3WJYMXkaC3W
         qMKeQc3bMb5yOz5dXayhpV4gZUQgonm5aHsqv/JMpFjg2YMSQZmNDux/GUHYuRL3UQS2
         Z9Czqp8VO8euChLylL5AieXusRlcUv1s+9LlRDj+8y6o3NROUIjsPKnhQCPnTdEuyKVJ
         oAP9t8C4bdkUOR19GogjpeRg3IdzgjP7n8XSnf2GipyYWnQBGMT5TtJ5ooYC5XQTIxkA
         KWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142317; x=1793747117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
        b=SNv/+rYRPd7PMnkaYZ3353qMOi7LdcUWhX0JD7+TK2RFlgWJuaQGgGXbFABRMKr8Y+
         xBv22Js3TUrZCz21vUyz2r5SCX1u+2Aj4qqOAyxCme3Y8F0p3a/rFzVl/kYZQIrjONAr
         860G7dRH66JmqHcIWb6cwLojyYbNdUooB4/PiJRNVGZEN+Ydnt8yMz8mcgTNI2KFLfRQ
         yEDCNg08bwWKp7FltEqtqVBi95Dtu7dqeQmm2mCQBvh531+NX/cN34SBq/IlB4cIIkbX
         KRYs7tMUCgdDijMMEdHh6BlNKYIs1ItVI2ww4ZqxL8Jhy3TPe9qJ9wmrEij6z/lF7c6Q
         y4Ug==
X-Gm-Message-State: AFq9FYIbOpjzruMAJ0ZQETBRBbGiG2cCGh4wqjNx7g+2u37l78wd1tEX
	vZO9MdEQ3tth/7JW7ry3AKrgZFahcqXCJPpqbktP3zS1ui77aN0qhheGjiTILL0ZbW7KTeOe5ru
	i/0CfwlOP2gj9yB4JKrC5wyIwHfWUrlH3wz4p3jPRu7/C7+yVM8ZZrq9dLBuWFF+5nkEsgQ1DWA
	4/
X-Gm-Gg: AYBFou0k5ClnKMY7+EivLRmDHZ4ircq8JHlEtZC7tjB13AzDrNZX2JlMAvOiL49fNi/
	BKmm7Z0EnuCd2xSsRFt9C559ggHyiF4n0lKwO0OsBHn+YtOlNm8DrTJAYiBopGALASq+GSE19AJ
	Ol4k9jAP/cblNmK4UAZD/45dx+jKfiTo68fVhSahqyILGhiuSjbJnU/xr5scgQNwYXTfa5U9LXK
	UNITwyQ12wleheXTMpOMqTm0aVvpTa8/aU8pFn25sgwoaT2+el6+noQtnPSz3zpGdcT4O+NyA37
	Z5Ql4wRkg+isgPN4AgZrcx+OhJz3p+qTBHG81XAN/lUazVxsHJjhdh0tpmMWQkjMXe0RSTAHMnW
	Ny0K5gyuzWJHppjtF08ItaJf8wav/+eI2cJytHH0HqrhUz511Ug==
X-Received: by 2002:a17:90b:3c12:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3ae57f9b47bmr336476a91.19.1793142317195;
        Tue, 27 Oct 2026 16:05:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c12:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3ae57f9b47bmr336461a91.19.1793142316753;
        Tue, 27 Oct 2026 16:05:16 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55a6859bsm510639a91.0.2026.10.27.16.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:16 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 5/6] drm/msm: Convert map helper to use dma-address
Date: Tue, 27 Oct 2026 16:04:48 -0700
Message-ID: <20261027230452.130031-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rPjr9d_5hVN7XPnCvsMDxHn4tC0OZI9g
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae12e2e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=I_bc3XnsTyL_mMZFCHAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX9VTAR+0CLz66
 uowe9FOGX5wrYKQ9wWva3dIFpOtxXaiMj/V/8vpSxwx5lehiKun00q15VN9HBuraCG65ZkexjRi
 kvK73wcEJ7e1KiNJpE6dniE9LsFK688=
X-Proofpoint-GUID: rPjr9d_5hVN7XPnCvsMDxHn4tC0OZI9g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX8UKo1vU5PdqX
 mhkJ2n5/R1ykeAe9lnea/eVDJXGmbGtmYf+3jum/9bgHIFRpncrwyZehMtHQJFMs0QKxv80xt2r
 63MdFtfQWHabfbexLeMO/SOPR9bcVdXriikHrntvXdf+ZM29rVQQmLjO70wxzqcT6guN5Itihc4
 flSc5eyj6iU1y7pJY/GyjUUlKNdG9Li+MqK7HZ4QEunyp6Sxt9Y6fHpArlVBOG+TeEuEpEd+JY6
 okl2qLHKgvAtir+3dZOkvG6KY/pGE1I0FlrEx9bScyd5ssIqalQY8ICiKiwZKCyJbqLAG8zKSDx
 nQjf240NbaSvEsb56Ot5K3pjfc7jOEKnlrdnb9cuqfe6iIis6jyQM52RSY2w1GAmy8jjBAjJmSg
 EAYBx6Ch6YDvateBCJ90j8CkHv/R3qDax3ET8DjC4Q2VWmxjLsBYJQCAj0By1ifxFMUv9az2KyB
 PjgVHJIucfoasgazLAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270093

Now that we have everything unified in one path, switch over to using
dma addresses for setting up the mapping.  This avoids issues with
CONFIG_DMABUF_DEBUG stripping the pages from the sgt.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 479e5450a4dc..c2950d32c507 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -153,9 +153,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sgtable_sg (sgt, sg, i) {
-		size_t size = sg->length;
-		phys_addr_t phys = sg_phys(sg);
+	for_each_sgtable_dma_sg (sgt, sg, i) {
+		size_t size = sg_dma_len(sg);
+		phys_addr_t phys = sg_dma_address(sg);
 
 		if (!len)
 			break;
-- 
2.56.0

