Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808703;
	b=nThnhkPn+pAP6d8ethbU5/rNEQ0Td/79dTxRYtlJbt4FxMsjBNY+gRm59QGGhZcAfoCv
	 NqZsUt7E7CqHMhGV65dQ3Sr5RFNM4v+t+duzpjtbp9nePEpn+CDEwX+Fk44XEGiHE7Xti
	 i6+0bc2AY5iJHQF8XKfuN0l6yjMym+TnWx4ihV5kULRgT85r8vrYH1aOANpz2O7jd1gBy
	 sJOR5p3K1D3UvCYSHpWW+iEYgtCjKZ3tkunTxYDluUhwMYQoHbYOpm7dlEMBgkkCPdJ82
	 yintm5B+TPrlOwjzJrslblmWW9FzAIZAMyOwvaUUMQ22qp0I0A6WKlhvrCd05s/7euw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
	b=X7WLNoQ9qbacJAuQTIQ5E5yLnjPUICplsN3x7+rByt8LpZg0SUm8DkwsK3TZ9W40WHKp
	 A9KuoCWOVoWp9CtWc00ad2xSotICE51arrgAvJSVGpnmQiVl+CmDSUWMJWLeZmaKThWdW
	 DQkLl4Zul4igyKwglapS4dt4YRM03ASrQLXW/bNTiwZJhTQhKCsKsLGAaOeEWLpJeu0LX
	 z8NAmMffcQYS/KaGdfEpcBguk3vYWjSQQZrwY+WgGyHiCwQBMBySMJxG37msCixIXT0uN
	 FOnOqusRaEaT4Dx0d2MUnjV5B3VXrTXEYTTSI/fhL24CKr6LXQOIUmzOxyP1AY1aytA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dl/yAJg6";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZoGzBYP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B1606A683
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471B1606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dl/yAJg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZoGzBYP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB1ZL3752761
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=; b=dl/yAJg6V5IWealc
	HonWl/XayYEuUqwyZ+Kfr8HHgX7Ijwt6uf1DJGJ0xFx+7inn0QANbZjDt49Jspms
	7rPIKLjCydUe6gBAupZttKTZ3FNxYYW3J2mWUd4k0k9ceP1uvjtuoQSh/uDsqSuF
	oM1H+nK0hB5N8sydrAIT8/UMl90N0YdBNwYmAfnP1myFc+dE108gZ5ZaXhG7QjJg
	+GOdnalsEhgmPF1SrhRYXaZyRnJz/RASQWEzfot+HporP1yfMgnijoJXWqdqk4dA
	0nfYX6msWf1/qfiRd3h6ppmXtOyfB/dMz3l8OKWZOGWc3ldZJDL4rCkg865a5yd3
	63WyEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74ghapks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d32f54d21so160564651cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808699; x=1796413499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
        b=hZoGzBYPlg7XOL6uCgdbrBYMOJZ5lYX29+ol4bL3myQIxvXiCw7tWTgQDomkbatHyg
         byPnwSP1K6oBmPWPUl/ZQsoZlAOEcvU4OS2ZjzrXVWg12t5CzGKrTn4FKTMRTxD2jFZt
         y1PPiD3VNV0HbYsN++JgTOxxzg2wKHkX3dfs7aivGFfsPlQkJdknOHeqCsE3ZQa0myig
         PENREqFSb05Xq2iuNaDMzOpEg+QMxbOe66e294qsom0VG+/ma6uvgJUB2GtpZ4cXryau
         7f1PV8UA6ICXm5bnFoYrAPf6tgSTL9Wlv+0Ai0gBjdSKZGom02RXhxeQYMrLX/Zqk/Tr
         BbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808699; x=1796413499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
        b=LcfYTHoXQ18+Sff6lFIbcJD0HE6z6TzgEeyRznNYGQSdMjDIUgGE7KGEqQU/MnC+0s
         V5dG8ZJ0IvossvUAjfijwPtj5AsuOcp//NrCsARZyFSuEBIFOfn961an8EfckWGHIrz/
         Pr8a6Mo3szlF1Cvj+Lu5JbmdWEpdR8NzZiyDzRwhzve4UzPkjxt6l+X1Y3GUfNlLDo35
         WRWPtSwJTLKnKFDQlONPFD9yHC3KcuCd3k6wGqLyPjBdcb80YtnMgguhFdRovZ+FuiE7
         ME5GBjYo50+yaxhkyi797KZiw1QAW22yc+tK+PY5EmmEy19nwFJgeNONuWa5EJ4Q9FiD
         j/qw==
X-Gm-Message-State: APuU4Z9ww+qYZYw1O9PoUlmPvttaBy/u39QmMhsasIYh+RM/yKrkJNki
	rcfJgaB4gkKvWdThlyn2hlnvKQRzYN4VEnsi224cHpoDrNxPWl2G9aEWn4sciqiKUvgtGhBE4fE
	la6K3/bEsCMaSgmC/7TTshO2nwH5NIDalP1oqfJIcsbST4+E7pihsmEi+aTpSbqhkPs27
X-Gm-Gg: AZFdTZcVtROwbCx8N/3dKxVERAmceqvx7kedfaWranUKV3wZkqZykX+EefcnvfT8s7x
	tgtPnjD8SGfHrW3h7IazMqcjK9iylv71JClxjcH54kBacU+ue8WYcuM+hecAnPNDU/oL1hCoa9+
	QH29gBOLBnItr49emvC+ujTxATCEwUbHb1Q4rf9g0wvDaCCQ0HiIAiuhuAcmH/pANkWIgyUkoRu
	+cTzk979l1sHswcdEE89T+24iElw/ajItTQWvyLR7M6ah7Z0RTNKt1ShruaQ3Iz2AQOCtXOCKx0
	u0JCZWefX7oLWALQfHh7bft6YaMFbPNlGBj8dtNDzEHOnrIQqReS9ihsY1FiGk+bn72yemTuWbd
	7VU0Yun/YECN20T2kYs7EF1967edqBdt66qXtEaixvh8+DvdjOeDO5ysyn6kk6IclgBBYarop4y
	ZLhbwoLLqzcaKv22vWzNFe8edA/hGsqF+CuoI9r+AX3RZdoEINscO4lrp5RDppLA==
X-Received: by 2002:a05:620a:29ce:b0:949:8901:dcab with SMTP id af79cd13be357-949ba9b3de8mr4738194785a.23.1795808699309;
        Fri, 27 Nov 2026 11:44:59 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:949:8901:dcab with SMTP id af79cd13be357-949ba9b3de8mr4738190885a.23.1795808698864;
        Fri, 27 Nov 2026 11:44:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:44:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:17 +0200
Subject: [PATCH v4 04/14] drm/msm: order the display snapshot sources
 around its worker
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-4-242b0a3f8e47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3385;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iM9tCgrXdMoAc0lpkEnlYv/1Wi0+ANIcrUxdVoj0Zoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2bGB58rqVr8hoJL8BnbuQS4YkuMzpnyL0Cl
 tSINwYNVr6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndmwAKCRCLPIo+Aiko
 1X1kB/9vKjFh9sbWfnCE0uG58KbQXR/HZIt3VNbJNfmh2xHotRLuCJvPfk/oovco5wLCwpDdbc/
 EZwQPgT/s/O8BdiL/7EuYAEfB6R5i3/qloDBIAwprPX7t4mLS0GkNMloOyEaNOp7toaJYxX9XMG
 Pv0N6kUgVzNnPKLdXgWsnrBMhLlJB2YCcVc36LV+J06r2Y/OFYZKR6TkQTloo05WxWWAhGE9c3z
 +YYPPBJEfbM6ZgOFkcD9004KMDjT1CXYYY3VbH1YYhoEkRSMmOG7QjKXXMBMhboZ5h1pWURUQno
 kV68Ky1yMdhNfmaBS3cIYhmpmKj+yukqpl0Gg/rEh80vBySd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX1ClqkyMK/b8T
 gDVK5i3sMzSbMqBwD3c4OlBwiwIUIYlzwQXuCUXZhd93UJzA+GN0raofsg2LweEEYRL7YBLD0+t
 5NrIHFNYw5wUt924Albr8gDZxqvKPeE=
X-Proofpoint-GUID: xoNEtf4k7HbBgIUMp6KTJdX_ykQT_LQk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXwhTdNZOjzvSv
 gfTuLKq1Cdo10dEg+o9m0RRw/bIFw19ujTJG/XQNnqWBohbOCztpgzKrTCOx5cICtFc5D403+/I
 4VMdGoGiIHowZnpkp5dpSSMYQeD5M7uU635EDmYaqNw7uuhx+WHRTfVahrjSYW7DN/o3T/7YVli
 ZQajmn4pQ5GLmdV6o82IMh3hxRAgAIlGp3OpDzTBdbYpwgVDx8gPptNRSOh5v5BsW2FxM9m+MQ8
 vkXNZmE6JTC0xKVxB+whgWH6zD6mSGN+jBzO8QlVzyp9qRmMg7x1ttLKVHBLjAcuJwHYgwPGOK9
 8fsFtGLXMw3u3swnOIU7qgLx4gWkk0hru8nzvneNaqzg0Iedj6SJLOI1kUoE1eo33JWX0n6D1wg
 S1CAUoG8gUhSmVr7uLLjiKO8PeSBCMpo87ZgstrWjP5CIjBeuwjK3tu8O6vz+keYU2jDe94gSaA
 bPqlPhIqLBXyFxKpduQ==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09ddbc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=RYZzOHaK-VtI4H7RTV8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: xoNEtf4k7HbBgIUMp6KTJdX_ykQT_LQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270078

The display snapshot work is queued on kms->dump_worker by the IOMMU
fault handler of the KMS and by the DPU interrupt handlers, but neither
of them follows the lifetime of the worker:

 - the fault handler is registered by msm_kms_init_vm() in the middle of
   kms_init() and is never unregistered, so a fault during kms_init(),
   or in the error path of msm_drm_kms_init(), dumps a KMS which is
   still being set up or already being torn down, and a fault after
   msm_drm_kms_uninit() queues the work on a destroyed worker;

 - msm_drm_kms_uninit() destroys the worker before it uninstalls the
   interrupt handlers, so an underrun or a timeout in between queues the
   work on a destroyed worker as well.

Start the sources only once the KMS is fully set up and stop them before
the worker goes away: register the fault handler as the last step of
msm_drm_kms_init(), unregister it first thing in msm_drm_kms_uninit(),
and destroy the worker after the interrupts have been uninstalled but
before the KMS itself, so that the dumps still pending run against an
intact KMS.

A fault during kms_init() therefore no longer produces a dump; the KMS
is not complete enough to describe one at that point. The handler is
cleared with the kms argument left in place, so that a fault handler
already running still gets a valid one.

Fixes: 2ec5b3dc18ba ("drm/msm: add disp snapshot points across dpu driver")
Fixes: eabba31a839a ("drm/msm: register a fault handler for display mmu faults")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3e39c3907a9..a94d2888a21e 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -182,8 +182,6 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_de
 	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
 
 	/*
@@ -211,8 +209,6 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_de
 		return vm;
 	}
 
-	msm_mmu_set_fault_handler(to_msm_vm(vm)->mmu, kms, msm_kms_fault_handler);
-
 	return vm;
 }
 
@@ -245,6 +241,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	msm_mmu_set_fault_handler(to_msm_vm(kms->vm)->mmu, kms, NULL);
+
 	/* We must cancel and cleanup any pending vblank enable/disable
 	 * work before msm_irq_uninstall() to avoid work re-enabling an
 	 * irq after uninstall has disabled it.
@@ -256,12 +254,12 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	drm_kms_helper_poll_fini(ddev);
 
-	msm_disp_snapshot_destroy(ddev);
-
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
 
+	msm_disp_snapshot_destroy(ddev);
+
 	if (kms && kms->funcs)
 		kms->funcs->destroy(kms);
 }
@@ -339,6 +337,8 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 	drm_mode_config_reset(ddev);
 
+	msm_mmu_set_fault_handler(to_msm_vm(kms->vm)->mmu, kms, msm_kms_fault_handler);
+
 	return 0;
 
 err_destroy_event_threads:

-- 
2.47.3

