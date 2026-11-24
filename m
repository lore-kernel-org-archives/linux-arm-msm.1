Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538867;
	b=udWirIGM1mFCxgpId/Zr4ug0VPGIfo7Pa1Qb4aZ/dwcv+Ev+ehreLoAfCi7OpEj0UmPB
	 nUdkntYM1Owi4EfqCSw/U8JqT3WAXKK0PVNCQaBjQK8+1Vnt8HDTNwBe8P/QD7gTrY4wg
	 BiZnfjFb1akikyGi+wkfPs9QB+8InGEfo7qRjLi9noMmlftj7TqRXkaPUh7/7xE3pbUIa
	 I+U6xr0+W2lT3HKkhOEJbKjcx1VZH65PJdxknyH6MXIR5QrEzBpWZCG6rhXgg71IEFZAU
	 BlYlx+a7WOSm25LMZ4zhSvQOWPovc0qXOk1Vht8IlWUDWRxHv1vRVGEUPAauf6NwNtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
	b=IyEQ+9dCuzNts+vQmR636bt7M1w/3qpkDgbKfUKkr+e9xAgDelkci/vzak5q7Ba4/V3G
	 KdUhc86H2gDpCPf7EQwoRkO+b51QbAY4O26kL00l8Nj1oUe2OuwaobRgW1K2MgXuJgBlo
	 0ABylvtIfthJvLzCGqt/YqjOXs2VXRjtej9PHC3ixLs+i85H3wTBhF/IZYGyglyRiHF8M
	 UWjOMPNW9I30hEUWxtb9ECjA13k4DjPn+b7UuQHUmpBLr5nT7thvfHnk2zC1yQ3iHxHJ7
	 JXEIsetS1jJhS7NkF39gqK9OLUudXxx85w5y+cR2d+nOcpmRRw3/JXFkjiAsC1v1NWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D/wehGwS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aAlGXMF+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA8606A6AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DAA8606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D/wehGwS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aAlGXMF+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLFrF3878610
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=; b=D/wehGwSYdfacokR
	vMRQuw7sbuVVO4g7TxKw7T9jNTrcpseIidz1veGPlzdKE3SpsS+670tW5usDqOYN
	xGHVhB7lBsd+Nclznm+xYhvfmE/BEfHU5Ef4dVQSFG23foboGNY+mkC2tFaSQH2Q
	pPEyFc4PvkhqqA1H+shE7kyjyQFMsamus+UpyIk49tqZZXo9iCtFaoja5DNhG7Cr
	ykjAiU6r1AUWrcQpWpBySBJz4mbN4JVb9XkrzomWmvSPjUzmWRD1dqQYJ7/zVd3K
	9L4ft5yq5c6j0nvoRa8WKwIvPZRKpUKxAiseMGLLOrkKT8W//dMnjm1LTnjGk9+4
	0GyUXw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy13wxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:47:45 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4dca1ef03so58560817b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538864; x=1796143664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
        b=aAlGXMF+GVRniUL702EYKSRYKE3lwnXkrk35Ho/OZ6oGVukT7xeIrXg702kIYvQDbi
         tfH+eEuPFAJl5p3Yvw7nHVqjSU2QQyVGLfv6ZYOqucG5COI7G6TiDGRTLWeVNR5EsGQI
         Flz0aslGzvRQr4MpOHRoy0qfHEGXeNd3jUci0iUvwFXdI8abbW/8flY7uxHDD47LtsP+
         Hzl7Y6bMRNJhr/W9UR1deaFFSgg213SaKgmTB95uXZTr8N+gd8vtGb4emdnFb31qejYy
         F11Ek7SXdjk5IjOXBuFODJxTiqRX+qHW/xzTWHTE1aiFUsxunBeWjf2IwA+Y6l/dTOEf
         dkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538864; x=1796143664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
        b=slaX2tXHOVD7AtB3rCq/+paUZf3gYnMI/uqUXyXaC/sJj6RUV8TyOBSoIfr+fladO5
         zPzSGxKSElmfm4uSyFMD/n3XaJFbxn6qgLA3iYzv/OfgNWNSf1GzznGaWT0BuYyqcsi/
         8VCICgfnrk4EHTYJ3fpUIwPsb+H2nd3rYCHUucOaLzHX5EAk0HeT/Vb4aFbKw7mkhNmJ
         qX2UX+SnUB+oYhQSIqOz2meyqcFdqbOE5LLznnpdKZzSfpbzG5CeP6jjM8HpUpJ6Z9E2
         Ipn4IO1q8iy7VBfPPPiltJWxKrRn/slJjCg2U4yGJZ3jm/iPkNepDEdRt3gEHW/1I0DV
         Ubuw==
X-Forwarded-Encrypted: i=1; AL+hErEeymkuJIJDKu4sZpOkm3cv3p86l9J5lA3aKcw0/0rbgPG85jNMN+Whk/99WPYIKaQUExnZdDteCLT+gbbx@vger.kernel.org
X-Gm-Message-State: APuU4Z928yYKgm8eCuVZUL2Q3sI4aP4IcNsKhD3BADGqENBEwPQQZhOs
	Cih0Dn73qmdLhxbpyZ752vOEzTNQeuhFAq2jmjCKgczyARK98VPbTg0S5Yc2erXhqITs57bOzcQ
	jS4MAypmmqUduLcpSaYEn6Oi9SqZwX66kj1paNQiO7GoCSupYdtrVM97GOAeVIF78X8rC
X-Gm-Gg: AZFdTZdApaYeCB8vorL5LoGr1nXMZz0MJ14l0d8zscO1bTDkkmPi8N6p+SW49Z5ezar
	/Y+jYUtxpf81L9NBFaIOECqEAHMxZ09kdT52ixiGVTnhGD68hVHtasna+RxVRIow0XY7dbnfaXT
	/kZZKAtCeo9Dm1g9MvQm3Yf+wVTwWdfY7Tik4piphDxUMI+MkN6my+TszJd4xy36nD2plVrucmC
	9r21ZA0aGCSIu4tti38s16P608RV6lhpPqhWujbA5PMqZX9QZUxdxMzSVBewnQM3eJXHTxJQptS
	dOKCIIYrAJEQabxqIPbICb/zqYrxNBzQAF/CSV0FaENdSndRJe/mUNgv0tM646Q5FEOSj7f72qF
	+3PNXBbk2lB/zvlwmSh7CXgvgCLCF27qBi8MKl+Gche53iR0TEds8QJeRGxsQpsWcE3BMd5aCDQ
	k/ak4FSptNEZBOaXw8PzlKgNc3AjfczodwHdQgxtTCMRJADgSF5YOubvhnLIVG+manKNb/U9DHE
	mRySEIO8eo4YTaZKppHNESEKxQh
X-Received: by 2002:a05:690c:e0c:b0:8b4:e258:408 with SMTP id 00721157ae682-8b52051832fmr70265017b3.58.1795538864492;
        Tue, 24 Nov 2026 08:47:44 -0800 (PST)
X-Received: by 2002:a05:690c:e0c:b0:8b4:e258:408 with SMTP id 00721157ae682-8b52051832fmr70264837b3.58.1795538863804;
        Tue, 24 Nov 2026 08:47:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm29388605f8f.5.2026.11.24.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:47:43 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:47:38 +0100
Subject: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
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
Message-Id: <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
In-Reply-To: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: DT63MPxLWM-kzK45Z-a-zp5AbHANY8yU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX2+B00Hnw9tyx
 eIZo70Rgg9idi+Kd8nr0w+8EgtVSOxKpKJba4E1M3PglKP1qeoOJq0r2JWf43bjmJANhTDTSzcV
 Tu/J8GuGhvUddJYPm2z0/bKENoJpJdw=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b05bfb1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=q_A1cxkaZBfKfFhyi8QA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX+nqLUqXgjjJc
 nOIVxqZrlN2TLoxEimBGOcw3+wf3IB0VmFV+QTqqrUWG5KfyVSb1AdB/atDNR/a60FbhOnjwk4G
 zrPCMFFyAgJPUm7y3OnDSP0B3xxScAJzfKRDoZ7t+vWNYdiOR0rpejJXnmVtf1bSsMT5pG4Cx2c
 FrzWu/9gA+7Jfhjqp1rgWULByDcJ2/GJWDtuG2jXS1Ubq7UYfwarvM22eFuAOdhceIkeorWP/N2
 eqFNRKUY01u0czDE2FdryAtPmp1g2No9dYer8zpki3CVBC8TYa4NH30pjclHgH2H+qLYvI72zcM
 RNKXzR6OJ4zO0sxVRBXoq0Q+V/Wj3FsujeJD9T78lE73lJ0i/LzcGDVF1qLIlkJE9sh4WngyIlQ
 siwhzOp4GrYYUNEDkZnx7RaBDVBuqjYmslMZ1PDDnRXGnrjojIme1EyJjYJ8lNqYs4+OsocVeJW
 pVbXXG40m5bPLGOfjeg==
X-Proofpoint-GUID: DT63MPxLWM-kzK45Z-a-zp5AbHANY8yU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

The buffer address written by vfe_wm_update() has to be made visible to
the hardware, and the way to do that depends on the generation, the older
ones only expose a register update, some relies on a FIFO, while the newer
ones expose a dedicated address update that triggers the latch on its own.

Both sequences are open-coded at every call site today, with the address
update being additive and always followed by a register update. This
leaves no way for a generation to tell that an address update alone is
enough, or that no latching is needed at all.

Add vfe_buf_addr_latch(), which calls the generation's addr_update() when
it provides one and falls back to reg_update() otherwise.

The write master configuration programmed by vfe_wm_start() still needs
committing, so vfe_enable_output_v2() now latches each initial buffer
address inside the loop and issues a single register update afterwards.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 33 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..f39e1f303c9bb64a41c59d0d413608b5cb54a8ed 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -443,6 +443,25 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	return hw_version;
 }
 
+/*
+ * vfe_buf_addr_latch - Latch a newly programmed buffer address
+ * @vfe: VFE Device
+ * @line: VFE line
+ *
+ * Make the address just written by vfe_wm_update() visible to the hardware,
+ * through a dedicated address update when the generation provides one, or
+ * through a register update otherwise.
+ */
+static void vfe_buf_addr_latch(struct vfe_device *vfe, struct vfe_line *line)
+{
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+
+	if (ops->addr_update)
+		ops->addr_update(vfe, line->id);
+	else
+		ops->reg_update(vfe, line->id);
+}
+
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -491,9 +510,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		output->gen2.active_num--;
 	}
@@ -564,10 +581,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		if (!ops->addr_update)
-			ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	}
 
+	/* Commit the write master configuration programmed above */
+	ops->reg_update(vfe, line->id);
+
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return 0;
@@ -601,9 +620,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		vfe_buf_add_pending(output, buf);
 	}

-- 
2.34.1

