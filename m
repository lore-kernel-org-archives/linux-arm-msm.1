Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172036;
	b=4EyPiMsP+NePvmiVcafiaft9nPbfayXI1RCSHHfm3zxspxZkpBxVGIsTE/864H6reh5t
	 CAMLIpGv5CCuWt/veTKPDXMxZo1fnFVHEFXmSBezagpHTvkNVGD+zZggN7+urZu7A7TEw
	 tIbvHFMGhFt6PCMxyW9uIZrvRxXS4bge7JN0T9gDrSmhWx/Mx6f63fI661RGuJEaDzA1R
	 Fl5afr+Q0kPeGvKCtE7eVFRWGDy3nxjt79JwBzK4kghJpXIAflYQI7hAtT8hftybL3KuL
	 zea/RZK86rAkI1n+4Zoy+ge/alXWTWXx3MNzyovWEJGgyJYe7XPNxrH9C7AQnqSuTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AzCQrlehxDLRvYPoK3LFMcAPEAt34Ay7ZuowUvIExbM=;
	b=XBHqJpqemLDptV4bJCBjoTzBW6z+LZVUqfuWb5gQsjwHMSdXc9cEpPZbObS+gIOaMHEs
	 muXht4yRY8PVW1qh3VzSrBpR219VGh9booeWEs2QaRjYA5aIJnXfh2RjMPTgB9eZjII46
	 mkimVsHexriIyaR301uLfxk0jjYa+fBfPy7v5/fpxa7cAkm4PWEYfOmwzKcybV+6YZ7Uf
	 s8Z7Ga0aMeWCiY7eiUoOzRAU3BwBlnefpABgNGahesODjZVkAsTiscY0GyJJJFKCb8tlZ
	 aeRXFMlKcPK19vbkdWgG0joohUPyJuTNdUdDnxvG106ohAdcUGeNIzLoAKBXE6KiTaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CDsVIVDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPA61kYa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A53606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A53606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CDsVIVDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPA61kYa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqRj1463003
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AzCQrlehxDLRvYPoK3LFMcAPEAt34Ay7ZuowUvIExbM=; b=CDsVIVDcGFTjw6lW
	ojABQMtpyTtl++/qTE6KBz11hB1aULRK3VCrkAr54zBTvx7TBcnFsdK6Ev3DBGkf
	14+a+PY+Udz8M3a5gn+CqonKBwI0x8ABhZtzLt/BVxJzcDvblzT8IqCoM0ARCFYC
	zhWMT0lavKGQ9XQOKBnDqWRVO2hJ85KaRvx5xPlziPVSOtGKkn2/76sTJCDtyDtK
	mMzboLFqYupX1VkIQM/py2VOKTBy8a8OjxlK5IH9jQNauItI0uj01jQAwZQB2RKb
	rP8526ejDsb+J/1x904U1ljKsBXAcXUmSz5znBX0k9gRkNuJWcsSaSZ1gFSx/tst
	ObWQTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah46u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:53:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so530189a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172034; x=1795776834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzCQrlehxDLRvYPoK3LFMcAPEAt34Ay7ZuowUvIExbM=;
        b=DPA61kYaVfyEoqv1S6dbCkJfBuZC6Es3cZGJF70wdVORN1MrvV0V8uPLQQJUf8cWWg
         1NLU+3auT8YIPHJCXcEyLpo3pZoPifiAJf6My2gyY6FBnOypRuxRwMXyohD5/sjh+tzG
         pbGdhD9fob6bEqxdomSWq+xKwugbeePJS8LeNQpETuX3pDz666gAMnEyXnfZT1qSRNPe
         UC4H+TM/owXTYDbN6axmjpzOW8V1v2bPvZ/cm7JP0+ZrAhLP5Uylic1wRnWTn3HpCZVI
         fX/V1GVAUtzp75WxfWwMGtPM/Hf3UcgfoOLlJ3gBgjEn2HWpQW69fPIRIr3xEeOIvevc
         ie1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172034; x=1795776834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzCQrlehxDLRvYPoK3LFMcAPEAt34Ay7ZuowUvIExbM=;
        b=onugE98Pk8KazfL7MffxdYqlHT3ECwkwDpUzwR9ryaaKcKRbcVowBGKQep4ZMWokXh
         Rrglo72SSZNUXgsIWyxlqMqfcg9fm0NmEaAacyGEQizQKS4EuVLcWG59FPLD+7On3iNq
         gH0IQ3yiUcqdIgAh6jXuZnxEQ/2TU5DNZ06fSnkNnZK3uUB328VZVbHFcgN802gIGuYs
         dq39e/OlFKIN36csLE7m0Ov3ycFfYsGKw5O/pNBQ1KgejTKD6c46tiLk5iNcfvaD67mm
         gL6opABT8yIKxB4CI/z72Q46UT4gJIZhq8SM0RPlgqHqysXNHQHay7hKhxUgof1UtcPd
         lL2g==
X-Forwarded-Encrypted: i=1; AL+hErHKo86jOi9VUexux/bbGL7COwBIaJlUqoEHUHDSpaNxJEKWiAXrFZt9YY+fXek1QyS0QJZGcjUnhT+u09gf@vger.kernel.org
X-Gm-Message-State: APuU4Z+L3BzYyjZeQT9s2MoS9yOpnQMAfx0L3Pj200Fam1FewlGKgEZM
	jBhnLqaDyqABg0Y5m99GOg10DRG/OMMJmKeuxd+isXSzB0x0yxNA5vFEdmJGN636CCTuG6QTT5t
	i4+/uaR8lDHS9qfELbBgtnnUdZFQogdfTgeTzdNme2SknoOTCIwiGM7pURdwnwx59yrqs
X-Gm-Gg: AZFdTZffAqYXOxBZcKTD0UxwWuVz/l8bLAbn1gvOrg1vWdplcR/jEJzENX3HwUXLpfM
	LaGFxgiemguz8mot4nG9dqNRwvLoU8CSFSvoRjVTR0ZjZym4i6S0tzlC2sjJS7aCpFaJk96lIsO
	KcWfuu9+On9C4AwUr8/EzeK2O2LJw0b7nzEr7VxQOZ11FCfaX5RAJfhHPUr2hyQKNnCAN+x4Nf4
	n8TRdSY63Rh+p+JG5foum1iTjtAGKZA3ONbd4DdSFO9MISj81y8aQhr3gY3o2J1f144d7Ixvnyc
	J4sgz/RUDvbmPUfxdKQ97CB2RZfDGMvCV/38CyjD/fKV7yMHgHn2ITrSZNb/b9wriRKPwNGI9fn
	OozFLLVusYAdyjSdyWfndE7bYFD4oi06OnF4Wq1KQLM1ch+KM+xog5+CuQMQkZuxS1fIOEeV8dA
	7E43C/RuI=
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id 98e67ed59e1d1-3b41c8fa9c8mr2320774a91.23.1795172033824;
        Fri, 20 Nov 2026 02:53:53 -0800 (PST)
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id 98e67ed59e1d1-3b41c8fa9c8mr2320752a91.23.1795172033343;
        Fri, 20 Nov 2026 02:53:53 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22888esm1559604a91.3.2026.11.20.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:53:52 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:23:32 +0530
Subject: [PATCH v5 1/3] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
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
Message-Id: <20261120-tpm_qcom_driver-v5-1-3d9321ace107@oss.qualcomm.com>
References: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
In-Reply-To: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX6p9FHsmW0iJ3
 nBjvUW5rteFW9ViIkUzC4MgWLJb0X9NVy5CknPVVCI7LRo0yXMZCpoUJF8Pb75R5wu+mn72v+/4
 kZ5uMOhX5yDq04g/d0BKMLEsqO8ovUbAbwNs8ZRiyGkajQP9yz4PXngkn9Tbh7LP5tRxTBLJ6Md
 P0OsGV/Glo6vqZuH0xhwkPHcJZ5DBkp1dfq8DFJ3Cu58N8BX4k3dvyjr/bSDECkXifgi8HeNIbt
 kGwcDTzVT8c43rGk4z9bj4/excU3S8B+cx6xNwaoRBcNItKATHdKqNRmVVXFI4vb+4W0Pr2xT3d
 O2QmWOs9wW1dWKZDdsYrzLUtmDhLELV+FHLXeu+35ipyTKMYyE7yrTqpnCUpnhmUECOUQt+y2tL
 qzNocI4QOMbjPoVBuMI0b7FGkk5dDlSusIeYnUCWDKF7Lx3O5CZw74HEWCWNqvv+iavZfkyCJw7
 XL4H6IB1dDhPXYisUuw==
X-Proofpoint-ORIG-GUID: bwRTYx87n0y_2Q7BVYe0-4qDLRdf9gTP
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0026c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cMdrFq0U01fV1n6vpx4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: bwRTYx87n0y_2Q7BVYe0-4qDLRdf9gTP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX0v+/YSQvWd7/
 /rm2CSHhKA1h8Jfc2aoXRk5fAFztZrG6xnQSstTNCohoraSspCmoBZ7KSLVwrWUlZeaF4XAKfG9
 8fgBtO5KqKnqJ3pKVikV77h/tF/3AU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200043

Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
is enumerated as a TEE-bus device, allowing a client driver to bind to
it via its generated UUID.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c        | 4 +++-
 drivers/tee/qcomtee/qcomtee_msg.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 96badaf98795..0c9fec95c9aa 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -747,7 +747,9 @@ static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
 
 static const struct qtee_service qtee_services[] = {
 	{ "qcom.tz.uefisecapp",
-	   QCOMTEE_UEFI_SEC_UID }
+	   QCOMTEE_UEFI_SEC_UID },
+	{ "qcom.tz.tpm",
+	   QCOMTEE_TPM_UID }
 };
 
 static void qtee_release_service(struct device *dev)
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
index 9278a361dc70..9fff9dc5fffb 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -106,6 +106,8 @@ union qcomtee_msg_arg {
 #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
 
 #define QCOMTEE_UEFI_SEC_UID            413
+#define QCOMTEE_TPM_UID			81
+
 /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
 
 /* The message contains a callback request. */

-- 
2.34.1

