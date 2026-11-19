Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076790;
	b=2o5Pg8I6gchk0MqL/H1DW4Dd1wCvb6zaCq17CiHm4JV9CfmDHkEpTPn+kDAY4rDd7pWa
	 MtUIVMaikbFiEfOO0OgtIetuJrpbk+IDyLS3sT7xSnEy1WVUEw87ul02MmncA4YtL5pRg
	 7tkihDIPbY4NR3m8kCcz2ONPjtD7sbbLtU92MBPeLhPN9iHPu7YCbSKjWiZlL8KL+2Pli
	 ujk0sdazKHhGFXMzTZtDtTyY6NLUU1XBh7TlbA/MvJdd79cucYTfiGGKj3vUPYH9JcfL1
	 2516HMRFdATNZ0x31AatRJVnyuBtXupErZaBQtRp+kge/VlCYs/mTrkYpWzmRqs6X/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pPO9UzZPVsaDzgbO+XFBnwFaiT4fUA4lzXiiqyQTXJE=;
	b=JFUO3JY0HsqAZCM6GVD8IziG20+9nDzdFxAk+DbJ6TstEPCHFq20T5dOmTx+eFAMCKxn
	 B2PQR+JKntcyvtAUkuGVMcCoG2uImLqgwDQVtSjSXn2hWvm0i7gzyfY4/yMbkkL7mbn3+
	 xM9BLp4og0ZtT7Z+OKzjS89zJ7em6HGxALu8cgStRJg4BP9Q/B8SN+9qhVhny5NVixPa4
	 p6+TDA+RQrTKt2V/x6ecsxvhF3xdE/XH88r+KYpX71e1pvs/Yvp5GdaqXatVg8nOtRL8m
	 bBrorvhjJsSjXdU+Pib8hhliSpLcnc22xdAJFRu2D4LMN2kJcT9r1OqSNlxYWpAQCKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcTMoWPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UM3vpBd/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0CF606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0CF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcTMoWPh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UM3vpBd/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v6Th2030625
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPO9UzZPVsaDzgbO+XFBnwFaiT4fUA4lzXiiqyQTXJE=; b=RcTMoWPhevrzXQ2A
	HZi98H71JvUb5Fn73XVIjDhDKkGeIZKYGFFoz4d0i/ROiSXYOQ1bdRPALv8gSLqM
	gR3u4YmHAX2RPVPItL4hSRE0q1DVlpEK2AIeDPhcJYAdsf86yURk0j/uUfQHkNP1
	pEZGgmrRhoC6Ut6Q4a4q6vgB9pvYJdrPJ3Gc0DR59nYPlsAZY6joME3eRPTsIGxK
	GRgJuOO0fNV15HrY1VSoX91GC0ZUw8wL5olc282r6nWmzC35HQqhsJdztBY88ixI
	/S8Uh2EGThZ+KX5FozGYwAlRDt/dCj+DMRzVv/DEcmnGpdfm2gr+HX0TGe6xfTI2
	0YgJ7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kuey7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so144670985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076788; x=1795681588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPO9UzZPVsaDzgbO+XFBnwFaiT4fUA4lzXiiqyQTXJE=;
        b=UM3vpBd/vRZvDyjD+ctFDMPHfma9QEg80OKqEl3T69GqiN00RzJUmqLvlAtoHIM+KQ
         siLIi+ol1JlTM173lPR6c67MGznvsXdhYyMIgEdolLCA+BQfWbFu2h0i/rgzkqVSzTDl
         E/nH09DkHJD8ry0ae18zM6omajORpIcDMxqp2X1SSuhBuf5tMdihkA3dBGzhM9T3cxTG
         rqrAuu/coFNuUx+7EN91BovRYWi7BNfwybYhnC8pDOW4TFBENmQmur/Ge2tKG1LpL/O2
         82nNyjz29tOgZwq3sLAyO7JT/NcxGV9q9X5vx2ygZmqEYVGkGfXhdq/4b88I9Ekf+InG
         v+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076788; x=1795681588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPO9UzZPVsaDzgbO+XFBnwFaiT4fUA4lzXiiqyQTXJE=;
        b=jscAvUSutofmypxhSEC5TOkkgBwsTkiDL2tKtJ8MnSB9miiVZU2wRO98VF4aYuvZ+D
         KCEVnO9sdRraKvrctCMJAIa6ggwZmaDIHYjJzY9LLar6k17prII82D3FaSLOzn2xKNDC
         8M1twHoZdH78dquHxQ5qVyatmtaDcF5t5xZBumDaxBhu9ANxvFV1LmUHReadPQe2UFhS
         uKBopC78AU5jrEJmfPa+RkOg5VBjXHSsqg31BIcTPbc6Db8D6e4G6ZB5I9olZdp59JOl
         zCrLPrPDlZeMht4vXsPgaCiF1VNn7CHm07DVSGhELYmzzpRpj6iQPLDPhTL/x78Gfjni
         +Zjg==
X-Gm-Message-State: APuU4Z+Zws/a5Wj9DVpea4vBxuH3+mXlRCCnwULar0DUmnAem/7RGrVC
	GqTcE0DS/CbQTazQbP1whgecYMU2EPyNLJ9wv2k0dTd48sl8WsYWal2cjucRLMWwL64I7jlsNaI
	FDS2vhWGYVTEbpn6zRL6F7HImF1p8E4NpEti33lsUiziWu5SFOCPnoW9wEtSHTW+0W4Iw
X-Gm-Gg: AYBFou0dORd8xYZ9kqZBTV+6r1a9KWMvyVn0b8o6bL51p2JQGgW9uzTXerolQWo3wYa
	/4KVjzXPSimxL5zkThZ5Af8BWkwSeq2pH4KcHUAAtsj3BRWRhhfEKkA8mKH2JXLr0OW0r7I+lkQ
	paCbl6XhKQmwE8xFyrDGaunVtwwG1e9EYsWaSsOB51Hxrplm7yV2Auxw+kALz/lBTSJIcYGmoiK
	vr/p3gsHJjVU2wCHUzzzQndQg5pPXW+Kh+SMPGJNHy0CCpS+otWv6ibISi4zK9N9PhlBMwlYBOB
	6g2d1v5c8fu+3MV1S4m0yiyJ6FXmjgeE5273LUa9XFhExF7GMAFoq/+SJkG9dChBUz8UeuVghl9
	1wFUU376uENEZeh+X4rUY5uyQKfMjvzQRgUlFoYBZcqT0o01X73x6GVZaqTi3Eb7aLj7SC5J0X0
	K0SKJDJ6YR7WlUnabNErumBhHxMPpoEfpfxzRp
X-Received: by 2002:a05:620a:1714:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-949b34d2748mr63529485a.31.1795076787961;
        Thu, 19 Nov 2026 00:26:27 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-949b34d2748mr63527285a.31.1795076787363;
        Thu, 19 Nov 2026 00:26:27 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:26 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:25 +0800
Subject: [PATCH v9 23/29] drm/msm/dp: mark the SST bridge disconnected when
 mst is active
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-msm-dp-mst-v9-23-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1111;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Ky+XcbutFyz/cXz6z0Zw3/ezOmjUUoQaMdosLPDLKBs=;
 b=nP/fS22rtyeubTiHMyxRIV97lTbda48vdtxjL7JIoGUxRD2Ku+jhLfwSeN76QcaFlfjcYF6VW
 4woXV4WT9JlAnlZeo/FSZjsjB8nFzoAoph2ghO4kf9S+utvW+kTHxcN
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX8dqzgdGPTxA5
 5JC3JyBoqwE8G474N4uPc2WgfEG9/oSnOw8VDOeVj3T9B7kIyebzLwvvQhZSIS70OIFYCjf6gP1
 Lt+PStHQCS1KPRyRp4yYfBR8ELL49TQeMYUX0akK7NF6PZRCbJlms8nKtw+4P9Fpz769m95psn/
 72ddx8enZWvINbMla5mg5nOJGxhsqPFZLasjtUpyPvenYgWC2GO+qBTYVyhTHxnetGr/DKSQmCa
 s4OIYjy6LJH1bQeY4RwIfJc0v95t6wHS8QQ+lWXJdfC9vVHrgrgIMO+TPWsnCsI7/SDHybmbs5M
 5LIS0UpONu8amkkkllMoyXMSHMQeyDap5T6zxCpLYJw72TuJp0Jtr6agk4rz58C4igUw15MAn4v
 H4I9WOULdYrglCuxy1QRlyQnNzdY0abGN9uFQ1FXfzLGOUto/D9rsktoJ3JZ2et0GOzRsRDKI/s
 MxT9AfvISz9G6dYIwKQ==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afeb2b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX4Gl5SBYq0gvN
 rWm6Ca1bQmBf7iK6COJ2+Ll/wluV5gfuB0sHFsxsSYF2LJdwLPjUXs3hEusVst3avGLOjRNd7BQ
 5YMQadSZCYoN4o4uNAsaWsstSDpvnRg=
X-Proofpoint-ORIG-GUID: jcM-DxoDCgC_Ii2oONwfX1hyXEnYzMzK
X-Proofpoint-GUID: jcM-DxoDCgC_Ii2oONwfX1hyXEnYzMzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. Skip detection for the
SST bridge when MST is active, matching the behavior of other DP MST
implementations.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 75eaf739b86f..17487a7900d0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -976,7 +976,11 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (dp->mst_active)
+		return status;
+
 	guard(mutex)(&priv->plugged_lock);
+
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.43.0

