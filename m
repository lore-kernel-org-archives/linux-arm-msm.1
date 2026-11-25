Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594048;
	b=jcLTDSXIHzgW27F8wpaDyGlEcnjESZMCgO2sFJAPrRlaskWF1a4vWwYU4TmYCLC5RLfk
	 sdynYGkHvKrunAHHJ0hof9vHo3yOWjeVAyKaFsp8iwjwnVCB8lc/JxC+piIF6ymSY0IdV
	 L8r5iwfS+rzYFQAfJUrGLuDIFcEFdxd2rLuxnTHH1j4yTcZdCOd804zj0+lo1Qcqb4YIl
	 gsyvmQmKYTlFCV0Dkosxz3oOhKgRfbZp6Lh3Bwr8r3z/zh3+idohN8ZSMjqHKwS8wFDff
	 FPNgbOguwl4VOVVKgvqJa5WxWaCLSXGPw6ogneAM919D+ItDBpVk8UxfDmwXYXj8YIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KnJ4D2byKSqvUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=;
	b=hAaJZjDQCuLVDvcPkpxQDZnX4Fa4ARKBRN+S7AvBk0AJ1/uFF0GMeEZJ7x9hPiW92TDg
	 BW+lgEFq79NvPMOUa1KU+LysSQo6PGjICX9Pf8vnN6vkCUM8M4E3u8qKm5dAh2JaK4hnG
	 HRRQXrgGQZN9gjtZJkgJqvDIOGvoFxqVoRwem87b59yFAVcCb9z2KKjpig3WtZrIwiGme
	 9M6ljCH4rOxNHymuQY4Td/9GG0dnRURuOka9ps3DORudAaGKfWkdMd6Val+LAa/KvoVLV
	 7qnYOLh+ZcwOwtodybDiBdnzyW4BsnaqLTxOfYq21m22SC+/fsVzh/j7NZ5QpxwSnCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev6xJXyZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93637606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93637606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev6xJXyZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69tfj1006343
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnJ4D2byKSq
	vUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=; b=Ev6xJXyZ6aecoiO1HM5wUNfbmme
	hU7apthnajHIz1fmbUpbjcuO1MneckKvv8Mm6VF1q0Jzm9nGLIaMmZAlWvUg5Uq6
	PZDdeYtDvfbIv1rRWzZXplYT2KF/yodJgs/FhEBnMrftEsWFJzeBnF/pJ9gQffBV
	Y8Wt+BRxVykjZs1bq/cka0l13+T0e1hefWgDJUXd+cYjCcvXoSLMnfTMos91y2S7
	itKAbbzyy8RW1sNp5M1qR1LebddLQHZOJtboDn5KBTk/E5tW/nLyHJwHqWGS37wO
	armtdl1wVHSk4RPjkO6Jx8ACevlWJ18bxxMtm+a0QEMdSgeNBDM6jhwH1yA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa292rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:07:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e0ee0db35so3700750241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594045; x=1796198845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnJ4D2byKSqvUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=;
        b=PhPadPQKVzXsvh4PfCpIUELpklozHvNqRXr5cOdgWYSMV0nR89mgeMoE6VCTAI/asY
         hepFPPAxLtFjOTzKQO5uLPl1CZjqWks3I7AN8uFswCAZioqAfLPKQkLECVWqqKqszaOU
         LDMNqbpjbYLXIFuM64sHE7uSADOwsXeounjuzGKwzSkEToV+VkS64rWgp/AHf2WG0aZV
         XlJJ+lgGw5+xDLmVXx0yOc2Gy+a3RKOxqGkPBOuxTISseMy8SIhWoYxV1AN+IwgWNb2M
         zv9fewe9IvVSZKhU/hla6Ny2AbHMI77guDwmo5p0rQT0EBAICKFo9u29OeEZFfAX/vOy
         EJJw==
X-Forwarded-Encrypted: i=1; AL+hErFIrM0Z7c7khi9/Y4B43Y0sUj5XGGpL74Ksc71PuPRuEFOjGZLiMeWvl5kbIheT25mPlJQAghwzaDUNELPh@vger.kernel.org
X-Gm-Message-State: APuU4Z/7dsXFv1FjXc/cJGlahcuP115dK2b6I7KR7x/iUiWg/vu0Kt1b
	IrXv10DFy1BFvQgBOrzN5D+izYYC6/0GQ8VxqTG6uiqrTxFK51yMGObCykDHP0BhgL/hvYBND1n
	f3boCbGQKQxdLrd8uKSmdnkbUJejlkfXyxVfbLRKek12KFXOwYa4e14KGg+lSoHYaC4CUEWNQpd
	XbTc0=
X-Gm-Gg: AZFdTZf/FBqOUMeP2N6bU41433wB+vcTMwxg1qaVvanIuRRDjcfCB3rlcWL47hYJy1/
	KM3JexKW26TaqiBvayiVYIGdtDUEnGBnqiu/5tWcSFarFrwr041bokPDCF4j1SEIsx6yW26323V
	4+jJInOxLLkdQ7DUAsABzpECorfFsJPGVKxUGd1VXJePdQUA3oHExVTper+4xZJY0KaFRKSQT/W
	2H7LU+zJKelAGbKJby80tO8hZ0PM1jU65y64Cqlsetm69kzZ7PeIbqrM76Hzs6fhOLBSDI2mVph
	B7wRMW++HvBvketV5xYJSfHC8WHj3fofVkMnFgRFxnA3jAewd9cPrbWlUFxI/oSAA2HHzOOn/U1
	yaiPhr+4HEYsR6KKEcWUKzv7luJ1zOvcy
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr2062739985a.83.1795593626587;
        Wed, 25 Nov 2026 00:00:26 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr2062728585a.83.1795593625623;
        Wed, 25 Nov 2026 00:00:25 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:24 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 11/12] media: qcom: camss: Enable streams API on SA8775P
Date: Wed, 25 Nov 2026 10:00:00 +0200
Message-Id: <20261125080001.2540101-12-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ppbYRUkUMx2p3n2uABCk4hj0K14mwL4T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX4ZP/4KnNNWmi
 GQQfy+cdZINSUjo79+zwOXjHnDjyrc+T9VG49JQZJ9XZnJiT6V12nCIhZzXYZPaUkGA9rtudPOJ
 Qlkoj4FBaJnMlvrZs52WIIbHB3McSXc=
X-Proofpoint-GUID: ppbYRUkUMx2p3n2uABCk4hj0K14mwL4T
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06973e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=onitAmIIXR4QNx4LYmwA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfXyCSFAg5d3yhq
 kGcJvOruaG7Anfm5nefxzmX809pqqEKD/A2EX6D6BkojdkvYtCNIB9AsnoGOKwunSgxtzKlsYjP
 n+5JACvu3OPTukab4Ym8aC8gKFUs2dWbr5dZDAy3lS3IZrAJYMGNQVvsQ6hP3wPlE7Frk8Vm8yM
 YLMtasq7k1Bv+lX6Oy3j6G39p4SVXDq5ozm+GZq5DyjHAOtWzkAPa7tBFWjLogi5s5QokSiAKy0
 ILo9f7oxGK4VI29RZVxIQ4KFMjFSZccwv9Rz+zy0UZFfOlNApj5FMtBkWR/3P+rHPVg6URxdNMf
 vYz7h3NlJiuCXIBFEYvsMAjRo8DqRdXej6qVWWXFZ5MXck4S/VqJchptYfU94ceRl5OanbYh6lv
 l3r0jimNLCSimXgLyWEKmZV8e6WWKRfBDJFeuSOrsuTft+dqL46h2FYhpPdpSdWoX/eqplXgjZ0
 vhsKLNQRoIzLa3az18Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250032

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Set streams_enable on sa8775p_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path, same
as already done for SM8250.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 77fa80dd79c4..e444c29fe847 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5719,6 +5719,7 @@ static const struct camss_resources sa8775p_resources = {
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sdm660_resources = {
-- 
2.34.1

