Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555222;
	b=nKQAUIVFjzE+rl+zd20XioAZgK9vEzefVqs1GbNXcpTBez35wudayfSrPdmYqMgNsUHk
	 9BODvAUNebIqyw5T9yPrXsjKQJNARDW9RDyCan31eGJCDf4RNVJyor998ze6F8cncBl75
	 7zzzempEIYrO9CIXaPeZquJC+s5WbqIrXseXqjTEtO52qikkQuQk7sfKAxD5zbzyP8A/6
	 0uEXBW4OHGcNnUmGHb6Dq89YffmN4mJAqznmLqGDST6VR5Bzrrej7UR/RQzI5wQRfeXsy
	 mpUxo6vbU0MZNGiLxBAdqUVmQ1Rmna+mSr9uJf0kAzTXwvS3SNBEnnZV9D7+QYttK/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
	b=C0h98rgnhSADHTrfn7TBfQ625b1TVn+/AL7T9mbgxQPxozR4XrRI2dAuDdH2DNbAbqcb
	 rrpxRPYsDwkGNG2WR5iIOKrx/flXqVXIzo9RyxaOO10IQLqwis2T6gBy1FtFeBc/l8uLw
	 D1aoVUGo3PZhhopxCDTDp9GRW+Fop6xq/do/7FfYANrs5xceRjYGyWvjESBzukrB2OWQU
	 ibssR/pLP1eS8WKk5KTTyJZpzcYZc1+bfZJr/5TfN4LNdJ7lb7WOsKJiG5XqHm67dn+Gx
	 zqWOhiB0fJFvt+YJihrShxk4Z4iYpaDsY+wpycYfyzta84JWqn+UsPc8VBG73oGCltA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKPtJDu8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbUuqmFX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AB606A33A
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 17:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0AB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKPtJDu8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbUuqmFX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQS7K889007
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 17:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mvo7MCBtKan
	n098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=; b=XKPtJDu8wpATNUaHOSrcLWKHRrX
	GG9UFCnkz+yZgT4HBYLpojmQUl3SaVFwbTsH/SXX4W18qi+4YnYgbIIEOlEiLpjU
	LbtwPlkg/etINSgUgklmHMepSBlIlTjyFMADs8NAnSdMkElLcnljWzaBM1xmS4kN
	MF4yY82vsZfAjNXfLlDDIDvjc/OPSF+vtwkVk6IGleDw7bAWwRWc95ckx0hpIzYL
	4R2ZbsB4m4SY1FAY/MvlVXIVvvp2voWMqAere053sIpcwPcpENLZALsQHvCOBPi1
	CiG1mBQrSby6qFREvBJ1bYez0AQGjNAqJ5Xw6TnRRfywxj0DkYmw1VAbnpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ekqkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 17:47:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so3488991a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555220; x=1794160020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
        b=XbUuqmFX/XeOxTYATqLKIpr/jf/FW9/VCRxewSTQjJLWZy7N+HQONF3nbnQvPPhvZK
         m5etDP4FvhTGdsOyt5dVc2RRcgY81hcW6TV0xwzLKmF1CMisSz02NHIpPMrCBD2tIHGx
         hQ7CV2ykT5nbUhTP5pAX3cTv96edrGJpe8s2QqPOn1syPA6gxtaFPyq6RasQ1fGSDyqz
         zml7dRN5YHxiHuJTTsKacPd8JxFjBtvl5uNB2lCg8FNQefbpW+9SjwTzV3iKv4AsIVHc
         O5oXfEF43youMSkeLicy2ZH7jETH1MBU5Viih8HTEBQAoF9Z3Awz3J+5xrdTf7PuippW
         0xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555220; x=1794160020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
        b=ke2Rxr4y2j3rMFk/zqfPsrl7DWoOfwqV+iLuSPqliYR/ou3ReMS+xtHg0mfIatCn0R
         cPKhKfrRP+uyq6P0KuXpA4SMO4Xklch3YbRcGjqXyeYr+Px80j5gf26SOzF2GznfINa6
         vhLqZRmab4rt34+ZQr0H9Rt78jvStu8F2WbUZHoJt2p6buskq7PkzxAeoAW5p91thT2J
         t8JqJDe+C6m9MDxCjp+m/9N5SKLtA78C8XVOTmqi4n51+3alYJ/Ellm2UTObQke0ie8R
         ijR3FV5QDxCmMMk84e6yp/GnvG1kqU6l9xB0hFrHGAXYDD2g9zOOHTynzOzYSIH9cDiR
         eu4g==
X-Gm-Message-State: APuU4Z8xgqXfzbFJMUqKwDUPd+mzptzgtuF/HxbcvX7pYNz2CB+AUAaV
	RXv82gsgTvzhIwm8xtvAwsb9b46lJm/5nX8cuzmAueoQTJnSt1FXy5TMFBe+0BOkGXlzU/WvDb5
	iH4x85iopEij9ZtsEt9ry65RFBSOMIATkeWUpNobwKkai8sibIXM2nqJy6fkj1CprpEqe
X-Gm-Gg: AYBFou2UNGiVkZi6uIAno/n5u+PuS0dDabFihQIOsQZS2tnF0eQypfX6EVIywfyOZ08
	SmJiBUAd7KLMacKumPvYzmbGQwvXMuTMOTAnO6YpDP3cqEP6qq6pNUW/tlqHSwHRaIQSlTBcXB/
	vKhVC89YUJp3kFlBIPYKS0OKrydD4PcfSyczOhEvuXzLmGETtlsQgNi+jbRxnFOOrd5gNFj8QFK
	493x2Is/U/xTfNkGBjOCrgyLcJ8SfY4ytMxwqIScx92ql+/QEdw/2F6fL7lw3HxB9W1zWMzRmB+
	NZvQeaYUmpNv+IGWIwWAhmJrz9woxPVa70AZbRI1pZMEi9OKgTX0luDseHR0DhRIw5ZkpyUoQ1N
	A8MsKCWkUrWk3nIQco78VHvs1wkcu+v646IxB/CtoF2TmFg+0XJOIK9UN/1gFOPg8bYKxthzRE1
	6rYyDD5K4Sw6YMMFAb1chAUw==
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr7095226a91.67.1793555220374;
        Sun, 01 Nov 2026 09:47:00 -0800 (PST)
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr7095205a91.67.1793555219884;
        Sun, 01 Nov 2026 09:46:59 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm10839408a91.2.2026.11.01.09.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:59 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] drm/msm: Inhibit IFPC for state snapshot
Date: Sun,  1 Nov 2026 09:46:28 -0800
Message-ID: <20261101174631.23637-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX/VvHg8uB5T2g
 xu4EdgauEK0HsJqTicZ0zAC6RPvH3yG71l92Zpwz/aVUfiESdlNFfnT8DoLvdPvJZh0ZOcaovhc
 xR9NkqX5yvpws7j+zKwSuM/phdp0ch53CjeDsc+yIe9+XgE7JT/jBJJRi9ON5Msg1ho4mnFD2YR
 8K984f8OIMel4jQqwoLjMHpKQGWqG9dRlVRcSMLey+O2Cu94wc4/NvvtOYw3MK7+rYZkMBKq5cB
 SzB+WXKbiOmz8EsYHTSuncF+KES8IeaGKN9PHzZjdjIN0xUrgyf0KHx9nXxW4KVJLjaEwpnOsqd
 z95NOrro6cRjpnnLQeFqIgtJlnlkNp5mCjJ9GjbAx1l4c3/YKJhH+du/3CkfgAKFti2up3ucaEj
 2TIEDRXjOYWuF1l9jyiUIbUMFx699Ev7HP/z1HvL1H1UIC3XZWK5fs6Eq2NdIZkxRWNFpBZkyz+
 +vIZoZ9k47r0LCUmllw==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae77b15 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jgQnFmZX3A3noQDnNKkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: jmTkqXqx9wa0GfH2nNZT9_WCpUQNOoIF
X-Proofpoint-GUID: jmTkqXqx9wa0GfH2nNZT9_WCpUQNOoIF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX+RfdAvEt8mIL
 5KsEdRTrHKMHswOP2G+dhPEsCNj+5sEsZxpvY1m1ZtYLqfY4YXR/Vg92f5ZpGWiYnQjjBkxSPeQ
 3gA65QrdQsTLHDzspvGs5ryY+2dEBxA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index b0ddc02f67b5..224401b4ab12 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		guard(ifpc_disable)(gpu);
+
 		scoped_cond_guard (mutex_intr, return PTR_ERR(scope.lock), &gpu->lock) {
 			msm_gpu_hw_init(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
-- 
2.56.0

