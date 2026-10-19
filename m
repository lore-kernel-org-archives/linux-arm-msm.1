Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7079491B01
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420771; cv=none; b=GfWCpMAZ+swJwdtApACVB6qlyxvTy70p2x2yI52/1kwMaTMNmU8zHqS2TIk3kaL3KvsaeRCJTkJxWxKSPlBut2MRbhTOMhkAVcM0QOWowItK9nY5Y/xDjqPy9471uSvAYfYyAIXu4IH4V+pDFSeL9TJXlBYic+E93y+tzvJ+814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420771; c=relaxed/simple;
	bh=2TstF2SND7fE5Rmpoe3pXhm/sLFsTBxNKrPB1QGiNNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLXZkM9cGKiyBq5X4bL1QdTdIwbCEsg3yO+Ve0Uws0f9gUtEiM1WVTShMgDU1+ZjecVbPOROrYap2tmRdlAECEvrtBJ3aBfmk+RSStEIL8Amf3xhyng1PQZm3Ae+3zPZ6Zv+MWretjZdpEnCbq+Ew7dFl8gCtkgXSA8KLKorbyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9YrcygU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXf31nSw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9YrcygU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXf31nSw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0LSk3401414
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjCx6/yxQC9ysAu05r7/WSvftYtqgg6wz8K+mhMEd3Y=; b=l9YrcygUhwTOQ7Nh
	dIfPh1Rqcqm/o61WYYUob87U8BJKaWt5z9SDXZbf0Tf9HP927GzUK4JdswuzQAdb
	RfD7IYMit8s+zxKj6YllVlzBCj85G0FMpfkpkTTl/FBJGQvCLxggMMg3ighYdG9k
	IXaG7qDAa0p40DpRJxnb4EUOvRlXVnpgO1/Lx3PrX4yQmVjJs6hnIyEr3eYGJVVE
	raURo14CaXMdg4ucLH+u/YvLpW22kRoyfrkbamGQgTbg0NYLOKSDUz4FmT20Fc4p
	tQadOG6QiSZs880h3oO+NSHDrRFixU+RJkCpkHxdw7RkpmrE7rT5nB1udDc9fSby
	KZz1JQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1fqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so835759885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420768; x=1793025568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjCx6/yxQC9ysAu05r7/WSvftYtqgg6wz8K+mhMEd3Y=;
        b=NXf31nSwcnP9RQ3phaf5UZWRGK76MfRBluXp/ugnJpdYkW0nA/0yjtP7hyFK+XkNaw
         iN78/FqzmWY7o+y+vTxm6OgHHtIr+Ki8iRCa1sn2JsW7ZBewKIJp+EGvuHzScIOPs+DJ
         vOSYF8gc6/uUvX6TCkzVtWwIvPlqVXJ2xNDy0ufdi4/oI7nIMwBX6/F88oCPv8dCk2e1
         TDOlG3cSJDTMqBq/c7tW3U1c7Ba5Acf26B769pywwyQMdCxIpjTiepiLp2pzr7g81xt5
         jy3GsNFpu91SVvp0jlzA8OfnXfaKQlJrNveZ340GpAUtYS5JKoQoGNrLWmq1LNXqWxu8
         O/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420768; x=1793025568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjCx6/yxQC9ysAu05r7/WSvftYtqgg6wz8K+mhMEd3Y=;
        b=fMfafIhTkTooJe2oYehpJGbvc1WJIY4HBncUIdi4yKIxgazouzLKqyWmNYRH/ud/Sd
         Yl9+HlqUAYgEoGa5F+7YhOIsX46onDdM1nIYz/p8dniPLOXXfd7vJUwrlpJ/zgLW+047
         +EKAjPQyOc5xXgW41wfqD+EfUh1dyEDow81zZPMSKMSdQ/7HZfnMLHv7XWqPmLI7y0Np
         B0HUAkNDljOmkAxcUNIK581S5gc1oWYYA712hqd1HGCu7HzXfP3xkkFviJT66ezCob0i
         lziw7Q983hh8LIC/hzgPNQsiiwlPfg5zdJbhAdbb4memc2FP13FoqyNVQ7snyakAmMLw
         hmaw==
X-Gm-Message-State: AFq9FYIiH55NRyI9DxGZEaxa8rjr2uVodGKDy3Q6l91QdxivZDa5SEzC
	JV1wB9He2zw7FoDymE2k+X+eceiGgJSidhffxFOx+RkXz1eZjr3ncLoF3YnbckAPpu5sugVeLnO
	ZDNWm88mqASa5VFrM3NgSpzeTZoyPUnUfPT4yxY0wTrmg2ipdLkaheB591OaIRmbmZwk+
X-Gm-Gg: AYBFou055OY89hTkvJkp2M0QUoqmWOP8h6uVWMx4wlN50ZAc+waHs+lywmTXr6zXpxb
	QXvBYnWUeXiVeheOggEYoNhS27oSthbkVuqHLlJc9J5R10UVlG2mQKFtRVj4UBBZxQehwYxZhTo
	HXsxlWpfaMDiZM42tPNhb2BhmQeXaDFWDL1n4eNRTbjnGpCBuitySo5/WVpsfyif7zfVYfa/+2S
	ojwmX79QW6z4S6vPNH2HalSBZ7QLGAmoTWi7aoFoIGv0C146i24zCjE53qNaT36AzwSWI3wQ7TF
	lLjYOw/j+F9y3OtHMQ+qEo31pdzxalEDGVx3UAXzaSw/mzbf3GTpH5fhPD8kVIy1oNd310cC+RI
	yNmXSe4hMi/ui3Ha0+3YwYqMHweoUphUN0dhUAASadeC8VfFZTWpCZpoBGeU/I5ns5/9lgshgty
	eNLvLLdzN92Itz
X-Received: by 2002:a05:620a:800b:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f29dfd65emr1413395285a.81.1792420767886;
        Mon, 19 Oct 2026 07:39:27 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f29dfd65emr1413390585a.81.1792420767337;
        Mon, 19 Oct 2026 07:39:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63aa17sm2033436e87.69.2026.10.19.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:39:19 +0300
Subject: [PATCH 1/3] soc: qcom: spm: fix the SDM660 silver L2 AVS control
 value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fix-qcom-saw-v1-1-9c7ba3fc2493@oss.qualcomm.com>
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=926;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2TstF2SND7fE5Rmpoe3pXhm/sLFsTBxNKrPB1QGiNNc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iuY6bpLJierCag4dK6Bzw0D+amcMWhxQzKVA
 ekR1qbYYxOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYrmAAKCRCLPIo+Aiko
 1TCeCACYOrLf7U90MxlU0YEzW5lPoqIkDGGPtNFxF3pj25nPJP87GC1fQ0atHxRs2OYMOW6xNJr
 85es0hWWsfWFsDsuVqJ4FxC4jfvBVvdwjoYn89sx9qTKupzypWL7hs5vR38O4DEowjwQeQB8MiS
 CoG8Ovbov2o2JjZiVuEO9avi0ikZXgwt9dfrS8oC8hv7r5TxwciIYg3TtPjjAn972S1AEXxVI6I
 M6Ks0xiDGIuxc/I6U0ffFbFs2RyvtBGnNg0xPHIH+b+5/UYiui59bIwdptcw0mYzdK6JMjLaSpm
 chJv0Mos+ThFMteCx7EWY0+lwJiVhBBSdm05xyEtofSp+Gzm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX/rjtDMgQ0IqW
 O4MpKlYe/iWjdFAZzFcIpzCoF6yyI1GrfIdtYcfQ0GKGUR8AM7EUwl02Sp25AVn/yKfo38WcmhI
 Xi1w1sXH/O/SwiHXG+3mByGQbNJxQ3Y=
X-Proofpoint-GUID: M_TeyW_Q8t_G00XZCHBzwyPBNwUkHl6G
X-Proofpoint-ORIG-GUID: M_TeyW_Q8t_G00XZCHBzwyPBNwUkHl6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfXxHAAQcAyKmYa
 OV+IiJ2b+SBT6XrypQT7HuqsB8F/ee3ESotMARRJktpZb/bNZgNcWkT1ImxlC6pbI/J9RbX1gVk
 IIHJzzGLF3fqzxib7QSKaHurOARVubo6leGN4xrGka6tl6w/Z59LoFFNpnHcOevOk5Ciy1BPKKf
 o9ZnhZVlhDBd8KGyMRAfGkDeMBBz96/pHQlgX3wzT+LPmy1dnEsJnVGt7buBOghg7pvfyuNvC4W
 IJ9fR4hI1hGpCMNOqmhw+SYESOhf2B8TpK2Ugyj+MCw5sz4icH7ReNNz7MPDL2Fr42RzqfPRKgw
 pltlVm0tl4iPa2yjOPNhUki8TWpZjgXs3qd0V/qlvp+08zCq/mh49F/QIkjj0k6Vp6bCLRqVysa
 j3FAHKoRIGaWxjWhawhfTMCNmV9pfwFmUPrGNy8DxbESm1+I6qGdMQ1RW+zQsC1yrbpX1xEmRhq
 ZoOQ46U2cDLTp5o7j0w==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad62ba0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qlPoGPJu3atbak1x7WIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190058

The power cluster L2 SAW of SDM660 is programmed with an AVS control
value that differs from the one the vendor kernel uses for this SAW
(0x1010031), so the AVS hardware runs with the wrong configuration.

Use the vendor value.

Fixes: 13e72c3e2261 ("soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/spm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index f75659fff287..d41c94d32b51 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -100,7 +100,7 @@ static const struct spm_reg_data spm_reg_660_gold_l2  = {
 
 static const struct spm_reg_data spm_reg_660_silver_l2  = {
 	.reg_offset = spm_reg_offset_v4_1,
-	.avs_ctl = 0x101c031,
+	.avs_ctl = 0x1010031,
 	.avs_limit = 0x4580458,
 };
 

-- 
2.47.3

