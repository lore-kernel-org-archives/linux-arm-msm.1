Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3AC3B47DC
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677352; cv=none; b=QYVd2xOOtH+NPG5K8GbQ/L1MJkcf1LC2VCv1L8fuwR62dIS88OYAOd8B8P5d4EoPWH2C62TckGkPeBuONFFZI4WXW3LR4omjb39q1wdr28zu9ct76vuh1Ud3N1sH5MNpqqvMoXc821wvCuRcNimgkTvkPtOAHauxyb8BumDkQnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677352; c=relaxed/simple;
	bh=Y59BOttM1xa174SDMiJoFUqpqlNHb3j6S8caVXTgWjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eAybe7r0gGtqfFOMYDv1MXLNUOh4+iPpLkJj1luMgQ3OqJKusP44oOn5nM0KehWkPDxXhxJZyIbgHmHh29V6ievbY1AynM514Qvj7T1A5z57ds45KLH65ogjcwRVhLewfrJj2j79W+WxdNWN1fXYFNioecQCjbzkzPh+mcAVBwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIH1CAg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fj7e3EUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIH1CAg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fj7e3EUt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B7SGs1320075
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Aug 2026 13:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuR176VLUamMDkT1wfGrpjDH+JtVK/6ppywmLriE0eo=; b=GIH1CAg2c6YJFAL0
	IgRORIFj08qVHGnwasy/bl9d302+Kx4kx7icuzrp/lVtRRWdx2IyyhRZBeEBcjJX
	ZVfcNoCObDNfNsDQy/Q0FHo5I3qH1KABHfkqYHEHUXdwEhkosY60TN6pnEgyaNMw
	NVOGzktx/XF/X0wLFbmXx0d37dHaxG23M5eSj4t34loJ2SlhVDvn4cOpg6LAfvSn
	+D+XqWfbJ0HOEpqGIdFqQeD0Kx9wnP+cqFa+b0g+aCIsqe5nwvWvBovZs94TdedV
	kDh2g6WfNOsLmX/j5yt/pFugkJd0NGxPexOlosgZPzaVgqqsFeFQRRwodFY7zuPL
	0Hc9yQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs966au71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 13:29:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so47862035ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785677349; x=1786282149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuR176VLUamMDkT1wfGrpjDH+JtVK/6ppywmLriE0eo=;
        b=fj7e3EUtkKdmFAfW9X5MAsHCVG1fDlIgzOD2zHobUHZEMdRejX3Up1mAtjVttGcKRX
         elNMHgCtSL0kG0k8ulI9KRXVdJrGeBrXT2LeFqJ/cEhMeMb8OAO7pinHFvc2ZsRKMFY9
         k4M5I5v+Os5gsYTj1pQocId/AmZ8FhWJsczrynUBVHairIsZ5ejFF2CZojhX/3VkFUJs
         No4sRP8RnOxf4hRJ9XvwjU+zBqSXaoyO+XvpInQadRwYQlwKQsqylag5n4sFUL5nKP+4
         DBf0tZvapchVTtYPLTBecgwxmBGegwcviGP02s9AkmD+XMg/6H6o3KYXCKnQNz+EJbJY
         mQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785677349; x=1786282149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuR176VLUamMDkT1wfGrpjDH+JtVK/6ppywmLriE0eo=;
        b=JwEQB/VUrEvCVBZdBDhRUZuc1OmlZDSZFpqmvHRdOBmsFx9fH/mmP2uKwhiatYBXA1
         tmoBw2iJ4v6tpczQ3mweuhBOnDNo+iRAhbls4G4aX00jTcMxJVrAgHsGkScHXrYeT9L5
         a+0TFAcOqNveyeFcFUkcOU/3clM40eahir0x0zFfq+OAd0nDGJdOW1JoD2oOvQh2HB44
         rnFZGIsZ9iLfcqUYDE+1wWQ4hnFEjau8FtlUuTPEScf3qLuzuGJUGIHIkAw0p+lq8qlw
         CbazknWD58yt/hz54jyzl1EIpospluFkIY6DMMBukNZ0rFdowLlkWIZby/868J0SNXGx
         eNeg==
X-Gm-Message-State: AOJu0YwVr8OuqHzTS6YdSi586zuTdNC2r95TpboS3ywy3EzrkkiE0ai1
	2iC15Cufdifnp3UzS8UzvvsV854kCww+/usQy8ia3a6opCVOaF8TFSyS8eSy5X/BFGPaCobLmL9
	idwvBQcXptK+sbAGGEtYouE81y0U+Pu0Uxh/2T5H1YpXefjubumfHHopNEnqtmlCi1Nl8
X-Gm-Gg: AR+sD11axpweuCJaix6yFfPpFPPrfz/L4jvprwbNoLn38y+amaJAuUVdIab9T/CBdEc
	Hd/JN8v4PQRCpY09GzZYex42Slem6W2VHTO+WRuyxgemGQTFGL4+yCMqytrVg8tFZ9rfnN9P582
	0g7JgXS2U5xAyP/31JHOGu43Y3/c2BZ10699/MlyFKp60OTgKieEOpgMlJMEWDzOROT3nVzFqLQ
	Yeez+z6wqBpsbeQzpONWMG2ZqpkDiLLolFziQWi3yv0HByAUbYKS2blPl2w6gATOAxrbffss1VJ
	k84ugtgVLwXyF7BZWGiZ1NTCIqcRASc/7NOlYtKjhOTWKbHHVYbbVM8fXs2GECcw1przkmX6zAZ
	J4rJs5vM8OfQWrgN+icfvOPBhkpfu
X-Received: by 2002:a17:903:3810:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2d0524740cfmr67911035ad.40.1785677349015;
        Sun, 02 Aug 2026 06:29:09 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2d0524740cfmr67910775ad.40.1785677348549;
        Sun, 02 Aug 2026 06:29:08 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153db2f911sm30582951eec.0.2026.08.02.06.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 06:29:08 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 18:58:55 +0530
Subject: [PATCH 3/3] soc: qcom: rpmh-rsc: fix kernel-doc issues in
 rpmh-rsc.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-b4b4-rpmh-kdoc-v1-3-0f5026293d9a@oss.qualcomm.com>
References: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785677338; l=1765;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Y59BOttM1xa174SDMiJoFUqpqlNHb3j6S8caVXTgWjw=;
 b=v6PNu/9qo2t+RnDf3UOioLg5lTJl9FnxkTcJZsuShN/gDyeXGCzAKkFS0wItJVoXKi2hjTglY
 n5NIbEOrF7jBv8qaJEzipW0WGfVkS7dVmV+5tXHRSZTfk/97CusFiUX
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: Fobk-p5d9sagYsbXAQ8Nrb35zP_Fg2qe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX85CxJ3JRGo+B
 CWUP4mU8/ilu98NDk2HykpB3E1NTxRbQ/pFH6o4R6PoHFJ7Q+x9CdkApzpUTvZOgzlJKGQ0P+Aj
 RZ0y/fCjLdBTvitux91U1xW2kXaV28M88z5zcKbMb9wG65WSxbW4eHtEUSu6GQ5+M7/iuv7a+iR
 w/8zkB1pZ9qJP8fuWiepdWbIW8c+GIKdrtNBYt3/iXp3k1aW78IOAPrpqtz2sUeAXnGI3Jc8foh
 vF6iXJ+gmzsJdCFDPTHmInrb77EbNv4Dicvn4w8AohsafaWtmXv2RQjYlTKv7HFLI+OOx8AKhr3
 JvhqKeEWqnSrDf3QSoPvXy+2qYuS4fgXk9SQtToBMxTI+LOmkA4ogrJFYe7BSNjuYs8qQWwW9Se
 9oL59EuO3QuPg4duaxJOvgPGfET/xUZ281co6R3VTU6NhjamWxx0QwLj81v9xKDqbx78n4njDX/
 TO6PLC+WAF7u60QfuyQ==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6f4626 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=x3vLSCj6OUTY9ROcoe8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Fobk-p5d9sagYsbXAQ8Nrb35zP_Fg2qe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX0S/n4fgfKYCm
 0ijiLAVyCYMEB/XzN7eRY8OoA9Ng1IPK/ll8d3w15331sImZw00fm32xlofJ4iGZvML/iRYGp3w
 QvwgGmrGVUXdW7GrUI5sUY3hHkdoqHg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020118

Two documentation issues in rpmh-rsc.c:

- rpmh_rsc_pd_callback() has a copy-paste title 'Check if any of
  the AMCs are busy' which describes rpmh_rsc_ctrlr_is_busy() not
  this function. Fix the title to accurately describe what this
  callback does: flush sleep/wake TCS data on PM domain power-off.

- rpmh_rsc_cpu_pm_callback() has the same copy-paste title 'Check
  if any of the AMCs are busy'. Fix the title to accurately describe
  what this callback does: flush sleep/wake TCS data when all CPUs
  enter power down.

No functional impact.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 66928ca40b9a..f5251519ec85 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -833,7 +833,7 @@ void rpmh_rsc_write_next_wakeup(struct rsc_drv *drv)
 }
 
 /**
- * rpmh_rsc_cpu_pm_callback() - Check if any of the AMCs are busy.
+ * rpmh_rsc_cpu_pm_callback() - CPU PM notifier to flush sleep/wake TCS data.
  * @nfb:    Pointer to the notifier block in struct rsc_drv.
  * @action: CPU_PM_ENTER, CPU_PM_ENTER_FAILED, or CPU_PM_EXIT.
  * @v:      Unused
@@ -914,7 +914,7 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
 }
 
 /**
- * rpmh_rsc_pd_callback() - Check if any of the AMCs are busy.
+ * rpmh_rsc_pd_callback() - PM domain callback to flush sleep/wake TCS data.
  * @nfb:    Pointer to the genpd notifier block in struct rsc_drv.
  * @action: GENPD_NOTIFY_PRE_OFF, GENPD_NOTIFY_OFF, GENPD_NOTIFY_PRE_ON or GENPD_NOTIFY_ON.
  * @v:      Unused

-- 
2.43.0

