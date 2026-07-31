Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61F28313D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457925; cv=none; b=pXMgG2e5UKPO7n61Dwk9SXVxq4nVhNqKUuPXFatHwLEeYH2cG/2mr7dz3oY9X7JbQs0OvDovxldSQXL7T9hjg9lgs3O25H0Vk9nmmxYf+d90s7jcAzxXUO5+StGlgmP/l+I+qwnPwQHHnHCrI5aBSFmHEn/7QrphliYwZlE11Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457925; c=relaxed/simple;
	bh=zgD959mMF/8ySbeK+HmCfcXDYm53NBUcMxUwd7KZ7mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dt8coIG7wFbDS7GBiFWgCle433IjH+lFbLUD9w3TTkY5qTmEcvZWBUe4Fk6FtMda0ZFqcuhgm0CSC+oKrnQ8SDWvLERd2rYFk9yI9Zr6oItFKVO+8aB/+p0vAruiUYvI5j2SgQvnMOX79GKaZknRrU+hhegiSI0wj6JuZgvbSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEJsOyxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpY6g7df; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEJsOyxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpY6g7df"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UNIvIL1760310
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgdfzEGCpIZsxITOSxtWVRvSfeRmupU6X1LTU4J1VNs=; b=IEJsOyxUbmNiStSv
	W9s9IysgKx9DAFOW6QJNgVpJNb5hoqfWGN2DCdNTd8daHE0nETo/i1p0+wku0vld
	VjpqHcKo1rK80GouOLXSrg3HmCKFdJbUlsFJd89a+G4FklE//Y+XIbKV3O0OGGFK
	2mKkdZ+ZUK4AhOsYYjlRCNRDH4OMrVYFN26PjAI8erli6nxgNokV+9iYOpKfUo2q
	Es3UMNiWLYroXBALy90EZYPIbNFeHVZXZrCxDCMANlGjCDHicS/3UcYKUt1BBGtG
	nYvDhB/YbnQX3HKudF7ChqjjmCxaXeiynW5HfdhRDSIO2KjvfUDGfoGRYFMu/RlL
	h6Kl6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frg5v861n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e6f602cso6398541cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457922; x=1786062722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgdfzEGCpIZsxITOSxtWVRvSfeRmupU6X1LTU4J1VNs=;
        b=KpY6g7df7vKe8D7mqyad7wmQm0liiF7sIzaz5DGfkBA5v1GqDKn324S3oK3BW5r3nI
         6TrAbphdrasV/gYJjvUxRBLUMuQcA9ObVJ3IEpoZfXcaD/tsNID7eocCnpBrgY0YmQM0
         Yqv5RjUxU7VA/i1MtDFc+daxWQURuCFPDQVdIqFv/KKQYqOxz1NIHO6QDwb5tIuTlRkZ
         XKAjTGuP8NEBFEJwFgxwdHl/VwMiHwQDb5bvj1TUhrqc4S5UhJ5OVKIPPIeAQ2AdU/cU
         MoXXnZvcX6ZOuvrumwtmPdhJfzMwKe9HJi6cG7enzlWFH3CENtyKlSK4QNTYBaWfzCPh
         Kl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457922; x=1786062722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgdfzEGCpIZsxITOSxtWVRvSfeRmupU6X1LTU4J1VNs=;
        b=tCx8Prhv1u7s96sHoP7qmM/FsKgGnLmRGMGxFVlpMl6PQk/zJ7uG1rqd6eR1wMDPC0
         PmS6B0kuOZRw7hyF9o+vMXg7TGNjdu3KNVzIOna1LSM7KeXmidyjObgkhPWxGrlDmySJ
         zol0BqlM03wgHRWjQ06TzAHfxxCcDBAO4TXGxwBwTPsZY4H2K7oEAUEGLfBKqc1Bjd7k
         eGBXS3PGG0k6Sy+qjiDxFRD4B8u/SuhR+YDfHDMPTedU60d59FyRHFJCOTAf9+x+lDXZ
         PFVIEYtJQgdBrUnOQtowEgpkB1ml5J5Y9ZP20NT5SJ1uYWHAQP4FkmCnwZ3xGPesMqG1
         hPng==
X-Forwarded-Encrypted: i=1; AHgh+RpprG8AxcRD5dQ8NJ+wAG509Kd1UdpPxAFKIU8NvXFVr0lOast/H9y+3o99G/IA3JaqVqZ/c9AfPJNnjgW9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7hQygAdJJD13AOC1PS6Bmu89wiGXsiCtH0iLbn0agkbqS7Pn
	Vvbbq2nuWyuSInjnhZoXkVWtZZjlykp2dcppa/4exoLwRlULpWjW3Xmbh4ifK5PnSM6R9uOHOou
	qfRN0ynTHxj0ImEJzHNSyrUIdrsqIRcRJw4uygenvqGVh26SvL0v0KDWh1QMxc02H/eu5
X-Gm-Gg: AR+sD13wFW3QYMv1U34aEsNiptgk3rxS/Vn9UcIHMl+1WjxxP/BeFM2jUitlH+w3VzA
	5GitceaJDdJFVYIX/mpe79aafouypUJV5U1qJzcrhSsfuM0lZ+H+Kw9P/R6pvJtH15PX+RUUvL+
	GeUVbTvWAQ7cjHdEaIwNdOAvZ6TPmxP8l20gHpVoMRaEibr5k31mvnygLL5dVSniruq92xLHPsx
	raHLzLTlRHqcWSwP5fR8jN1z/DY9xXGT/LEVwKQCeSs2RXh+n6UkHf4GbEiq7ug2mU+RRfZbY3V
	U5dn29pfcuv1i2i4tSLwRXQ5H3ey7X5Nd4x1QeAgoim4CxVo+PPdoOExc2mh21x2ATND0HlOfH3
	1NmfFu71lvOtP4JBpakgItpXmqaL1y0fUDg/DWqUPMm+rCvYTcHnPJ4VbApGLRo2qLLAMK4nP/n
	Wv4XOpp0E12e1h8A==
X-Received: by 2002:a05:622a:1249:b0:516:ed02:c85d with SMTP id d75a77b69052e-52b4af3e4d3mr1379681cf.3.1785457922339;
        Thu, 30 Jul 2026 17:32:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:516:ed02:c85d with SMTP id d75a77b69052e-52b4af3e4d3mr1379401cf.3.1785457921908;
        Thu, 30 Jul 2026 17:32:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:31:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 03:31:40 +0300
Subject: [PATCH v2 1/5] media: iris: fail firmware boot on invalid
 uc_region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-fixes-v2-1-94c002016a09@oss.qualcomm.com>
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zgD959mMF/8ySbeK+HmCfcXDYm53NBUcMxUwd7KZ7mw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1b2m995a5lVprBelxTwCNrQvsHY9b672R5p6+dnXPuT9
 od5/trUyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJlJxn/8PP1PHHpVNum2Fx
 efevv+VXVm54byD9ysE8XsLu7TLh1wEZW+KniaYwlfE/N7cT3LhmV7HT+w8NF5mX5thu9E/Kfvy
 /+tHB7/bs668oRrrYPoi44iG6K01zdR0n2/rft6VjuI9/ViiuTZKcmLBx7aV993gK+cMfvguczV
 g1yfGB8Mk7uhfzzzq0Gf/hOTHJJKBeII4zpEqFgVN8Ftt1ucK5ya8WaGb8n650fmnXnd1T30oKp
 S+/5GvNdF994uSrXKF5TytjYycnaWprSfgpsnzWS+oqfhKwL0392/YNXJtLHKWLt+r4TN/pHLRt
 0u9uCQ+Rt++rPH1Wpqid1+79zfjibui+fue9HnaecXsSAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: THbzboVc7QytIjULo0NwyPuDY4hQOEyi
X-Proofpoint-GUID: THbzboVc7QytIjULo0NwyPuDY4hQOEyi
X-Authority-Analysis: v=2.4 cv=JsbBas4C c=1 sm=1 tr=0 ts=6a6bed03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=bM5zmIW2MuzvGEp2F_gA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX0is+4bbCGFZk
 W6v7eg7DhqbYVwg3+A7EULjl2rensFguUhvyjGik7400vID/H/JkXVxgReCdvaOt6vVbIadNkC1
 Ols5to8BRmPi5Qe2Cl1IeslUgRMJNkQ8QLkZqUhG0lb8F1P+pTjuaaLHnWplNwlL9tqaXUlf9gE
 v+k2ZeWC7dBCKtBm2pRNvhwe/O5ECCaG66naHcCtUYVPJcTEX5RxHp9zgP9SjdcEeVMxwdddSyT
 d9MDFoeXEeu8p9IJTRlSplbfqUMMQFrTzMYdKgex5+oxfQ384d8VEhxVKzZG6ERXKd1TVlE2SBC
 hR98fhbuGh1Qf78nzP9sKTM/WlJL9aqZmJAgsVVPgHLfI95B98Ogq8MSvyU2fbHZS7lmRgfjp8S
 hhX88UJol+RVMn+kk5yqjFSih/WU1f2iWUAahyjPJ6TpujRs0Em0AZyLpjvp9rGoM7M1TWVtqoe
 5Ue25eJpmBG57D3W+PQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX/5t64q7O6FMS
 /HBhhbZh4W7JckImMZP6/TqIf83+PWa00x9ztLYEsbsiW6R7eNCecG6VlUc+PSzrQWVCvEBBG9t
 DtD0wLPoAqAmX9pRFFAd3szx4YFZ5Fw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310002

iris_vpu_boot_firmware() polls CTRL_STATUS while the firmware boots. When
the hardware reports an invalid uc_region setting, the poll loop breaks
early with count still below max_tries. The following timeout check
(count >= max_tries) is therefore false, so the function skips the error
return and falls through to return 0, reporting a successful boot. The
caller then enables host interrupts and proceeds to use firmware that
never came up, which can lead to unhandled timeouts or hardware hangs.

Return an error directly from the uc_region error path instead of breaking
out of the loop and reporting success.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c107709..819db7569524 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -84,7 +84,7 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
 		if ((ctrl_status & CTRL_ERROR_STATUS__M) == 0x4) {
 			dev_err(core->dev, "invalid setting for uc_region\n");
-			break;
+			return -EINVAL;
 		}
 
 		usleep_range(50, 100);

-- 
2.47.3

