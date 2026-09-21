Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819113769F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973545; cv=none; b=dbC0MlGUFqP998bKhrwkaxUgUosVIXKgtqIqa79lpSbPRhvJ59xo/eSkQ26rQykLmNDGuM4q4WWai89IMDKw0GEEF1K7hf81VSi5v6aATxL90AJgZsFmRjxLGklkUL4LHBwn0UAHT3CAWM5lrkKzGhiLFZvocR6uJGMx+LVhN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973545; c=relaxed/simple;
	bh=+CrABi2X/StxEwnWst3mUt/1ibBP9K16D9ajzjNs1nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sg/qNOpf+MLUmZMEQFyTcZ4jZWB1SC/Rme0gcGC0LfTSccDS4brPEpsMXsy3+oPOlCWh6dCLoCm7nAKQ4gCILIosS/s4u1jeXHE+epRGgNKmk9CRy/U72TeeAbX6m0DOuAEbHuyM+42x9ff+TRl5+73wOt4YwC0yIhkZumzt0PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEmW03b2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhdtkxPC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEmW03b2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhdtkxPC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZYLv007213
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=; b=SEmW03b2oK+Wmo+L
	G58/kzIvyv1Ib5YIcJZe6CfEszuxtsZQMykRd2B1l6ShH3OmY7TJx5kHdAxzX0Tl
	8IKVnbGGhYwLSrRY6W4kE0spmAiGPlLejQEup7pLhc0DQcnNaqMSnL7KD6KkTLvJ
	/ozior2MOQMus/imcDwfTVHS7SxsZaMc4qcNs9O+YFevOhnD6ZNAUJ2p2qQdjeRD
	eOM0qH0n7I3bp1UxJ/LEdKD0hKEVw5iq+Q3/jm1oPI0nvLmcIypG1/Ttkx4wUE5Z
	ceXJFrkvzrXilhJCYSpL+EJlf1O5iCaLoMv4NfUCkR6iY65E1jLFACKHrwI4v6Xr
	q1kSgg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b99hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3827113a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789973541; x=1790578341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=KhdtkxPCUOvq2lOPtzNEU3cXIO/2E1pRk6GvanrKMlOL3nn+sF3M+gR0CZV9mGUnb2
         kgvXMqSyVQS85kxOh+M88vQLe+xHCpP1979hzT62WjV7VOzVmaQ+4Yvjp/X69g2lEX6j
         HjhNdYxJSvDDoeG5DSzfdXgosNWRZi3E8wtneNmHoc7Eby8NFjntS1TyyJS5UL9dcg5L
         tGUbbXr1aEPtj1vSVdsGjt7Cyf+jmH5E73Q5VSYFk+lPn3UACNmhkD9WbOhixUsloE9W
         IFAhFG1g9wQy8pAUcLoqrtevuVyLCyw2IRHAvSE17D28Hu5tSXv0Ai74+1RnwsVn+1Tv
         lFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973541; x=1790578341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=J0gICt4Kl/RpcY6kCaUsgwARKG2SYm2K9smN63mgul8ZO8naw/NCDwjU9QFERDgLJ6
         dZCRrC9++jz4dXSxqHxrOW0aVtpCEAzpsNzyzDZL3GqVnpgnPN8BlaMkycrjJCbbiDu8
         kizVKoc9PjA4ueUwSxzJr+kbjzu1hsJf0XckSgHiotagkMK7Yxi98To6qkzBMVlwHuMI
         e6QReFGYah7ivA0kT3qOQJPwrV+i0xB2CG9wt2YZ7Xn+byGbrJP68IZo8JY/pFuu8iwb
         95DZdTdebidPQnKXW7u/9h2Y03cGX6R9M3JAyC49kQMHZvK/dAnBgONVHWRs/BTISEJz
         SX8Q==
X-Gm-Message-State: AFuF++nVsDMuM1rAcsZHoZKdYJh+OqQE0H8aOVo57uJe33ZfVVjECwb7
	YrBxPJ4FQ23iEFhbS9B+9JqdEd9qXCuKFcNIOtGzQSWE/+Tlb3kgVqyz7gaPpjm+AL6MQ7UNwdS
	A16avSLSH+zw7QPsgRnFdDuJnlpG76PJbyPld4fpy96S/kCGHXC7oG/VADlLoocMC08J6
X-Gm-Gg: AYBFou0rLuHX/TuNHVFrMJlxnaQmh3L+XrbqspwVY5dFGznQI8wbPvhTjhTEt2gYzZK
	6JvhpdPtxjZd1UQB7bp/DxtkEkzypVGl3UzVdQY0D1yk/howPtI/CYhC7693mJRenRy39kf2TOy
	WDFV6pR2r140nbAdMUyuUfggLP/oWUYVjcb/OcAmhg1yJmxQJyLpgl9AZs/etshT1D6xmvfgbLo
	zOGIuAzt9shDIqHS1IcQDzIlkTjAaVBapfYoK6h2K3d2lz30DH8S6KcphEZnj1DFIS8ypvQ226I
	EJl7HZ1YmpWiZ5Q2bh0zMccc8jB+Yj+TMlrGe7tN5LQngNH15SwJxv5yG+JneK9TXwcD/o3L9OX
	JBR6O1lJdGwo95vjMbpymAbpN7jlsevqtJLEgojpkiDl/cZfFDidLc++506Hn4doEle/cn4Ghak
	R/rMAxf3FVwEPbqwgNIcsKajnJga27nCvceA==
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:34cc with SMTP id 98e67ed59e1d1-39e6c693638mr9665633a91.48.1789973540948;
        Sun, 20 Sep 2026 23:52:20 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:34cc with SMTP id 98e67ed59e1d1-39e6c693638mr9665620a91.48.1789973540557;
        Sun, 20 Sep 2026 23:52:20 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31342975c88.15.2026.09.20.23.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:52:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 12:21:53 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: add few more SOC IDs for IPQ5210
 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq52xx_new_ids-v1-2-63d68a11bbff@oss.qualcomm.com>
References: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
In-Reply-To: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX2jn+B3z4s+MK
 XsOVsgW0KZhs3IjlmiwfEdB0XPWll4SYZ+xcgY57r598y2Z/VA7zGyzGnvFjYQfx8+c2JE3fxxj
 nKWZNlZTDjTNYiL20VEIbrbE6RTqumEWb0I3v99og9QnsTMS3gpxwSMNYwEjpZVFqnIApAyuLWG
 6HUbZj6MEup3IeWgOx3zudP4TLjQMcV/HSj/Xpy1VO+RvrPAC5UaHDqkGN17yztc9cM6NvsV8iQ
 WGJPpYbi+GiNqKpsxf9K/CPA1vE45Xt/0CMqEC5S0sjvp5JsoAfVHtFoNKjb/6REVZ91irn1PvD
 2Zz1yV5zCSvgY2eD34m1+KPEJtyiSm1rGpjJK05zpgFmDgniErKxdwZgGgssQt2rsTS+w2JHoLD
 Jx0vn1DfhOLWYn9zzApKJHtKj59l3idNw2DPk+AsKA7UlC3zZyT5l0nL20GnxdvjuxxEl0ahOLb
 fgY1nc0K6iSzQcI4tEw==
X-Proofpoint-GUID: j9b4zm5TkyoveKZvF7mg2vfi8eZvaTwW
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0d426 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PP8aMIA6NNbLyI7UcOwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: j9b4zm5TkyoveKZvF7mg2vfi8eZvaTwW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX1RNOfDwQ2oRx
 kgszj9jHU8f0pQ1/vLDz9AJSBMvy9QVQcArDFY2tnwu+1QMkktiMorqApOUfE5LhRz/o1X+Xv/y
 xSjhBawZYCn0dhjhLOXeSRscDBTEtPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210097

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..4e7e14fe7231 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -558,6 +558,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9630) },
 	{ qcom_board_id(IPQ9640) },
 	{ qcom_board_id(IPQ9670) },
+	{ qcom_board_id(QCF3211) },
+	{ qcom_board_id(IPQ5211) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.34.1

