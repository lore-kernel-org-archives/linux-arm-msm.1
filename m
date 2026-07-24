Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743C6432309
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896942; cv=none; b=JDZusEaUxgCO0IG0KN/XRj+tUYOClgLtpyJC04D4XuQQLpdhja0nKjt9rS9gvy9a0iFcgnpBQ44Z1Lpm5wV6iurBlo7OcbWiapg3gFGnY0iDTbGkpkxmk4Ue4B6j/0j+217E2Jnj0OhfaeN3YHKfCY3Ub86Qnj4lWd3cwEkODj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896942; c=relaxed/simple;
	bh=wPkzhur/NK1jDuLBYAFWPkrcGSJqVdt0NxnLJdG8vTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0Og8IEXSssDpb1F58IuTh//7M9ACNhgNxYB8P5NK7uHIJ+3B4ZL8dJHNGZa4tmnR88a6wWu6zXBwDINjR3XZFFhXpM41uol1y0Fn6XBF+QdvYtn0gw1QJ5BF+ndNPMJsyQwE0ExTAEeG+AOAmTdH+78YnUUL2JHq0wb8Z5lOi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXWqa59H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJK8KLAk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXWqa59H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJK8KLAk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OCgJlc3057389
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=; b=XXWqa59HcE4zdB9t
	53Ft4S3nfR9aSQaSjhCNKd93KFtCQ1ToeWjv5y/C+vd+2OuNb5r7GPfRGG+HAARe
	hoMOqASymbB8a5U15AG5mZ9ENuClGcwNrLUiExzW0/9neLmRKMJv+rZtIyoEJ5Tl
	3ViWB7WaBeASY86E5bLwfm5FCNgGRmMbjWxSNkwLUP7LU6EDzndHCk7rkJ6zxlwb
	vH02sgTBiNgm3y7qLaFF+9Gv6SiId9c00xdnC9hKPvawep9dzZkN45JUFFTYhiAk
	rrGva/6IvFjW3Vl25sxIWcbyG6OlAkl2qS/tmHeZcgSBJkOXyaL4VlKzspjHPUXL
	CVMZ/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yagj54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:42:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so4353681cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784896938; x=1785501738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=;
        b=GJK8KLAkWB8jJUgXu62Zu9xR3LhKWR+Darg9NyE7DVlJx5x4MkaQ3p1mkeRihILkdg
         FqqG3pB+Aw0y7SwH/yeDRwol0im4oG3wtLbj2QvQVu7b9HFIlrS/QwXNpL825flmTBL8
         PxuJWo1sFDmsOWZpdX6+6Dr10w/3ercTwiMbiKSKl6ECaQW5QO7m2AHOI1+XlKftQ5YR
         LQHD8rrXbF8myw+dBSUybWdEIjllUDghtISckI3Dk8+ZX1gqSZI4RXRHhJ9UsjrJ+pTS
         mxSl+zjYPxoeg5tvI9rpB+vBq/SusqG+Ihstya9OFq7riBiWEdpkaLnHYeowZcg98tXd
         AyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896938; x=1785501738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=;
        b=QFZc92PfO5kFtJK17ekusnFEUrQWTtPeOLhruGqKXuN51Ng59dI2RnpjUy6ZU459Xq
         p6pJNNdUkncuGGWRcKb+nnLSEXVDU+cQED7qHBkdub1Yfu3JzAJunsqq7U/b94Eiwk4p
         7j/ik0CJxbh5IrZCYy3cDN1Z/GxLs/dgcF+aeknz7X3YLzoAtLBnV0/Xo2450wGlPoEE
         AkVu38jYyViafS8sG4Kk4H8udj0ApbV76WfGO9Qog+fM5IRZ18gFePbNVSlWkmrlwgIa
         fVRRai6DLbdpTvkmgfu9BKyRPdQ8Tp2LwQHohv+QofDEj6xK3ViPPUIHfnebSmROJFpo
         fTmg==
X-Forwarded-Encrypted: i=1; AHgh+RoDEEHjmisF2snwwx1o0bX9pA/cVvUUbkNwV8mzwkhqzFGPiRHEQu+1wijl1cRgjPNktlWFCA5Ymb12Ryn6@vger.kernel.org
X-Gm-Message-State: AOJu0YyLuPLGa0OqTsqRnFEtx+ZgBe0f2J6lUrWwL4HvO5A5bW3DhlOE
	5z6RAT/EJuyhRrVGv5lL6UK3DL5rlMLo3dGFVMrXlQw7hsFU8eIO/czQqr3iW3pG3X9j5ilaKte
	8HDp+X/ipg5CYODJKQgXVvylnChw5RiIRSAgb9NhmDIQywd+WW6kNliwmAFa/UqisAHTU
X-Gm-Gg: AR+sD11b+ADmKDs9MAEEWroIZhcLVGtcyl18qrF8y24GUxLNZs0GCBa2uBbi/P1urep
	dIuDVqqet4nMxsbvjIcgrh0+mhdICuVR1IFfi3NRk3mEVws6RMBZb9wrYGeXYiLi9oQcpBS0OIB
	cGkiUOKXyQwTNeOBgHfhQQPLbcIiy2popZNJiUXODFs9HugP6VevvcTaoVbd3cV8L+2kOt3OTwn
	PjH8p7HXq08jNfEB9VbuPyzTYKABS+iWOl0+CHKDx8p/bFteGs/DHLyxXJ3an2vg6qzD/93mNi+
	ztzV2qdFASTwzb9WFL2j7NoekGEUfpHfJytIOB6uttNkxGYioSxLxcwTupnr5c+Swrn/ZopCMvM
	2Eu82Z90vKNS7rqIJ9B7Nim3+rFMo0yw0a3bIADEheiFAqmCbunNrlwKXgMRNcKJOLQNVjKGsGK
	DR3KWVgnz8v+hEnTk5fQBwETTxq3jv0+ogI21MLZem7uZUiHm41A==
X-Received: by 2002:a05:622a:903:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-5283ddf7510mr64662971cf.32.1784896938493;
        Fri, 24 Jul 2026 05:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-5283ddf7510mr64662651cf.32.1784896938025;
        Fri, 24 Jul 2026 05:42:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm352591166b.43.2026.07.24.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:42:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:42:09 +0200
Subject: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfXzTzeYI0r/Djb
 TvfilKLaqX8UNTgN7DPJZI+r6dfUuAgGaS8QUaMOHfv3qu8X5MJyDlIZ9zzSRCx7ShiCjyHEALO
 QZaFs5XpJJUy4zKmKXcW/jP4/FXl+b4=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a635dab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: jx59vUmPsBaPNmA48mis8WlCFp0sngQw
X-Proofpoint-ORIG-GUID: jx59vUmPsBaPNmA48mis8WlCFp0sngQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX6TnxMM6KQrG4
 ghkMZu1PcytUSRtQcrojPdcwSHO2sWKpaAzX8GCZfqCEGoD8ZnTV+w56ztJuYSfDbDxzxn/8UV4
 SxtYHWwdqgQBTdHkbioA9JBjV+ciR4rCzVLkMlK+ejjfhD9W4VLCB5brmccpR3cHaLwuGAdNcvo
 /ItVm/tdHEM5jNBna4atte/2oqJAs8+9KsE9FoSG1A3nKJkfcViRTHX6f3du63/hevgaKAF8WQs
 XZwJarzc+a93scxm9CrQzrEYRbBTNVzJXQRcAIvq0CDTTLMVlTDrT5C+tqzCZTTOpjFJ1ThzT87
 wOJfk2zCaY2oq4To90I511pFNC8uLKenmC1yiQVxzP2Fu4M2kmNjo/iwb9+B9uvREPmDTViOv79
 nOvlZU5/3kZOmKSoEo9QybN7Eu2m3BIFOb/FyLYLZlW1enI8g431QwezRVqgSVYuP+g0EGfXMMI
 owrS0RkRqcr8JgbFJlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240115

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
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6fb2570cbc6bced230 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

