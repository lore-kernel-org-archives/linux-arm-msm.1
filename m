Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79779355819
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 04:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793210; cv=none; b=PSrqkDUKEXb0gbdcXroKDebYFCCD4rd5DugMNjVh5zYFwqRmjiomik5NhrJqO0b7/LJVyP/MZG6LNlOsOuRWGjPOpOr3Ay8O1gwuiqrMbJcF58ccGdOkENXWZycCX6QZ+4dB7JlNK7MuxKLsWJ/SSC/+8SX1iEld6KpOdXHSpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793210; c=relaxed/simple;
	bh=QNrXSGT0/RU9FGBzR1eB633FR4BNgbJh7WtYPXkRtdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYyz4w0oC1ki+dOUUXaqQhgg/Wmzyw+0dKAcN1Ax/JnxQXhFF91Hm2lsrumagqj1jHAndNs6wvcCxu57T/ZWX5syjA8o4J2pxW+nWdzq/wecHq0rEVke2VSdfZBY55bstaJjdAIKT5AqsGIp/gnBVSTMolaThM19E1oo/8tDfys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE5scQir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMLKGWGh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RE5scQir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMLKGWGh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J3KR6S3022411
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 04:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=; b=RE5scQirmniXXNJc
	rj1SuLkxf3KcMnXjISSr1GGOzU/Tbf8zwvVRPcS6/ONl2MLTdTy1IukxUo51hrgU
	xj/bmTB54OAYohCVvwhppQa5wXwXlALtFONIk0vz0Sm4dejzTzmCivHksaAa6L/Q
	NyhPxAyGayGVfGSZEdzSmfq8LdNUUlpCz2Dp0+Pcc0gVW1I2I+4OABIE2Xv3dluV
	dL7hPxqmyyjP3o7mvw8G3/1AQbrG8V/IoItqyjCve1xAWuywSUvmm1inCGvXqO5+
	Ql/KmZ5ZtSyOBXC70fmZwy5uJAxMsXC/QriRzmQF+cABW1snOdmSaaVTpMI/gRov
	rFkw5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd608v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 04:46:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so2097784a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793206; x=1790398006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=;
        b=GMLKGWGheLEAVKSV3YQUqxNXwJ01LqeVNBtS2wgX+iYa8pY1Wy86hbfikFAzgGRDnJ
         LHQgvvCkdZGZ9zEeZSmLIXaZYLpW3ZvYYyY+8I7WbxIjpXalq8bNn/CR3CaEiLj6+4N4
         C28PvXGvg3JDqYBfonjASPVXQgnjs3iSsgQui0l9ot/pMHc8qE6xIfUgV5d6K0uJKSSB
         OjMySJdF7JSQxCKvfSaoM2qKhhCzG2h+QcCTQfryr04RDDClXQUzgCo2PMyv8zGEjVX9
         jYT+7jg0FkJu/ivHK7ZIxa7ROeq0PBBi2u0Sidek3uu6FzyWwpfdbzMgjh2SUp7ShI69
         f21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793206; x=1790398006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=;
        b=NYRNfwFwVgwAtujvevkh4Uqq0MuW2GRpmXEvMahW623Ldgab/CUeLJIWyTeqwdT0r6
         wjISzFsaEvL6wa2Bq6wKjjz4p5bLUZfYT7f0JykvhqOxargVjYfU5A8B2m1zBzziEEj4
         j+1YwNieWsPn2sQYdGPkg+QziEhFqIvgz3AFAA0c1dt7Gx/0tJlR9t96QJJLu8tW1kOD
         iWtu9Vqeq5n1VA5oSiQfDDAPVI8rlfUSlepn4QiU10yollDOVtOyd5x7FI6ilQSGIbY5
         m3mVoCpicSaTBGw3xKK4hj/SSF+uTDk9IQzEeSZk60YwzbDsepllLj+7y2IDoXtLuMg6
         lnSw==
X-Forwarded-Encrypted: i=1; AKwUvBwsnx+xMMVSmvuiXWmEr9Yc36/a46+UExXec3CINh/xXnCmiAoVPY2spLdQBBneA0Jl0/uT9Gr4PBSHYSZq@vger.kernel.org
X-Gm-Message-State: AFuF++nwwn+H2k+He598AusbbIu/hUzSpePP3H5SQu+HzVethH1fr8co
	dEGRq124rqk9bX1WDpvgJSEo+hDlsl5dqQichFNnOoaoiDm9CmIg38mlyc7oMoNiLx9NfKRg7FX
	FifnyJIjSWd0fb/itny67d+7mA3KGhpy2Dhan29ksfDlj0a5YIyth11hLQx4uA85O132D
X-Gm-Gg: AYBFou23lXBwTp8RDe/ssgoXjTvm4mqqGYs3FG72UfocslysjuDRHkL0j073kXlxSDK
	9qMqiisL7V3zgh5K6y/5+rCPg5VXQQJPaQPfqnInuKxXicPWUERFtlfik02F/Gervd25DwQsfWK
	z+s1KvgRAZlwcuc9DVjUmSaqXeUTZq5fWjS+79fo9mKW9WrszaSNKvTuOUYqRyJtrWFc9qza8HU
	N3EC0xqWYIrmHQCcwHwirhBwMJ0wxKw5BiUsvy4LMg61G5c/p+IzZd3eTsHpo9m3ahI/2gf2Urb
	6giUZIOtp9kAhnhkmmm+/RxeJpKaBgMnak9JmOuawOUC1DWcgUZVwk9w/QaWpLnkniprndWYvBX
	V0/GYD2gLa5Oq+SqGHoSLJyjWfJcHElZh
X-Received: by 2002:a17:90b:2f04:b0:39e:237c:50de with SMTP id 98e67ed59e1d1-39e35da1f06mr12756125a91.3.1789793206420;
        Fri, 18 Sep 2026 21:46:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2f04:b0:39e:237c:50de with SMTP id 98e67ed59e1d1-39e35da1f06mr12756112a91.3.1789793206000;
        Fri, 18 Sep 2026 21:46:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:45 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:57 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=788;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=QNrXSGT0/RU9FGBzR1eB633FR4BNgbJh7WtYPXkRtdE=;
 b=Rnpkeh/um/yPQIp001CvYoCvjgiBi+CHqntQ7vgesxgSiR2a1W7NY3Ki3vcjm2ZZeZzO48SEm
 D2Y7IqZ1KicCUwo8tqwBK0+jXlUVX3Pu9dwm1Kfe5NYg8T1E8fIN+Dp
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX/HtsDbD+L/SL
 7g9croXkyWyXkDdLTDG+f2eyIZhldSck2tIBPv3cZB6ittHLjen3alqVWC1wKjy/pZATWzdh5nD
 O9pzyc4J5deQwKmQLT8UMV75D379M7dXYdEnI7J1aGdDvPG9wMRM+N5k6RMYD3dJ1rK+rMcd5SE
 gfDWHNVoRSJ8dXZ0aeQ1/kGCRD6vUBgqZOsKp7D+whLl5w0RfjgrXLk1i+BPe++MEOTnb5/DDtz
 CzcbgYWO8TC6n6Y+gptrmCvh4LmMtK1O7mLEkO+cfkyhGsQtpZOJVGAzifoo/u2wYW+6nzI46PC
 RP3jRu+QCsPX3vShjs5yze1wUDNPZgiC8/E/FbvY9VzRglDjbXxLIZJ55Vh+39OCBmXgx//1onU
 F1UUMz7jPKn5pkBWSnllpOiWq9ixmL/MD188G751htQbhNOjGLrnSl/XR8Tomkw6/9EVlAYflXC
 4U1EldkJGxgLLklD5Ag==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aae13b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: JaD7uaqfMYm39bHZJZfJ6WISXXtFb_2r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX7ak2/lcZwEAA
 vA9IKlEHcpcwsQxEJgz7no8OmZ0pZS/cgURL1hb0mmJht2e6NoI6VFLCOnnEptWA4IXurM0CGMc
 ySzLZ4bZfz6XN5E7EJr6wI65c6CazsA=
X-Proofpoint-GUID: JaD7uaqfMYm39bHZJZfJ6WISXXtFb_2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 2ad26902ffe6..98dcf57652fe 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -442,6 +442,12 @@ &dp3_phy {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

