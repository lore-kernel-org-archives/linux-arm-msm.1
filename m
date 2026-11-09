Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234092;
	b=us1/jr95XzX/iZ7NGgnGtOEYx2rPO9FHlTiJYfAj5yFQoks4Q7thDPQ7+D967jYiGLk7
	 Cf/jQV2c61w8FhRanHHid1WR4d+iOT8mw6A//xvH9sXrnZMswfEyrs1Hd5JcrcmFWv+p0
	 F4izGkKE3+ItkZ3PCVTyQ9pfRi+YLxNcsI3gBokI+FeURfmEofwobsJYI4+NwGjMou9hg
	 gF5TerJfpx+y/QUOCiwpjFIUP208xp4kcpUo0GqcohhMB78hJD9M3+o9hekiJfNzngqZL
	 y6nI62ge/DMJeq8HiqZXMsKptrKsE+KK4kKG6K2Mj+FYqwjiUWhjRdhzln8fwRiiiEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
	b=bZs/Ba5nLNw2a3Y+vSbi+lsdH89N8URKrYId3YRRke/25G0E9ncvQecfu8bWtXB+XztC
	 SqXH7HJlkPfdQlXF1xtjd/2jwhSzx1wfuNefhqA8w12Y8SHDP/23YqTlcEuMdbDnYQzwW
	 eQCx+CRlle9JQBHrK7uQoUvnleYnKZ6VgiPTXhSq8qKoL85G6HNIIpt+lH3QQQlrGMypb
	 FYyg+ivovvROhq2twCo1hj2klMBhSywc/UvATCtnV3tBc3Ki9SbyRe0wLPOlPqBm0NyCn
	 kEwj3B92ulaI1WzcjbfOsl1ynPKyyhReRO98FFyMT44IcTY01Cc80A7Vj2ZiSz6jK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBUkhJbp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="e7/EF25G";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B576606EE98
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B576606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBUkhJbp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e7/EF25G
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFD6x4025852
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kova2M5LKwq
	QTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=; b=kBUkhJbpDw7lULstxLc6Cii4yRX
	xaZEBbleAs51pSqn8KgZN/4xJoVLyZNtPc0Ke6Qpv8drEf5xBkDe4JdDSlFPvhQb
	9QSyQiyiNTftSmg3f6JYMIA2P11S/snjDXkeE1ZqYsnmyX0cFMqcqzpCPToUBzTF
	aAps+CyFGLKoxtUSZfbHg7eUVlBPfAYIE0BfaQZm7nOOeRS4u1g0NDrQxn98ExCw
	GgB1FKHfUO6S2tcmvtdnF8WGO/GQj7XBJUfXLWJCJQNCenmqvPRNmShRp31XB1G4
	HWwkDWEgbV0o67ac4DIdSlxqlxp/wlpe6bvaEECsMaENawJlnioD4HjjuBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua589awt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:21:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso803015a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234091; x=1794838891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
        b=e7/EF25GWhU28NiU+NGHRr1ULQ4+wpek9LNQRsWlckGH/mE7KYjIyFX61aDFfwzCmc
         uETmZXEz8DMiBxsEMlKyK0KqNdBVOTYb0r1gVbuaF9iLLagY0aTBiJNU/sKfdr0qRHT9
         ugvrzg6m5leEO0VS/joMZDjSQYcPk3bdtckCtxAxSRzLajD+vzq7+kmrWSuLMDCZ6dp3
         xWEOHUrVeg+6rTt9lXAlOSLGdo25fepr6QrgvxBH2VOOz8rkG/EkfIdf0jXNGT2MWN0E
         ya4GDR3VfvcQbjzU7Zu+1lHtY34lcVSdnvHcO0kttrqQDaUo8OLk9cXgn5j1R6vzZvAS
         HYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234091; x=1794838891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
        b=LURl5azbSEb9FeJWShA4b8Y0HZMK0YPfsq9eS6xoq++nEOR1mIxNy7lRBHeLr4IyH5
         iyi0Tf4zEMrQ9j00SPbgfa+f6tEaKto+Af9UfxWLpxZ//yGzExNBcDVmhWZoDGj57MK6
         92+TuJKlrtIrWmrkiB1wYt2k6iglZ9OdMrbDZ1VEikIEKB8GSiNm4Yy1OdPH7e1ZnqsX
         EDzdoJftRB42+BZDt84PyNkat/11/Ijv6OUc5zXhfJdjpvCVZdBTmRg+jXoiNXQFtYwd
         nlSqMOa0Tpx3qBu5cf+KsVgh/d5/7D5cIf4zAFplP5+2zofCSdVq9+hCxK11dAHJ9pfT
         gRXQ==
X-Gm-Message-State: APuU4Z8VLdOm++figJCTvExv/t4izwwTmfqGo0LlPpetVbyZmw//JJkS
	VX5wFjLUiJUVoj9+FDSOwvuwjR7XK8/pZSnY1E3yLuqkpgFqHMiQDkRR8Udvc1IVDivvLOWdghS
	fjHTlF2pBIB8HvMfvPRbiomZngPKwjQR9eUxWPLIt7mgWaHx6TMpHqf0/E8O5jAYihPnO
X-Gm-Gg: AYBFou2dC369Ec6/PI/NtJTPIYN9p3RVvmGaZogm3kvFBQMNgKv/MaOXhowynPKn6O5
	PkceiBiGLWzN+ZkHQgZSl/r7puGQrMC5KEdOWYp76sAaYcUZU8kpBYPTVRIxZyHOspVaiqftA15
	+7OL1iJA4hkd/52XJb0o3pWMc7bkHDdGv5ZmKilzZBuP10kS+5WMY0vQkQCteUoHElnfgOZZlvf
	jHKRUun0+PyGCblSbJwC8H+LJ+VjITS/n8je/GCR6vabxvET2jKndsGPqpco7vMU3WFtROJVPpz
	/Ormh/91+FUnCPeL9vT3yuNXEVuUPcvJLnZG32GruO70ADbuWHbLMla39cSblyaPcX91ua/XuXo
	ohLtSUlqY7D83G7tLL5AauPNr0So6JCbBEX3QzerzUsH/egY68zv3Dq4uuybyGlldGOZ1bW6CZX
	ogWpS9CLt7OXInkbixRAAwE0iBnGRgRkhDP5oFOlDVooqin4WlyLuy1+nWLhQ3Dg==
X-Received: by 2002:a17:90b:564f:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3b12d496560mr3864989a91.26.1794234090684;
        Mon, 09 Nov 2026 06:21:30 -0800 (PST)
X-Received: by 2002:a17:90b:564f:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3b12d496560mr3864950a91.26.1794234090151;
        Mon, 09 Nov 2026 06:21:30 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712abcsm7261337a91.1.2026.11.09.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:29 -0800 (PST)
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
Subject: [PATCH v8 08/15] drm/msm/adreno: Fix PROTECT span length
Date: Mon,  9 Nov 2026 06:19:54 -0800
Message-ID: <20261109142111.256630-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX1S5m8f51LmHu
 seZXMzJVM728+SH1y7QKpm9B0itj/oZEa9gBztGWD+fyfe/1DBjknPsOra3A8Oe602VIfJG5iEe
 IbHKk/TWg4aNBbpatxc+GzuBw7+P06nkMHo1xBlPDHvCVDvN5JGhVejGgXBLjaJLIIr5Wpezoj2
 7GPNbdr+M5VIfS+zir40FxfsxBtzQ8jWDLXXp+wIeLxTyR9vzJ5LLfwqWU/wUY0U3OdwR4rlsZW
 Y3Pqk0QLikbfJGryj894E6/M8AkL39p5R9r2/F9b6d6CDJvZnbl1UK8J4ly2wrZce4oMc0wfh09
 4+z0I0com2O8UzOrbn5F1pV3CdCcv8OktouPwH2FUCv7uORyCmXiv1O1E4Dn6ayjw8hHJdqP9XI
 iqkEInmwX/xltjsmA1hNFd+tvpEKakoPXZhHFdZBTth8RvCOSPlyMOoWXX4nbZCrGenHFskYfa0
 wTdLtj81xGGRF26LJZQ==
X-Proofpoint-ORIG-GUID: nakrsflXBGanGNYepGq4tzJwhT_nIF_i
X-Proofpoint-GUID: nakrsflXBGanGNYepGq4tzJwhT_nIF_i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX1BNfMzOSqquo
 20j6SyYcJJRnWP2iGIINwc3zLXRDYbnIEiOuVCH07NRcUvXnLRfreQ4jqtUvoSIeMTw2YA8dAJr
 wdL+XYOfnCM2EWnpihyVKKwKL9bmALk=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1d6eb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4a3898e58aee..cfe7a3ed44c4 100644
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

