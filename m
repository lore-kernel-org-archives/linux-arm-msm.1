Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAB360EC9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682858; cv=none; b=H984tiH+N9uQonq8kq+zNhM7avSM3ZHmKC4vXBrqmes1tFNwpOTxYbpHXEcdTudXWqneEeTXqg2/rZ1YVqDcHGhQf8+zl9pvAS7Q9v4uAfq8HPce6wwdJreeIPugRzm6XFSY+kkvLvot37RY93lNGCxOodMVcnHBJzb8rlEvMZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682858; c=relaxed/simple;
	bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+J/vfqPy5VSQa0JwYTDvkw0zSnYSMqpg2K1cFvpJuQsrqrsdPctgTI8+QE7mimsFv6EFC7fjeIUE2vBG10dn+LnnfaggHhy6ur7SDsmaTZpXnym+eDd6UsVta/wBYk8Gj28DVUM582zuhZraBPywjYTdNBpYn6bCFxZz7dIyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYX9671v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kc/3pVFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYX9671v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kc/3pVFi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CCEt3650241
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=CYX9671vuZfIt+xX
	au4XcaSKIcre2A0riu8zYCAbTZcxouSraEUlbpDo+UAqzLg4ltp1427pE2tEPVrv
	F1xX22tIlCaiwX64ssxlDF113tmZ4L4iXDI5O5fEKrqwhBBD7ktXSW0IoTy9r/mW
	AkfrZyM2wBVzLLCS2z8/xcuvgEqgzNRoDvAh3jL7lOL0yrHoTtp4O5HL5ZsgmEMo
	gZqpbu+9CkBNHD3nv3oJZSOmcOf1StsBoAisW1zRKjwn2ZdwFNkJZEHJ/+3+h0y0
	Oc8fw++4fKvbYAAJJWRohZWjF6w0F2Mw9OgffGFBJ8sKWq87OYTT/2a996WpAiDF
	1SQg8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3knc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:14:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso16474552a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682853; x=1785287653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=kc/3pVFiLLpHKaI3vbd4ochKM/6wKgVuVHG4lQ+o3bcUy/Pbr3gYaxV5QG2VNTIDza
         gpbtS8A4wJuAgKaUSYx/O41EkfTU1rJwgRIKkQUovQkPwCkeH3NY42T725/Aoq31CbS9
         bV5MEy5Ji8yJq40gHWaoGkbkLWrPLx2W4nmRAVoJ+0NpNaFEvmHQ6MLHi3b+imV9E42U
         CT+fUmSb9i/GoG6kHWbwJFa567x+7V1pXJuqK4hI3rNlOkuv7ASR+niDXhSD2lq0Yx/P
         6n3E+4p/wW56jXLUYcQ6CmfSNWNnHvnwuAl7Zdn/qacVwf/W2wFH7WK2yRcFpP9wAQqj
         GxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682853; x=1785287653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=JrLdsQw5QBFi4gsaX6gnRd2si9ArdxTjsNMkE0fj8winPiywkGMkLv2tcKbWYDEov1
         LXMbKqf3mrcNdKHy5+T/DXPoiJMM/yubx+juAOaAozwEMN74FOrut1V6RAYNKZlh9ntR
         H8+9wmmUuKivVlsD+5+CNEu4Se0t85s2BM/gib6msAt91/ik+zrTaMO5rLZXS4pSjh3+
         +SqeHhhOSX9YJZJTTkWeGKHScmX2OfekYJUc9En8TvZgQt5JzE2zU8Js5xj2hQ6mg9k1
         WzE/fIiPaIHoLBb35p1xaFSY2PVXI+jvJRhyAUz6p28psOxZwN2TuMPGORTCSfs8e4ug
         CYpg==
X-Forwarded-Encrypted: i=1; AHgh+RpxTnQ9iWhL5frHyYf2iGm/lmRP1PqXxAtnW8eW1AGD/mSkO3C0pquF0RsteYSl2ECjsuCgwF88WFOwHYyE@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWr9rFstTuOSFNXakBi9N9465aVJJcplEUz3+1gYyoFCFz2bt
	6WD/zBtsSgHtGsNz88yQc50eGgUwSUBU+CJkWH+uj0JWYEInMUrbrlvNwMjFZOJGczNyuUcNhzR
	V0l5Iuc+HRwKujokvRakYOIJjJcvpQMAjekg5PFXxfUEYy8jHkNL09eDIoIi00JlLiUmT
X-Gm-Gg: AR+sD12phb2BCxGz/AjVwXZngKb81QZdn/FqWcQtNWLRkrB8Ctz8U9rP6gGsVtYBRJX
	FU7eXAVRN3KOiGg1I0MlxiSG0rvnHO0Cmxc76jzsD19I9b+xM0ZbypyyJjmIqLxODY3XbhV6WbG
	LfUZlVs3/JuuIZiHhD+5c8k+z7D2YVXnFWMad0aciBICpWy372SlE12VvyO2GtjgHogklcHOKR6
	YXs4B5VOHWVKjD+nR2byAZObHpYvt36GU61acumA0Q3t591+49TF75d2oZG6cLtkRWH1WaSpl1Q
	xnSnG2v5IpFhpfeASeZsHlF6uMcKVyGSvqEaQdDkFMFBeNRwDDGzLYfLQW963mvcuc/bEL4PBjl
	qfhY0bOKyT95KoxqPxVTJ0TGsbNxSbAskVHzCaXk9XdSyprbwCJfcRx0kzZUr5vQ=
X-Received: by 2002:a17:90b:2e90:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e4b418439mr20460522a91.6.1784682852845;
        Tue, 21 Jul 2026 18:14:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2e90:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e4b418439mr20460479a91.6.1784682852018;
        Tue, 21 Jul 2026 18:14:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7b4da35sm160380a91.17.2026.07.21.18.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:14:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:13:47 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
In-Reply-To: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682838; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=jBakBYCNzDdjVoMi5eDvzHX1E+IdgD6H1Fcbk/cuN0Kd6M8m0FR7gpM5zzunUVXs5JyxpLzSO
 5hSv83maoH6AYpsiiaJH+r7Tuieo4//oOCgQQRdIycA0s3DMr6HbMRb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX8S8Q+Jo7V0Nj
 HeGDFAQ93CnRT7ESQJ/W22/TEul3Pqv877u/1vGL1Rq5Cu96ciN3xUk7nJXbWO196OMFPg15XMm
 JiyazE1LqUiqUMP9o4kLs8IpCGXO+vLep+jwb42Qg60Kxd66u+Pknw+CTmm9DF/gRkl8Fgp+jEn
 rXcxWvCzbGgZhMR2B4WPE8sVfm/9jCWzsqubYARi6rOwKc6yhHiDQWDztVyXsLq1OccyzBwilUr
 tJlVwtr7CGlK7dmj76+inegppOPci/6hwb5XQuxVwrD82kFglaIDYe02M3giwCM1qngjTcXS4gu
 4Kf3rIRqhn7KyZtL64jXVbyL/aKC7Ajc5mYdXBF9MpG5IGFgaDBktZpdGg/+wTXOpBpM+YaD2I4
 4Y+Of/Rm2ksjQ++gh/5QZqjURsild0T2vHOfJU9sYRQQXPnnJcQ3lx4tYuFW7OmbcngOPcmAe4x
 xxTMkgglo3/cNJ1DtNw==
X-Proofpoint-ORIG-GUID: 8TeuEXeFFTU999b43w187qxnd-9Rr4_d
X-Proofpoint-GUID: 8TeuEXeFFTU999b43w187qxnd-9Rr4_d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX+DxrAkNWiIwQ
 +pp3FIX8/OfeolKyxwtjMllfQUOaXXCGCJfC+px/Uj8HN4V99JYk7/UvTb2ykXeANqZra0v0dHU
 Lj+jkb7Nz210vHAhoxdbrK77xNwi8as=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a601965 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220008

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1

