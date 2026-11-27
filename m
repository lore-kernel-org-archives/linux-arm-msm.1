Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808707;
	b=E/DPxN242aLd+T6dbdEr4CFVgsbjo72/VCkg0n/+w1n77R5xODA0QDO3c9oDHSlnELNF
	 fe4WW9hNGzWLxacKAU5V9Lw5vjqNQV5OySZlYvG8e2DRB72sMEbWPfwS/NAToy5zJtJcK
	 lO6zJ3qgMjRkqUcYPcnzf+likFbrbnEQdialrhoRvViabNqLOcODyn5u6HZGqggl9W7Mn
	 9oQQfvhqPnaE7gytR3PufFuUpfprhyXFez+4cgvKByO8yQa3pCIHzNOGId6IrsivqZAcd
	 qotseEiZ1aQa7c504u+UmlwmVxIEVu2apw61TTeCszvFm+Tz7T1qYUGehBYrBxXI3PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808707;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ekADTNsGBXddQN7XdChV33/pXH1c+6xXo7T+C+WpM8s=;
	b=nVtEYj1CbEVfRAaWiIMaeTGGhmhOo7AzxwgVmovDIt/Dg5Rf8HF1bk9eOXFbMTC2BK0d
	 vclcdWtOxKlKi/N2BcpHUrON55+c/PEjxsA13xu7ucW20LThtgRs56tXM3LoACuY3mh2d
	 Siy+APFk9fGO6tOWmboN8oX6jnOt70MpNV6fC1nvk5B1QClGlEgH7DixExE9WeYvHSiOE
	 5yB/RVJlepFzVkOqyMEZrW2rxR085DJIo3gEqTVPNH4vTcHe00ffbzBDXCyv/vHIa2LWI
	 UTSAvNfIKjrqnTae34E279N25L1xQ7QMDCcq1hm7HrJH751DG5fmdF5McsOBhGrEX3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFUcnRwx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpEIlGG6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD9606A33D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BD9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFUcnRwx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpEIlGG6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJBT083134892
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekADTNsGBXddQN7XdChV33/pXH1c+6xXo7T+C+WpM8s=; b=jFUcnRwxj3UDWVp2
	cYiUDO4PyRw9CsG8xYDDvpUA98ZBPcVDYO0gzQUBsgo5c34qKeE7r6Sp1W5Yb6SM
	nFgCOI7YAP+C8EbEqkbarcxO6ysdqOz91MbMk2K2Ao0rwqPO5l3TRzWK0xJx0j+g
	TjGGX/2ihYW8A8XF33YhSbeA55U/lExbsuV9yMyGKbBTc12a6osf4d4LVBy2X0N2
	WD/EqacNx+YW5q4oA+YffhcOB0tLKNTvt9UtJAukkxARAc9XdSq79mbsRN0gQRoG
	ZkBvTCzUY6j4b7s0yykiSFc6ywM1jV18BNt+d7K9inVjBj3vkh4d7F/gd5oo0wHF
	R9hEPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gatru8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210a12765eso123938466d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808705; x=1796413505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekADTNsGBXddQN7XdChV33/pXH1c+6xXo7T+C+WpM8s=;
        b=QpEIlGG6hH4rUel/nsCXi0GrjrTCPfQ1vGpAbLYYpVkzep1CYnOnOGmRSpSQexpbRS
         aoiM4Q+2cBzJ1m1HfgHrnOJk1fbXqI6ZAXE8Qh58Bu+JyxHifpPvZIOzpi4gDmr/kYdg
         MVHPatbVcMc0GGet+lLhDQtf/sXugBRX8Mok93pnWcQhz8I/4AGUp8odQL4dEy/lYuHD
         13tbXM3fEBvyhEtO488Jk/bsg+hizzA8fK7T9WUm7kK2EGtogPgvay4j3u0/kuPb/ix/
         jFUZpv87WbLxc8R9mK+GtjJULi0VGHbKGsl0kjkRuoB404g9DruecRqo8qtfDMNXIO4P
         IAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808705; x=1796413505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekADTNsGBXddQN7XdChV33/pXH1c+6xXo7T+C+WpM8s=;
        b=2Q3siap9CuOmuCg3NO4gJ0sGI9oJi6Ql6Wcxu5Cw81W2d/4ZEo90EabGQUkYta27vz
         DsE4EjpdEY9NgH+M4C8cF0TW3ssetcCU0/RPF1jCvJfCbarZckquALHOE8ZXfVsutgwR
         ovaS4J46Fd4V7hdtCzADEDBUpvH/hWYJQJP+D+AjwsKNuwherr/WL6tAyL5vKYWysD86
         Q0i2hduexyvxGtDX/0o5umVfQXODy2JW9RQRZkdD/KRdsX1DCWKIryl771g29ro3CCTq
         o4ZOvHO8/qrnHEZpdFGwRkBeqIG3Lm1pDvar7GBDSt5xgzjJZe2Y3+jym++q6jgzDKlU
         gTJg==
X-Gm-Message-State: APuU4Z8JMuWchLjMyJdusepGPaDDMxaNifkAY9tgPtEhOLlgckv8KnAW
	EFlX640WbsQPrt/wuVw1c+CWFDcRCurt3XGaAGel6pTq6Pc1t065FKM8rEdRZFS+O44/pBQ9z1/
	6jFwxVfiyxUX2+7L/NizfpZ0gD1azQ9CCnnZeXqHvKQVXIGv9g6fg58yQtYHDDG5J+JvZ
X-Gm-Gg: AZFdTZfJLdMMMrXNkwltbpAlcf43lJweA77g9630ofjzHo529AeXBni2wmX96HldqaX
	SYOPQpZFPmQnCa8t1fJayLYtIwDz48P7Munraw8WlNlRTS4IgjSzfiztdxp3mSPBs5J2yeCWm5q
	Py24ZAoVricuPdzaQMvVu+W+H3x3qw2cJ3pFBoPPD8xk5/rNLWkyWFZl3zZzLlow1w08k09duC2
	pn8bt9e/IwxFoKIBW/aYmk6vi2rkOkIgz825xZDeMVP+QrXA2nHq/G+fVxL7PFFOuO9GzbmC0Gq
	DhEDSkcEhTZzKm4Ug3enumElvgONF/7gGPOR+4FdxmgWh6p479gdnqO2rwefR086j//TW3canxT
	xF3UxssceWRnkDyi6m2MQEQD7Plv2EybpDjM+fR/V8BEgS3ACEvZ5pCXIxM73Rt97xgIOKsBWju
	OQZ4VPKOhP3M6VzmOW8SOcp+ZdskZ4JlBX98Cte3FiYfgVcwNoLHVJr38lGTUe9g==
X-Received: by 2002:a05:620a:2856:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-949bab28427mr4818614185a.65.1795808704728;
        Fri, 27 Nov 2026 11:45:04 -0800 (PST)
X-Received: by 2002:a05:620a:2856:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-949bab28427mr4818609885a.65.1795808704301;
        Fri, 27 Nov 2026 11:45:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:20 +0200
Subject: [PATCH v4 07/14] drm/msm/mdp5: unwind a failed mdp5_kms_init()
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-7-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TwRmZcwZxmtcoSpUxQRG0/tQN2vHRVpxkXVxOYQdep8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2g83wxS45mEF+GFA4n2REdL0v6dascALSSD
 UQsGStjqnWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndoAAKCRCLPIo+Aiko
 1Sy5B/4nsR8V///tktw3GGSW1RIOKe3FZ7X2WwFGdZbpabyoNQmgGJCCHOmKhueL8IXxqoMfmxp
 7Thx7DkXurmF4/l3Uwokinzs8Rges3aa1K7yDgcXo2gvzRWk17CRd46Mwl571D7o5E7Zsyc5vwt
 Mp+VUyK7kIwhHJ56qbUBg+2SfJiTq/dNUKNEfdEUZuESnUwq5qKkaj0nxoPtLrC31zfWnVvr2HB
 5m1O/2nEw6D+nsiyILgDcFllmgYKSyZ9UdpGGCevAKxpn7+FuXl/Igw4JOvCV0inbmJ2zZAyKkH
 pr8lDoP9AjEmQI/LnrGICZEL9PRccadLRkb3PJgfpaXL9oJA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8RKbeodlCvLwNWn5OQhLEwDOve2EiSzJ
X-Proofpoint-GUID: 8RKbeodlCvLwNWn5OQhLEwDOve2EiSzJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXzs4B3kOrBCeu
 N7N6mQS0Ot6YqxTozyddfXVLchz0DVAmy8EckvXOiCkLymvB7bvagjvfqsZt+5pqZbKCkhIy49j
 8k77+vIiwmG68lhG4o6gF37iNK/yfo5tx7gNvg94eyJPcP8orWn56LNuxSP/zb03FFKdK9M+NQK
 MxJiUk7mLDnoh90om+jSq2lkAawAz5nqHncRRINhagqYuk9Ey3qYU5q6XgXaSHxMH48Knd89pmT
 LnsQXRBfvymyqNLV9KeGHq5Zv9nKzXlMAROGm65T+75B+hHN1W0H7RnASWNP+rQjGqVqfLayKTA
 /DbGXtGkhiQSe6o9hZYRXxp+v4dbHy72XZMvXG4XDMwwRsfcIt2Qgb/vXf6Q/oXOloGY7E6qY46
 qR62UJ2LgKMzrWd2YVyfGhVAgrAinG36NeCARPM92HLiVHAbi06jPmEWyAfqrLOVZAg+F0TcUVj
 WHKMToIyQP9TQlQ/TxQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09ddc1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MU5U8ZpPrSxGNErEH5sA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXyiIOvJ9kGsom
 JWKS6gV4/WKWejm87xTtIFsXS2uYJ9FCKUvTqF9qg8v8uIM8dtLbJOr1YGeQ8/eRTjiGBtxxaKx
 KgpP/p6hkjm04wW3QJB/2QXptt294Tk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

mdp5_kms_init() returns straight away when one of its later steps fails,
leaving behind the kms, the runtime PM reference taken around the address
space setup and the address space itself, and lets the ->destroy()
callback, which the caller runs afterwards, clean up. When mdp5_init()
fails, however, it has already run mdp5_destroy() itself, and ->destroy()
runs it a second time: the global state object is finalised twice.

Undo the steps which have completed, in the reverse order, drop the
runtime PM reference on the error path as well, and tell the caller not
to run ->destroy() after a failed init. Fold the hardware setup, which
can't fail, into mdp5_kms_init().

Fixes: 8d58ef346f30 ("drm/msm/mdp5: Add global state as a private atomic object")
Assisted-by: LLM
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 45 ++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 085c23820f46..30af8ef51e4c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,9 +19,8 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
-static int mdp5_hw_init(struct msm_kms *kms)
+static void mdp5_hw_init(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct device *dev = &mdp5_kms->pdev->dev;
 	unsigned long flags;
 
@@ -58,8 +57,6 @@ static int mdp5_hw_init(struct msm_kms *kms)
 	mdp5_ctlm_hw_reset(mdp5_kms->ctlm);
 
 	pm_runtime_put_sync(dev);
-
-	return 0;
 }
 
 /* Global/shared object state funcs */
@@ -198,24 +195,26 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
-static void mdp5_kms_destroy(struct msm_kms *kms)
+static void mdp5_kms_destroy_vm(struct msm_kms *kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+	kms->vm = NULL;
+}
 
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+static void mdp5_kms_destroy(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 
+	mdp5_kms_destroy_vm(kms);
 	mdp_kms_destroy(&mdp5_kms->base);
 	mdp5_destroy(mdp5_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp5_hw_init,
 		.irq_preinstall  = mdp5_irq_preinstall,
 		.irq_postinstall = mdp5_irq_postinstall,
 		.irq_uninstall   = mdp5_irq_uninstall,
@@ -506,6 +505,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
+	kms->init_unwinds = true;
+
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
@@ -517,7 +518,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
-		return ret;
+		goto err_mdp5_destroy;
 	}
 
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
@@ -538,19 +539,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
+	pm_runtime_put_sync(&pdev->dev);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_kms_destroy;
 	}
 
 	kms->vm = vm;
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	ret = modeset_init(mdp5_kms);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -561,7 +561,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
+	mdp5_hw_init(mdp5_kms);
+
 	return 0;
+
+err_destroy_vm:
+	mdp5_kms_destroy_vm(kms);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp5_kms->base);
+err_mdp5_destroy:
+	mdp5_destroy(mdp5_kms);
+
+	return ret;
 }
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)

-- 
2.47.3

