Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815188;
	b=cadN4nOHYOlojBqIxd5sg1UePMqL84meycASFARCLyvyD5CIl7BZcpVnGmO/4jo2pm9y
	 8pm1DG3pJkGULfduHjb/KUjfvXp8/6qPaicRlHoCzLIZ4YOdhr4z9TLFBf4NmzAwfjui0
	 eSWi4yugl6Ofxuu/DRRN96raKej0RP0QdjIYUmWfeqUCCVUfy4vCg3Hgxo30F6BIVejVZ
	 dq+taIOc/c4GPUzMlphF4rJ7fPIPOLpk8zr/4I+B5IwIOpn2qmIDYorvRco5obEhHIgxG
	 PfZePo0Ool3RmpCUzCiRYOraqM9tLph2jhnlMqZWCZUXYH0wS4Od9LnWLUiwco166Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bJZszEO0AROxRXFKvPGmV2rnbIDeStcxgukOo5uOajw=;
	b=FpQPuWGwXhvCuN7Bt3q9DCxU+JcJGau3wkUKFlKsiSiSAJTmksyEWSHNnADUQjhDKTb8
	 kQFlbRQrS6SAsu0VNKLr3UBKoRKb3Xc+2W3kV7gjEWXyzvi+YDVV0G4CWVnZY2gjlraQD
	 BnwQcnIB092Dc8u9vtrWsb2gSfCDZRHsXQxiGwOOR9IPQcmax5hxry0ut0Z+JRDx9Sw5c
	 RHjPYvzzDj20kb/9UFH/4iQIyckcfTuAkrKRBFVmskJgbaj9w+44Ngl3aeUEslGgmQjsA
	 h3d3nuL2jFh4wOijJd/ZEVsaGlmu0UsY+Z2xmULZHI0Ppn6DzXMHz7uZka4BYsdbw0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S0PoMoIk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DInwBrZf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425C1607BC5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 17:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425C1607BC5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S0PoMoIk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DInwBrZf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj2kF1899319
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 17:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bJZszEO0ARO
	xRXFKvPGmV2rnbIDeStcxgukOo5uOajw=; b=S0PoMoIkilIeLfefd8qwuh3k1dD
	TNW2Y+o+/AKAvHfEvrBNHghpc+VvuhpwVpcu8D4c82kDQBFsRhYIAmaeZlAAcIDK
	uLzoDSCKDGnlHOX0nueZqJquKdaQVIP0XKejnJnbnRfMFWQur8g0Cl68atp8IpXN
	43cTAEI46Fg82Y4EaKU/Rnm42v0T8Epkhs1JkdHT/0/Q+CFeQt3XOWfECW4m4IqR
	8kiZAmBUcQOWxjzmPpL32SUIU9jnlDnN/Md01o1jbvbJKvKEXXN9CuDTbAhygNr8
	1bjoZFAc6mrtvkm2VmN9OXWt0K5OUaeKdZg8cxnSCwXDUFKL2xwaibDFasg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsgbf8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 17:59:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so977629a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815185; x=1794419985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJZszEO0AROxRXFKvPGmV2rnbIDeStcxgukOo5uOajw=;
        b=DInwBrZfC4dPeVw0RBs0g1pO1JIaa41sOnk87ItVTwiSLryFP4p5aJiBB+6EZC8Rov
         TFuxzzXw2HD3YKOysGXHlqWu/UIc2jhoVgKNmyLh7GWMkoBj7ngZxJlY6B5IFV4EMfGJ
         7Sh48Fd60zClHo7+tssS+oFS2RkwGH6nv8kq0dWgSpwGDM/HIDIofWoG9sXBvR4zSfT/
         LBM2mu9hcDA/AeEzyb9ga2MOWPShodMz3Z1moWdvXbK010asPRRjwCSvnc4Z5bajIxaL
         3/mBOSgxFXpGpksI7Mu6naiUeuZnWXIflskbnSSaxRYFs3c0jvG2RNoeS2Cdvpvot2Bg
         EbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815185; x=1794419985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJZszEO0AROxRXFKvPGmV2rnbIDeStcxgukOo5uOajw=;
        b=a/QWVI+nZHtZfOqNTawekq55lx8AnDiXww0obHpsAKimB0VM7spBDKWnotYDoOZM3z
         +YfOo0F3hbC4cSDzqULHPNweL6oHHtBLgHYz5UYzMrOIJTHYr/YNPZO50l62KFHY7kH6
         5pKSSal4uVu1BXmJlQkyg5AKypHbxzA/fkr4+gWfDBG7TeeunbkaX5iTRPLddbgGUVJX
         pYQNXi2m8OHMJl5iSgNkRqPc+72reK/Gu4a4GxG7lxgpS1c8f2xIro2LS3x7ysrLxTjn
         R0nZ9tyrn3ewFJY61AIP73z21Fgnow0D2ZMWzlPHt1my25nll4OX/2ZOvg1zb7stEFlv
         aeSw==
X-Gm-Message-State: APuU4Z93I8t1rjRfeHu6yEdkY7e+5bCq6I1QJfEWYsYxKGW6AlHlDLFJ
	hfToJBh3fComsylST4G76WPqKXm2yoLJvY9M31xb1jU68kIx4kIJiPigYxJfwNTQoa9RH5imEjR
	QI2+ucfLOTUxowg7irg3CtMGFEpWMHgFyTlcyAhVQQxjd0m/4pL4zOUSOX3fnEVJ9teR4
X-Gm-Gg: AYBFou2KdauUcCguTdeFnq9b+a2Y1wupemN9lyVYWmv+0P3wLKT8c1pvFUJZJ0NGg3i
	Vd0ncug2Ls5QN1oh7FO0IWGfMog5CAh/knW1IIcr48Lc14UGTKp28/lNdDWmIRrZnP+ZgOzzZ77
	kad2bbjdkhWa/Uumi4UV05qotdPKNu1EQWn7bqkLHzaCTTJqQ/tKvCYn1Pyrq197vcU5RpPoLrr
	tBQ2IuZGKeEOhypWN5JeyPRnxnfPL6spziUYZcV4/G+crj/2XtidVi2VxKTOpbJIxmvnzkVo8u6
	NQ2sPxJrgLv6Nbk1lShkCzldayxZZxZx3Nd8k6hxm8c2ncINQ4HBGIi7JmUceKMu+byUdmk9kil
	tzZ4mURfUhSrvrH+VhdOkU3TbClnRB+X/z7RaTn5PO5g2QU/cPcrr9VKAFTWIihMrcQ0dK+ONZu
	cciw+mWv4SSgHf4r2gVgy8WD/z/IG2fXmBl6gVNYTj0jeUTt+1mcwXwVm15l8=
X-Received: by 2002:a17:90b:52c6:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae897ccab8mr16723796a91.10.1793815184930;
        Wed, 04 Nov 2026 09:59:44 -0800 (PST)
X-Received: by 2002:a17:90b:52c6:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae897ccab8mr16723775a91.10.1793815184450;
        Wed, 04 Nov 2026 09:59:44 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b319f2c9sm41733a91.10.2026.11.04.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:44 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 6/6] drm/msm: Inhibit IFPC for state snapshot
Date: Wed,  4 Nov 2026 09:59:26 -0800
Message-ID: <20261104175931.28475-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb7292 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -SC847KB4v2oPEgYZioL7M9Uto5NPYz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXxF4xOmEET8A4
 /M8X90ZyJwKIsUzKHpiOlsItZCwoUmD/+Z3L/g1cSiIIRd8FndvS65iRdQEJgpilSVTU4bqdM2G
 VnlTwn3a2zsudOLHBAgaRe3Tfu7WKzWEYjQPmjA+WRJVPveeNek32vrmW96EuFyFhn3mGQus8RJ
 kHQe+2U3W0GPk6FuQLaFi+XDz9B4PGCV73G4QgfJzjOAONMBv3OkWXQ3IUt27fgeKg44jUchbVD
 CdXBuGNfWA4FEZn5twvk7Lki8h4Q99L6nK4l8GeoHcp3aSGseS5pDV/p/edrk2kU5UJnuw7IgCy
 lBpd0CD05oUHWM0wlGRJY0dgUV+8xlWmCqjt1Vw1TBnoCue5J97i2Y7o+rxczXkTcRYcrKQEeV4
 1iQVMeIHeXz02UMx6/0cUsxxJL26U6OZh64973qgART+GFHyS9L4mjMgpK/T2bfk13eIhEqA9dI
 yLZxBK1xCx+uesOL4/g==
X-Proofpoint-GUID: -SC847KB4v2oPEgYZioL7M9Uto5NPYz7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXyDazTA7s80Rh
 rGZpdK4u/bRHTj7zYZ8EP5fldUfxaaPoSyg/ms2PiKwxkBG6OQqfOwYr/z0t5CyyDTej+OqIsz6
 pb+pRKtPHXNtH8nNtgOIuzI5Ut91msA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040071

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 136029025b80..b993a556a816 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -83,6 +83,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 		scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
 			msm_gpu_hw_init(gpu);
+			guard(ifpc_disable)(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
 		}
 	}
-- 
2.56.0

