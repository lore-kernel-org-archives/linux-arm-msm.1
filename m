Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F825218B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111284; cv=none; b=XKam4ts/LIYiEvo53OTKGrnJRUtFIDv6KVqK/eSWeKQGj2aBzGDvPWXV53D6IxrzMi4PtQN9QYJvCrW2sy8jBWSsFlV/+RCj5n3kUmdFxgbV69HmagqlJsOtguzPSima+Qk+HSd9AABGBIOsGYhEpEiszF/blZOTSJK8U84Z2xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111284; c=relaxed/simple;
	bh=CCkVQQ02A+XZd8aWHExIUK3cAu/PF8VsO3Lst1ch1wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O2gi0fTUEIfJuWgSCiqywHcHQmtT7nTEAqjZ+dRfFypI+XQC6r1AipHhJBO67OcucRs1ZyECL/NIofD2+oVv/UQrJqgg15tS6Ek/bMPb8irdcEpgLVE4ozyPdOXgxPgHJMRL5XJp8//kAm0pIXU0muVUExkcv9bcXX7wNHdjpx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPUvC4me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4eU6W43; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPUvC4me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4eU6W43"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7RA4900465
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=; b=CPUvC4meGUur+uy5
	tVoNel582JDy4Gdf18KfGaVOF9Mf2KpUymaV0li2Jv6U6eZs3w8t8zRaSHTPHiwP
	YtvhAtlWJldkwPesbl0ZD8UP2i7Fr1DCMTk3sGZf2RpAOrdy/bfLuIdZe3VuIQyY
	LqLiCmdAlwjx3xwxa+8djXBu717yVNYybc8UfQ0T4E0PDcafhpqSaAgSJaXIhC9/
	ozOKgKXtdZcpsXmlBIOiqwDQACB59kZxHyOqBNZX87uryn0xn65rYVbx55k3/uc5
	S97PAFLEwnPyEb5d0hC8FIFeXkQfkh8ahQLQOsTImLCVTiUgsBlPMlO9DVYclwr1
	4D84og==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyut4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:54 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1416f32fe11so510775c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790111268; x=1790716068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=;
        b=i4eU6W43uUcDbMsGoics8l/jV0XB/WX9FMBcJmV8I9mPRnSDKrltnHcMK/3ahbwqtt
         SDajRxiZ9YzXMDTosmoizBTtqR0uhe6lbhAZU6h4qoqCeSqUleV3WsaZ4Xy5IYjN2K7k
         4dTpwfkFw3B1eJalGkr8jaCkLJyXN+B4oZnxD6FYiDAO4nDPpy6D61Bd56dBk/eh5sVC
         LsuKqcfbjNzRYdxHJZ0oqomznKCoiLXlRZp3dn/PRdK1SqDRAqCxvPDV+oaNSqFM2uYH
         3o4AJobW+N6O9QRQh1yd6sUi94yP9z3nz694KOahj3IdtDGiUgVmg1VYmegpBVcgxAvb
         DYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111268; x=1790716068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=;
        b=xqBSXWZTlNkbRNEn10tS6rPx93Vj4SEVeWpK8YCUp7vuxjh9QaeIHK/3/RQzpZaQT3
         1kBJCtM4TpGTEheylYfBN8+m61vORF17sEqbQ9oGeUSD+GSK8IoX/xuSwNFDi5M9QX9H
         FHRXca0kveZwfDx+S+yaQ4iTMkKEulI/0qcyGWsa6jfRCjd8OA/7BYZm2FoRo51OjU4t
         qcNAS3rFIs/B42Hk9zLruK6bTKWiL6PSVuTFuDpb4ac3OVGUZDpXPYqL7iN4w/NkiwOO
         8miot1vdJyP+3564EfcJWwpP0ZPu928CsHsNX7F7ywBKAsh0YL/rNGahMWNwcLZf53P/
         rNzQ==
X-Gm-Message-State: AFuF++l5Z5LGfsG7xmlw7TvTf91nOqzOw2Xz/CUwF5dmFMGRl/yx44Nc
	078U7RCblNpNPbZz3hA82nekPEbU8/vGq0Fy0Oke7f8wwnScEWuaDrLfCmnJOVLahMK55wPffGH
	1+ZJH6CZkTMAdbRn6sYFU3ZMS/qDoCzuccN+iuJMA6qrPOBtgL6nmlkGLISAVeeJpkjBTZ2Tnez
	i5
X-Gm-Gg: AYBFou04VFd8Gv76HSEl9SmJdER207YX9X2bwC3V3EgEzPvzZ06GlsvwLKNHvaubxe7
	jApNC6fV0Loiu8WDLFH5MmM6q9ed+u+z0zaetcP1wc/Loz4Qldb70CEleRcRNT5tQHCs1cMilhE
	iBJKevjZjNaDZH/TK/GjAG5p9kUsXdkiEBIn8DSSmeEvP4IrP+a8Tw8UGxSt0J9+rKe29VoJZ8B
	yVCpcD/sUUmPzKBn9r3xUwGk96FOxIoxlA4HrT1pGMpzknhEVg7DssZcfrs3ebPd5JLxxs2Q9+6
	j4gVnNW6UK8Xd7yxNQc9AHP7WWb4elqAKa26QAwiypfPL+QunUIKj4hgUZYNkWNm9iUJGtG2gJl
	kKZnjPY+eyfYIolbc8ERLLvQS0g==
X-Received: by 2002:a05:701b:4208:20b0:141:4a06:ad64 with SMTP id a92af1059eb24-144f90bb165mr692604c88.10.1790111267796;
        Tue, 22 Sep 2026 14:07:47 -0700 (PDT)
X-Received: by 2002:a05:701b:4208:20b0:141:4a06:ad64 with SMTP id a92af1059eb24-144f90bb165mr692570c88.10.1790111267108;
        Tue, 22 Sep 2026 14:07:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm1157207c88.13.2026.09.22.14.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:07:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:37:33 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SM8975 SoC ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-socinfo-v1-2-f0d1aaee9323@oss.qualcomm.com>
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790111254; l=674;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=CCkVQQ02A+XZd8aWHExIUK3cAu/PF8VsO3Lst1ch1wo=;
 b=lfS0tsTbqzXwgmy7dSrn/cs+dxnymFhBN8mJbWxRC4NzBJZfizJik1igG2m34OdhNdoqAuVOr
 96PSl2C9Wy8Axs+sI4/q8kkPxY8jd5BsOpqjE7CZDdsQslHjlfC+Q7T
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: NjqnnoVjcJfJnm8mVzmgEXMv43Jcl0UJ
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2ee2a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=c7wgbAQBttT_6Fm1Qd4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX5wB6ZhySpEjX
 FyL+vZVZ7I4OBD0D4a0CGOkCznV+ek+xOYAuAGOsYv7M0iw1vDqkCBM90Qw4HonR3vMv+C53Edd
 0JkxL7oXsyG3jOPAqpERjtd6aa+OG3LxZzxqqqjDX6pdUsdy0Chz/60wc3FcUNpHo3u4aoRYFca
 P3i82fYjdENan/+bneFLsnTI0AmETjTGytTNdbaLRRTjt2Si582K+gR5L5TyDAb/3U6f9KC81Xo
 UbZhfkIZ9VG0JW3UL5G42VR9BM9IQ8owPh7Tf1Kq96EalZI9QKD4falsEILz6pbrINTm7HEZQbr
 fC7iFwaXVNh0DpJ5He1kJSt7T94vXPVA1QRVNLO0VLv7vW2YMDbTGwQzvcVMvgQFWp48thAXgAw
 GtA5n0oVaP9Om8cArlRPgYiQKhHeus2+kqnnm8PJ3v0j8TGynKaRyCyrVLa3EKwlIUKC2KgWFiY
 uyXO5Avj6kxlIn1zzBQ==
X-Proofpoint-ORIG-GUID: NjqnnoVjcJfJnm8mVzmgEXMv43Jcl0UJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX+21ExKSoz3TY
 60mKeuM5rKTcvmLpV8FExxvLFQz+cVG91CnWLIxTNYGafn5pegVKALWpmz7SQeQi84b42oJcKXT
 YExFYfefJr6zShqNvdtZ0nlWMijxyqc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220297

Add SoC ID for Qualcomm SM8975 which represents the Hawi platform.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..ddc717382797 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -542,6 +542,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
 	{ qcom_board_id(SA8797P) },
+	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(CQ2390M) },

-- 
2.55.0

