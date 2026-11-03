Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736374;
	b=WieAZjgxc4OlAjugj4j21r/FW4ln73tE2/JxKKSt8pKy/9/5U2A/q3Ib2JGAfTZ8ofli
	 fbvxiwC1oDfVr8CN6DbY+sbWasn38lJs1B8umf+VfWHuLgPjAPVglvOUXnVpvGE/bzr0p
	 qcsDGxDVOrfRlz8S2d8Qb/5YHqOktSF4+xP5/U0aWMV6c1arkBLyVncWd1AK+YFtpXSt0
	 bnCkj8jBF7Hu4751vC39lL8sqRfnHPZ+FPtbZbte/U85/Fll9fifJIb3+m0fA70QmXwH2
	 GLeJHniNDHUhR14wGtaRFXofgj+Z8IRaiHRd9cE5UmJsE+Bth8Vf0vZ/0eGNkMdwd0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
	b=e38wJ/w0XO3X5EIv7cytYeer3RycNIRCdN8sVWtlsFFfqt1EcgkYwYLP68X4y9LPpzra
	 +k709ksO6VC/NFz3SK1RI+kRxdgoVbA8B2OTIaEgZl9B2ps1xsc9pjAfFAjcqhofGwxid
	 W9Z0eXGnfeJStYchh+tgGvFT//RewZ+Oj5NgR7MZEiRG41fWEmCOyFprzhxaXujcWkziE
	 P78gKJEjCk8m8n486U081RMUx6moENxcQ3zSJYumX6QLIGGVoe+0BS/J1w2UMkGI71KmV
	 SjH5xTsHfAflcrerNPkuqhBPYaxPNmpnycUIIwxjUL/1ltvbBffZsem9+1EpQ1tpxbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTPtOJ+f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUjeFRwu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55504606EE82
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 20:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55504606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTPtOJ+f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUjeFRwu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZDOQ3666530
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 20:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=; b=dTPtOJ+frAPEorJS
	bZEoMEy5MLagE9LydR1o2a5KL8mOWL5LJGPzqQozeomkGsOkzzPZfAU1TZ1I20jo
	fAzhG+f5J6G5mWL8NWHg2NcmWT6SvcdqLZK184nFS2ZCg4Tgt1EBpIEFcCoX7i5z
	U5FsxG9HRlL3OqhSE2ZyJkx7Thy83SSmbuSc1q+cEnZNz+U7a0U55AtObRsyYvcX
	2xI10a3ohK5rNmDnMO9qcKPSNLE/z9OxIUFADrdcxCCyloKtxvy6pJkQuagPm+iO
	0oEYWbdgIStIQLWe8cOtOVmyB8RC2N8psgTGg+uPgC4qatSD7jAvAsoRc+smEpzv
	1qIIuA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubh28f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 20:06:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99082f450bfso3556532241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736372; x=1794341172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=iUjeFRwumnTO7C4i+M6RvgCYXOdfIWovdu7k/uKP/4gkQQT3SO9jzivQls+UTvNI6S
         rgUq05Yja4QeEFZlIjoXp8EnQ2yY6DCK2HPjg9tzNJ0mYJCIaHN/divs0CCEE53pc5G8
         UzWW7S77IkifsxLzpdLYjj2mhLZM+73yRMxGztohsusaV3nz6dCV89cyTPP59R0BdFeJ
         jmh4L+Sf5o14yYycRTDq3/OnuHO+/7YeNJZSdUXQ/TE5eGBO4ZAxwuBc7eyJEOTIseOw
         vdRgk6FM2LjGHKDC2uqwxFxXO8C6gCkxS1Ta+t8bv/v6TyRhNL2G/ZNs8QZ1Sl4jPNH4
         mOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736372; x=1794341172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=XdoCbXjAAm7GF3Gmi+Yf/q6UC1IXXIPwsB74jNXYUBMRYHe95jc+iLW9rbQBnEoKH6
         eLgqNpehHHG4abxO8a9UjUOs1hxCkTv8mZ1H6llxO2TrRZvNwPFVqGFY+E7/7z6m2sIy
         u/Ue3Q3DQUk1xxRX+DQKJvFSo8PjjrkROO/mZxoTEwNWA8zI3Suppt0VgPyW75z0mWsu
         06y0Ok7t28wzM8e2GOcy1P5NMbNulKvW33zKPLmNZG5Rf9Ls29wY7tFWXESlN/VeUkVV
         qR+pJL680MIaiy/jLda0rMRz/n0o748mN//J+gtjITvoxXFh3YBmthwjaPFfkhrVRNUk
         yqBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcQqVftHTjO6MuaiT468FKFp+p/boKaGg43TWkF0bmxyamfWOdiVRHP0Md2FHL0UMdXCQk2aQJBrbzaHm1@vger.kernel.org
X-Gm-Message-State: APuU4Z/t+JKgGevynyRQakDdSaZ9p84SZ7O7uTppaCxC4WIsR36uz91Y
	G3SF3Jtd+n5dPmsqAsW9xNt7gA9Y+s4/xcf3HXdVA3jz86jZGv332Cbqr2izO1r7H4A+Rn3NQdI
	0w9pQBQDbemufIpsX7cluscfjYJasAdO8SaeAgCS6PSbHn/iTY/E9DbcFKPLGYqPg1pLR
X-Gm-Gg: AYBFou0KYpwT1VIeCaSZ1DIiqmqetQP47BcdO4q3AM4ZXdMUFsq3UIDv0i9uUCVTh30
	NgZ1HbBgZU/+MI9xwYrhKgDevHVdjC34UUHZOWrTLX5/E+hXmVvMtNTKT3TNBoLOj4IhdnMhrS0
	Svzc+1ehhhVztOOBip5UadOmxEfDomuMvI2QI4TdC517KV+f3MZmIHlW0Ng4+Pj3EELpGhSZhk9
	YhTpY1GFQVpFSzrEtkFkugtS7NjfcXq7nQ58DcOh/RA9Dy7LCTLIeajuiqQjOe3pz0Rcbb6Knc2
	XwQJiJEfdZ9XySVlups1l6vWC9ioXKNtYE6Qd7rElzm6qvK2SgJi4XKTcf4OX3lJfrpeGA/S+fX
	oAO58QfggWXi2sKNf33a/as3Rw3SbI851ggaldiezUcsCAPOV8jUyFv6kPVefaSEzrgZ21OZnNY
	ziZXvkrIu1KElYg2gQ+zEHLNdECl8tXliAAiViQgZDPUst5qnEYGfEYaXPruXd5Q3RA6rPeZKcX
	nel6rOm7GXY4ZKGt8RaE97oTlzU
X-Received: by 2002:a05:6102:580c:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d072bc7564mr5895186137.8.1793736371749;
        Tue, 03 Nov 2026 12:06:11 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d072bc7564mr5895172137.8.1793736371275;
        Tue, 03 Nov 2026 12:06:11 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:09 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:53 +0100
Subject: [PATCH v13 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-camss-isp-ope-v13-9-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXz5I4dWAAocle
 HCLsFinSsvlAf57wBRnDTTUHxpnS3tjSLVMyWt4JbEeEZqYjyuNPPw3JgFE1oaOEoFdGNssg8cQ
 hLIUKVxTgj5w7oKz8IvQOMNpXBUhYRA=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea3eb4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MWvNLhr-pL88feDBzY0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: Xk2oeKh4Fh_bd-VEiazql5XTY50iYmic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX8AMMN99jg0oN
 Ioyl+nmm+/UTXIgbRiEZW+7R3AmyOWyhXAjmepRUHxljpbfu0yEuzaTGjQWLG9ajBHO3t/P6zAU
 dQJGUciLCTzgVvRmYHePMorWL4EbKdPI8JdPy3g/MiWKg2ANhGoz9LfjauhrGfOLA71dGQOZl3f
 CoXoE7v70PhZnc2tXos74X3ZyX0HofeKIP01Rdi94hFRvZhz0ltm5cS/mLkhYQi8Z7VCtzDCGt7
 P0kt6gGT8sOFndQEVavFasTi2lJLBgnR9cw6wEaTQJiE6Fp9k0BsRMFwUYKBkprZk4DTdd7hTWF
 Z5PD9bu+InYtyh9J+AiiyEWVRKiwJCFn1x15ONWQO342jLb9npPY81Hei/fvX8G6j/4a66yTuUS
 EjFYuzLEm1XPnVzFjsw0OS5bCiopDudPILZH7ZeRqEnEPiWj/1Iu0/l+qq6AE4Oga20CJuyKSj9
 vXAWMfUVFwqJePTM7sw==
X-Proofpoint-ORIG-GUID: Xk2oeKh4Fh_bd-VEiazql5XTY50iYmic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

