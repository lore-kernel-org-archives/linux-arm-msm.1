Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D047D937
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455345; cv=none; b=MmYfPttgCZm1Qgnm+1iQ9l38LNW25D3r+uyw+Q2bqvosKmT+jTtYQgqqPsTJEJca3OqmMwlKSa6ahUntcrkpYR4ejyvVjG5gTeSLhu/mF/0VrhFslS/FPSxvpwTg1KAgw3v3T2ZbANusujlR3p0Gkz/DvmhehORjZaaoZ1Xkmqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455345; c=relaxed/simple;
	bh=Gg9iPDAjFfgIzLpyI46MUBUdqccwqP3lg6opdo6zSCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=esKFnmSDfvIVIJIEyscSs9XqmpEFOknB4XZupEILNxDK/ZCcnvjmntoMqvI9+PqgXmY4Hwa6u8bxCQI0t1SsBgiZ/KGhyhhiHm8t/S1nwBut/9NA8PxJSpyZpO4AV2lGSmSCOTU7X3kfYPkqovt7fSe7qPTHGNLBU14PJobUR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/jWFRxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNxMnlCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/jWFRxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNxMnlCi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UNJJ4j1760873
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNV8r+3D95mRhh/1Xz93P866EBGrDBxQgjelh4q/yuc=; b=e/jWFRxXspFzAsgq
	pVQKT367/CBJ7H4S4ZLXLTzsIPjR3cygghggtKA1wMTf5A0QUiIKxQCVUaOGbSTJ
	8h84vHZz5XTe/wQ+9sONsw0af5sCmW+J684uC9KYWgvXx+aLUGVzCad4dM8uIZbo
	eGGcpKaWD3dOpdZZQglgdyiQgTOW/Nph+7VBnHkj36Y1VUEfxM9tLYRNv5lmup79
	tmtOeNKYlg7R/uFi/Ivur6SP32UQjQdQ/16PM1Wf8iacoDZCRSXxbs01sB2sTjxa
	+AtsanPmwJpL22D44wjQz01b0+RpLgFOzHvqH0ZUrMI78Dz4ZEDpbx9SKWcur+gu
	YgRmbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frg5v82kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:49:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso3080121cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455342; x=1786060142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNV8r+3D95mRhh/1Xz93P866EBGrDBxQgjelh4q/yuc=;
        b=cNxMnlCiA2uyB8pyBixnnQ75aOP+Tam+yuidVhDflY0apFVzAW5Lt7hr+EEg+fl7ds
         7f84O+E5gIuqch6ytHMzJgAtdpbH4YxLoVMZxvX6kUEWoTvVyAtZxxCpf0KjBA5GNW18
         xIcGENIT/XWngQNnxeBLppHZ72CEfj7sGaToVPs7vRSVDbbyrFx1yH5AslEkWC4JaqFX
         6OBD5tlfMW5P28zdEgj4M1atGV9htuFWdt7Kd2KiGnAbUayhCZ14RZimPNcAHA28Moy6
         r+Mwqlp/y9tY+3bu1DP0OLIhBaNqxBp4pXrYHN+hFBjAA2v0ExTDdBmncYQSkC71CuZ5
         V66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455342; x=1786060142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNV8r+3D95mRhh/1Xz93P866EBGrDBxQgjelh4q/yuc=;
        b=tFQ+QbCw+geA0JecOZZqfY4VbTIJJFoNPuygxdXd284l+jIfZewS1a6HW2AVJ1UCmI
         EtEt7PU1njZj39wIAdanzX/9g4iWNiCjE2IaanFFBv70xs6PZfZy3eMuPa5nWVK5YvLA
         hNK4pH44hBaaR9/lOMUrCX1k3F8ijZJDgT4QK+dulS5gSbTTa8yarpYP+ypwxV16bC7I
         rqrVcFlS0iuCYVK4LdVUfNVrAQg9MaLPIJGwXBib/NHEQPeINLyl7e6AB8niB7WOq0K8
         09OS420ee0JNoY5xEuCh9McsL3iF1Bi1Kv9y0/UfJbzIhsOy7dhRc0Hi4OBw13o5ARCM
         of7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro74RdkK2AC/g1x6W28HOF7BLSyAm5xxT9euS3VWD9CoZXkKGbhQXZGrBL/+g4xOm/UcuXB5EDFopBlH2Yr@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqodQpSmEsF6CErjEOsFBOzDgDihhBdtLRrhctt34Yc3UXlxX
	hW99kKuQzZnytxO/wAcUC/Sh6fNfyzYJR45OmkYGGuv6nYgqmieq4PilKQxCe0BS9wUc5T2WEbB
	6+MT49EsOLPMJLP+x+YsthUGWOfPw0snfwVVtJYi2pHwBz6u0XbJNBHoEEExbMT0yBuvj
X-Gm-Gg: AR+sD10ZcLK1x401W6H6ua8hqBaLT1rB8WbY2AONOYsBJAsiQv6hoRPnn/APln7qFXU
	yG5p9XaTr7BBW9pnNpyo4oTZ6+os8EW6UXJ+2kzbn0HR9oipF7yI/BFCSWj4XANCHF0w5se0SiY
	QIEbtunjq8Kgp2msf0rKAxPKjrba5Bm0ykSa3+GZfI47rZdToaTpc+HDD4g/oOhKwuQ6WMxVsuI
	mNTufJJChVc9snz4zG3vhe3WWIr8pBId8jTF+f6NZE+it6To6RUAEhHIpelBnRATdN6eKeqPi7D
	0/rioJnagpxmvoyqWGlwdrRebmULLJii74InJojX8cmKJvShpHG5ZWsw7rqlO58N4jpg33RTEDA
	v+hNkrZP/CdNVNvvIIl1wvQYsrzYjVbFEN596boK7QEPYivVHyD6W78FkpmNwrEi88Xb1qx7+a7
	LU1IaE5odkTzXpCQ==
X-Received: by 2002:ac8:5f91:0:b0:527:a5b:ea57 with SMTP id d75a77b69052e-52b38735a25mr49701371cf.85.1785455341542;
        Thu, 30 Jul 2026 16:49:01 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:527:a5b:ea57 with SMTP id d75a77b69052e-52b38735a25mr49701071cf.85.1785455341068;
        Thu, 30 Jul 2026 16:49:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:34 +0300
Subject: [PATCH v9 13/19] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-13-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5856;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gg9iPDAjFfgIzLpyI46MUBUdqccwqP3lg6opdo6zSCY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1b2o9N6MR8l2Ze/nBkk1e80+VXhnssJ35auvKn+28blP
 NMckyWPOhmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkeY09v+pHb/az+z6m7uk
 x9H0wivpvnzDnEV1Hzc9T/A5vPTZgfwcmeoL1sFRrz+FJN2OCN/pH6eSsf2KOM9PxuqPBedLPP+
 JcTDuWi94M9qxLvSwlfQ0253i72JKg5zU6/rPPtVIOy85VbQj1ys1OE7rsu3CerG2ub76dbIlhu
 s/xYns6w3j8DHXTeFlNv3X1W6y6XXGyqcX17UKafistnk472DOb4VVR+wiHh7KfJ5i/fjoJxdL4
 7T3e41azqrKTH2TFZXiYfJnjoyD9dSoHes2nryhIcmlIiEZ4FdvyftfSepET/Q+MdX0wp0n6xsc
 CqrkH63LOPSlpHten3ZL1+aN104m702PfO3rVOlx1bcAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VRSw6mbMkjDGsTmGkjxVz6Yzc7Y5RzWG
X-Proofpoint-GUID: VRSw6mbMkjDGsTmGkjxVz6Yzc7Y5RzWG
X-Authority-Analysis: v=2.4 cv=JsbBas4C c=1 sm=1 tr=0 ts=6a6be2ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=O8_DsgnrxEnowPJBzLQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXxTEHgnH91iNC
 An8D/bztsxLBswOwyE8Ajx8dA4+HmrDSEWgeKEQ2Zvc0w1zuwEj//39/cJXbeDAzGvfAZWGbk5w
 5jRzbeGKUFfaYDRgGF9Jgs0isihgd8zgWUG8AMm4/KuMQXvvggNPf0rUOQtWIVFuu4rJfMI3/ka
 NmDsH51ZiE/5D2XdU1Q8Mn7QJMSNz1jCBbeh2pvcW8RyEUEGktaa8VsHE8R8FWeZ8zeD9FaHeN+
 TpORpeoE/LmGgEoO5wz1h/w6uT8+YRBAarcSpVgUsAlEG8Aj/55BgZ7jIiSe4H7F91Zxj8sPWG+
 /NsufjzgXUGmWNqNkx61df/GICCumIbhZSo1VAayOpqV7vc0zyvQey7vCUb/eXcE5x7dX5D6B4f
 Tt+lt9bgvFiqVMrbRdtrcOwQsWS9JpNNNj5oHBeMiham5cGfPf460SGOFL2t6MJWpwCOzwOR7RS
 e/AkfLOyVfyoRR9WIGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX+/w/WUN8liYI
 3cmcrJFUbHCVKcAmyre7fUKSuYLuskBRY4e/44qKLHdBMbtMjf784mZoEa3bdOi55LhH8RIiVgm
 WljZIuCsyRDxah1RHgHJ4S5T1Qn+gOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300168

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware. It is used by one of the following patches, adding support for
Agatti.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index f6e9cbfccd09..5650645f9f65 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1120,10 +1120,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 275f3fea3d2a..6981e6e84fd8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -206,6 +208,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -575,6 +583,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3

