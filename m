Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D243BB695
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459875; cv=none; b=j9KJDmeZuK1Os85tq/u2LUnpEfw2Cs6+I3Bt+LfljzzfWnK8SP1QQyGHuxme7J+zo/wCdD7X1GZ4FAc2sGdiYXgnm7JFgNnvdsqlbZ23sPbdpWeTJQZamL70LsfkUvHt5tS/SZoLnxQJGS0IqYbvvtUr47VrLN8B9vA6pIWHCZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459875; c=relaxed/simple;
	bh=i/EfGcaVwPdBD4d/EhaLA+xeFVF7rZ7sN3Hf7EI7L4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDPAHOOkyTOKeCdrJXJ+F/b40ToNUc0+jqUwxMVl369pLiaTmUSgr2M70SUrR5ld788EjPt1i54hhkxWX+GTAqi20qvTQj47S/JKIsXDaWHraecwcxNV5rRT01LmDo/j7/s5q/28b0H1ZwA7NgoeW/0JKGpZ2lYUZMek/fK+VpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbLXFfn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM8PlGiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbLXFfn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM8PlGiy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6YsQw4048592
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=; b=KbLXFfn9q7GCpyhp
	jOQ551fi83GZMF6dhGiRqj5X46Ep5WUQVO+ax+EQpo23DM1wjhbKRw7qcpxaNmje
	nsq5YGSd0CzTr3I5QiCFHzOmHaLQ99cwX3bqW3+OSRjAVP1E9tahWVDD6t0D9jGH
	0TNLPX7hJYHErggZ8XlMppXUp6TmmLGczEXsYfLnD7HW2n+j6YFCegNqwwKiOLOW
	+g2Alqs2/BTZ/fpmkuV7VDAlkKbfrU5gQjSr3M1MTl20O/CBW+Z1PLStdaYQtOe9
	D6htfSGX761UVIHKRnQeiYA1BZaumfSRtMEMaagu9Ojx8heuQAhW2mMZDCqgekFD
	/LO03Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea0rhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so808145685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459871; x=1790064671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=OM8PlGiy1AVGX8O0RMevY+knPujl+BMtfyGJXzHY23riqne0WWikact90YmT8T9/pg
         zwyT9ac5NQ1YctqBFOGDmce7hF2h7TDWtaE0vDOUAizJB93a/j+yH+cSJv6eeiat2jor
         djYpouShSebbsz4QmVJScuzEUiXVxq9MXdN/UcrH5veezd8AjzeGc/3v+gIfscjKWXZS
         9gZ4xPBxUv85CBEYCNox6Se7tB3A0IN9QQidG/zG7IX9de/FdeJHv6hlogmLWOD1JICl
         RtCa+6izw/12LrQx6Uh6TrK4zc5HEx9eJFJrZ7mznJOK6xhp8u/xqKgrKHzIFPL20wMX
         EFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459871; x=1790064671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=J7dcx6xniKdGcLcw1WxZy7YXs7h8N1R8+sZeYdiobHfjd9ijmRFXIIQ+0W2Kpa7XIJ
         qKiohy1GP6bjWOebjxZbX+iqQILk4UQNMZIUWK1rsLfYtoqfMCF5tYImJfS5LOL0N/kR
         88qD3bwxie9efxqoABlLakk9G/GcOjP1UKumsM0CQCC4GTRQJbsZoGEifAJGMcOMsXyM
         amk2uBr4Jtzy7Z8lTJfC39M8T5IUYcHMdp7ZUrYnHCgpeYvNpMbAbn8EXqR5wXs/FsQD
         zJg6sWF3ycGdESRoJwedzdHoZNYFONqW1nvpiR4RFXzp2oHK4PyUEpYkhBuqVzEez2Ej
         xxew==
X-Forwarded-Encrypted: i=1; AKwUvBzklv/ywYjVP3S4X3RVIDUsuh4tA6WLyPaZ46x6gPqQyNbj69kxKHmFuOnXMdENv0mGx5gewVxMDmdIJvEn@vger.kernel.org
X-Gm-Message-State: AFuF++kWfvk9f6IcgWsJ9s/wUnDXxw8VyKMCdIbixCgiIv7M2akEDD3A
	skp9Quw8gNYIyV9jICmG6t8ZryrPlSm3Xm4CB45kcxgkfkH3Jdlcjo+gj4n1u0X/EiK+QCuOr7V
	ud66Eu+skmf013UyVMzjlP+cC9sHiZqdzPaW4Eujzk2YYQQ6vrFzDYMhCB/mbiLjbYjYe
X-Gm-Gg: AYBFou3MQnkp0iigTUmk8Q3ewEn0Dnxrw0dS5EHfAsXSD3KUwyZj/iRN3iStnZgktLv
	h5E1LOx4CGSgWFtd5j6jRVR8hyMdqXeDidqMxfJNJeB0TB4Et2MLCRWrmZJhfWA8EZMrAWQEyne
	4v1Qfj8Bz9OwRr4x2dTyKgBfTFNEkAj+xgnGMsk7e4/C1Rts7FuA1BYyeTcsGzINkbGkx3HOSwF
	rGqtGDPtPQtdnM3bC/qwBMJ1jvemPTsfmARzvsU/17jbOqawj+6XYuY7SkmtKEEvnrrSl2OsPs1
	XmEcqrwSVNnGpQ3I+LdXXFOlMcQgp5uNUsuAox6QAVps+6GIUBt3VA7bvg/EkO+EOlpW+XNjoGe
	+iBTkxaKf0N4Oup5SmMyWXOYoNdZHUW8tBQi7d+VHLvtNaeO91CCYMFduTAGUjqURDUmWsKq57E
	3RSBcbPjFVKIvL+b2WPU2+vP8/F7kzgM5FDBOGRTgDqdg80wKIGhw=
X-Received: by 2002:a05:620a:8006:b0:93a:661:56d5 with SMTP id af79cd13be357-93a299f455emr1089407985a.40.1789459871374;
        Tue, 15 Sep 2026 01:11:11 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:93a:661:56d5 with SMTP id af79cd13be357-93a299f455emr1089403385a.40.1789459870932;
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:06 +0200
Subject: [PATCH v7 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-3-77b13d131d3d@oss.qualcomm.com>
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
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: -exC9B3Qc81asYEJzqRDMjCb8TTZjh73
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa8fda0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -exC9B3Qc81asYEJzqRDMjCb8TTZjh73
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX6HVM+JVUwy3z
 OBVfDMHuFaBC33nZuh+5T4O/TmLp1bZgLWCTU0C9N74F/2gN1GWxSBPBBJPF9BanKJWg9NPiLB6
 s5lGcqpmms0HP4nxJztWnF1CzFEg+8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXzGe6kdJ4iV2s
 EuMvTyjklNIQC1dY0xdg7pnQQO3CktZ0CPtSs/s9Z5PtCVF0qua/DsYjp0RoUa6bboDPT+0H0vP
 uzwHlQUNnmTgI18zWZNmFMwbV9xsf9SWqpLA72mcBNRuF9mo7R1f39CifKMzjZOTK3F85UAm7dm
 Bo1VoHzSMTJg2ijk5PJ8i8wMpA4HWwxxlKfQz0O9mPQwKMW9V+g/e9tIRJ8Tn7M/7mPIQFfCE9h
 yjuqz28BEVsZO9WRGYIlioLYFFwgbAUd0g7mw/uWZiE+72SyixtOagGcGcyGtcva7ukqKvAH2k6
 +V4H6GLk940jVsJZ9y5ZVDgcuKDWZdMxUtrhpc/aqHQVXh7HTInxhPqTWD+EA27J7pGU5/9UFXF
 XmaIbqR9be5Q5aiLiZe50HU6+ZZrZVPqS7ZPffTg2amrInttAz4AnhBhtnQu9gMPc4fiKGkfaDZ
 PudlRXa3+tn0jcjiiYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..90b54b9808e5999a4dead404aa2063ab695cdfd6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,8 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
   reg:
     maxItems: 6
 

-- 
2.34.1

