Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AB0474261
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363720; cv=none; b=lypG9H6ogCy5NmXgE7n5QjW4ox5PJ7gpPmJb5ZO873S76ZoC0l8gNW8T7IQdlTPD9JmqTct9HIzL7w5UuvtgaC8XV4jRUkvMWCRNmBG421SbOWpN19VEWOO81gDsLMXlXdifMPjYc5AEdSdUiM253vGTDqshhN8opR3yLGVwySc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363720; c=relaxed/simple;
	bh=T8GaM/DWCcTwfgaKLNVN9FohEqx9SJOxt4Sb3BkyXS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HH+/M+gI/g7JwirUCcbWEEXbaMuIFuMqLUCOGTcCvZgTZHrumjagqh3KC6l+BMXbWQ/1BzD2oejlCVP7ZpV4CCVyDETfSqXEX+eOCsIxnuFHWfmveVJX6YCFkqkfdOrES3MzOlT4coycCwFuKUJWrMqzm+nAK60Xva2q0Z1s/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blrlk3rz reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blrlk3rz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jRlt1873335
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3s9eIt8PRE
	KTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=; b=blrlk3rzgF1XvmajNUV439Xx1RL
	FSZNlvvah4TZqNZvgGD9CfhGLqPwi0sfOABWYiCViXGJKU04+H8vhaYc7z8I5Ohc
	3UGcOP6X1XscXXldLQMO9ctCe3Ecnzp16hoYgmMSoenJHoFpXqBv0YiZX+4Z9tiK
	Bwa3m8foxS/JwpibQq8vPGz5Wi/0DkH37HUS0+H023FpX4IcgAxkL7zJW9OwHEIr
	AzXwJcSjUQNdfLJ0X0L7qXq8ZwnnTmljSxEOgoVvnS1JijvwWKZ+T44arqFGxQeJ
	dNI5DtIIh+ilNUCWz8NhMMw/3XLDRNFTXjWWVndWit1wjUxpDWw89QKhBMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rng3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:01:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso738827085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363692; x=1791968492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3s9eIt8PREKTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=;
        b=c7tz5hhjbYP0fZV5ne1hVVlZVuTESV02vSOSdrzTCb+4kHY3Bw3BhJI9gtXvgWz+M2
         CW2q6haTKyZUCBdh/6FswIx+sXzITjsiLeuBabc9YJqs6DdWe8xU4k6YNquuaj35k2nv
         G5ltFL93NUEoZYPP/ex5eEPRQlJ6lY04Hd7HM3xlaEOx5nfVpRQFfM2DGylHo/Kzbkid
         7G+z+8mQc3klYyh2uxdxdRCkIgiCuxrMpkoGl8QymSfHEbjYewA71YegXbWEz1yvTtnQ
         VTZW2V5OIzKX5Yo+LJ1waggxTS50bWvOQh9yyY0hcBkBQ1cp7yhaZ+dNA818TWzrDFUx
         9aRw==
X-Forwarded-Encrypted: i=1; AKwUvBynGzVTjsJrms6Erd0INJDjz7gWOLOz+VpaiXdSZ2mTj68WcwTKLgyNl7wKg/AJEoZX3BkDQu9Fw8GHvk+f@vger.kernel.org
X-Gm-Message-State: AFuF++mKzcAkip1Nfjuo5sq//RlRNnLU4RDv3/U1ZNvRDp4O8b1NCA8X
	c6hRj7PCctOv6PQfifFJ3fTl9yQARok/gnV7jpROW0+YQTZ58HyL/9Ca2X3u4JhIFIG1YqCOI26
	5XhQPTuRUryLpV+JUHFjMYfdIGbt61p7Yn8gVuwvFL6Jo5Xm3VKw2jSleyTAIOHVtvS/E
X-Gm-Gg: AYBFou0CoHsAXNfRvaYRahMqpc/ufh5V4x0B9ZejLNMtYhY6hz65sgu8okpL3r/HUiY
	fYuagjAPO2zCdQ96bUxA/K1l/sV2NUt3/3uY2RQIwE0WUQVTc9NOdI/o1Y9dgY7mWtP+TPSTvhT
	8v16cW4mCOAZaiOSP7MboqXmGw+ONxgHNUxh17MniaXurWTrBoB3q1gaOYzsmuDvXSktpwF7zpk
	OeAr8TD7dRPVpOyHUGEqh//0wzkwhax7bmNFyKvYKjrcXeUOt83hv+F51KU4F/ywqH2X3mQHXxA
	Q5MfcRQr45/O6pJKQspo5VK+mlpwu7b2RxUXJj8ZIKKdrPGS2wNhAKbgo7I=
X-Received: by 2002:a05:620a:d93:b0:93e:787e:bd72 with SMTP id af79cd13be357-93e8610e5damr1003527585a.35.1791363691679;
        Wed, 07 Oct 2026 02:01:31 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:93e:787e:bd72 with SMTP id af79cd13be357-93e8610e5damr1003522685a.35.1791363691199;
        Wed, 07 Oct 2026 02:01:31 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:30 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 12/45] media: qcom: camss: formats: add pixel format lookup helpers
Date: Wed,  7 Oct 2026 12:00:08 +0300
Message-Id: <20261007090041.3732717-13-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX40rSTpGB/UsH
 QFsyz90ZA0gWDb1ctWcccWNRX3+ep8nnED+I641vzY1VEZHbKTrnw4lj8zQbNGOOjYlAJD3WPIV
 YHybeisYUMYME5fUjr8r4jhLZ1Heg4g=
X-Proofpoint-ORIG-GUID: Gri8KGgOhR28jxoalcMFSG8f-6PfXZO2
X-Proofpoint-GUID: Gri8KGgOhR28jxoalcMFSG8f-6PfXZO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX25f9M5IMpkM0
 rgtpvF1l9nTM+kDJ8wA7TnmDWo4+L5WhAFBo/Gw7LWwvHkAJ7n2hywHa5yBvm4l/mBXu+ecEaeR
 kZyteCHheB0IOuwrbfKKy/wqupXzYsHBeVdhck76tG2gTs0hIt39YxIbTFHwFj9fkiv/8cj181t
 rJ+6wyayNDL+YKU6xSkNzEFbQBTF1QH6Wq8P+MRx+ok8hgWvVJ+iyo1dVnC1cE4P/BUPehXpGRF
 vswXGmYapJJdhqbMCeXIVMf0sHDJ0oRrDBpHenE3vwGitm7m3eAprmGiwEmjlSlqJqA033UwCat
 NtO3pgnXzyvfro+7zllfbMUkJueWmtkWBGZyD8zU47eTTivU+pY/Mh3BMiTuYpP/iNFNOCMzCFI
 3XUZPfiiljerDYuqjd2Bk4Xr1/HrbeJKusGeEFyBrbMKuVRXn6F1JMArLN03Ge5ERFpYW3SJijr
 MvvhHNOmfo0Jby24nDA==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac60a6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=q9B_VXwnRp6pzYBZdsAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add helpers to find a memory pixel format for a media bus code and to
calculate the stored depth of a V4L2 pixel format plane. IFE format and
performance setup require both lookups.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-format.c  | 31 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  3 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
index 52cb01306ee0..147287e7f033 100644
--- a/drivers/media/platform/qcom/camss/camss-format.c
+++ b/drivers/media/platform/qcom/camss/camss-format.c
@@ -12,6 +12,8 @@
 #include <linux/errno.h>
 #include <linux/lcm.h>
 
+#include <media/v4l2-common.h>
+
 #include "camss-format.h"
 
 /*
@@ -103,3 +105,32 @@ int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_forma
 
 	return -EINVAL;
 }
+
+int camss_get_pixfmt_index(u32 code, const struct camss_format_info *formats,
+			   unsigned int nformats)
+{
+	unsigned int i;
+
+	for (i = 0; i < nformats; i++) {
+		if (formats[i].code == code && formats[i].pixelformat)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+int camss_get_pixfmt_depth(u32 pixelformat, u8 plane, u8 *bits_per_pixel)
+{
+	const struct v4l2_format_info *info;
+
+	info = v4l2_format_info(pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (plane >= info->comp_planes || !info->bpp_div[plane])
+		return -EINVAL;
+
+	*bits_per_pixel = BITS_PER_BYTE * info->bpp[plane] / info->bpp_div[plane];
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
index 4f87ac8c4975..f1af2d3a2c54 100644
--- a/drivers/media/platform/qcom/camss/camss-format.h
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -59,5 +59,8 @@ unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);
 u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
 int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
 			     unsigned int nformats);
+int camss_get_pixfmt_index(u32 code, const struct camss_format_info *formats,
+			   unsigned int nformats);
+int camss_get_pixfmt_depth(u32 pixelformat, u8 plane, u8 *bits_per_pixel);
 
 #endif /* __CAMSS_FORMAT_H__ */
-- 
2.34.1

