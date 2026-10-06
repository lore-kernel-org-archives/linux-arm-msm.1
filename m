Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6622425B
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269275; cv=none; b=b5/I49B0QY3dQkhfIeUa9xwGtWE7WidhiFnA/LYG5Jp9eTIjYmoqQjghlUmf67+p3yBwDuHaRIV/NSAb3vvorS5pkhzljnGemnZASZinyHMvq5QI9+Rx/xblVAMXd7aGYVz8E1bg9Vj6FzEQiZqlwUmMrxX2jkYp83rlaos3Sww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269275; c=relaxed/simple;
	bh=MPN/w4fd5TNJiZBv1aH5s59Vk8uQssuUdgllkMx+sZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/QtxUvL07UcOu7oHcLxdtO1lPDUzgtuk8VwOnbz82yP/STAC4zOREy8Sa1Wkhu6wU9bJNSpxmowRMTQowN4FTJv2Wq/F7mgCHoY/wLfJYdMB+A64wnX4RqssuVOTp6X929AQiaMq5dI0S3v69rCWkEpGLi192e8MvN91g/i+4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbEO/cFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+fHztlw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbEO/cFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+fHztlw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e4jL3902922
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 06:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YTNWcUy5uXfw5fcm4xIoTb6pkrtsUZy/boO
	3vBsoZfw=; b=GbEO/cFrPWAN0gxCRfLYavIkiXFDz/wuiQFIJkecaPdvlfi08sl
	iDL/YviDPfBtCT3g/+U18LN1suVP+K3fPWlhBgPF0Y87u+lu6KOddA2qT13hR9M1
	SJdU5Ia/c8FPHYDysunEvGpZU1315osC84WjGOpwYB0e3P7PL5lpsgEgIprYRuiy
	d5qf3O+aVTTFsg5d81o6gUlttwdQLXMDzJYMCKkBux/zWjOxL3kk8BK6xHUcmzck
	pT10FQD0at+h681FA4Lp+7eNj44qRKkKuFYvSGs/4XZwRnAZxo+cWSOlcHCXgXXA
	FaXuEtucDyT09lkFXaRAU9O1YyZ3fIU/8yQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dv1sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:47:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc40759b2so533176485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 23:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269273; x=1791874073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTNWcUy5uXfw5fcm4xIoTb6pkrtsUZy/boO3vBsoZfw=;
        b=R+fHztlwGB4UMi4AfMum92nbTgj0/c7sQd0pC7oTQUtBbVHbmwoDqk0j9NwqnDcJmC
         akiPrGYto5bVtH+jgR/gg68X2op6XFQPPqlPFhQuZFCNOsKh7myBzmI1XyznhADF/y9W
         13RotskON8B4G0y2DTK7gMsNR/XLpsk5TomIMBVQSYpE+EuvJP8VESXwIhQiIUPCl2SN
         7ukLIMiZU8oRTW0OIhUMHRVbbMbTT+iVeuvuDEC7gfO+y8rXH47x/0TMEUMY4DioTCwW
         icoMfTtTslNpsbLpepO3CkVMkjnAeI/Ur2OZhQ7R5aQ4ZuHvo7aTlm9+AToOtv56rVQI
         z/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269273; x=1791874073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTNWcUy5uXfw5fcm4xIoTb6pkrtsUZy/boO3vBsoZfw=;
        b=soFmR6ZJiLDvhJmWSfjHgSIaXL42NJn0SE/6B+vgkv3o1lInjVZ9/xKgUr9VaVhBGW
         KAHNUdR+B2XocCCY4F30xGZpYoaX6XYZl6ThqDB6Jrm4pmomPHVckc0j8gLeh+UM37jg
         RhMX1qKQ53/pCTxdkWAmfknmFiDLfU8HhC32fFGO0XOznNYKrAYQYY+xDpfZidvhFs4Z
         jQ8vherLStwh80+qXSGftSQVSql2NvYxozQJkv1FRKPw6h6ju98CW8XS+II4lKTGFKYT
         cMBcLT7aEzS7rjSHepeYZbdyJtaaCFpMN075rDz3dnTRKA+YZd/P5UzPjJYM/u1R3rCK
         6s/A==
X-Gm-Message-State: AFuF++lDxRH4oFy8oVPh9/ZeVcELEtsy5jAx3J2Gm5oXxSTREGdiMrXq
	4oQw2iz8IdYMk64hV6dysPkArzlZDRWcSG8eLVcEswWVJg47L7op2ayKE6bnhnGLiHfG0ce63w2
	AIKN5GKGtI8w6C/eSGlR2SwAIGWuD9rMG9v8/mC2D3xIisS+Q16MSnlFlp4ex+Cp8xerj
X-Gm-Gg: AYBFou1ujD3C9V0mgnq9yaGAIDwTz3Ef2HrwU/Kiqz5KHuFo7L3LtAwlqE6E9Rx0xAD
	UZV5dT+SoaMMpkZj4/mcO0s+OTjeqM17D8fyFb27vQVOqLYoI3NtgvV1//hoSgY2jnyz3wLsa5k
	kFPH6iKTP9612qT7VNeGYgNRUIKhgu7/8xOtYIZXxz/HsrcQZUUHk5QmtV9ythMHTNI5Ni6QGm4
	iV9lJnJc9If+8PrYOyBmVWbuDLQPsAhvh6GyiN5ApBXtNv13TydftH5uPNKb+CFeqXgZz1jD+Gz
	aEtW2IcsFdr3stPj46W/06J9uYvF05yDbli4mv8c/0MH2j6WsVUSYxTyK3U7nx6SgzrER/00mUN
	wNyDBC+xHk1yozVDWM7Tsd8Vp38VunvmSpv+/QlAgz8/O
X-Received: by 2002:a05:620a:8084:b0:93c:72d2:ccc0 with SMTP id af79cd13be357-93e8f20d503mr78344085a.17.1791269272512;
        Mon, 05 Oct 2026 23:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93c:72d2:ccc0 with SMTP id af79cd13be357-93e8f20d503mr78341885a.17.1791269271937;
        Mon, 05 Oct 2026 23:47:51 -0700 (PDT)
Received: from trex (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd7c2c6sm1189326f8f.54.2026.10.05.23.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:47:51 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        andersson@kernel.org, sumit.garg@oss.qualcomm.com,
        konradybcio@kernel.org, harshal.dev@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
Date: Tue,  6 Oct 2026 08:41:49 +0200
Message-ID: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNiBTYWx0ZWRfXyZdxNRsX/vN3
 N/NtNZr4G81IpOw95lUUHYDgpzxtZYazCSqFOuKFow+EpFvCOGMNXfxA1ZlMUIO68+txERf+gDf
 VcxljR3yYpxJ7+Gef3i7RNp/yJlJjb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNiBTYWx0ZWRfX//U32hlyr7sh
 OL5SJHwhrNaR9PveAOdLgIdc7QWvmKi1c2YLoBXnXdkvlywh2AE93goP3ElPmpqs3frzFjNOxG6
 Jm28siB7PTxxCJpXLuiyemgAAaNWZiwaMMGPL4wa8QAK3foAK8U74x0FKurNQDCQ2o8goj3Qp6G
 yE9N8rFcjUzBTqckhkCI9p4X06CAdO8MNbcIvt+P5JzshgQMU/vsmUWJMJiiBBpWdjoglJnsk/+
 eMeJHlEcDBuFPIxd/Gn2Zw6l/nvMRSh1K+IBrfK5RU6xezwMtptzDpATZ9uHz09+RC0NfXO5wns
 x0d/Kz+XC9U5BPVT43T3JAt34dK0m5blct53/J+oUC/DWOu1k2OXZk05HO9EgcnJAzy/vo251nC
 RGH2ueHOqDUamlD85WuNDzRVVD8uBqUv+PTkoPhLjCc6DCjHHF/SnG6E6rC5jK2+GWACshF0RQv
 DxMKQGS+VsXsT8jdwIg==
X-Proofpoint-GUID: 0xhDWtWnjxtXixsS3j18ChOwAcKRFVO0
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac49999 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tEyIeYPr_htp-YW85GYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0xhDWtWnjxtXixsS3j18ChOwAcKRFVO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060026

Stopping a remote processor clears its cached resource table pointer
but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copies
from NULL when the firmware has no resource table:

  pc : __pi_memcpy_generic+0x110/0x22c
  lr : qcom_pas_tee_get_rsc_table+0xf0/0x244

Zero the input size when the table is NULL so the copy is skipped.

Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas_tee.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ac33a00687aa..a52a7df385ff 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -230,12 +230,15 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
 		},
 		[1] = {
 			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
-			.u.memref.size = input_rt_size,
 		}
 	};
 	void *rt_buf = NULL;
 	int ret;
 
+	if (!input_rt)
+		input_rt_size = 0;
+	param[1].u.memref.size = input_rt_size;
+
 	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
 	if (ret < 0 || inv_arg.ret != 0) {
 		dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err: 0x%x\n",
-- 
2.54.0

