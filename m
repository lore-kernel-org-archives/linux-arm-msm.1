Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED033955E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321340; cv=none; b=s7rXhigLwFLhW7YqXqgn45hjQMuAj7XS4lS4x3ymcFzizdPybF6/KKY1EygwyBKM8wO7YCOiSdxWpZGlNIrBPmHT52PerVppDiMSX9guep9pskSaxqHvEY8k7XY3u6sLVQ2chEVDG/WZofrV5pZRYrJA72nUCCepk32UFKl0rZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321340; c=relaxed/simple;
	bh=8PFfTxM13ahnT0/lEem0uzt2tuNNGVbRz+lfpQOxU8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O009asQ8DXZOSPR0TSLq/aQ09VnDTbik7w69bnhc8R7UnnGlfrMSiJNwZlqJH1Iz1zktlpRvYu8loorQ4YTOYjOfdRdMSwZKuNuExI62WsqnCBBSKS1mU12sZc8UB9ScpV3uKe+P27LclvqLXhQuKIlR58fNY72XnjK4Qcj5qqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLaCAxa0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWYbGA4o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLaCAxa0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWYbGA4o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtnQs2887425
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nr8Y2kLGOAQ
	fP+6If92MLZogonNmCXdm3m2GqTYBhjE=; b=gLaCAxa0DW+ibkaCzTzroerrr0H
	Ymr6Rx48d/TcAGbSzUXU5xLAyTnM21jrvrRk3fWEzG5QVbuS0TlqAckcDBSFl9AS
	Zrh9uDnACNja0Z6NHwGg66o9B2/0IgVc7iTbTR8h3j2Tw6uzEbyu8NnZvnZAuKGF
	g9SFi/QWljv1QFYV3BtCipl0aDnIBFgTHYGs830wO+5N7n2KgMXXuzkbx414O0Av
	+0qT7ytiKswd96W+C2erXJ0m3OYX2MS3yCzXKDiZdobSQKoG5VeMglxl237U1hxp
	xbEgp8sk578SIJlETcDbWF48/m77wrrg1Pwl+twbqMbftIQtLGf50A9zRHg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfjn5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so169309335ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321337; x=1784926137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nr8Y2kLGOAQfP+6If92MLZogonNmCXdm3m2GqTYBhjE=;
        b=cWYbGA4oFINfuLaiBhKqpSxFaySMtUgGqATnfQu3YCOQn86CDrUamxwpKxHrqsZ7id
         ujafwHqsJR/WtwpB5VAii9Ibnz7rs+Y17XlcNXkRa58BpZdIaFedKHFz2TWrVivvO8uh
         kqCbpTsKP9eQSnZ4MmDv+aPhzvvEdvd8cntHSN5EWchEFuXBg+wIujgWLFVRMSKlVGGI
         8TLmpRPi7neDwfPdtCfFKgGDCddHOfSCDhqUjzDippMhwaVyz2Utle2zyaj1bCP+dkfJ
         pi8U/rHDYRdk1S8eqmaikAdDql4S+/vX06o6oiHXbvNHj6m9XpzEMMoDE4yLWY9rroep
         4TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321337; x=1784926137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nr8Y2kLGOAQfP+6If92MLZogonNmCXdm3m2GqTYBhjE=;
        b=RCdXGz4iZ4NbhgVbRfEQJzENi0mgQWJebiKD87ZV+8SJ1VqWHfDacVvLJ7Bd1RrKWb
         4CI4YMW86KNZE9+/z79vk9LZ52kQeHkpqxVIkIF5d+LX986T/ZmL3+KTNZ10IxOKICNG
         9QPLHdIELC3WLD7kCplN+jh3MlJPttnQZjqKPcPW3r0oaSBjmonZ+5qZC8pcZXqhd1PT
         5w43KRHxGeTQHfcM46+q6Y/nMh3Q0nYpIzQ2lavfYCCYr9aGlu/zLirLh6WhCGyRKJdw
         3ydH474cPXW8DCdBT/qAUc7/VH0ORql4o3Yu8Q9cOAaqYQ32bA8FWE1y+QATtwBIhuib
         dAWw==
X-Gm-Message-State: AOJu0YxCsSWWKz6+l8D3uA5WNIxxtr2/A59+YKq1JKvtRy3OQtxLbWcx
	6RH6HBsCWpxSDhhOKxo4E5bNGZMJQASYIZsKsXtGnCBY4NRxjTT4IQf7MmfXNDTChhg6Af7JrdH
	8sFWGmvrKXd5Ue+HsU7CrRznPfTz6wlvDVYbk3A4QJIOj+R/hQ7AU9hNoTrzbJpDsMWGX
X-Gm-Gg: AfdE7cllIcsjGzY2hPLrOwtckp63FQslVNqo7OgmvcDFH+ECMFqMw++5bARoGQ8uGBg
	yOS1ZcC1oqTpdpRBb+k34foZ1kofFY4g+4bsMeQT7dWVmU7vQs+uew31t6J+s6rQw+K0xspZuTc
	PlRb+T4rfYt3yVXn3eTzYAZsCtBawPJaulN3vHoJ58XyZ7JvlP3wbBJFjZ8RGzWqvluCFRatIpV
	T3CfwH8pg5g95iIZHaZ4Z1A8E9fynPYr1Tr34ameTa1i14uBbaj9w8DPbeJ5EXHlMF52IOEb43l
	S25V8HjtDRQBWlTLsGmeZN+QVMfPlG022B0PIn8glFpj0CEWu25TOeJPaChQaOCoctw+6QCYZQ5
	ioCboDQyLFOPtbJxyr4guXRTEeULWL8l9QgeGm+edTtvegFY=
X-Received: by 2002:a17:902:ce84:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2cf3484be47mr48915125ad.8.1784321336979;
        Fri, 17 Jul 2026 13:48:56 -0700 (PDT)
X-Received: by 2002:a17:902:ce84:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2cf3484be47mr48914865ad.8.1784321336552;
        Fri, 17 Jul 2026 13:48:56 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34729df7sm17187575ad.63.2026.07.17.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:48:56 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 05/16] drm/msm: Move nr_cmds initialization
Date: Fri, 17 Jul 2026 13:48:21 -0700
Message-ID: <20260717204841.26120-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX9BC8qq39IyFR
 cFD3BAx2weUi0JprV8Ul/QSczqWpn5GDs9jHHg2b6TYQrxT5XfN8HJOiSky8SsbDJcCIvWvBMlk
 vWyv51Xuan+g50Jyr4Ch1+ZNz0F9r3e2WkBf15dkTPW6OwvF1HY///7J7jM8e90051EHwKCbK8M
 CkX2GREhgg0QtEtLperiZZu9+hvCkhfnHYgKw3T1hc7+nd7lLQK+OF8ZQdGTqYlzI6B6GNTXlWM
 yHSK2yfkx1ASs9/TG6z+/I207w4apk22nqYypjWRLzp764YNoi/rvuk2Fkw4QI5rin06PtyGUso
 eOfK3fJ7enXbSweBQDxe9MxENlqGznttssI4CrpUqR7xQ3o94lXbTHyG/KrBTJUT3I8yTF4Z5cz
 K/iw6LEKGynePZdBt6xSyDmA44Mj6t91Dw2D9daSg1wG2uYJAVd/j36HM9HXUhjpFRyMvliRpiM
 ilNRddUVBcI4hXsqiBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX2LcX5vXdrhQo
 mDP0HZCW8dj+AAcoWXr9R9eB/mXcJoCaQNhoWjbgSNcCWllUXoz+acon8BRwrdfDSAqzrDTLOm3
 tA3ceRoGE+w6+XII4LbAGHYSw9K0zC4=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a953a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=F5a-vUUdUzRQ_IYq5r4A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5hOnuBX1OWa-QWhuHkG9tdtRCtvFVDgm
X-Proofpoint-ORIG-GUID: 5hOnuBX1OWa-QWhuHkG9tdtRCtvFVDgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

Previously if we entered an error path between these two points, we
could leak the relocs tables due to submit->nr_cmds still being zero.

In practice, relocs are disallowed on a6xx+, and non-ancient userspace
will not use relocs on earlier gens unless running on an ancient kernel.
But userspace could use this to trigger a memory leak.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3c6bc90c3d48..aa48ea4e7f58 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -260,6 +260,9 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 			ret = -ENOMEM;
 			goto out;
 		}
+
+		submit->nr_cmds = i + 1;
+
 		ret = copy_from_user(submit->cmd[i].relocs, userptr, sz);
 		if (ret) {
 			ret = -EFAULT;
@@ -719,8 +722,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	submit->nr_cmds = args->nr_cmds;
-
 	idr_preload(GFP_KERNEL);
 
 	spin_lock(&queue->idr_lock);
-- 
2.55.0

