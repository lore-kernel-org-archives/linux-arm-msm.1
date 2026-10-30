Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340111;
	b=yDBUYoyH2kcMLJDOmb2D7r19FlmZeIUaPZA2hrcJx08l8e7Srqq78jY3sEUpORYWwoCk
	 Fh8QMFeX/dVlHXFIZ0aV8fTQqKkaUkLjf5B78QNzdTxTi26wna/8AwtIp0qCsi++nihdM
	 +y93f3HC2IOH3AhRz+JIAWiGrtKPBIC9iaB1DVQUEFTo9fiifonD7swbe/meZ4Sx0SbAm
	 NsgDVOF9R+UW2y2AOPW6g1yjmB+DtmmY/sdlRasyY12jS/abBxnWh0toYvQm41vzAiwwF
	 pvIrfaJxXsx9FXblvR4R/nLLbpyoXkOqox49vnJkRmvZZy4s48yiLUYNBOOvse9/KgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
	b=iJzaU/Aka1TO/jfyfVIFCnBORdqbFkcmNmXerJFp3OQ25at/yuUTBvjHPwOIz3PuVw8P
	 5Mq2MKb5K6JOS6N4QkjzmUoWvD0lAK6XS8m/GnJJWSBQGhN/fdja0fmYTYQj/wpY1wz8W
	 622oSN/ZNouhEnJj9JBAaDHZLPbYrJSO7DPQz/2Lpu8yuBOrybFHtH5lCC/Wm3PGrmByu
	 dg+WnsJRdQqT2BjuFBChhZdfJEVb9ZpSIYqbGQr1UEofnDtRc6P/YGZf/CH4c2GNDXr2i
	 JrFfuhO6k/TiWd6PucJDdYa5o2ZTb9M0b0iobhc7cuK7APUFcyzPSYc8HreFH9OX9rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1GUPYVa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RALYOlK6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958FD606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 958FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1GUPYVa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RALYOlK6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FCUJ2326633
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=; b=p1GUPYVaYt5x8Fsz
	9U6Mxmjhx3MccUJd+BBFhjIfoqgJhdbdtnA7caz7aaITIb6YuR9uHHJtqOWp8mtP
	pw03LDSf20pTjpHMJktId1q2KCbPMmXUjG0eM7KNhdF+jLjjtIdEyYXR9KsZCMNL
	XzcXthjfQlumz0fHxcLPbnEkGzG+sbjXa17x6WgRCIpwwd2AtPP09qA2d6DBb3At
	Jo3fF7K53Aklw57ZrUzR4F+v2EGdg5JfLK7PFsyqirn8DvBWC/UXsCOmu0fnz6Z/
	JnmXhDSVy7SLYwtdKAcUGPSzezSG4DCFFYdDYZSLjsZA7jBN5iUC5DlpSTgJl838
	z102XQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhf3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so437134a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340108; x=1793944908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
        b=RALYOlK6UcnYG+oHngbgummfaCT8BrOjgLEi8pP8pbvkvUqKdhTu8JCF6qqCJ+xheT
         pEfpDPo7a/XRv1FiSFhXduJRZt4zA3J7xTglKVRyv+SjxdsirTPnxKA9zJpx/pluRWO6
         fW/IgBfJ7hs3doAO5NuQUPZsfMYn9fyLZyXe+mo0dJXcESFsNJ8tgt+Uo6I0LYZBRnVj
         /vs88YObq3fNfVSq8E/F6STas0ojJZO/DZq8VrbIKl6iZBiSt1DOgMSKVF+zF2XHazaH
         SgLyDEGXX1IQdsGcaW6esf8ptPjhPYaetfoW8Rz4qMnB5/Vmu2z0w1IIO9Efksb3tkhK
         JAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340108; x=1793944908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
        b=vpwF9k+j1EKFPNpiTO2SAJ3/+ShBkUfPEKCcIsb8IAEPAi76IqrWrpln8iW7h3Yyip
         Aue4UZePM059fxp6gwXVDDqobARXvwHQbOSbZMiQ8uwxpl1SYmX1EtFBU5LL1gIyQzv/
         jL8jxHCuEop6YLR66op4/UzHn3B0eT1BhdvovYkq+D/aWHhoAxpiM6bbIja4H8/st930
         J/qM37seZJMYV1GReiFXK77Tu2gD87Cf/ylEtCFOWN580Qg9z7kPt/A8w38h4OSNFzj4
         Vv89G+UxO84rNP4PTBbpj5S1pBDkSgHNF+jTR5ka/3UUccBwMe6hlhgEFHcTJdnv9iVu
         UIrA==
X-Forwarded-Encrypted: i=1; AKwUvBwnpcj1JGxlK/VkpkQtv8zZwSwobB6tiVkanjuLFExs/+R0Tz7kWIMDABXb56XU07y7ZS/+VfdNARE2M275@vger.kernel.org
X-Gm-Message-State: AFq9FYLFc9csUo7MJePS9ehWbaDBS1SMMluBgUB1MkbSr4NQcY1XwTkT
	cD3HiW3rTDAYRpHWQyZiOvlJP/m7twhCvQHDD8UQu4csO7EhGKiNGk2kIghiVRRUy1csUC+g/04
	6Tbn29nZyKCnYdRl70Vq20WrundUHfFvQFWpOlYJX0B4xicgxPtKroYVvP6SU9pI66STA
X-Gm-Gg: AYBFou3MWnbsQ6Janl5A3khIVNN8LG65uBqXkoZxUq5u3gH/BPHUwrEEOhUf8w947/A
	VuGGB6C7OmSAc1leDuL2xDtbask635vqCOvujy2/pbDwPf4IF4DtxG4wK4zJe6x5Yj4pXcoAOjN
	b/s/A0RePYzsPcIDM4Sw4paxXkI5tBM6eJlCB37eQrWJ3fCrq0EWNrn9Iu9D+mBYOzgFmwMa2BQ
	+hBHxzLx8rQI4CT9cEnOEwCLOjMM1lTaVemIKuHav9fYB/FMtnJUYla/1UYARbMdLdLmgJscC35
	nn3DvDbCkkQXZAVUIm+2BSPFYiQl01k2g9JcT/MXkcOZEs4FXNgZX9/JgPQ/Kwm+/ge48ugfOAo
	89ZrSpV7E+BcCsYFgZwegBIIXL1woirEbFsJC4Zv0T7fKJpI0EFl22aeiraO6jJGnhqeyLWrPkl
	SMytH48ydDzPvt9TXhlE4Sxb+reny62zA3fwYo
X-Received: by 2002:a17:90b:2f06:b0:3ac:9785:4c34 with SMTP id 98e67ed59e1d1-3ae6ece52a6mr3382690a91.4.1793340108077;
        Thu, 29 Oct 2026 23:01:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2f06:b0:3ac:9785:4c34 with SMTP id 98e67ed59e1d1-3ae6ece52a6mr3382626a91.4.1793340106771;
        Thu, 29 Oct 2026 23:01:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:46 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:28 +0800
Subject: [PATCH v20 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-4-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340076; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Ux/UFuXxomeyORdfFTzlVtMlH0joNUz+K5vYGMS8MOs=;
 b=zUuxdxhuBcLR8U3IQg3Iv054zxt9xGDwIBldKBF6CFaHA+ue0fpUG/4QbRrBHAyzjq3aGRwaz
 0/2iRE3l1MADNe8/cz0GsTnUlOawLNECCXvS+oE+fhoRK2QP984GRxq
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 82Uk3j5dQvh_5rApcGCZoJArmHEKDu7E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX0ChGRTM3mtOF
 JFEdJTMmlFizE6no9ejMq9gFK0At2zo0bQbqVQL8AuZyqHw/dLoT2zsi0H4WCToLcmEvS7NC1Wd
 dE7G/so0yMI/j/TFQFz2bxL1V0Gg0lM=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae432cd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 82Uk3j5dQvh_5rApcGCZoJArmHEKDu7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX0v7dVSNl+nQ/
 VYC28AFiev0Jx29aPZO8sY9BB8P9atLCN5ETn9kk+2DsYx9gVXceaq42GJ04c1QT2EBGQwvIoie
 cGm5y27Py21De46Aige5TkWIBU0l2CFeugPBT/mQyho0NlSYvshza/u95ddbJXJhaJhfG9raLIT
 0BY1hVk1RchS+i1fK36nQCrWWhG2+HqmXJntqym8UTAn24AuZleWuokqaueMZe7PLUkGe07HU9M
 xaIg6DY/TexXUoj8ZqCViAcMgJdjxoc3kP4FN5eCa5gMu35TgTqY/k+IMOqfpLhQoa2eonyR+9C
 TWQ3PZqEYqL4knbnmrGuGIIShnPYqVuIITPbifNCRxHg8nV2rFavHAz6x12O2ThVwNwu4B0KrpY
 jQdRJqkvlBvuJNGlW+Q0MVcqTkidiSF1wuxphLxnmyVlpUgaGsEzb9JbqhUZcT0Fe4WDfhzZAQD
 Nf3LpLuUVpb4SO8gVwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5981deb45d28..7d41fdf83c5b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

