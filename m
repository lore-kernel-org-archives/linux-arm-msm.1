Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209247DD6A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455347; cv=none; b=oEmGRwNTOSiVhol6WJ0X/3HTPZKUcnXpkKHdyNHIHwfGpTR6kIathYrYdmKsv0XWGx1ivVFkGEo1rW0baucwiU6VzgcdXH6c4/cgJPGwhYarQ4WswJGQUbGFHlEx8wgiMEUcN4Kni8zRQsNWmK65b9IgkrqL2vXLsYy9GRNf3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455347; c=relaxed/simple;
	bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5HB+cODnB3n2ru468vM4Ck/eeJP4T9pUcVWKYpsljhtU21CX34EA/pFm/jAFVs/uX73wj154trKgO2qQ7JZNJiaxSJSVuevBK+Od2FRctyw82k9LQGYaaluORj0Tc8z7I0LWOXrQcCmogPGGIKpfXMuazAOZijyFryWKaB4tXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHvf1FH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUHVpBms; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHvf1FH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUHVpBms"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMraeh2206435
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=; b=kHvf1FH0KiQ0MiN8
	b3wurvP5GrXawjIoisfMcXQdMPnaIWz5zo1dYEryyua4Y1uIOg+jrozC2FsS654q
	z38w5EsCh3nE+hY6ZcqluJxXRzPVeKcr/MVWW7ikYwPWpd3KinJbnFD8XqXXw7Wc
	YajeSb83V62FJalLJCxUBYaZhwqCAw9BxqS4hbyv+hji9BY+1C998+kqdBIgpDq7
	YJ1jHfwSLX6wQkOQta5dLY7OWHLfrHAh1IJTkLligYqVV6Li0bwp1lawYiWQxp0V
	FuPjy34Q+qJJf7qvncReymSl35bPyYLDoueOM4KWvcJRMDPkup8XCMk8ApLs9HBL
	nePohA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfrfr4qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:49:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so4515301cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455344; x=1786060144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=NUHVpBms35ro9jXVPDFjl1SnfuqOtakFd+B1MJ/jFpA/w7BVhS0ibK4EXnbIzVEPQ6
         M0oqmaUpJiGziFtKlO+bqRdIgFJulVYlGbxdSC2rKlvmsaAkd4OhwbWQTjNhDgueatRt
         E5SySWoiIDwngt82LInBIylEPZhK7w6xeXRcuDNWTkGBqrFqdgBsaiXHS9/riP+nXvRE
         My4/wub2/VZZ4bBY4s4F8K5rzG0hvFK3t3ztCbP8wt/RENyAhQHj/pc0V6hUFn5O6jbr
         78QM4UUJYEhvk7Jx7DqQfhzh5jzLQrvA0QIj7vVvw5CzXk8aRpsD0eNvoz3Cjax45X/k
         hviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455344; x=1786060144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=rPUEbRNUPPnmY0YhcqQQIwJUumFVfL3+EWG4+b9qdvbHoqFQUlQKZwFfmRjGtlyozB
         fbQfrT+lXZat2/AUfUEvhtXtr3C02Ga28ZAMH1BmG0yrC+PF/ieczRFxBAdKJe5s2LsY
         wv5Gwi+PlaXnnaPkFvHmbAqeWA1f53kpNl1uiuSKaWs0T/ljpOZLRaXAul5z7vru8ym9
         snmNYelf40o5/QeiN8sPDdWNC8XXeOLkbOn8OIvxizGhCL2GKXQBPMiGuOOcwNHJ8ELi
         z1ilYxRdiZcKbvV87gD8ubF2VfUeZo3U6ZQ2DSAmsz7E2WRBua6kHxn9aWf01K3UO9iw
         ddlg==
X-Forwarded-Encrypted: i=1; AHgh+RrHrqQLZgl1qr61J+PxXf+JMOtU/czqxiAPhxOPmr0QF0iy1hjaVKMEyy7iuzMERbUFb14zLC/EvpA732Vm@vger.kernel.org
X-Gm-Message-State: AOJu0YxrTA4IteyHYgxH4zrYWPq/wnqvF777JgRFIkb+gSHIecH2Nq8W
	bE9iscDyRNGY2EQ+QFXc7wE3PxfhSJJUYnLzPF4Q7S/ryjBDjhomneUqg3XqvL6a6UStjGlz7B6
	diQz2mPT0j7VUBK4ZXBddEMBG6gHPtdG6mpqeS1QMRweM8NUZBgFczapRNK98m5mkY2W6
X-Gm-Gg: AR+sD13A6WoyMq6f2uoO3f/VlwsSDR/nFzFpVcE7HMO3tPsBi3XJYc7BYb0YwyeHt8d
	wZZtW0UL+6OmKaoWppcrcMqgS3nyK6bRHyolzGD+lrpg7GRO4obmBUn/XxQl9/H2gWjqZlQbdW9
	cKMNuLtfitl5IsujdFyvN/SC3H25DshMFkS2Q07c7bkDYyo4CeyMsCRktnA1GZbFynl10WUu8y1
	rs7z0K5z78HA8+own9nJzgr9JWhexTh1afXl8x1+a3I0JorcVGepalZpoUwBdGbp8+HvzGn+yoi
	Q/MbP4ViJiy+ppoQDHLW1B68g9FaBBx52eBd+kKyG47AWhrERAUEQuBKwQL9xh7/AAECMZ/pgSh
	e+zOLIwnL/sMse4i6OpMFwl7sObuB4xyFB/tVsBBGk2y8JhxsiMOlViTlpI0tPQux9yazXiZONg
	q/d49fnwJllpZwjw==
X-Received: by 2002:ac8:7d56:0:b0:517:9c91:6246 with SMTP id d75a77b69052e-52b38662c50mr49006481cf.44.1785455343848;
        Thu, 30 Jul 2026 16:49:03 -0700 (PDT)
X-Received: by 2002:ac8:7d56:0:b0:517:9c91:6246 with SMTP id d75a77b69052e-52b38662c50mr49006191cf.44.1785455343358;
        Thu, 30 Jul 2026 16:49:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:49:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:35 +0300
Subject: [PATCH v9 14/19] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-14-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3581;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LMa5uIoaKewqRN858jj7TAIuysHB1Q7j152
 TGLnialSWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvizAAKCRCLPIo+Aiko
 1QnNB/sEmunG4VJkNl6edsjy8QgPPDpybKp7FVj2uO7CDNLb0Rgcg4ryfaviG/py3If+fTwF/VS
 QsRF7xvJNQb73uRd7QP0bgYEG9rtP3WpL1rpPywZJxXF0vTxbaxKaoiCu5oZFlhU0xvTBrhLZsa
 32wPUHQ9cus1a7zmGAf7e0F05E+GYgIf9UsF0JVoE/1Z59eFPawerOEg9xHJ2a1qynYc4EiygUS
 1nta9X6YQ4CEVsjeRHYd/jOr2BbVWyS6n1tWu+nO+SH03WbkxnHu4RHR4oUb7N0uSNkALvVIt97
 AHRkUQG8QN6uk8EAzjlRXmSFAq+IYsa/LW4VilwfdASH7ffx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX6KDlVghPsznM
 JAdpgmcXZQ1pMBrGTyEjYrYIi27GzsVC1+iIkFeT8Qc4zN2TBxdRQZLCOFwj0yt5XyYMn9LBBuK
 Ehuii6yuNBH/ywWRu2YW2M7ZLeccw88=
X-Proofpoint-GUID: FtmgtVwpnAL_IIhT3g3OW7xXi3iNnF_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX9AyZbDPosUn+
 K/rdf5Xh38ZicvlMuy1X1HZX08ILNQF7Kb5IDe5J3IDgUGLvUyLMaqMW6prTVt6TgkP/atyx8h6
 Lyh5vltiPLYER5df5WzkLgqhJf8xjghl0aUdDkFa7SBEBFda+TPQ8MrjJaqVSe/KTfFgLncefOa
 k+UsPnP+FUoAjrLA1BUFoO9TteqRgZP+tPY+zaltVk0sYJSXXap99cZOPBPVAaD6tBkyS9fsukU
 Vx16Q4b9rITJe6OQrrlc5jBmQmcPUgv/Fyvwk/1UnAvvnAf+3vg29hYR58Z158ctr4vngmsrNAS
 O9V143COylpbAD5SVXTDM/KiOr3cwAQpRO8aeQF7tLRvEwwjrkNVefqVhEoAy8Csn9hiEakYwjX
 B04DvVV8eOwovpLyaOyIDjceC6CF9okWCgPitYHAdPGHmsRgSzY3sh+UsmT3gCAn1zje9KWubkH
 kqd8EI923rWVGudKiXQ==
X-Authority-Analysis: v=2.4 cv=N+kZ0W9B c=1 sm=1 tr=0 ts=6a6be2f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: FtmgtVwpnAL_IIhT3g3OW7xXi3iNnF_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300168

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 76 +++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..7ad6f0bb4677 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,80 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return BUF_TYPE_MAX;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == BUF_TYPE_MAX)
+			continue;
+
+		/* on relevant platforms hold_count and min_count are swapped */
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (pkt->num_properties != 1) {
+		dev_warn_ratelimited(inst->core->dev, "%s: expected 1 property, got %u\n",
+				     __func__, pkt->num_properties);
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +731,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3

