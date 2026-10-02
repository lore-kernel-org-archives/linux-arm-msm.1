Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C359C4ED1AE
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955005; cv=none; b=inIdoysDe5tZn9QSHFiRsdK4AikfYOrDLRGEMPz19CvNIAByUuOB3jR3ImbGYK0EKz7k0DzvoDfyXbQIB3fSjBItMcYZxf/AmUiQCGQAXHZoO8dR8ahUmsDQD+LBa+wX4YrEf8udKffWDOLal+0wCUCUUFie5QTUQ1wsHbuoxsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955005; c=relaxed/simple;
	bh=BRTFGnRCiK4ZFScjYYLcMsd0f5n6Kl1CKn5U9teS8ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLrKhB/B8o3FRbcmOXiO3idwSA5A6HOyLuO0cbZ7Aw54TNMBxJWNICIX4miUGCm8HOZtLXTiCKU5N7wRfyf90CPewWXBNN0bsrRBSmXjmXZftc1ga6ug7fElWfwvOlJig7vzXhljhfy54fBJqvYCe6fwB45QZRxMNYfxDZ9m4TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8R59dN2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1GD+VWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8R59dN2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1GD+VWj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGjxA434998
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 15:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NTICCgegx83CMaefd/EXj8tYtmfzsjfJOJdBMrgs7UA=; b=P8R59dN24VRLzKXT
	C1IN982brIZqOzMsrWlAQLa+E8n0vS0+ikZDzBYc/VarhRVAnxcXYasL3dWipcJ/
	NEBINX+4l1IjpUIc1oRsl8h/XFVFfYubHBjshOEw2Ot3pjYZoqKXC14nhNiL8ZYX
	ZQ9QnBUlcE92eg9rJhksv/iUgEV2RN2GbcKuQk/FAu7WBAbJRr/UmfIVeRBO81/z
	1XFhyti+nYvDdPyhihoR5wcpZ4AK2m2CaHN+Rw88BPCvrqL5OLgY6fxntQkwuNSb
	b4nj37zANQPImZbQY9NIdmicCcc5jPTGwO9y/VExqJwEf6rVzpCy+d+saGkRWmmz
	a0nvbg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxebrvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 15:30:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so7793554a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790955002; x=1791559802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTICCgegx83CMaefd/EXj8tYtmfzsjfJOJdBMrgs7UA=;
        b=V1GD+VWjAXsV6gVk7LuO6h3RpA3liMnaYc2FctINq59L8bdVhLdbZrzENiHSAfcRku
         Q8n6Fb//p78b08nzwGJP66xn7fzlwbsmnPz2iicI+KhplmuuAU/6634jc3PrsUVMsTW7
         KLpkSUNF8f4lsbdXv3eMrVM31SZZNweNBPWCO9M/6CiS50bp0wCZFTYQs2CGHMRiJ7iQ
         EJV8C0+m+NNMb2IpI3pNVLj29x3gOFzlflZieLyF2fJxdtNJG8/Tpw9RTNCz9vahbSOA
         +ncoUsXjNSc1Zju0cdim31aIDSLQfTZHiHW5G9PNIp5Qe51q+xYIRBrLXWyCAMQ2tUOO
         Jynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955002; x=1791559802;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTICCgegx83CMaefd/EXj8tYtmfzsjfJOJdBMrgs7UA=;
        b=Z8myzbpSDXS3FYWaZuQcn/7OQO9p1kSCk4ZJzxeuqjmH5XDNm8FEf6yQqytkpm4pXt
         2/DfRSs9RL95yy/XzByTI3lZ5igJQ1tnwtCY9zRdefgrpcw0w6bwQEZvDKAIanAfKhYu
         GBssOG0OHUoanrFVOmNqiTYwqSlKTb/taHGDV0nigbW4F+jfbOdLnHY8oZ+1oGYN1xaH
         Z+aGm2B6cQoOyLajIbhVTI+oIQ938/og3gxBULnyoZ8DZ6pjM63qFwtf+E0ixpFKDUmg
         EDSf6triudWNQG6dQtPOGIeDhVymTqJTf3l+h/p1hF6ceWIw+E+axH03rNekV3Z9No7+
         Ttgw==
X-Gm-Message-State: AFq9FYKh23Prx80tXPaIwBM9NqV5xq2ZdHGubKvSi1ezlDtfZ2yybE5H
	q18vL8Po2ic0NKBqQ16sAbgjHLMjpLHsGj9DLZAlGhJPQ8SZ24VY2MQymcCcxdeKORlDsK9dDkq
	BqUp6hP/dXKhelMq1tccSfZ7Qn2L12UZOVFZ3vahPZvMl8F4wuFr+Wuk4dbOBaBu18Q8U
X-Gm-Gg: AYBFou0nQVt4WsKAvIVQqWi2298BgZUxUrxCRIQIH2Qc82L5qwuCeIGQwl4U6j7QKxn
	5r/KPwEIKZfsVY2G196xyMdsE6OGkpQC1AHeHLg5kPMywytrn6y8GRif7Ec2mz+XDbNEl5FXoEM
	gFGQvnIdRR1sediAlUEOLJdrvxzFV9K6tHTxOmq3Ou9b928/wA4U9WV+jTlIAxGCVy7f9lnTEla
	VZXFJZ7+QAgU+0uFHuLtAw9gYp/7iWd39pTzNHOHIPKrRwh76BCb0WJJEHrGP6vKftizdY0j+zF
	u9MhbvjztGjd8Qhu3EmXN1K6t/Hg+hYqrO7rvsqTN6koEXoSINkRuw+Xha+VT6JWyut/84van8q
	oqq5kkLVVZ3ZLYMuQdjVQqeIJO8+JfFRJOJwajn9gOx4YFvc=
X-Received: by 2002:a17:90b:3844:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a6cec1c749mr3289862a91.49.1790955001824;
        Fri, 02 Oct 2026 08:30:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3844:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a6cec1c749mr3289830a91.49.1790955001162;
        Fri, 02 Oct 2026 08:30:01 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcbdd97fsm1643414a91.0.2026.10.02.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:30:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/6] drm/msm/gem: Stop calling get_pages() for imported dma-bufs
Date: Fri,  2 Oct 2026 08:29:42 -0700
Message-ID: <20261002152948.85308-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
References: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfcdfb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=n7WAr1GF7x8bO2YR65YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: SPZhdOJF77sbMA5rsvoA2o4VWfpvltx2
X-Proofpoint-ORIG-GUID: SPZhdOJF77sbMA5rsvoA2o4VWfpvltx2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX6UajsJCcHfye
 VhaQ84i+T8uxEeI0PhYsuItKBIOLN93/jdUyyFJIqg5Y/WR3XFOtirPqATZSBEVRm1t7mW9Rywe
 sowHSjvHMP5xdYFg5EIVu+1rSQTbPfGZuoMF0qzYxWdpam2uc0e2iOl25fJYBbQXzFyHhMtOGE8
 ioSomCeG2emK9/NAykQglQp6c0xiVSbjqy8jir0rFFc9tmQgYM4LHvtYnyGcsp3TgI2QfBkXeeP
 i8f7IXflyccNufYRAqnMjSIy7lHdqUBQ90SRpdkj8Z3Az3q5bX5DtZveW1/x5KdtAypCWlGXasW
 VGpUDdF+OjiQJK8QABhNXgSJx2JNgf6DV/SBTvAH1OCUUBf2xFiEoTxHVglPfbd0qyDJ5DCE0/m
 ZbMrQm9l6j1p2llvfbWQV3kUPwuMbkt/VXBpB/0YVyVmKCDZwWobIOFLfD2TBQqxWx03tA5P5kz
 2KMiBmcHOBOk41sBROQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX1UjWzSPTcoQs
 P6SBbwmWlreJ85qlAeEFi5iW4AzLxqoGk17ouK+8LSGmROvNRLSe95k0mxmyuaNoSCi8tsj2Snn
 n4imCI+gqSqPCmnIAj+ZI2jL18CQb2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

Use msm_obj->sgt rather than msm_obj->pages to determine that a obj is
resident.  The sgt is populated up-front for imported dma-bufs, so we
will never go down the get_pages() path for imported objects.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 ++++++
 drivers/gpu/drm/msm/msm_gem.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2341f209adf5..3111d7389572 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -193,6 +193,9 @@ static struct page **get_pages(struct drm_gem_object *obj)
 
 	msm_gem_assert_locked(obj);
 
+	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
+		return ERR_PTR(-EINVAL);
+
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
 		struct page **p;
@@ -286,6 +289,9 @@ int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv)
 	if (err)
 		return err;
 
+	if (is_resident(to_msm_bo(obj)))
+		return 0;
+
 	struct page **pages = get_pages(obj);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 4f681100ecb0..e92c6723d352 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -422,7 +422,7 @@ static inline bool is_unevictable(struct msm_gem_object *msm_obj)
 /* Are backing pages/sgt allocated? */
 static inline bool is_resident(struct msm_gem_object *msm_obj)
 {
-	return !!msm_obj->pages;
+	return !!msm_obj->sgt;
 }
 
 void msm_gem_purge(struct drm_gem_object *obj);
-- 
2.55.0

