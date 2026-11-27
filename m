Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795929;
	b=gSnxMpz9KRoGZWBrGo/hWVtDYNXjmGUDt1v3pJS6a4x1gNsWg9lNL4zBg69c+e4+7JRj
	 1pKb3P+7nOrAPM2h/bym2JoeH1VSQm4KRTKOAWSAIwK2GH8qLnz6mKI/sNf8Uzqbwj/Nu
	 dyDjrGF6th2t/cRlMcmyzZ2Bi736czTCu+Xx1x4nHtvFrz6LIDPdp6w8N+Up4KjvJuv17
	 Ba7fKWTrvqqyLz+aLYDOoXtSr5ljXYv8C2pEW4E/nP/y7o57fWuhskEviXri56PMKxsED
	 nUm61Wo/bk66qOClIIHrUYzv46qEBQHJVU0vWZn/hgu/Ztrd7hHU+gKHzGH5zpfUXPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VnB3Y6cA1jDU2PIsmpLUVpJsaHsSWIAQcrfq9eUTfpo=;
	b=N9KAyShkZRuR84P3lk17uOmktAm/gdcaJ+14q4h/nSj+lQoRvpXQs7DaYK8uL+JQNCye
	 yzxQMqYJkgwTY8PAhRLZRgRzAugM+NnlMGhKjSdMnS0JM/epsfSwMhkG2WWQD0iRUMOnu
	 gmFsahTXSN+JHkKmVTbvh8s18Ebu8yQsmq7eNQ9qDl83J3YCnyZoBD6rhKyi0XmYlo6Co
	 WbaV6Z3I44Gq7U1czBcnWWCQYqq8faAKdahmW5LekwmDy3t2Y0j1cGGUGHti+IXTK1GUt
	 2q3lukbrrm82NprWMugt6RsLm5FMdT5sSvyE8aS6OSenm70y+rsEVduqsj0LaYWUDsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOH4lfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8Cz02fk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28643606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28643606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOH4lfO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8Cz02fk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpT2r2211124
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnB3Y6cA1jDU2PIsmpLUVpJsaHsSWIAQcrfq9eUTfpo=; b=cAOH4lfO9Pj37/be
	RLV58OvuVFEU0v2yR2KCULTDI6mXHM6pqgshtqjzGMSdujdzYv1mzr/oagQX1rvs
	RZWrFCclwLiplJ9pnfu//QoVgKzws58Gmx5CE35ikboey71eLKrlHW+ZbT81gWmr
	HZXeZtPgJdkI4dhvsdWgtYeNsJx/0D0jH1j6fomV5NCGwUD225cLgFPeYvs2U3J8
	I9ysCXbrU22IXcvMqCkKwu0aksxocjg5/6TNqsPACMuqhoTlZsl2wlFDsWO6mCkp
	x8jUt3xEikCkd920dwmoc1c3JFd5fykW+3N49w2pJMzX8Po9aNAv25P2tbJGeW7e
	G7r6ZA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ur0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:08 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836c416b236so120136947b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795928; x=1796400728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnB3Y6cA1jDU2PIsmpLUVpJsaHsSWIAQcrfq9eUTfpo=;
        b=T8Cz02fkADisnkQhm8s9gLNVCiyqKB/3OKQZBP8ulilmdS2ORAUEahoLtnNerHGa3Q
         LEKcg40SNqPH89PSyAbmT8/kZIm3ImndfSNM+1bG/tbgZJQbhtWh5Ukm0oWNHGkAEpxA
         zlaHsDn8AXbHvvFFDBbnCqgMMQb3rI7DLmyt7vJjb3EQQ/iodTaQWVmCC8psQmg5OPdV
         z66Wq9SI0y41QuWAy5orxkgacn1+8Aoi1Bxsi/E0FoFyE3KH6jH2dtUUh15iZv6H9hgE
         w9pYhuA16ExMc0OAvLlofZDLBJtm09IVOPG4h8N1GlG/hJM3RTlqicjUExGgnhlRj027
         dzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795928; x=1796400728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnB3Y6cA1jDU2PIsmpLUVpJsaHsSWIAQcrfq9eUTfpo=;
        b=xQGGlrqnxWG/axTO5w1Xx+ZYqiN5sMxdE60YDLd//wgAls7deNZGe+JMTwBsR7/XI5
         7qbScooa9ES3/BEsZW+EnQYtypiZjx0IuaHVtT4tc35iGLVVKtKH1Q6sfUzpjMm6zpxW
         LBtQoYz/baKg6W5dLjD7ObTY+0jhnyz2V/WVLO4On9AvIyYaXFNZ3RiVt8mbGLs9KwuD
         5whK9C9/R5Z5NIP7pI0Xti6dv5LbhvsTbfRlZ27qQSvoSJ1d2hMyyN0xP7K/OOl6VHr1
         imLk2sgQH7HVWgKxtFBVsV9/0Fxd+ovD6rhXyoGD+/GtOy0hk6NU8pb5l4lsCiiBmRT3
         ecvg==
X-Forwarded-Encrypted: i=1; AL+hErFRg6bL49RWpk8aObfjjVWROjppa2lDWsHjQJ+iZwdXlRUjpD4Amnv7w6D9f7fX3R3xh1OSEgypEmEC132w@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fvw7QmR1nLkt/NN5iQZV29VtoX1z39OOLnivKR7Nh/pPHv9Jk
	ymxv9vvwOsH5K9olbzOQlNEpmtiFwGmITKVYhKNa110Z/jdCYLtTL44yfSrfVGq7yZCXz44duhd
	IiCXHDtaH2zHatVTazEodsmMULILdjP/+yQ0PeUq0/mwM3Qcn8/qSinfso8Td8uAxuqOC
X-Gm-Gg: AZFdTZeDsI1pG97JbIOCGhkUnDL0Yc41O83qg13c8W1j/MKZbFvpA1gjaDjHWU5cyH+
	1B+CUOCDviPy8/H30HY0qm7z8nmhoGuCKmq9fyByJRLWpTFMneZTiSDebuRf65Umti5II91HkTL
	N7K8Xlk2PELBHdd1ilCuf/DZpk7YG8HEJfuU0YKIcXH4vT+e5ylPKMAPBJOeh2uG63cp2fgCdlH
	yy/3vXQV16MvRt1rHTYQoVB/HfiZT3Wwd3G/GQl1XLP+Kdm56PthjJX82F/6q/Cck+6FPZybRQ4
	v0CLJrCUuvvepSMDJKC5qAJD/4S6ptIBdAlvuntZhC9xzW02rKjrxIbPY8B4WccpUpIC2gJNLbb
	nC9T2rAjT3r87K44TSilIfozI5L9LkWQRz3qd/i/ZzqtYDyg5AJe74sYHdiw8xRENMaZmzdM/xF
	xXgbohCeUOKTJz+iHuGTw47rDEVP7PIJSfVWzmo3/To/OCD0ly6trVQDX8sSWFbO+NHroOHPcT3
	7Sc78C9e4Y0F3O8CupEtpa1pGXT
X-Received: by 2002:a05:690e:1446:b0:67e:653b:319d with SMTP id 956f58d0204a3-67e653b3b4dmr2153828d50.133.1795795927483;
        Fri, 27 Nov 2026 08:12:07 -0800 (PST)
X-Received: by 2002:a05:690e:1446:b0:67e:653b:319d with SMTP id 956f58d0204a3-67e653b3b4dmr2153777d50.133.1795795926806;
        Fri, 27 Nov 2026 08:12:06 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:06 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:57 +0100
Subject: [PATCH v3 7/8] media: qcom: camss: Timestamp buffers at start of
 frame
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
Message-Id: <20261127-camss-hw-ts-v3-7-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX00+aUo4jh75n
 QToPNcpWgxA2z6cADotJx48SrnM+W5PSntFS7lj7M8gbrBfpWiWoU2ReGppVBnvm2E5W48YVIAD
 DFtiArGiJjdApqG9UZJlhwtv0ialhuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXxXaDIlpehl+x
 KdXg1hJiOWb4L4SoX+O3QoaTEosnEd827kS+SKH9Cfy0rH4WHPMbh23tClyjRWCprc3TpqvghhO
 eSwPtBQILjFD70dm/XJRQsdbJTbm+lsTRorAn2u8e/Gr5nAz0niFWwca6D1xGu4qlaqYDHYgfQB
 0A98I9xqiRW9RBxs6+gPOMiCJfz81dY6rv0e5S/c9siN+F/9rlZdU5priLHIQc2KXQ3eCP9Jxhd
 GB1jBut2xtUk2fKhamxvuQ2ZF/8CE46LZ/FJk2tzsS1eGFIt5IPp+7iE9Gs/edBvkd24pO3V8s0
 CBSDYQO1/vUaCemstAIgW3O6m3WOQhhbAc6TdQGtUJ/dd56e1C5XfIh7bk1gPDcCjKtXkCfh5yL
 0Wv2h219gNRodzZwm8TkbYtPVMVqPhkiChIGAvt8H6vKTVSDL4A5nluw8snADzjyLNxbXr5kCq4
 BNe7z9mkGQFDMT5Yv7w==
X-Proofpoint-ORIG-GUID: fvMvduFiZERbf90F-iGahwVq36hVDRTo
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09abd8 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=heOmCKqh6NOOIyo905oA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: fvMvduFiZERbf90F-iGahwVq36hVDRTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

Buffers are stamped from the write master done interrupt, once the frame
has been written out to memory, while V4L2 defines vb2_buf.timestamp as
the time the first data byte was captured. Use the SOF time the CSID
already computes instead, handed to the VFE the same way as the SOF
sequence number. Hardware without SOF tracking keeps using the buf done
time.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 7 +++++--
 drivers/media/platform/qcom/camss/camss-vfe.c     | 8 ++++++--
 drivers/media/platform/qcom/camss/camss-vfe.h     | 1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 4972d3ab65078387735ef2e853bf1c9c3d82baee..6b8df1f6e2a731ccd0e739edaa82221c18203f74 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -472,7 +472,6 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	struct vfe_output *output;
 	unsigned long flags;
 	u32 index;
-	u64 ts = ktime_get_ns();
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -490,7 +489,11 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 		goto out_unlock;
 	}
 
-	ready_buf->vb.vb2_buf.timestamp = ts;
+	if (line->sof_ts)
+		ready_buf->vb.vb2_buf.timestamp = atomic64_read(line->sof_ts);
+	else
+		ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+
 	if (line->sof_seq)
 		ready_buf->vb.sequence = atomic_read(line->sof_seq);
 	else
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..ab4edb14ed7486724f12fbd024e0600d70f8355d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -456,7 +456,6 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	struct vfe_output *output;
 	unsigned long flags;
 	u32 index;
-	u64 ts = ktime_get_ns();
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -474,7 +473,11 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		goto out_unlock;
 	}
 
-	ready_buf->vb.vb2_buf.timestamp = ts;
+	if (line->sof_ts)
+		ready_buf->vb.vb2_buf.timestamp = atomic64_read(line->sof_ts);
+	else
+		ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+
 	if (line->sof_seq)
 		ready_buf->vb.sequence = atomic_read(line->sof_seq);
 	else
@@ -532,6 +535,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	csid_pad = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
 	line->sof_seq = csid_get_sof_seq(csid_pad);
+	line->sof_ts = csid_get_sof_ts(csid_pad);
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index c37526caf9a6fc052c3f4ab4215e635167f6da95..8eda4592257169d04027a9a3c45233ac937eecae 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -95,6 +95,7 @@ struct vfe_line {
 	const struct camss_format_info *formats;
 	unsigned int nformats;
 	atomic_t *sof_seq;
+	atomic64_t *sof_ts;
 };
 
 struct vfe_device;

-- 
2.34.1

