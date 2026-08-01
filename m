Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83984308F32
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785566706; cv=none; b=kZxsLe19dWFsGy6ICX8Z8Mz5ieaYxhEfvEast7HWqU5G6m8JH8DfAa4+qjZ9KXFSvyqeOkgHIJogtlVgVb+pSAOB2mp0YoaL5aENDBHUMszIwrfUiGw+GHLif8Cki18MnM2zKg6zcKeZV1A9+nmhRZpit3vMNmafeuZf29wEeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785566706; c=relaxed/simple;
	bh=Talog+0/N6j8EQ1PakpJ6H88zNB0v5H7GMdas4bX7vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txcgIIhgMEz/e+PeRBbb+VGbgOJdV/A0W5hlmRe/QJmVT9V5DQZQIjSMP6pKi3wGczzNWzS9VeqS/OqlBv7ipIZ/5p/LSShff8TJLkgMnHF7v2gJrQaJVFHLC74Cy17pwNXXHMS2IM+vqcUPEdjbKBrhy8W4tgLPmBiDjGQmdOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuSHQqp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTIoERBQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuSHQqp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTIoERBQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6714lmcq1776039
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 06:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gy//CsWuz2yFFMSMOowYorOjj1Lc1O2Hpen8MYG/G6w=; b=FuSHQqp0K8t1xWMM
	UdLd1dDN4uSn9FjKY7Y3blIoeNXY+W98GamApn1MIFeXBaXWTp9fhOCsRClKJo+6
	oJzvEoXv58v35yUjoPhRtAji3i7istuf38dS3jzzbZ/Pi/pFNN8U6niX9FeMZCMC
	A7QDVFP5Z/yD+xqairo6gZDlw/Z6pLUvEgsFezXgh4fD1XXpRBC1CdJSwjdbrtz+
	5IVFS0e1Otn7JeCGoYBLijshCC27P9BJ+Eid2EC39RwDSt6q6/Yfwtg31Y9/XULX
	kjrDADMxrLnBfBJV8ocToQg53GdEtTWflUq8WZSZswprTdUL7zhOT1V7mKWbq1E+
	kZlQ3w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa3806je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 06:45:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso2188765a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 23:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785566704; x=1786171504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gy//CsWuz2yFFMSMOowYorOjj1Lc1O2Hpen8MYG/G6w=;
        b=NTIoERBQ3nOTRLljzIAvhhsKiHq8BXrSachG96waxR6XpMWWwbBJ8PaSdfSNwxJkwM
         G7dlIDAzl55B3ft1IhgcUQ7BV1ddNMgt2Ydp/ps2GxzriQTsCYpLoa8MrV3YLIuw11kr
         vuu9CxPcKC8zxPY2lyPUR4DU0zeZNA3h0ozOyf0t3T3PaEfKXLfGCFHbRLl1Pj/IR/gI
         WwPTra1DA90sFYbdLnaLrwkNkbk2fvrtE6WwvTzX/POJVfVUta3Frshcn0SDmSunrsl6
         eZ46JIqVZMbyNBUtY+t0gURLKQS7b//EQZREamHyYpPo/+HRi7wOAM7xRKUCybPssxjV
         4kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785566704; x=1786171504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy//CsWuz2yFFMSMOowYorOjj1Lc1O2Hpen8MYG/G6w=;
        b=Cb2fkURvDE3gwMI7Ey8IbUA6V3u2Xt3ItKx2ojdoVJKAFC4s/Q1sh53cOnfpLNCSVt
         QuWu+lEbZs5uawbAPSh5WpkG9Rh7xR1/4T0KuKvBXFCA1bn+0DFWchUShdv/oFbkJ/6n
         x5/ha+OXJJCgZQ+dUkRLsPauUJCxcjALOBmsyIIxM83Kohyvm976EqRM9o1TqnVdk63i
         OZa32jCT3zmlLUNBiyI+8zRlkwbC0iELqCCfX1v4hLczIVRM/BwDu2xc0H4Yb3uvx3sZ
         9BzfoKBZW0m1VPKVck5QjtjRhP/CngOFkibKySR9VAlwN0cx+d+hEv6UCNb5/Xg4MXbs
         t2xw==
X-Forwarded-Encrypted: i=1; AHgh+RpsHPNSngmoFUHREm58eDesI23HszBU67QmIMEHVV5ff1U3KKGXNqpklf2zQ9ZyoofCdP2pzEGi4ifY51wU@vger.kernel.org
X-Gm-Message-State: AOJu0YxX/hljcCK/zSLhq4NnTKBgliFlNDRkOhJexc5f0eWgGJ8VpYx/
	TS3cWzZ7Th1s46ak2ac9BA/unjJlexpHVenzKQzywl2SLlDcOmKxpQIwTNJ/D8dhcQiWpJ9L/8c
	1E2riK9v7Gz9LIxQC6COcwapDMQYETkVGVqV6QBSpbbhd+oloRLSQM8363OpuWLdKS990
X-Gm-Gg: AR+sD129VJtvj2TlVqqsas/iXZhBBQ4aecplNzueCcOhudc2dpiBO1WGRN4fr+0PHjz
	0+swcH2iiKwBVsw7xHW/ZtLa6h0+HGKzds7Obu5Q8sSzQp6LLgXjuewOCxIkbCSr6fFE+Nx4vyM
	d5o9QYOFnZGiYZTQ8smt3VL32hZeo1CyA4JYvamD//VkAWBTmyg2yZOMfVs4Iyt2Hgxx4KQAcUM
	bN2Cb6lPv9VS/EAhiH/tlBkaXP23n71iefypiFs75SJDjmF3e9gBfz77qRMSb+5Bker2AQr1/H8
	F8bdhlBjMCzHRKJY95/uHntphaHX6GQYQHRaCcEWghpd5U9b75vEgwdj6sGq3lMn8G2p41VPleY
	YJ0GnsAD+cZdh17cqVCNfW4yitFpUSzc=
X-Received: by 2002:a05:6a20:2d26:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c92a793ad0mr2620692637.28.1785566704220;
        Fri, 31 Jul 2026 23:45:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d26:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c92a793ad0mr2620658637.28.1785566703776;
        Fri, 31 Jul 2026 23:45:03 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm16863759eec.13.2026.07.31.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:45:03 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 12:14:48 +0530
Subject: [PATCH v9 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-iris_multi_slice-v9-1-bddf1449c280@oss.qualcomm.com>
References: <20260801-iris_multi_slice-v9-0-bddf1449c280@oss.qualcomm.com>
In-Reply-To: <20260801-iris_multi_slice-v9-0-bddf1449c280@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785566693; l=1459;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Talog+0/N6j8EQ1PakpJ6H88zNB0v5H7GMdas4bX7vU=;
 b=PW1aiaMjR+2fLFDCo2MWppwlTXu0vjtTDyfNmmOBdiCEgYBs4yBBmCX7qmQmEJ4cL7SMbPn4h
 267nikmztr1DRkNWcT9QVcvnann++9YMEVLk8XwA2XrJF2JmWW2tyf+
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6d95f0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA0NSBTYWx0ZWRfX4YVu1Zi2809g
 KWxYLr5TdHG92KZ8FSOEnhevRjJLYROs1oHA/2wamZdA3s/niKctsQYAS0SIFN2XYkds9JnQeXf
 6FWo+0tQnlJqj+37yCT50GgsueqmUfA=
X-Proofpoint-ORIG-GUID: 9hgdcXaWFsAmzovrXGcTMnfADBSuq-H9
X-Proofpoint-GUID: 9hgdcXaWFsAmzovrXGcTMnfADBSuq-H9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA0NSBTYWx0ZWRfX79wCoxgNcDvj
 1OU1Vp7HyUjwzd86hzWloAEoEBoyRRpOyg3mXR6E08hhJnLpQgiiIZ8O+VazPo3wRVONx8WN6wP
 Qz0mZwSmRlhB2HNp7kuUrx0RoABH8MQWqO5JltP615kuZp+OH5zoLJfd0g1wBaDeCuUTvH06R5E
 /N6WLv0fml3Q7LNtQEFEFQs6RIeg0UTV6vmSokfIY2wdrYsMw1/HRVvmVh8XIn6oocUIXvyrDfT
 rd6jJHJSYg/vyWQSs5H8TBUv2Dw807/ta3FDRPYHK+mshtkfTzt4xldzV+UlC1H8g/uxjLsQxPv
 X25QFOeNNTL8qukAJn5RQY8xj8SambLxmYgTYq/qtj5prVJV8W6RNGLz3e17L1WQIWNSz698eTN
 q4347y1/dyic8WSybOovgqP2d7BMRbnaA6P0gQvrzlL2vOuc30OZyJ9E7b7FwejZ4Ftb4yqPoE4
 c8nr4YSbpv412p0XJRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010045

iris_set_stage() computes work_mode and sends it to firmware but
never updates inst->fw_caps[STAGE].value, leaving the cached STAGE
value stale. iris_vpu_enc_bin_size() and
iris_vpu3x_vpu4x_calculate_frequency() read this cached value, so a
stale default causes them to miscalculate buffer size and clock
frequency for sessions actually running in a different stage than
the cached one.

Update inst->fw_caps[cap_id].value with the computed work_mode
before sending it to firmware, keeping the cache consistent with
what is actually configured.

Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index cdd02328cb71..14e0bc06e1ad 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -525,6 +525,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 			work_mode = STAGE_1;
 	}
 
+	inst->fw_caps[cap_id].value = work_mode;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.34.1

