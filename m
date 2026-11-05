Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877341;
	b=TJXS/cfNgNuvVMqKgNcOY4mkz/oZ1s8hT6U/MrQztKcWoVUL9ZyfyDP86IM+MfrRpkQh
	 8cQ/mvd9rlsIDwofzvdE/kPJ7zMEWfPa1cDsWQOD9aK2Z7r+/VA1LJAuQf6N1JixMbeGX
	 KYin1z1nOKAsZwCNHjMQZyWqa1xMgO85e+Vns6ufKjyqiTZ6/oIsuqaC9sQ2soCm+HQWV
	 w3WVTKxXIouAF4iNaqTrA8gpwNr7F14HLrXQYVdn2TAqo6pUEZyyXXunfwOLBb3/POSRf
	 l8xByvp5SUQovlsql7C8TDIw1vh0fGC2tXVzuMTeXVZ+vpp0SmhQFfTsg2L0wRntjEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QqTCl2uH9Ug0oujw89YxgMGvAEAk9LlD6OF8wpx+dV8=;
	b=K6QlF51VM/oqA5pu4Z9FCMva+on/UasmCyPFxqwylnhn6lYE/IrlWQqWfNzMnTbtKcvo
	 gjMCzUp0iXHh3bAWYvEwzST5k/yWr50A76UZ5I/qmWhofRGcbwduJ2W4XVVDAbqbNwnH8
	 +5/6Hc6Y+hBlPnhopzbMNfJFat84tNoOo4WAmqlLAAGpHdwoIrGW96EICIe/cucdspixX
	 Qbm2UKoqxJiMDLPrt9tnU+FNDuCKvM5MiaNvoJSXvrv06G/y8p5PQ6hD08zkr3XQUIZjK
	 qTBGmvI0GYx5QLEYBH9aPNroUx6tvBBTkiXsbtEIrKapEOVJfgfcusLm4uPO9t8M6Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUvGUcgS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDZKxJlE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE4606A33C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDE4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUvGUcgS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDZKxJlE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tQiE406606
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqTCl2uH9Ug0oujw89YxgMGvAEAk9LlD6OF8wpx+dV8=; b=IUvGUcgSdaufGKx7
	OaoqgSMnSU19wHd1z/O815kwcvjQxnsVIjHTA34GpO64dFHHiVy3TyaMWnbaKJly
	Qkbb7ytKqC3GCxiJojF44MR2kEtTpN8oIhQjxvUcpToUo52/jJm3fRDQ46atjSIs
	27YS2eWQmFXsjmVd8t2ZcUm8iBisRmo4hWyoggqpZA8iTh93NSKkWBk29aNYNGzV
	nK+55bDXlOstDN8pzaRwjNnhBXWBpaz2irj/z9YbK5C1cLO1eXIvyUDuzrHtFQtx
	fkg9QoWGyeqajlZWyz9uVaryyAXOLB5PJiC655J1R734RTSQEajMe/EqjyFjU4av
	ORgKqw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v16vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:15:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3627712eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877340; x=1794482140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqTCl2uH9Ug0oujw89YxgMGvAEAk9LlD6OF8wpx+dV8=;
        b=RDZKxJlEr/1QdzJh/5JV68b4/s6C4mH/VkN12QA4//JY8MHIUW/zVvCxHIAOcqKidH
         IE2wXcXnFYTq8YWaIBJ/jvr0Vgd2cBLnSitD3qYmS0v4fYrW9hiG4ZcLbX45QJzlZB18
         m0SkkdTgL3aNXDhwFTc5g2ga1hvIVTAdY+Dw7zWaRVyQCiiGr5CIyMhspog6c3nMNlUU
         JhFhpyWTrdIncZ5tRJPDsmU7KD5TlbVBIZmYz9TS8LiICuWPZeCTgLaA/T3OODsSO/O+
         E52yDjgNB96NANDMnhlrAfa2cFbm4+kDl4VGiX83fSoQVR08XtD9eKLmy2/GfV1FQ/Hg
         QpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877340; x=1794482140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqTCl2uH9Ug0oujw89YxgMGvAEAk9LlD6OF8wpx+dV8=;
        b=lRAeI6+toyQmt0FtB+rSPoY5sdkoj7plFvLqvlf897Uex5FqIRegjSPVVJmkD0v8oA
         RRr/ZkhQsGcaJOGo8DhyriA8OA4Wl6MigvE1hvIpafZJe6pVfnG0nj9Dta2lkdM1USHI
         DlRF+4emnkScg0XeykaMiP4WcNdJ4kpFNCLn8OtF/8bvP21j020NbV0UuAnUyhiojaAr
         Niwt2jmZZRKxBaW4V7uKLr16azSqa3zjcOlhP+1Iu5LRPT/PLmGdpDKQiLKG9Zw8turx
         lvW3G3wk4/we0D8zTJuAzbYaOx7Rwl7VPz/QAeMabvogMG9dgKiPVUqjTBSVqi72YWIC
         bwpw==
X-Forwarded-Encrypted: i=1; AKwUvBw98zD2vKbds4K/eWR09hIPGGgQ2KwilW20ijaLhT3OeyFpXkjRVwTc988izwHUojgXHK4e5XfmG2qo5v4E@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gxi/E9jo2fsnEUXWprHIImJTxAmBjiP+VZQEOmrXmP+hBYy5y
	hdXh+Ey2w+Nyxv5lk0C5MANMvz5N1/VHmlOhsELLBXAk7SlmnoZpO0HAx9uFL9Zg9pCwYY1DFwk
	dm1TqUrAKqG55HIT6/XqC8/1K3nsOK6WpqslucYwG1syrdS5jM59JiES7LDSEGjDPDfKh
X-Gm-Gg: AYBFou3uaKeElWluCwiwb/V6Bq+mGnzk6Otxl8C9LH901VFMWj0Ozx7H0YwSQNvyOZ8
	Maa+G1LX6Sxas2Ooo187EUw/Uux8/JOzkf5HbKFuAm+G31GMPdi6Xzco3syAgvQO3dWA67jLrsN
	f8RXLBHxRqledAg7blEqEXfK5K4cX4dR0LgtWfuBzxSmDEBqdriSfeznpzw9n3/MmrUn3CvSgxH
	aghtG1BNbd3Hs6GOMEtdmKPLeS1QSuG0A2alrDm7o02rs0HQK7uUiCwfSdEf7J1A0/QkQ5aombr
	dh8BpG2lG0KnrO/7sDcz7Qbwu6OnS/53du5/HqEFe67Gg2fsY9+SdoW4ha8XUqEKkJjZ+Tboyl2
	W/E3/cfddnnZ5VJGtsfYlO2HplmZZaBm2wbfFpmGIyR5qSgBMvIPVlXkcxUpY4arwjf44eyawBA
	==
X-Received: by 2002:a05:693c:895b:20b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-36a42389038mr27598587eec.18.1793877339570;
        Thu, 05 Nov 2026 03:15:39 -0800 (PST)
X-Received: by 2002:a05:693c:895b:20b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-36a42389038mr27598543eec.18.1793877338996;
        Thu, 05 Nov 2026 03:15:38 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:15:38 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:50 +0530
Subject: [PATCH v6 2/7] tee: Add kernel client object invoke helper
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-2-c7d68ce05c51@oss.qualcomm.com>
References: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=2712;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=MG/KeRt6DZYq7khoQnrWW6xa7jbn7FpCPMYbKhjz/hY=;
 b=uzXMOdWZhtoGqZHfDr8sER8R6AuhYYRfExYO3XIXFPnLcCYx+puN5AFg+qYlRxzmzpwiRI/JV
 7gIMoiDC+9OCWBewbhT9DX4RDxbMTam+1/+u7gDunqktIuZByjcMQZs
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX8KKS1d2ruXS6
 IP3Ib3UrI8pfFIxMa40ppUH9VzfpOD0wnDGMCoZ2KLxpzm65BNgyxFmDZFV2VE1UKSe2OpRVkYB
 NEalGUYftI3n8hs1R2Qmq6/lQO9qZA8=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec655c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX7QT9ExHdAG/8
 I+6qYBkb+fYoZKumTctpneSKLkWD2HlgmeTJ/YXGIJG/NA7/98r02EsWLAa6gj0THlSv8ErLIcr
 +r2TeBWWXTXQrMrDbQjmoHF8tRuTqw5+bH2Je3bmE2Mil+qrsP8iDMPDSkX/kSDmHekO4jjFwoI
 GeIOq3VsxL47z0+T38SGRiWJfV1u23WXDETcK2mA9yajHNiOl3WZToYbnM/19JyNaa+KRd9izJY
 bkUPRWYrqsvgk8Fp5TT+RTaNmGdr+wcI+yHb7vsxHBl17NPte/M+eerk1PYI2lK2KCoanyvWQ92
 QgS8O/ERYTm2jgNNrSuellcJ4R1PsBHtpnMCizDoJKmvliQfD0eeestjUJVppcZqThrejzps3G1
 bjVVIpYhMkEK+msBtDW2Djokb+hHBjVnt4q+rVuQpCBpI7gqqxj7Y6tNZn8g6H1MYff4EQoEJw9
 mu7OT/g02LbBjGSAl1Q==
X-Proofpoint-GUID: y3ME1hkMIF3IuuY_zwlfEKz215C911vA
X-Proofpoint-ORIG-GUID: y3ME1hkMIF3IuuY_zwlfEKz215C911vA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Kernel clients can open a TEE context and invoke regular TA commands
through tee_client_invoke_func(). However, there is currently no
equivalent helper for invoking TEE objects.

Add tee_client_object_invoke_func() as a kernel client API for issuing
object invocation requests. The helper checks that the backend provides
object_invoke_func() before forwarding the request by setting the origin
as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
privileged object-based calls from the kernel-space.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c  | 12 ++++++++++++
 include/linux/tee_drv.h | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 30901390149c..a03a3d645dd1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1404,6 +1404,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
 }
 EXPORT_SYMBOL_GPL(tee_client_invoke_func);
 
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param)
+{
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param,
+							  TEE_OBJECT_INVOKE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
+
 int tee_client_cancel_req(struct tee_context *ctx,
 			  struct tee_ioctl_cancel_arg *arg)
 {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index f3c5e106d853..369c87ad0205 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
 
+/**
+ * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
+ * @ctx:    TEE Context
+ * @arg:    Invoke arguments, see description of
+ *          struct tee_ioctl_object_invoke_arg
+ * @param:  Parameters for the object invocation
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
+
 /**
  * tee_client_cancel_req() - Request cancellation of the previous open-session
  * or invoke-command operations in a Trusted Application

-- 
2.34.1

