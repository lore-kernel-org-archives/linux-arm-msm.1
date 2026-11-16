Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848764;
	b=NxqGpvHmp2/NjXx2+75mC0rZ157GeJenYW+u9FqnAcbChEcBQmrfPchaTsSs356PPhid
	 CIDUzYpiwNOjnRyCebKRLoMzwA45P4ChozWkIEvZG9pY7wfg1WspYPwwTRdkR8lMKVlyf
	 xTWao03shhv5aMoWa6FVoX05TmFVzMMcAD6w4vMIT1a0wECVyXGGiO9wDVbCnKdeUbmL7
	 /FoFgA+IOd/JLl/B7m6qRq0Nro9ii2gV/AmOWKP0oTNlg/2R9HjbgrqTNVSkWbPNrBGoL
	 6ocOqbdDtvhKXd81lMhjTWApJgv1CLExWTmrzHFU/DK80U95mYMnjy6bb88OPrw6xrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
	b=UrcAirQxUQY+jLNAQ8PjauhmXqHoNIwVv4P08RAE1qjxCdTNfroJIJIjYlRapxYrR3Q1
	 YshJHC3VDCEej/6uQYLZLMlPoGtiJeFGX3+PpAMZ48CtNmHIWHpO1fo8DaRXPU5F+XKE4
	 AXC336Zx6aRV6rGbI0uSI0rsjtRqDHAne4t67KToX/9pgRz++C+dTVBXChXUOh0ApjWFH
	 hypCQJqKqFy0CBg1cekQeksFFSh22swf19v+X0tUvuNcUnx9KxvPV6uvj0IzXqNx8jyiF
	 or5w1qUt3orPOJn4l0R9JqNJf7G6x8S79RS9PGjtfFM/OQ3oybRVVXcns7jZbO2nMyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VtOKsDcu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1j5AvC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE82C606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE82C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VtOKsDcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1j5AvC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIGIv2126178
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=; b=VtOKsDcujsErv8Qq
	quoVGzJGfN7UnZq+ETy1SdDrNjoCzDsMu0o9AGakqqfAq2/IITlr+NNczdcJtiuL
	KbIrPLDEoM2ljJGXV20HCBXAgWIftFbr8t3AA13kfgUrHND5aoMcKd7jJHA8pTB0
	rkP6gAkDkui9pqGPi0YpIA02s8JQomDfym/537QNFI0Wogr67JkAwH0e741UoPun
	TuDJoX1rzIPcfMqs93EJaeNjZTmteEnG3z3Z/uPG0SB/MRtJyCkS4kz29xhHRRZD
	6Up3pqwegD99NqV5bEP4Pux5Fm26JGb3PXXl8Z5GHBZ2zdw01E/E/XmZqmQ78UCz
	Lekdkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2huue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:06:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e987ec84afso30543735ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848761; x=1795453561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=ao1j5AvCJzN8kgsZFGlGjAuc2oDizawReYiYFSi7id3yx0H0kb2aDw7rIeZ1ghsqZp
         /306bZIzBGRi9z6+xyvWulP/vAWRyQc1Eftjtkb+vEPQs3CU2k1YyoG7KR+KwFhoPjU0
         jSCcrKy2t1DNDCC17XLpRCHJ9VtaKJkSfp3aNA+4k5kqw/879zap34eQqItZAGw8nzPf
         8BnJ3BaC0VapI+xuDK0mQbrZS7SJpXDoPuHoSUJE4lDfJfTjc5dR5SuWOtPu+oYObq6Q
         fr77K7/gHR9WT+Kc8viaDVvnWohCeGwKO5ES5D5cCJ7JMGarhLB/Z302m9/ZUrC0XlDD
         6HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848761; x=1795453561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=23TQS5jHdaUK1mDJDB5o3UDZ7h0vTKgBe2CRPU5uuVhnFXokuCvt8YubcGphPIOYyr
         hEiJ9BiZJQjwnnoP3PPWSJatPubISCPCOLQk5Xtqi1t4p5wdPBd7amZlswrWDnvGu1/w
         XMe6kkci1CkpJjsGehhrRwk94FhtGTzrPVyIP6U6WqkR2/53k67xwjvj8Y1D/tPpJ0l8
         abXEf2VuLAa7xF2VY2I42kxEKh4tL0DJ8lPaGroH2IWH21+T6/6iauyqM2pQ81K+W5Yd
         UJ49fvlyU8US1+nUB+jpcGrJGAvia74hicwHpKdngwg9p1NMyD92kHxbVv+PSOvCgVOJ
         2H9w==
X-Forwarded-Encrypted: i=1; AL+hErERwFsaaxy/XKmCTIXEkXrshiXFaRtcVKikWpAQcekXJRUCGOt2XFIux+5Cg5LFNOZudAYfjzvorUSGkLI8@vger.kernel.org
X-Gm-Message-State: APuU4Z+m4xFF+ZO2s1MXpru4u1hGbjoJZpQ75REgTf4MiSSOUU6QTB/n
	blClxYdbkk5IyCYUo5rBc3Iqvd7ooaQ8IBZ6HcsCGF/AblfiJw8yO77oAJgruu24sEo2y20CsHR
	HgOcdjnfkCozTIFAWYwtQfbW1Ofb+KRjfc5BUbaQnt+otF3nySYmWgsWqVz6VTbStigh6
X-Gm-Gg: AZFdTZfH1wTiMsR0h3IJ8YcXqhoyoUeA2b0vSswQMSsgJTDuWpjupI7wLKk0YVGF8MW
	dP+B+iJhzCL+7fJdvmrz1d/1XVIdzkfxXVGZtVnPWGxLafvRurU6nOKXUqq56i5GzS1Sp94WmVD
	Rl2JFR1TgmlhClaIdcwNzJjZu9QJkQTNdKkp0a/NlsbQBNHJdUPkiBHAWdNiDOfBm6B18Eyj3No
	GxM8snH5DYNigoqGyWSanziBRCeDdX9KKS/67ishXiPC1qDeBk58+IRHaxzwINyXkn3beDwfE+B
	PGOy1n32MXJ2Ga8CqZYcO/P8zJDFUehKC86OGiOnK/hWqYnukJj9QykEX3U8xA13cZwacJI4wx2
	Elc5oSJUVdZVBgD+LF11vyS8//CIRmFs+1k4DLNv5tc8VWiNCyGpHx0yf6ElZrCf++TLkG7rZz3
	234Ov7
X-Received: by 2002:a17:903:1b67:b0:2e9:9c65:1af7 with SMTP id d9443c01a7336-2ee0dc3438dmr113739455ad.45.1794848761513;
        Mon, 16 Nov 2026 09:06:01 -0800 (PST)
X-Received: by 2002:a17:903:1b67:b0:2e9:9c65:1af7 with SMTP id d9443c01a7336-2ee0dc3438dmr113739145ad.45.1794848761017;
        Mon, 16 Nov 2026 09:06:01 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:06:00 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 22:35:51 +0530
Subject: [PATCH v4 1/3] media: uapi: v4l2-controls: Add control base for
 Qualcomm iris driver
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
Message-Id: <20261116-b4-add_sc7280_mbr-v4-1-636fb6bc8772@oss.qualcomm.com>
References: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
In-Reply-To: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=1121;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=yr22iLCXb30gmSFU65q7mnwky8PcLxD0pxfBcfk6+ok=;
 b=0RA+EGMxxrRtfP0XfkDhndYlF50E4imUGjeljaP3xFReHx5+p58bSCqz6GM7+GfBTb1AFM9Me
 yJSftfmOYTeB5dqQxHFFJSk30GXsDp+M2HB9FbN63u3041A++ehZJZ3
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afb37fa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=inWu9NajWAUUfZ5We6AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX6R4ih1l8dfM6
 1G5zdqrXMnJ03NtE7X1lYdtYVffSDeS3Nh1hVaF8XneiWSquahO4OmzogktUr82sZ0okNLs93Rc
 CigrEQZi7peg9NVkLIfXl3ui9fOTaFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX+9k0Azi4Rdcr
 53m72UkPbU4V7APpfEvUHuIQLW3UauTBw9Ead8SJs0yZ8/0LfkRdqnuPa7a8y5CrBBiyn4pgrxr
 GQHqhV/lOyyA2E75MEaViJ6cylyPIVBHus53Kx7Sqkan24OxHPFXO1QebyEktWae3tR/swOUpBz
 BgusguS5tsWLJS9GMFx80N7XK3F8cYSWddEieHo/TyQGS8wkWOCrEgj/YborqoRtCOHlXU9wTL3
 w4stXXivQ6DKVugCS8j2myG+FVSRUDvGfma8tITGtc+dTPQmHDc3WJ7r0JoOoVMp0mIKFReePPZ
 tSlEVszhqb9b648WKsJyvLqmw74mgo64PAg3xeO6RNy5Q6IV6D9Wzrg9MxNDjF/9CI8SXxsEDj5
 RksAj9h4gZ1jvIS5XS9QTGmNXYPiAdmf3FZF1hnrOBbn6/BYkOyXVKDIggh1vBR5IS0mm9yHCci
 fOJaHev0uOSu1FuChDw==
X-Proofpoint-GUID: h210L3J1T3ed04X-bVhuZdi82MKSqR6p
X-Proofpoint-ORIG-GUID: h210L3J1T3ed04X-bVhuZdi82MKSqR6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160068

Add a control base for Qualcomm iris driver-specific controls and
reserve 64 controls for it.

This range will be used for encoder features exposed by the iris
firmware that have no equivalent in the generic V4L2 control set,
starting with the MBR (Maximum Bit Rate) rate-control mode.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..ed2e2ef42829 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for the Qualcomm iris driver controls.
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_QCOM_IRIS_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.34.1

