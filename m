Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991804;
	b=w4D4j/pFZxy7MWDNmmi4tKj29jDmvYVGY8a1qNww3C1WUyaF4/sZf0iZfnL2UKa98ue0
	 CkT6H7/OK9iE64Mfv+kd+DGOgaOvIANQv6liUiwjOjH1nnlbCRVF6tasO0iur2o5COG64
	 BYj5oumTUr3C6+lrwQ/sAdUFxqiCTZhrRCQdrLv6ygRJ613uVJ4apjD97dyLUzt0YNUXU
	 QclBRM2MU9O4z1pdBVAP4OdQKOyOCMrV2Z8QnyNtMqw6rRnw8LvimFzJmvd3rhr5ySq+L
	 B16XS3rT+8fva58zC/3reFk3Hj/y0Ec5CBB5Orf8RVcU87sEPqcLrp+Shic2lIm3clA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/0HAahlW4CgTua9qfMa4tCpqsXnFAGAWQeeP/ULRLM0=;
	b=mQdXp4s/CvZRlz6fVf3twLsIXLfiYwfLa6yhPB5fMpjgmh8iSjt2Y0obo8HYfKIp2gXx
	 pt/UsQrHFFgxSJ1fhtblHvZ0vWAfBG3hWV+ZK7X5j/0MA8rw0OOPRSoxMm242pCHHFEoS
	 4YMuM6F4SFQmApBsArCeX4MJrrdMZEIt3kpKN2QbQ9zjbuxwgK8KvKEYb3VQVHK8rk+8t
	 2ywptONua4P4tc447Zir33UPpX0UgUm4tP2ZduMph4SLhpAr2t7e+2uC4rYNgaXOEyuok
	 sfHk3N5hmtkUpqvCSmTfA+k60VmEiGHRXej1KYnf1RfKuHDzlegg46c55Y13Hk6n1Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMj8ZTSX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GnqntKBg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE4606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 19:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAE4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMj8ZTSX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GnqntKBg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Ht8sR3066045
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 19:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/0HAahlW4CgTua9qfMa4tCpqsXnFAGAWQee
	P/ULRLM0=; b=GMj8ZTSXIY6fuMnx29NuoxU02azIjSOoP0BKvCZhweZpZ/ABay2
	oalpjLrF6Dv3viZPCZxFeVLmR3YyWYX+l2VP1A3SEHNFXi8OSHJwZ7MK2jh9fkSR
	Dvrg0+SXIdRpVObK+YFSC7z+7YnopStl0hY30K3El6Sj1oh3+zhXaCC3EeGZyOph
	CQFFnYqiP6RYIISjjP+QEGlkjSOH+iMbyJ67MH/T8kN4MmQp5LMUCNcOUjLXxcu8
	ttBzQ24e1Tz2+2L4fVgOJodj5XlsDdakoI95CO5Lo9/urx43aX88aWUFZr+ciwJm
	lrmgkD8MWgt1x7K9neGm6YUHqxDqcdIkLcQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcc9rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 19:03:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf8ea208bso8992355ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 11:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793991802; x=1794596602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0HAahlW4CgTua9qfMa4tCpqsXnFAGAWQeeP/ULRLM0=;
        b=GnqntKBgkOQTYqBcYHULN0jkDgKbPEgU09B6aQoJP/uNfScNiOSMZ/QwSUaWLybPp+
         9AhBym+O84s+KoZNuW/oU5D88sidI8jHjrJal4KdoRVu1IqKg2ylvvlPm1W57AZG8tsJ
         ayl7vSi6UenAWC9Qc+U4inVJWphJhfPLpzQi2V6ImcFVmNeRANwbMYe43zDxb8xw1hY9
         NmMpHKxaIgDy+WpUmjIt2YeF0G9ecESHF/lVUEYgwjJ5jhUvH7bqIqaqyBarmbyoRqyz
         OyVuSdkX1AO+VeB/vXMPCi87/ZYrDIGvb2Pdm1UZUSzshgwMnYB+gD8SPEuvW9vfeHnN
         9pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991802; x=1794596602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0HAahlW4CgTua9qfMa4tCpqsXnFAGAWQeeP/ULRLM0=;
        b=MjHF7phDnuLWRMK6OSxtGzwg2mpAIW1FIBztVn1C7CPcxPW88RupDSqDs2jgoEDIba
         LJXSL+cgfbqVvuY5edhcVM6mSrD2a7zozNHwFFMivdS47kihyBX7ov8z/sdip+LlEGGD
         W/ZB+CLLWIGAHNtXTyFMtUt2O42FoxMuSrzLkhje72dvNyCmXFHjrbt6ICJ6I7Gk6MEM
         UnkBoE3UJrVmK0XoudWZ0PAXb6yw4H4YH3yEhPprCXe0sampHR1eekpPpwtOoIueAgah
         aM5JfcYNH2TEU3MS37s9FCpudQcP22240qqL6uaFWGE2qjP2WP6/Il0yDgUgY21xL45M
         1Etg==
X-Gm-Message-State: APuU4Z/BQdOwTEtigAd2TMDUoUk2kpy4Jf7qgxUxj3OBHOdd4+GtKUkB
	Nb7lqKmYdxcYjv/cKEW6oPULCdnEAF8qCDTSUECmlI6nVBvwDmfc2P3FCF55GdItJG9djoccWrD
	Re44ZH58kAWVOaHPTNIncDXdvrjXMXW8fRe+EIoMqiqYTF10V+/VZLCDraLxEBKlWz129
X-Gm-Gg: AYBFou13wv9Wcww5dL94KOMm7q05QTf2bbbrnSa8sD/7Jr8rdOCxlL85ok1w95jikzw
	qo+g2J1WzTvIBJ+PqdtCv6J7PU02doZpvKHRuuLhQT1uU/maFBb52k3sQiPccMKZeYm4oFrK9EX
	M0pFBj+iIKGBswFw4ghCEbQ2apDG3EM4IElaWjlfAg5y0eExVXK6JmKdd+f7ZbCpRUbI6/CR9gB
	9mQzs9ufrgrfsuFOeOSlryhrGE1o+fu4zMZ5eukzEK1xuq16gr0V7Auv8iP+1QMLfIua7HGbJfh
	FkLzWDG9QAgYzqfGMfcu/9z4pvlXrsP6iYiu5MtOorQYQBHqtQRMC3cGlnwC8LkGhQ7VNH4chHi
	X/g1jGN16hp7mSrT7p3QlXPi+v6iL45Hk/2yD7URDiBvtFuhhoNpVWBnCFgl9Gnt1J48Lfgr7SU
	N+001rgE1zEZVae9UcyGc6yfVzKUbd0xdpXZpRl/wPMTipLglxN3NLu4MK+b167Q==
X-Received: by 2002:a17:902:d48d:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2ed40aca726mr41087445ad.26.1793991802206;
        Fri, 06 Nov 2026 11:03:22 -0800 (PST)
X-Received: by 2002:a17:902:d48d:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2ed40aca726mr41087225ad.26.1793991801750;
        Fri, 06 Nov 2026 11:03:21 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm8637105ad.62.2026.11.06.11.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:03:21 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/gem: Deal with partial mmap's in fault path
Date: Fri,  6 Nov 2026 11:03:17 -0800
Message-ID: <20261106190317.17904-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-ORIG-GUID: xMGum7itxcRUGz-pHZxlHumgPc-vqvr2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX42Yydc3CpYad
 9eitTtMFr9gij3YMZCBa/3ym27G1FwPbUSYk4pqNDhIbuNGjZkWb2uD8Wwrzxk/J0OauGMQ8Hhh
 RhU+/OY/VA4B0sX6SuvYPFsglyx427mCcGgf1MinIhUA2HDJqH44QL9q2RfIHV98BKN4jmizT9i
 LqQK9Sz/JYjcOt2V/PusVPFO6hY+EIrTBWR38uBcn6QHZb57xJMaApTKjTj/XS4VpTq0Y7L+42Y
 yVS4u3T3hv6fZanVPMA0m3+En4eob9fFrHMqr6p7TvqGrMHIV8XJrn3Mq0BusmSXwUG3SM9E8MP
 /dNhQ+fvG8z47SJ3HK4cqhcAkd95d8MVJpKZwe0PqsKnAORrM6IXFXDu23CsZMLjNSZ/NH0QfoN
 zOttmxbHRCNqqtl/gJbmkGn5C4FlT+V6oNyrbNGReh9aYt16vQbCDdrcFQBKAIp95Mzu2/BgZL2
 jJMcMYUEyxe73IoIG/Q==
X-Proofpoint-GUID: xMGum7itxcRUGz-pHZxlHumgPc-vqvr2
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aee247a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jYIoWETkLWJVVNRKBkMA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX0KOdT7yyKAf3
 qmHBdhG5l9Lif3hKaKtqntFAaI/JJll/S8egAXqgA6eF4dsz01VsbExk9LyQHDOWimM1TdEAFB7
 HaH0itw9b2GP4O3UGrPCh/aK8tUqMHY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060075

Historically we ignored pgoff, as it was a "fake" offset that simply
served to map back to the gem handle.  Mmaping a partial obj was dis-
allowed.

But we can instead just subtract off the fake offset.

drm_gem_mmap() still expects an exact match on pgoff, so unless we use
our own path for that, like some other drivers, we don't fully support
partial mmap.  But this at least makes things more robust if userspace
does funny things like partal unmap.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 000dfcec7809..5826fd69abe4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -374,8 +374,8 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 		return vmf_error(PTR_ERR(pages));
 	}
 
-	/* We don't use vmf->pgoff since that has the fake offset: */
-	pgoff = linear_page_delta(vma, vmf->address);
+	pgoff = linear_page_index(vma, vmf->address) -
+		drm_vma_node_start(&obj->vma_node);
 
 	pfn = page_to_pfn(pages[pgoff]);
 
-- 
2.56.0

