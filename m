Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657111;
	b=LqL9u3hs2Cku7NqhF4+NsUNQXUcuFaa94ZPTK0v1tZYucDxACzUBLAs3w/OvTWzmG76Z
	 To1cqUq3DD5yTK+KKhk957ctHQfzVNHOoEgl2XGY9xLqNO66Sjkj4AjrIbe01cYw5QhUa
	 ERVPBDCHMID4/uVYTjAyuf899nzw+YTFps5EaQUaSEkCEab0EKy7H8iNY6CKY1EDoowo3
	 yAU29aXhU/uhJoXTB1Gq3YGaqP1iHN8MsMm8obVOecyOUqrOG08RBCCAtngrofBk1Om44
	 c+dPX1yt6t7RF57IHbU4/WdxjPWRzZwN41+6e4wSgL6vuAvWctBGjaD4LkLH5eUBpCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
	b=M5iE1YO1Fah+L5hEpW8Fvti/IYVSckRvmIA5836/8MXGKutQ7eke4few0BaVMGzICCFC
	 bhFYzxScznvmur7OSCbi/vZQf6phfuQL30DvXvt6paj3bOvdG1tyOlueWCmkGhe1OAHpc
	 CORkOvAVU4malPJlUISy3U6LodpfxSe+5YEPUlUAbuSCuzeJfDjVBwU+XKVbjjvi5Km9r
	 Ed8S+N5j9wYtBZD1wWVyZJcxkY8vcXPNWTM/MVsZVMdZOLE3d3kLbJX8deB/PRUh4yo+k
	 zTZ0T4nq/aa4ldAJgser0RnQGz9SWhrbtRFotaR6oJu0JwSvK0y7l2M4l3uaJZ8eSfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qfm7HRpK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KNMF3tA7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E6606D810
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9E6606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qfm7HRpK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KNMF3tA7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K63vX1746042
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gIzkbjDhFpI
	59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=; b=Qfm7HRpKQ5VZqEMm+FWJ+oU87zt
	DAXYsKUehoT6EzN6nBis/jo0wPujP/mUDElQijsYDUURNNsL213xNOF9gC48Vj6b
	E8H+gsvwski5SAknyOF6apNL+DtnezzJkzLf2kpSS+s1vYUDNUE7O8pHzFqT6WR8
	GNqP93Vw1DAiSQi1yCAGffHLdrRpfpp6ugmHoskWHDJyHAuXqZpzk2ShnSJWGyNE
	vOETjeXcdNlsd5usYeMv4wMUYHiepbRkgtoJvPlII1OwLip3tFBxPhK1f3P3JMmd
	EmVkGpUex/65EgS0IBGCnPn9I0BS6sXp+eHqiaXi5+T0sAAvzUNzfkQqw9g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvu3sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:05:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2905041a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657109; x=1794261909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
        b=KNMF3tA7ZyGytjiDOD3Y9W1E3Vc5o5+LTy+qZkuT8NmRrRD7DbbInhgzPNOiXbUved
         6D+xJrDmTEdgMRhKcwMog7iAy6rDPQxJBIBn8KKlL/YrauWUPzrdOEo56pboG1njxniV
         lNSE/zCtbe/uStM/kEqVMM0tJGnZuJV+z2/TteV7d/suFnWamDvyEFF2sBInNtnSfq46
         yZ96SRosB/vJ5nZdnufY93RJdlp8V6CW6gtlpYAIn7ps8Sk6GYzD6POBUDEDWyELlKIs
         aNjmbYKJS03ZBDBzx798NkW+ghu/kkUgqTbLamMnVFxOvgwIPx+0om9QcP+WKzDoPKEI
         LIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657109; x=1794261909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
        b=Qr7ctGuF22JooOLO4VlDF6rG4ADnve+O2Yb0T64lvc5eNTDlldPDCy1KvD8V61L6AC
         i0w5h2VpYFzcfYKcrbObKHAIC4og89FekFe9anX9ZJHHkgvJttskfVJPcnCDGT9Nsjjf
         +UvAME8zGXQPgdSDXrk8Bv2M2iG5ZVklmcXi7Wue50vSzTbzYbkkR1Hdz5M+DXACH8L5
         sqS3oHiHlTBi9QT87zRyfQVXMg49L0ykoHLF9WMrvF8+Hs8TjJlNI9vPGohv+eexYmaf
         KSzZspN22hK05h8MerfqrJ9BbdflHm0GfalrasNYTyuxM2ftvWPgsMgR+NcNfkhUZbX2
         FFhQ==
X-Gm-Message-State: APuU4Z/0NUJazhx1og/tZM4n8haQZeglCSXu/DZUEe0Lv986/f8DJy9T
	48qRb0XtVeukUoArdWKN3E4EtmZlCvPY3e2m6P7Qq4NCkf2rwogiiPxv9qGBCJrRqD3KS76Y0kH
	aLciNDhGbSsqaeAJLl6WApTrYbAWYFdmQHj8GJ6Cu/za5JMqI+vREufaffHbZhfxn43D8
X-Gm-Gg: AYBFou08hhsf9vHoPEZ9k4Tb2RT9jsBmrc9jV8j8df2XOr8HX7ro+e/2W6v9Soe1Qdq
	w4fB1Ww0F9ha40RCygo+0WElBBrxrGK3bv+22faF+5FHa6gVJ/Noh4kAG+LqRMkT/xVmt3OrXuv
	StOrFq8WTSK8BiLEhSfK6KQsOtYrtnhPYZzSoLOW1ycRGwUUryjQMrIyOgGQ423n5KG9M7dmNHj
	F+8QGMcCWQ6AAaatjhS5DsQff7Zok84MXoPFrc2nmbPNCDgwbmOGo6Y2RvZLJsVzBJRiayI7SNW
	gJTUK3xE2PoeNp057jDAfWLQm4aT8b7367m9CurExq+npyrWF2aPNU8SDWlnUY7xuDuRd8x5B/q
	cADEA9McpW50azCGf4Q0DVgrKwRM/G0iI4EoCcwQM9vNtkcDjOMv3tiqzZTuEPyvI71NW/G3Xng
	GCK6Hy4wtQz0zjCJCu9UjWE9Y=
X-Received: by 2002:a17:90b:4a11:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ae896f8539mr8634103a91.18.1793657109341;
        Mon, 02 Nov 2026 14:05:09 -0800 (PST)
X-Received: by 2002:a17:90b:4a11:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ae896f8539mr8634079a91.18.1793657108947;
        Mon, 02 Nov 2026 14:05:08 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85d24261sm9255505a91.0.2026.11.02.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:08 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 15/15] drm/msm/adreno: Remove temporary __maybe_unused
Date: Mon,  2 Nov 2026 14:02:59 -0800
Message-ID: <20261102220405.30730-16-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae90916 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: L9N1IBpygHpCW9VXMNzMNbk-WDDKJZGN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX98jJ/ZxFKJ5Q
 63MtCCtzIdLJkF8dmKGfmMpIIQJByjPoGItAgtU3T9+RkTW4M6ni6Ea6GFm8W2AbKMWfV8jLphO
 bWy024tuhNoMK4BOfTaEoMLfaUy3xeU=
X-Proofpoint-ORIG-GUID: L9N1IBpygHpCW9VXMNzMNbk-WDDKJZGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX4G2Ptox7+I2r
 OTdXOJHIN7N7JPEms6AmCxwH1kpuJ4uK8ga21Jba9d81XIwvMj3rZTsdL4IGs/kN2dWCRAc9iAd
 Mc/fyaTF9uqwxbjbuxbLxSOv11bLxLJ/VnztbNxXwtvQsPX+3ysz0F6dJeNXzRVhDMdfE3q7GqB
 4fWhdzfjVIfnvdoBeNOoEpZf9TkpYTLRJ+ImdSXMGnJ0/cN/nEJoM+4+A9kZiusr2POmHfRofqd
 rKkuxnbHhezq7258vdz4MbKhnE8FHFYMaahABP9eYboa7Hn2RyBHhjhxViazGc53bV84eITthv5
 fh8w0dmf8WKcLVJNcu1I2p0gefXzEd3nLKmX2QiaTv5KNHZJK4N0DXDK6rr1GIx5FzVk867Z+DI
 cFASsImklAxZgRIwIfxmocJmFS/5250x6pLLxY2j1+4ViJPvR3G567GKV1UPeQ8JYxNkwyP1u+q
 +M8cq8B6drAsy0YTMzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

