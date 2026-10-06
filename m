Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754F43C583A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326527; cv=none; b=YSZQmD5OmDL4FoigSU1wYzy3ZimF3//DE/zf7jslj6JJjlgHZju9UjF6/P11yAHw4d6LGAN8LdOZLxM52Bd6cZQ0S/rC1/WmKDAW7e5CK6ppEuY43an7p4XlSOK90RD5OA16Ow6eenhRXC2E7Y2FstM/+6lfpgzt0ohx06ISrC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326527; c=relaxed/simple;
	bh=T6NGPeImLPospjxS8/pCO+W9TSe73t4Y6Lz+PI/W/L4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J+0tiSrTrni6jQluQFuhVgHNKfKzBjyyBuXf8Ffr1sg66P4FcEXfu2Q5174Z5/ozYmpDRksf88IqeKQ+00ZQMFbIHexJQSCwhaO9kTLz9bw5T1yMkbumvvuXHkHp2VqxyVQNENlbLCazjRGfUlY57nWuompmv7aF15LrJDjM+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWqnxPLy reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWqnxPLy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeNvR1899642
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DrnF+WzDhjC
	ZA+grZoIKVvpbcMd8nTjpbf5IDdeQS9M=; b=pWqnxPLyDwc60BTeVl9q4UfcwE3
	1ViwjEiWDGenyjOvk6jTy3G7j5WAZ16Cj6BJl1N1AhKST5mSqwYYPN9gbHnigqW5
	yiljH/cEwHa+qP1hcmqSVtG92J2W4VnjrPHlglG0p18Erv4ymPDpb4qsCCbLrAbr
	77QpKSgJgz9+SNy2+1fa1eh0NE8nsQUchQs6ZX/+xY4/1Ga035DckVYl5op8dGFJ
	C74pLjGEjfkjqyQ2DH0IdSI6yV17VEGAD/XcT3yoITErWrVHM6XuyQIVd1B+fdYf
	XhP3At8b+zCsmBrO3k8coajRvUdc8L7VJL/+dzTOhf+5jtroEn7mkJ2xjtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uhn2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so725141585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326477; x=1791931277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrnF+WzDhjCZA+grZoIKVvpbcMd8nTjpbf5IDdeQS9M=;
        b=HOXfylFcFnnYrzZMwvxBOSdyygLNSqTNEjoeAdqy+msZP/fT2LEbjiz7vq573iA8Dr
         aayMsYboz04b3fU8APjphB0wmnMVh4vB3XNlv+J5NPepPBVTWU8fi8GRbSL6HDT80Zjb
         c81XdtJ7AAYRiIxrZz0N96T9AMsmNm3yxvGfBFfRFkgK1z7s2Mjri3tjfgqtfkvvY8r/
         K4LPZV6ia4YR4ko3Q4fWuFecjpHltOrEZhx0e1Y4AiGcW5XRSsMNHHI14VszxoL02LN1
         QksNOTzpV9YFcxZYPN+bWenBz6I9kJcOjBsLLZRb5aayo+wyvkBLUFaaPKvjQ2r4VEEY
         phJw==
X-Forwarded-Encrypted: i=1; AKwUvBzyT6qG89GL4t7B+zfLdMscTBrRo9LcBREO95HAHPov2K4S44C47PyIoJLYGT0Kpn+LJgiWSBF6VjQh+oGI@vger.kernel.org
X-Gm-Message-State: AFuF++k1B7ON9u8zkyrLZDQInSEKVffLZe+PyGVjZqH+0+OppZirmaZn
	PHiw5lHT6y5Et70WCeg6/QLMmgzxJyZMU5tTi2soCjDN0amZxWEk682mQh469NGwb+ZxfnESQ9K
	rWlNY0YruZzadlq2icG1jrIST/dLbJrDcPB6ZZJp4LSoVX4l2SYu23xhaOMrl8eFSGHht
X-Gm-Gg: AYBFou00Z/1txxLvjQeWTgMvwe+Xr703XEjRsPLBPrL7/9GbozEgf5+vmCkdfWuYfha
	gdBLouewN93CxfILH2xeTdcU9XZSBqOGVt9zTA0fgzBOd1LwMg58Zh8Jkq9TWrxU14AlQM0jeVl
	3ZS2DHp5UxSNG1zYMcIbiAE3z4/prKfYyaSfFd6h1f0Zv2Jxdy7l5x4MslrLRMaupWXqx+3JeYX
	IdGavCFjL1GBskfnx7hEYyHoqZ2xep1Sv8icmhw0B1Sd9EUzUTCh80wxkjMcEfF1umbo2bljM4b
	aLaxrhkOdO4rS/gJ2+1W6MTfhCW++PieNPSxNlTg8xnmn3vzrv7Jv8xLqfU=
X-Received: by 2002:a05:620a:4486:b0:93c:5958:9de9 with SMTP id af79cd13be357-93e9b7c7f3dmr72918585a.33.1791326476757;
        Tue, 06 Oct 2026 15:41:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4486:b0:93c:5958:9de9 with SMTP id af79cd13be357-93e9b7c7f3dmr72915485a.33.1791326476290;
        Tue, 06 Oct 2026 15:41:16 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:15 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel path variant
Date: Wed,  7 Oct 2026 01:39:34 +0300
Message-Id: <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C0nSMJaN0EhjuuKMemtyIh7ZVEZug_yH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX7+gcxmFrnox7
 6kzCnp6UmzXrTkYRA/3bOgk1kMo6OZXI6ewR2QULb2XE+RAvU2w9qhmyIRY8iZOJlcIZqm3QuF/
 4um+AS1VwO+bid5AzbvPYsEL5MiLYDA=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac5790d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=xOFzXCKjWWEJiKxN6jAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+u83lKOR0ixR
 u5TlEOMjG9HarNPtl6X8BSBbWeS0pi48riCBaXaSTUoXpAVRLbSjPokiJ40tc0ZbfD1TX1mWquc
 X6/lYqZUJz6l8EpD7hR4TLD3uwIV/S/mqNuoBDwFqMyLVjmUggZT+kIbctVVBYaeT1G+uLSCijh
 EUM9DF2Anh1ShWtMtTmp3r2OnnFFSi/sT/Ep5BWLcjO5NRmXOSzf4tdrJmhRq5IUdNoeNYPGsYM
 FcjZAyxePaL9aH5YapX8F9jANqRr2doU09jO1QsJQccMcL9cuwSziizBHSszN1JkJiZGSEcTREY
 kO9U12sET2twNMdmnbCEGgocRZLexxBHPqhhCbyPXvnZ3coFqxs0OuSVbFZM7MaXFQ2C9utD+lN
 a7bR+ZmHk3MqsgWA+xewou89OIFm3UcHkhd5AwtDTfU0g2NvCT44/rxhBNMcl+msctIzL9qIFiv
 JoF/S/69Gh+PUm8QhGQ==
X-Proofpoint-ORIG-GUID: C0nSMJaN0EhjuuKMemtyIh7ZVEZug_yH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 48f280e99809..9206c7cfe197 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-camss
+    enum:
+      - qcom,sa8775p-camss-pix
+      - qcom,sa8775p-camss
 
   reg:
     maxItems: 22
-- 
2.34.1

