Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388026;
	b=lQsm0kRjz/bYMd3Q4I1yIyEYiwjCNFk7GVS47m1dHiwZ70MrWVZnsIj74RaHyz+CqNM5
	 Xmy2EOqdhIYQxyrFAO/zZEn+orjUUaATc1NIOasRyKq8c2YeRA3cBNZV9LdZEE9XyeXGJ
	 JCuV33t/VIz4CuYwn3wOD3znh820KsOaaQ0dh07Br+3B8Slxh2imt1uaKwi3gqOlobIdK
	 HFxp1qR3O8f0I+ERbIuunBq0Uon9kib2HUCjo00SaYhVCEV3RMjiQssoGQjlFTevCACY3
	 ihNsL4jP3xy4duv+5WnMSYBZUk1TV6t37nSj/tjFLaDRlCUSjWz+K4wBcZP6SqbB1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/ShQl6WYAmClLLFczEcBV6XknRwLtOiivHGhNRMzRi8=;
	b=KaMcNwZBnrtbyOPiIPI5BGLe71VRZM8uC7H3nC3eeldyqjq4vVkYYYL0xiOguvOakco+
	 k5dRZbybKK70PypryJ8tE70nCzgiyiIRr8vMwkz6/BYHjN2v5DRPQ/f+UVScOb1La4eEV
	 Na9Klzg/jCYacsfOKag/ytSdmOcUcOPSdXhPrqzrQBDwOkyMpDQy6a4tugJSU7n/523I2
	 jlXqtmlAuOzDzIioffXuq0xVVUKRcpcuE/4WPPq/NAcXI9uUcX/F3h+Evpdd73PlAuMzU
	 Mo1KdElnUHbLa389rVk5K3cO1F24p4IXlkHV6ZZmZNxwr8GEdb1jscWM2r2HuTLxKZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RlvhKzhb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RcJI/Yjf";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C630606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 19:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C630606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RlvhKzhb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcJI/Yjf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhTuX941856
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 19:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/ShQl6WYAmClLLFczEcBV6XknRwLtOiivHG
	hNRMzRi8=; b=RlvhKzhbEf56zUtPosl2dI9UbSsdN7a8c4KbdUEHwlVuOGnDpuj
	Rpr4UoXTo2YZNUQUEQZDBpN1IphR6XgCfxie45mT7eb4iVsU5jKlkEx/4UGkJ3kz
	+CZvIAgFGfUfZT5D/WMby9HVqnlLapKvITGCm3iGgyM5nAO5cycQKDDpvnyM/9u5
	88bdXuDzfpNPNLx0meOgusEVC3WAA9b2GTamzoiVRex4eJwg09gccg9+dNRDewq/
	OO7cs6b8LeT/mXTdSEc9I/+K8C8SxnLUcZqGpHRPq5op2o1ZK44XWGji6L4xzh+8
	pvTEJsJI2SatK3iB8CETxLU8NturAJuYb5g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s383rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 19:20:17 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0cfe694c3so18484657b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793388017; x=1793992817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ShQl6WYAmClLLFczEcBV6XknRwLtOiivHGhNRMzRi8=;
        b=RcJI/YjfE/1MQ8wSzQAa34lfLMILSAKsWYkQNBcIHnfXvOZKw2ubUCQVKOAUzcZg/e
         OZi+ZFfWJPswST2aX/ojJtryAz7qmuFtuJUHfPtlbo2ISOYV/dqARPJbFzqv4NtQukmY
         4g5DtJxoqdxMLLID9J9FOhi0oFD/N+7TwyP6JaB6P4ycQFcdvu3cAitJlVy4rvPzqLfa
         Vdhv2gzDnLF7wByHzlWkp3Ob/lbg309z6DbGWnkB5g5vMuofQ1WQUPE4zipFDJS6kQ4w
         2+waHe2HZnQsGzAQTYeNoygbmeeP5o8/i1Ccc5hI5cbn4zvymXiLKcl9b5QR5Z2E9vKI
         EmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388017; x=1793992817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ShQl6WYAmClLLFczEcBV6XknRwLtOiivHGhNRMzRi8=;
        b=vCSgLAfvuq0RCuk7K/Ndlx3SBQHKjXTw26DZ5ObRRLsTVB+5X5ebYzoSLmqOp1dCa7
         C4qQ+D88O8MxfUtdFtrDpddFql0sXgNPGLlCnq0pK8PetzSGzVZ4JFZGvdlKdA2k2AxR
         jRg/NAYkt2SAThimY7DWKXJdZCFLKL7CnLl3ZMFwi5uckoWWhct51htyJkclzbUFXgJt
         UEBK48KQVOZLvZ1RUfFfLWME3MpQOKz6lFgahsWhwAUz4j0Y94sMXaMb36DgkAtIXFTi
         uOgxp4Lsg/qhIl3HFUAKq4Yxm32oNSqEwx65WdjhDoXIVCqFwsPRPRlrqtV8Rn+6e/9w
         Wa9g==
X-Forwarded-Encrypted: i=1; AKwUvBy17cnK15ByifF7GYOxnJX8KQ5XvF2N1OfKsK8FqeoDDJbjBAOBmAnd1FEs88o/13irErYz3fY9ae//PFwK@vger.kernel.org
X-Gm-Message-State: AFq9FYKzNTnarpmiRnxpTI13oAvZ+j/ctJGymqli/MMLdh3kWqki07rO
	OftJJ+UdXCM2AEjaOSls1wURaGzyFqbefxNdU3Ip/b238vJY65iona679GoiCrg73/94s0XN0HH
	OZyd4JssRqHEovR6Y4is1B1vltqbmED8MlIWJ0T20jA8w6utBZRtXgi1Nf1yuuJpAAurai+7b9q
	qA
X-Gm-Gg: AYBFou3YV9/P4D3yg/YB9fWR8ZIurCF+uSW8MHEevy7/OX+2oe4/s9fWFRbNgA4QJ4z
	X4i/AsMeqm2H6ps5MfdKQcQnu4wqDc8pzgW0JTd4b0I6PmqTte0LxHJYKDKvj0ve1Z2XrnAj9eB
	V+APyr0eZx9zmFEM7EfdsGbQKuXqRrrSbWDHsvLubI0rAaiBVpUNq/k9K59BJQHyd/cO7zfvC71
	IsSDqq9Rpf5Oet8Un3s/YD0hILlioOxBwucPNTOrNk3JiMFwdD/uA6pf6Q74E8wB0WKgpeuIOVM
	iUJXFl042y6mxCNU9SzlLGyFGHmx5D1lCVw5hUeX52cSTdBR5DarNG2Ni5KT3YXlEYyPJ+bX6uD
	jS4DBAWysTPYcFAcklX1ItuPDZ4RWPuScntArungGaNrPYnY4H3Xy9H6vmbUB9WdWyQIdfEsPo7
	PYHSFu6BHQ9+cuz9QVMtqyw70ImaPjH48AGQ==
X-Received: by 2002:a05:690e:4141:b0:674:e0d2:7e12 with SMTP id 956f58d0204a3-67ba508d010mr2233314d50.109.1793388016783;
        Fri, 30 Oct 2026 12:20:16 -0700 (PDT)
X-Received: by 2002:a05:690e:4141:b0:674:e0d2:7e12 with SMTP id 956f58d0204a3-67ba508d010mr2233286d50.109.1793388016327;
        Fri, 30 Oct 2026 12:20:16 -0700 (PDT)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b719d2d5sm13185767b3.40.2026.10.30.12.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:20:15 -0700 (PDT)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: fall back to MX when gmxc.lvl has no levels
Date: Fri, 30 Oct 2026 15:20:14 -0400
Message-ID: <20261030192014.694393-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3NyBTYWx0ZWRfXyQy95Xb4FjUM
 zk74K8tBWJoOMGx0JSB02ELlM6F0P4f17J9EgmG5MBMdLc8bCfn4yevoSsigYK4P05CAJIQZ8QG
 Q0o8AqYvaQOuxETvE/YdIw/1XWcWeHP9TBBbLNXPOycWnsiRnXB60df2f0uwuiFVYHbGdVXl5RP
 AP5+KHWRxTES2YinrSzxSLbusIwHd7CSAfuZxLXg9b3fHjBXVNr6YLyr6QzgsQbMWP6j7K0Dyqf
 ehaJbwJQi6wny6pgcNdgvbcrj0y4x2XPbutZUtO3GmsADF68A9V+6Pf1WbKTW+kddyhh1FSHGc/
 gwbfEiCai9wSkHJG4lkcZkMSTtRN3CddHwf6V6E5AMeMd7RhBkLIl0ohtPTRM/jHn3oIqcAXBvF
 QPNggOTHdXXvXIkx3ndUuyaCX5xoT+n25KSMedJOXbqU4BrEgNeE7KkpikXdvtoY/4Hf1YTLRtZ
 N5JqwS4ZXKRYEMJSNKg==
X-Proofpoint-GUID: N8mU1XIcSgNwcciiw7NhzcuTiYCfgRUC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3NyBTYWx0ZWRfX5viJs7cUWGjA
 YB7jRKBofziZ6RYOwIaw8VhlCd/d7RozZZctYK4FfNvgO/MyLzG1MCQPVzsi7Lv78IcJja8YLWA
 ppzXAo2q8UrXA4niP9+Qu+x8OwEeA84=
X-Proofpoint-ORIG-GUID: N8mU1XIcSgNwcciiw7NhzcuTiYCfgRUC
X-Authority-Analysis: v=2.4 cv=XMul2ghE c=1 sm=1 tr=0 ts=6ae4edf1 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0bFHTkV68l4dVm3UfdEA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300077

Eliza's command DB has a gmxc.lvl entry with an all-zero level table,
though Eliza does not use a GMxC rail. a6xx_gmu_rpmh_votes_init() picks
any gmxc.lvl entry as the GX secondary rail, so building the GX votes
fails, a6xx_gmu_init() ignores the error and the GMU gets a zeroed GX
vote table. On the A722 the first GX_BW_PERF_VOTE HFI then times out
and the GPU stops responding. Before a6xx_gmu_rpmh_read_arc() began
trimming trailing zero levels, every GX vote silently used level 0.

Read gmxc.lvl with a6xx_gmu_rpmh_read_arc(), which rejects an entry
without levels, so the GX votes fall back to mx.lvl.

Fixes: b5269bf0e1ad ("drm/msm/a6xx: Factor out RPMh arc-vote helpers")
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d52..c42e0d4fb946d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1887,15 +1887,16 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	size_t gmxc_lvl_count;
 	const char *sec_id;
 	const u16 *gmxc;
 	int ret;
 
-	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	gmxc = a6xx_gmu_rpmh_read_arc("gmxc.lvl", &gmxc_lvl_count);
 	if (gmxc == ERR_PTR(-EPROBE_DEFER))
 		return -EPROBE_DEFER;
 
-	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	/* If GMxC has levels, prefer it as the secondary rail for GX votes */
 	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
 
 	/* Build the GX votes */
-- 
2.47.3

