Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640012;
	b=K3cH+xXfGus4LsrIw10EB/XMpu64vIkVww4uS1fokKeBkIrFp+8YaINy0huesWdRxyfR
	 gF8R8+7fvzZ00UJ7LDu3alDb1jAO1BftAfhDTFcMI0jVo3Yb/eO74Fcv2xw3UDQr6mXka
	 xyIxLXTK/K2+3/JIw6987USxcFSCSHvISJ9fB3pOKKiV4TyLaP9UM7L56tz2GRLLl6wZv
	 RZYtAZ4uLJaqsUrxSAt41cd5SkEdQ/WRNPZAZDyqKLYFrJQXc8dcaY2I9ol6rK2hNGf+b
	 pT5y77Zs/T/kXxjxJJddD2dNfcoLMPkXBAO3THxDw+j4b/yyOUnpCwpEsots4zqwB8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
	b=De99nwGbj5JpyAHhz9+Y16SWblPYlJBj3NDyRmBO18OjTQkjBfs9PIJfMRYurNA7aEBB
	 ZTgF3/F4xm7Jt0vvAM6L1NY17ht/PRExhwhHYPHCXfp6nVD0hzZu46GzU+JFJtmUH8qde
	 Frt2g/mQokluJJy//YGZnismn8AUO6uN6sT4+cssaBf6sHoCvYRbIuz4m4GbRCxljIdum
	 94S73/aXZeEB+ZPwXZ5K9Pe8E0DYaBztlmGuUwvVbo+Wtyx21ScZtnjf+PrJuicGjee3h
	 4N1KQJ784Tz16cNL8RfC3LRvCl8q2bOstEf9+Z4b2/0D4E6BEPVg7yjSgYCTsqQu4Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oAjqQaar;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D+AQoe8/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61D560A0FE7
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 17:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61D560A0FE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oAjqQaar;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D+AQoe8/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZFZi3370487
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 17:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e1U31KgLCeK
	QL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=; b=oAjqQaarCSj1P2bwGT8MJwy2/QI
	BYvKPJgBj+YEkBF17vxaEzendMtTc9uzVPCUr2R1fFawFOYpjjyqyDTu/wgRbZdW
	Gkr9EwrdpRx7WPXLUdyM+L/tewGzqkUX8I/A7663fijePlmYToWgXCQPpeinExtU
	KS6D6CMV/oSu9QX6OoLrXiVIElj8iB8wwB+0mg49BfrfvVmNNAojhsC77EoOyTle
	QbXDqcgXKHTX1C5GRPrNyu9aJch5qcj/hW2oyz2hbdfYJdliSZ3O+z8ln4fQZ9BB
	vDN+X6HKGAPX87T1E1nhtOVoQFT06JkcvtlMD3+wgVglv73yDc6sizpxJxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavhkct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 17:20:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea0fe07201so20232475ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640010; x=1794244810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
        b=D+AQoe8/rMyfL3Yl26j47eA8VZWoLtJY7h0ORkNxJBho6SwymT0pFVg4o9Nc7ZsDDD
         I/TWYcOTlxnzlxKMR47auQZHGCG0DSDdGMPxfRkW7fz3ZNHmUf7M0OauuM3ac0bbvkBT
         wTzgItJLy/iANB6isRPUpF2rAHIvreHdDXhudG8+lcTkAfJadB52jeK+xF/jeGZ0Mn1l
         moTBq6aVrlWqlGrLE8C8qi9QpovsLkpulB80Wr95PPWSghoEhRMtkSlei6LCwMT4QNea
         i+fx9Co2Em2NOeAEaVsORRRJebqzcbD6xZfJ+tC5ov+XypVMNb0g/nSYuBIWFz6NKhz8
         577A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640010; x=1794244810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
        b=1tnF+C3z+6N14iau8ns5Kl/bh9kEmx6b1++vwcB05cZiUyyNLwp8bGTLIXS8bhYchD
         CELbbLrcoYOyn3VCbhuQrkksb0Fg7Ho8JqapalagnXCnEDRyYsZgj261xnxSZt0YcXqc
         jOx23+OUImbU1YXsAaB5TQVxzAxauZ2qwPjXdw5Q06SpAB4KvnhHECDlhAyX7ojKTZXE
         cDWoPLVZc2JKlMsB2UP9tlzdWv3MwrVjriX8R0x6PvMCd+9wX6L5GIwJ3bqwozrqn7Lj
         rGb0cBK7ftFA9TNgjF+53PAH1yTuFAwI0eT8XXGNEIaQoXCL88FHUR8WJOnp7Sn4xwta
         Xbdw==
X-Gm-Message-State: APuU4Z/chlte4jCLBjX5ieRMHC+wg42nC2zoIETu+RJWQ6HBhkG6AEL3
	zvW7+6gdj+DIlLnPIOccboglnDW+5ySZ6my1lO+w9P7TjTuV5pFfhhM/pq3leUtonDrwTVKdOtH
	lSdQkDW2KiY6Noy6oPKDM6xAeFzzZu9bqqNskSqsUdcMh9k8ZSnk0VOSECvluANKa/5oW
X-Gm-Gg: AYBFou0/tcW/vOqqLZhRMfakkYqxSHSeeZPwiIDAmIc+S7F66sDevDtVEWbb5FvOnuW
	upvg1s6RJLNa5SPQCqXEUn3YK5/WNIkHx7tf2IouG5TV2//wemsjY7UgVTE9z2NU2U36sNs4rKT
	99I1gkpeWnQ5l544MVIgByFjNDIBDDcLuVYrA9EZ/Pcb7kUBOF8A42LhMCocEbmFsQKSx9wOSxs
	Q0IlziXFJRFyKDDtHIl3rb6p27TmXpqeEHEafqiHqsTfKKFfRI4QJ3AfH2QML7ZTRqEyTokKnAF
	Eq+jRv1fka+hqQmMmsvKC74VbZQ1SNLGtTW/Ccth5AqUKoCtmLifGvmJ3mV65Si+KaHYPVkxS8d
	zNqnTlhoB+yyLpEcPcwvu5OfY7Xn/X7wUB7JsHwJLe5GZYRaom661q/kaIzkG828civD1DtxXzn
	qh1jnRpk9FbNM0LejTyqghpg==
X-Received: by 2002:a17:90b:55ce:b0:3ac:9a5e:9cde with SMTP id 98e67ed59e1d1-3ae897f390emr8325411a91.30.1793640009386;
        Mon, 02 Nov 2026 09:20:09 -0800 (PST)
X-Received: by 2002:a17:90b:55ce:b0:3ac:9a5e:9cde with SMTP id 98e67ed59e1d1-3ae897f390emr8325371a91.30.1793640008558;
        Mon, 02 Nov 2026 09:20:08 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb363a4c2fsm159495a12.1.2026.11.02.09.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:08 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/4] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
Date: Mon,  2 Nov 2026 09:19:58 -0800
Message-ID: <20261102172001.508440-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX8AH5KoJbLw0+
 L9hHZr3MkK13i5EaP05Pmk/tkcn/baoR8e+hojB3Sp0fLy2SEkQy6GPcnhCrKiHG67rAv3jf7Gg
 JuYCyMxE1oDJwweFlholK7Ls1NKK1Uvd5Vhpl3hfEy4aac/wj39yMlO8zL2zQtAc6PoNXjKiy+2
 keHqoo0TDP7HwZPWZfuq+W8dRDk8Cp+W1S0q2lwsv2ayMDOS5Vr6acs9uwcMJbVLl4BPsfI4zTq
 Kh9Bx3M4bqfqVM33roHn8pzuL1uDLQTWGeA1w/8KeiPhhWI5Z43upqbtr4xWUQq8De2k8W7VPGH
 hURvalnZeIaVeSeg43qo7axCgl+E3tBPfqzJRRT7UEoYA1VeTYNXvswj7QWdrJ/1Ts2ifVEXZMI
 1JpHy+otn+D71bfmVz+hiZzS/71dq3JpYxrDe6mcDKP7YIJmF3BIcf5LAfONxanGWPsK9Oso6xz
 QeDvZKD2JQyQB7FKQkQ==
X-Proofpoint-GUID: aaRTDH6LJJnAySoxwkLhVabp6G0Jcic9
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8c64a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5-JVGYL1QLZbPSRHqMAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX5E7lefCvDR+P
 zzjjRVSOdVXcg3UdwmFM9Gehs62ynT5nskAQ/9Qm1VGNZKJ9YtZ3FBA7y48a69n3v70gSnWkttv
 3B/AJ64J8YzWMY2JKsIFqxKXYB96KaE=
X-Proofpoint-ORIG-GUID: aaRTDH6LJJnAySoxwkLhVabp6G0Jcic9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020069

If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
Only the VM_BIND ioctl should be used for binding objects.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ff6cf39587c9..b558d07ed2b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,7 +272,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 	struct drm_exec *exec = &submit->exec;
 	int ret = 0;
 
-	drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_init(&submit->exec, flags, 0);
 	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
@@ -589,6 +589,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	if (msm_context_is_vmbind(ctx) && args->nr_bos)
+		return UERR(EINVAL, dev, "invalid nr_bos, must be zero for VM_BIND contexts");
+
 	queue = msm_submitqueue_get(ctx, args->queueid);
 	if (!queue)
 		return -ENOENT;
-- 
2.56.0

