Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130442467E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856121; cv=none; b=Uab7vdkO9RLSRIP1AtxkIYSnSQGkOq1H4dwv7TL+Q/Ef2gCtgN23GRBIIOc8CHAfstC3sicNq3G4svRDgLhZiJIO7B6BnlISAhy+z6Pfa9H2izkm+nALDFmW8ub6Du1qVCDsjTta/U9U4N6kxqVl7ZvMAENvuRs/eBeXji4eEAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856121; c=relaxed/simple;
	bh=JxnapY64WEraZBfFqGiiqSghc4VaHYhDcojpYQOcQPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSJJI2K+50SrcqBTzDXe7lYfSyp7XtQcZDhajV/0oTNPmJV4wB+d2OUIQ88btghtemqKtu81j8JMHa9vchGPh/UUFfLTem5zut7P9sOIbLXVnmnvYbF+594vkAwSCy7s7kGIVmrPbnHOo59gzGeEoRg4TIMXF90jVk9X6i18L/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEUDUKwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1lYs+9y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEUDUKwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1lYs+9y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M37h2072857
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 08:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JXNafIa8Dz7
	9WQZ8cwkWKsQ6SpxY30pfaCRfbyo2NUE=; b=dEUDUKwGZWCGzXrPfWL+dZkWkI2
	18rgdi0b5IfbdvOhX/qJbrjQT1f8ypmWm657Fw8qlLRXWk9zmlcDBKRC+D67ZlxK
	VSBqwKKptkl7S4tGX95xsel4MF7JBNNjdIYqryIy8xYSbJefWcRtVTUiXC8qNQc7
	h7VIWIMCzfTBEBUOHdeDBwbsybkp0G5fZvwjKVYVQRkoyNzNcykoC0lP+06zu6zw
	XVmHu/h2tHADjDrePIeaY9eUFLsIJoWEKGV9ghJgL68dU4sex+1CjhRtyz4AlOJc
	AHNwz0JEQhdcZG/aRMDIKGqGVQhYzOfxFqKQXJqXyVVm+jh9CK+5HtoKWsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfymjy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:28:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d8cdso837959785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856116; x=1789460916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXNafIa8Dz79WQZ8cwkWKsQ6SpxY30pfaCRfbyo2NUE=;
        b=c1lYs+9yO1KxOXlt5qg/zcwq5toNOUj52r3QC/9zW0ToTWbQnYpNsfiOnp+GrSlX+v
         gTxbwA3niCScku135UHGYenqWZ1BWIzD6PhDrRojBkwfa//5PIiAshFDXy6ZoKBaf9Y6
         ViqVcIuJgpfHcRNvDuJqiMwALGp6xcAnlHtqQEYqMcNgbfnTzUMfA6B1ZrmG5k/JUdL/
         dN+Tit9iNvzSjo0AMFBTXkVCffC+F9x0YT9ZPGRx1FCCuKe03QA61+rgxDbZqAddMF/X
         2xiynQ51dtsXUUvg7IpYmibtUxp748wGKGOwTEqfE4604kV9ONc3EE7ZNew4hl00WPqy
         aVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856116; x=1789460916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXNafIa8Dz79WQZ8cwkWKsQ6SpxY30pfaCRfbyo2NUE=;
        b=BWh2dYvOxVp70MiqkhwSb4FxOvhFSzfU06QDihfchZRcemndM9kSrvTHPnXzL7iV/U
         Jtp/IsxQ/x1q+yFr68E9S9ZTHbDLKFt6+ZJqR8f2UCYfPAKh0B4FTOQxcUeGJ4psvCJv
         Brf8bcmPQxfmxy/zvN09t2XYQX9ldWBIm7lPI+blZKmGx+kycsNpcoHF/610e+GzS3Nr
         BLzRVhcaVRGEP/oKhyCQWKVIuzlhjLSdOKuZtFt+e7oGeri+vpX8tw7Zly5B5SmOA9wm
         EIBQ7om1liYhPr4enUsPkvuQGVXblfXRDrcau2O+PEqs5rG+x9fMWZa5EoYC/9KcR67P
         Oi7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxvMoqWLBEvvnZ9m1GmCida+G2hE/qFDQiG4S0f+lDOv8Ck44wAoA0yd9Iyybbz1J8Fjn/oUPX9Ran4uBqR@vger.kernel.org
X-Gm-Message-State: AFuF++nqA1RilLOK+4/V/6B6asZ8fyzXLU5OYtQ7Nop5wsZQQTa0Mb9F
	KgYuDiVd/AGYnJS66qQpQP5AFRfNZzq9OsIFzP9SBPI0e47K+eK2M6T5L7qdnnbEtB2UIVhCsdH
	UW9Jr5n3SPoW+m0pcjIIVNh52uYp1DToauZtPyA7sQyjBU+eTr570t2ZlnaG2zryokHnC
X-Gm-Gg: AYBFou1MAEpDAb5DzE7mknwAziNsdRxlzQomWoHmyo4CjPOcwJLc05bPRkv4Ml+cMl9
	fKrQJcAep32hIlEAbNi/E393YB8RsU3oq+MagS2rPeSBPo4xV4v6CeP8u0pnLmq3Z1MyrxIIp9c
	YGsVKLn3CLfIvKlVZmas9gCHT4+w+EygQny8Fk8TFreORH5WslTobtaKfIKTf4ULSY68nmkmteE
	HgieRudywxeECRfN8JarQqcEvfTaGRgy84aqJUuiHJtd4qVPPz3ItZoROUnxGW+6PvyTLU2/Ms7
	j9yYawVXDbcCLgENwMil0dEt9O6bOKfOvD8O5/NVU6oGZxyOkPfdNIhOgGlRpEYQ2g3mXa3qdT6
	CKQVddUFr1UA9Ig==
X-Received: by 2002:a05:620a:a2d2:10b0:939:8bfc:471a with SMTP id af79cd13be357-9398bfc4f1amr1804848985a.49.1788856115948;
        Tue, 08 Sep 2026 01:28:35 -0700 (PDT)
X-Received: by 2002:a05:620a:a2d2:10b0:939:8bfc:471a with SMTP id af79cd13be357-9398bfc4f1amr1804847385a.49.1788856115562;
        Tue, 08 Sep 2026 01:28:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/6] ASoC: codecs: lpass-rx-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:04 +0100
Message-ID: <20260908082806.648797-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F082FBNnQYnKuwV8ydJc20o4r_nWxAad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX96xjhtaH6W+Q
 zw/z1fFqysETp+lf8lQ+Rg37EO3Zp1BPGJBETX6zem2lwmSUMqb0ZWBV34W8woznEMz2GgRmzpg
 UkOXwdBQ3Y2ufDu21pkucBwgTpIJzLpBdLaP7T2XzLpEGuTxpMBR1CuGDb/Ggoctzw90BQ8z2sk
 brg7P52ijLLl6DAdepwYQTvDkaZyuLX+cZDU0EXu8ECuKshiScMNSkASBoIgU/3qIJTXK9ZFZk2
 DQTF3QRtZQL/86/dYCeobyjFoYcWoa99XmW+jahePZzHDoxCCtgs1ftfxUKPlDpr8nFg06k8ocO
 QXGLGmflvV7yEtzLSqq8L4hnIMSItP4G+grmoQmeSdKRBbq1JKDg3lgKeqRkYCfc7OsWyiJmau/
 W0Ukzf8QVLPi0O+QImcH9pvpMriDQRPGoS0rxHFb0BWSuwwVeQAfbMHJS9zCr8RvytCzryUqqTW
 Nn2yVf9on+00FjfwAtQ==
X-Proofpoint-GUID: F082FBNnQYnKuwV8ydJc20o4r_nWxAad
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX/8/XXL5Ny4Lc
 VR+eYkFeaaJYyRlhhQ7kT4teACa83DpCPRlVBSIhx8aGctLvZ1QtOLJM7UFE30UC/W9N+R2TTSt
 onKQuGDpUK8VfojgKUSg15Ge2N0Iojo=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9fc734 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_mTl3-Sb4fPHxIs9D7QA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

REGCACHE_FLAT hides missing-default reads by returning the zero-
initialised cache slot instead of doing a bus read.  The caller
can't tell that value apart from a real hardware value, so any
un-defaulted, readable, non-volatile register that gets read
silently returns wrong data.  Since commit e062bdfdd6ad ("regmap:
warn users about uninitialized flat cache") regmap dev_warn_once()s
the first such miss, but any subsequent miss stays silent.

Switch to REGCACHE_MAPLE.  A cache miss returns -ENOENT and the
regmap core falls back to a real bus read, so the caller always
gets the true hardware value.  Write-cache behaviour is unchanged.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 4dac376927bb..fefd4430172a 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1674,7 +1674,7 @@ static const struct regmap_config rx_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = RX_MAX_OFFSET,
 	.writeable_reg = rx_is_writeable_register,
 	.volatile_reg = rx_is_volatile_register,
-- 
2.53.0

