Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A0D3A453B
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459871; cv=none; b=ETlbfqKKKz9ykE5Yll9nDFkAbrpG6eI+tnhzFrgvOVAY8uXtz/tCdCifkct5SakoH+c5XI7VKM58jjiSCV07XR8e0v2LUgsLginxPg1EhJM+atGK1B1seWj+QbH26NJ6NgfdRiO7uY64dDmzCiyvfhnbUY98B5XQBHgmqM9yHZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459871; c=relaxed/simple;
	bh=TwbZMWaf5zHMMD2gf8LfNRX+QQ9gQjR1lauqLVDpOig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdHuxgFIRys6CqW1R2CbZ5LmcdYM6oNukG1+ub9iQIiUI/udEeHFeai5XLJtW5Wp6kA6e2M9wNWlv27los23Rlhyy0JHOc2/dUVl6CCPGjYjlWb1TjwmCnR8E5KgAtYQENpbty2YttPXxQzxGLVhxi7PjGc1i8LM084kCpyOvuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmgdJY0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUfKEhXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmgdJY0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUfKEhXZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7pK2167849
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=; b=cmgdJY0RFDho3MfR
	glnQVQdP6xuWAmMhvCZrUpvkd96Y+xNJE3HUhlAYqc+pQqHPpCX0EnNpbUDg1fEC
	LjevAMIen2bKB9LDxzRAgSylPUnr26t8aAZj/yqPBoiu0LwYswPFGbGGfw5VJdnQ
	JpJytloqGKuvJbDFGxJScA12zDZm2wEOB58mHAKBzo64NvxFjYMOucaOMd4ana37
	fyfYTYpJF2f8pqS8XCFe8oLsAh97Gd48Cs5uNKCOlNMi7dpDMHJHKWv7KGqDFeyb
	NEIlkQDmlzsM5EAiMb0VS88gQr45hisBT67ayzMocCoPxn0Y5MPHRNV1uKhUYV1X
	dExy3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s911j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so873664185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459868; x=1790064668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=GUfKEhXZH1PpdH98JhhXTFsajkaJWBvK4CQ35LIZ8lOYS0J2saKq4Rz6p2WRTEGe3P
         JlApvwa9372teBY/gyoEeqgV4T2xMYDhXhm7q+lwp5s2Flauj7ynp8r+JCaSTfacN06f
         axHjg0uLVKfnYIHDFMmV+l9A3wjDJ7h3Cy6+uYj17XTxAfXBMjPPVfutEQO1aYPTL0Sx
         g0mD7SfV5WLNhGaeNBT8mJXu9cEVmFlxDYKmDvPFJrWKcnsvstBXzDRHpqXwI8vJQbZY
         O1VpXVskh2TlBx1l9HQgDIlYnT7kc0ggTDg4hBI6OnsZmzcCug+wYBnWAmeMsyfwyXCb
         LnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459868; x=1790064668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=mRyT+RA8ro04HpbfeiQjHn4IyDUdVVHHRs8A5cEgHVVyopfhO2dbm+ZbF9owcsqGuK
         95Pt+zxGlqKr/Cxtykska1gMLVjB9fhx7gfc1ewulQDGpe87JvmZ7TXgz2PS88ilE1rX
         oBtPpMTtXB/OfJ7UewEUpzI2/EFuinGFVuhdu+9fUfChc2n/sy0CE550OpkFAPeGuXhX
         spxzBoLcp7Omu3DKqw/juFVoVdEB95uzYEDVViLc6K+6riQR+LX45pNQrqvqduPbGzIz
         zhmpD9riHx4sHXjOtUWkbtzc75U/VC/n4Hc7iVHFBOUPCC1avjEEKV9a8KFotUSdjq2I
         76BA==
X-Forwarded-Encrypted: i=1; AKwUvByCDXHLlIg4j3iN178Or7aD6RJ3qATYNpj0HoYmbrdUYOhEPSvaXNoryrSf5vjlFIDilzaAvTMZUBwB8I5v@vger.kernel.org
X-Gm-Message-State: AFuF++ltbIIEGiYIozVOMGyzhoZWW+gJHV45BHfMDzEdO6AijEp5cxt4
	CukSWotw59wwl3OmspMcxCp38UdqY47/iRBI4MlMEqcUYDTAuUswyZ+rIbKxuUi7An5CdxiuTYe
	0a/+msrS4g4av/WbD0TE/ZTM6/UGkvAJkyRLUZpocdN1CHveWJtimoxVnnnGvDmXSB4bw
X-Gm-Gg: AYBFou3BuL/L+Rrwf/l4UCbiRlpshgnMQbmTWhEJPhndfZQ5+xKneVHpnI0g+FZRLGi
	nKa9vhZiHrC7CeO7WwdLwE0wQbYfBS8EtVYymf5FrOczAqxJh4zuJKiTnGsaIzaHlspGWrRampz
	MkSRSDkM4zpuzMB/S5uxebfZy8ov2LrUlcV5TESpNi8WLidVnBFl5gRSfMwgCaNOBIAWYIIXppn
	lLMXAnXVxn2fWOWUb1kULexoCGgjj9kjqRCxSJdVUE3oAN50wvFWUxlKdIChuq68gPzWS2GrDAm
	aRveo0QoDzNzIv+KrkLVDL59V4vdBBLCIYcyavVK0GQ2NnGgoxIUyp7il4rLhpWGpbhafFbvLJe
	D6OgIrpxJM4RC751eI3UNJ6164j9UCoMvMUh7j0FNVHLlLDdg09QrWD3ba3+Bl/e0RqYiQAxMz9
	Rl39HhV+cY0odiiRLC1Zbiz5oGs0Qneopt/w94VIfpCRHxAl+VzSg=
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr1026086585a.24.1789459868542;
        Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr1026082885a.24.1789459868076;
        Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:04 +0200
Subject: [PATCH v7 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-1-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX8GzJmieGQuUg
 UbU6yLmzwLTg31gL9OypZhKnZwVJtTla7AqfO5HNECM5vw3uA5JplcyyoCNV7zl1lODmOFXlcAN
 asMTS3OHCDQrBxub98S6ewSTuz1IVss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX0b26DDZzRLey
 kv25AGOyoE/xmZT0ER2TGSkkdDraAv8eqMi/lNv7uSxvIOElrfdbPg5symhtkSBhtIAZjbnuHWN
 YmG0qifcrHY77ecfOWreczuyLnddSdq0Rn0YCWMocafVBBfWQqPKJ7ic3ihN01wXfXYPCsAlvP8
 oJ5BZT5FxGb5GRHwb2q0AkQCIuDQTsIxKJXfiuSXazkWgFFICNZmQhxWjWr4WUZzjQCTN+6+r+l
 4e4fNktWGCEUqcTJhvTsodPYwFIsYIOt+ui/7oa1E9TusKaGjBM8wl+sy+TP9yoFKzB0ZZlbCgr
 s7vAkNLq8x0vO39uSsdoXxE15Nbl7+2xG2YCyEJFDt/IsnyDAyWic9uyTTjJfhABCF5mmkfp4DV
 57mRQnWW7RAtnNjfDJZOZusp4kcnQGdoM+Mmt+DpyxrPawxGia8Gziz/Hp/+aFNXSoJ4M+Z9AAn
 mB40IBE657gP/dMBoHA==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8fd9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mQGYurjXkVrKghDMw1Hti5v-DwpFwdxR
X-Proofpoint-ORIG-GUID: mQGYurjXkVrKghDMw1Hti5v-DwpFwdxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..fce574d9268a019aa7829e8dbc06a6187cbc5c62 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

