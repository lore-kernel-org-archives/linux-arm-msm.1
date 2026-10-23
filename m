Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769531;
	b=wxPRfo6iAw3Ggb5RiMOywOFTn8zL7bBZVW4LDNgIc3HIV0rsjMW1aNuxkGCSOwUMpeoj
	 +vULvX0jXyXslwSDoMat09uTfxbOTdGb+IIwO8N6GpGmC8LZpWu2A/EDAXA/a3B2WtPOY
	 T8lZg2AxnZvFrlruINVX2kWRqjgTDXjyXMI9jUk+lAYD/Qn5rtdl1ikrlirTvfgnRvoSR
	 r9lA8p/GpidtQdW1WzXDn/Z3jS8foXFN9Jh4OEA2XxyGJJDDlT4eLNwexNbABqFAGZHhQ
	 6ASToK6L4FzdYNI+NVbdrUocflPLd4AfBxSsWu+ljlf2f+prTUmWAjKvuTmMJTdr9yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ss2KL0OlOxY+W+P1n4KMOe89FXmDrXUTQoz5/67K/78=;
	b=vI67g0RYe7O5l2IAigmIdPLbQGh+2j9da1dSZywbjXAoCC8h0EG3PPet27HYWsHSMW/s
	 67hv5+gZkahh9HRSSkmofAGV1L6H+UTNmLfAMXv7P+IaAAS5ij9C+kKOwJ6dYEXyEmiMD
	 9v10QJuQTsnxsyV+6XEFtEs81Uv8Z0mJ52aInCbd98bocG7swIZivS1nGY41FS7vJhtdH
	 rB8a+6LR2Cx+3tRX77hQEIS3Es78GzylMtySJvviidsxLWmEF5MjdzWn/FwgSbo8Dxy65
	 Qe4hjLW5l1yig1Py85UhV3X3GVyHdiA3iUldF3dHV+8MH6cIV1AJ/+DOqboKfoka9pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kvLgKBDE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KggnDxTF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F251C60A5BCB
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F251C60A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kvLgKBDE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KggnDxTF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6I8i3479630
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ss2KL0OlOxY+W+P1n4KMOe89FXmDrXUTQoz5/67K/78=; b=kvLgKBDESPU8ZDsU
	FIwwUJZZEzWiJ4CKEXrtOJUg9AnOQG+p5GN2TlIH/crsEBMur926Tt2fjkErDpZK
	HRJ4BKDDCJ00g/PEcqfWC/zgwxDHBGcwL4kUf8O0GA6JM7YJSZlfkpQr+LqcJku8
	KYvSV9NdZ7/n8B1BMpTIzLGHaz0MclWYnJRB71hg5tELNMcrkJSbxuP4S0rjE+Fg
	iTa/lVcI6sNqLiEcxhbkgmaJlGcsfVXIJjg5TfAMclkVqIpYv4mPbWMbP69SOtiN
	qMc8FYmT/giNSRt7RmLC81DRINxDZPQixaC6g+MUasQg6nUiUKdzyLSdCp551kJU
	xLdlNQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0mu9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:09 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99063f4065eso255182241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769529; x=1793374329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss2KL0OlOxY+W+P1n4KMOe89FXmDrXUTQoz5/67K/78=;
        b=KggnDxTFI4FTvrYtZTtLB1lJ5/UAgrbm6zIXNiqM/ELa8Xsf0Y7Hx5gU1fthYV4tkW
         +ksOgEnhzJIsj9SDBr0U4q/UQ6siTLwhCMuqrceEqRwBXUDt5ZvT98j2K6XWiDgbd4ZW
         vLi6ow7GDTupbpr7Drx1bDZZo8uiKmtXNc+fp1NDh6miGrRk6S4z2ze+UrowMP89Y+zz
         6TqlMoX9m6fYAEbQzLykP/1YfWQIocj5+A16J++ilzgg4CllyiFyMzP6nDCzjEkXFVrC
         1hznpTAnHBk+tex07bTrS1xIIqUa0Ax1YS9NB2hK8s/iwO/bKjpuPR/jlc3nmfXBQ4xb
         3uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769529; x=1793374329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss2KL0OlOxY+W+P1n4KMOe89FXmDrXUTQoz5/67K/78=;
        b=vA9hG+ZK92cRRmJma58SCdRKBE9ni5hQf6BAbk6pOaY1K3wUFcQXhLcVzQjffAs9wo
         Zq8vNzhN24I22HY2XE+VLIuHsA19XIg7MwAbm/+Z/HtiAqNsXU9GjxwZhit5EmKs+bSW
         Lh68TFY00x0Ao0FCSRoV+1wMSzRmFDNCBbFQnolrUocNJLdIFobnK3ORLUW/G/jVoF0C
         AIludIT3TpC0Zeuhtyl9cudHCaN865lJsreTrnMWqkiHyxMbdWV7pfa8QFXswg1oOODR
         BP5NOuy7DquP+xjDHW0kMFMdcPfY1JabJuwMMw4acz76SLkZdqQsLXVrGtomQ7A7OzeD
         nsuQ==
X-Gm-Message-State: AFq9FYIC1/Jv+1vAu7ImOAKan+X3W89eKpMBUMHV0Lfaq1IQnyH3sBkN
	U7kN/HuuVZtkJ5k0L3b216PiBCq/wKPmmkb+wlloQ0bArCyXytobqrcibrZFMaj0n/2OMTEjkTT
	1yjnYNOiHtFmFrQ7URV06kmyvr8DZSnjT4bDZFbeD7t4SaviEihH0S5nBOlJ02ENER461
X-Gm-Gg: AYBFou328VRFjobyeei0ZiEcYDZuczNB9oHBx6UPbvuSh7lchPVo29GT8gHxFb4fOn4
	onw4WPErWbGLT8wY8cfVMZpPFH9R1xSoTrtzr+ks3j26xwfGVsvYWVteYvUd6311MyAxNhA/woO
	SFDzbzbUow6qmBDc5Q0g73j8hk7Uko92aW4Z59aGf7ecTR2Nntd9Y2Zh/Qct6xSXcJisiTajs25
	Ru/kNwt/tH9u/jEtm5O9Op1P/3m8uHe3SNJnslxiKQxfhDBGUQHzYX7ljK71wUycqd/rqHlmdpl
	/U8l0PFWe5WQL5KO6NkyHjWwl+tnaSrX7nZnmkQRcpGu2UlNuPqzBvqQ9+djMPxqbr4jYjYO9Rs
	cMyB8bXaAKSBBKdGSsNk4yTna9YiDQrOX8yGbA8j4+p8pVs7NtErOG9U0bMO7eASFavmf7DlWVd
	hNqiavjGWUUoBQ
X-Received: by 2002:a05:6102:6445:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7ccc31cfefdmr988231137.13.1792769529029;
        Fri, 23 Oct 2026 08:32:09 -0700 (PDT)
X-Received: by 2002:a05:6102:6445:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7ccc31cfefdmr988186137.13.1792769528478;
        Fri, 23 Oct 2026 08:32:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:32:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:29 +0300
Subject: [PATCH v2 14/14] drm/msm: drop the runtime PM flags from the KMS
 teardown
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-14-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4747;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=B4JgGLbwDstbXJHsjEO5t0PiEr07XCtrTjLF1Zlgghk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233d05ctLcFT1lQ5L0/y1fptF2HZbcHeyP4sb
 JAkkvqqzfSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt93QAKCRCLPIo+Aiko
 1SETB/9GthrzeNPq8k9LtQHSiF43VI7ukKfO1qp+Sqy1VfPwJGk6afIi5bG9zV9tuFc3RXD7H9S
 Wdyw9IQyb7B0r8OjXjtaPsp3ABNorMhRIe+ar2YRvLeRN0v/J04O2oqFuI/u7hYEiPuNOfzIEkX
 a+byim64iLn2VYOaMOZMNT4qm0TEhNSiQd8SN9KrUDiI5iB2sdUPxGifzecdttWjyYjiAgLJHvM
 vQwH9gdoe6FgLUwN7HBlulveia31pWVKDg8HF7TABV8sVfwT5PFJuhaF43nXuvt3uL9ok4N5H49
 AOtjRoBdgN/3XUcMg3RXyD5dxC+F79DScnWsLE8tXz+K5+z9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rTWNTeez7dAezLb3WfZNr__YBsD2bmsd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX/8DyFwfZOOnH
 FvLvHJ6pyVSJlzprj3xkg5YXdLTbOOM6Ah7K2YW1M3xq6zs03VafjrJ6JIzeWfaS65/JO27kQgD
 +q3l8T6tXAAkFhFawaBnfQ3Rh80O3n1ztBQNtBDUBhSPM/0zd5QTqPrXoYW6ldGB7HnfcbA++yt
 rRESpzCQauOLgJ9GTUhLNC/AqZs3H7dJrOACKkCVNcZwYSbwGHQfteE70bnpxDPCTn7HFGYSj34
 7GyvcmVx4D1svUDkgqkKoL1NTUo6dUzKKpu1g+T//klcjwi+3RUt5EI9UnphixSS9PTu4kUki3y
 jgRcTiYFSaZLxE98fhls/YbrLFzfpONt9yR3cUZvRbf+JRUaDNu94L8LPlJ9R7/ugYs7Ml/8kKx
 Q7Wcie+Bu0hvAIr49pOxg9Kwp0L06mNT/JGsAXKpljhO87rixmerGbGWDd+ap4vwShVCfuKlfLz
 vHESVI/SmWzItcf/9hg==
X-Proofpoint-GUID: rTWNTeez7dAezLb3WfZNr__YBsD2bmsd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX7AUpvx5pl2vM
 x4NbhbsC/IkvKvYOWBKPS5Czzv4YV24ckwTPDxLKHCqxsi/8+TXOVxD6mb79XAio1QzJK6qod8J
 Ix+V9bG+OqRMt2j9X3rhzX2aoASxkNI=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb7df9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=83TlOTTOEq1NsKmbc34A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

The DPU, MDP4 and MDP5 drivers track whether they have enabled runtime PM,
and MDP4 whether it has pinned its blank cursor, so that ->destroy() can
tear down a KMS whose init failed half way. ->destroy() now only runs for
a KMS which was initialised successfully, where both are always true.

Drop the flags and the checks.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  | 1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 2 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 5 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h | 2 --
 6 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3546efacba3c..e994fd267c5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,7 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 
 	msm_kms_destroy(&dpu_kms->base);
 
-	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&dpu_kms->pdev->dev);
+	pm_runtime_disable(&dpu_kms->pdev->dev);
 }
 
 static int dpu_irq_postinstall(struct msm_kms *kms)
@@ -1320,7 +1319,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	dpu_kms->dev = ddev;
 
 	pm_runtime_enable(&pdev->dev);
-	dpu_kms->rpm_enabled = true;
 
 	ret = dpu_kms_hw_init(dpu_kms);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e39831a397b1..769b8ce6332f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -87,7 +87,6 @@ struct dpu_kms {
 	bool has_danger_ctrl;
 
 	struct platform_device *pdev;
-	bool rpm_enabled;
 
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 58a269cae31d..0668ae79f6f1 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -129,14 +129,12 @@ static void mdp4_destroy(struct msm_kms *kms)
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
 
-	if (mdp4_kms->blank_cursor_iova)
-		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
+	msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
 	mdp4_destroy_vm(kms);
 
-	if (mdp4_kms->rpm_enabled)
-		pm_runtime_disable(dev);
+	pm_runtime_disable(dev);
 
 	if (mdp4_kms->vdd)
 		regulator_disable(mdp4_kms->vdd);
@@ -437,7 +435,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	}
 
 	pm_runtime_enable(dev->dev);
-	mdp4_kms->rpm_enabled = true;
 
 	/* make sure things are off before attaching iommu (bootloader could
 	 * have left things on, in which case we'll start getting faults if
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 06458d4ee48c..9dd829ec9401 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -34,8 +34,6 @@ struct mdp4_kms {
 
 	struct mdp_irq error_handler;
 
-	bool rpm_enabled;
-
 	/* empty/blank cursor bo to use when cursor is "disabled" */
 	struct drm_gem_object *blank_cursor_bo;
 	uint64_t blank_cursor_iova;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index c349eedd55a6..bbf459bff35d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -575,9 +575,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&mdp5_kms->pdev->dev);
-
+	pm_runtime_disable(&mdp5_kms->pdev->dev);
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 
 	mdp5_kms->num_hwpipes = 0;
@@ -734,7 +732,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
 	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
 
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 7bf2172fce0b..c0b163c4baa3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -62,8 +62,6 @@ struct mdp5_kms {
 	 */
 	spinlock_t resource_lock;
 
-	bool rpm_enabled;
-
 	struct mdp_irq error_handler;
 
 	int enable_count;

-- 
2.47.3

