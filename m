Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973359;
	b=dRD/GhSnYjchp7idt/WAPMyXoVv48OYb+3o40N566k8YgFvT8Wl2jKMw9ry0ysmEXqYm
	 Ju9UV0GZv4Tj88eS2ImfIOMWQQ0KFLEg1+69gE/Jae4Sb5h3qYWFSN7e/6pPxryRKC7IO
	 HYC9XMw4iY7I9KMx2/+i2/6xTrSihGWbZN0yd68qNyb0MlGMTiXN4g6bHancHw0JSKF22
	 KLSOk2llWjg36N4hH53SphkcfuE0OPhl3GYwrrbVl2ndYsYGjAUz7SS5tUcj1nrFbUka6
	 jMIzWb8L8veGj+jaLads44/tu9arTv0abCfR1hztapclG+Fi/lw/Qi7tGwCTYzNs9ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
	b=3F75kf6UMkMLikBYYXLZcZO7u+wWiD6AHoGulXlAwBoLhiNDLwJbysDaMy1PWRsdVbfS
	 p0MsBL0Xv2XTimYkrcy2lMnu4avJPbSFdY6+44sriiXbxAb5K744c4yABZ0TP0oii6FrI
	 57VtLp3UXmLzKPmYkTGvwQzMZ4yXePQGIwBmCWlK3r+RvMRA2rzhrXjbS9kWHx3y0vKwO
	 Ac39qxvcRQECtoRyLTqgzfFVLtgJaycEwOdHaM+MHsR9u1n+YXIbIXuVf+zS2CxpdYfU+
	 U5kCPNHOfpJANS//VKMIBJ72Gdy3rF1X8MD007ei5qIMNCCI36YN3sl6JzHbJpH7MPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US2nmvah;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8KV8Xf6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B53606EEA4
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B53606EEA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US2nmvah;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8KV8Xf6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DocZt536496
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=; b=US2nmvah1yJQhPOR
	tKx9LUKcM/vHdZzQt0Phcfi/T3pbV+zRYzwXi0q5dvCA6MAKy3DETyd/S9viuPZk
	idcXvg2enG5VSWdwNK22WeaSi28jLTvsDVjQZRt2v+A6MCAswGiBOkHqP6UH42Tk
	+3eFXZxFY6mKE9lPUd9sn2e9h5kymEf2vpIq/H0H51rU1sStrMoWxaOHYVYDa+1D
	PvmniTx2gfwR2m/ueGBBxGrs+kKWxSk37d6Z7rq7xkWcOrJLFZ4YjNJ7mceLaum0
	qvoYnQaEETRqARToLchkLRUUtFrvQxRNQxkqQ/e2oSYK2pFbJUF813x0hcHRANpI
	RqShGg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb30rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:55:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99859876e19so111827241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973357; x=1794578157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=L8KV8Xf6To1qNWXhKLDVWSBrHCkj02pnREegQV/Z3bNQAT3/bmWN2E5HtwogiE+2PK
         cwNueCDlPrb+eFWTJiG0u9REle69greJajGEL0uTlg9sdEH05NnwRvMuXOK4WHc8iZC8
         cpEHl/9da8Iq2miRu5XxmiilR6iviYKmtTokJOtk6OZ9JwOXBzKlOjn9KCOrV7oI41ae
         tAU43Folq/FrhNbXlE/OGgnGIa6iuyS+CvDeJS4vMJD81L6lPVaFyYkRn1ILrJbgWkX0
         svzBykZxOdDDKfC1Vm1OHmuZ5oN/z4zZPJhgK6qOaQHoNU3m5Ij6cIUvDWuIBWn3kq/N
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973357; x=1794578157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=dM/kMdZkosmm8PQ7X3JUvQCoillulBvM5SG5KNTYuHgg+jjVlsAYSY9qo2Te/LG2YF
         9/Q0uUvFBicpGtb6z0T6qQ1P5YwGuf3S1EisawWl+Ih3LCtrMDIgToM+FQASfGFFZQ02
         eIPaaza6mIXXdGczh2Z4Gb2CGdAWM3KQhW/Y9b/HSfhvkhXvOUBD0SlCrJezCZzfvHSJ
         QxDu0tmJriwk4TnxKDPARDxuGWuMtHkiiWHFX8nRL2UZHQ0XQsroRGUiXBzugBvJi2gI
         9O6O9MsyHwzeghwLn72cPzXGnv0FSmEGmJHqAyDnysdTTFwpJ6cx4sKGKofTg/CKClJ/
         EZgA==
X-Forwarded-Encrypted: i=1; AKwUvBxcDIB6pvCe0Cf44R9u1nPb44CBUW9cXCYriry+6WkaD6u0n0TYnU1KljDustYGDCJNdh2H3/uFXvM4cah9@vger.kernel.org
X-Gm-Message-State: APuU4Z+e0REDmggdNNueVL0OvqyrzvUNwc0i0CRmteF+8bQFRvrJkcdf
	HtNXNfgFfaCWwt05D5mG3Hndj43R1C5o8B5X6Pq9BUWkX+mKoSJHVfyXtmtbKZXYGQ0kHasrrCF
	zfS1FuSM07jyPzppJ+utGiVX05/0fbI+7G/SE7VtIZD5vVo5XUQWsscaUFKHrpmu3qfLK
X-Gm-Gg: AYBFou2fHEucqP79BgZDz7mnJvtPipDY2hclhSUQVb89Hdl79emlWN4anU2Cb6xvvct
	UfApNfHewnjwlGJ2OmJ+Ay9jBwvf295TX9XQmCW5MAeq/NUHiz9No8RkrFdsBRJKR4uDShtYgeG
	Kieb3AgZ/ns07UsjEGYngVqmjk56Z4cyFB0VfRuPPvbF5bCXC9dtZzGhCQKUrZmvdi4X/ELHNbP
	dJp5718bLonz/C9yRtXib6DkeWF3+R9mk5GsG3kx2+lDWpn5uhlNwzdmI6tm/7fkdhaTXvvteoc
	S6kGBc2x5hsm/sfdql1RP1MmxAgsKRaogHpDrVS+Ln1kop12jjJQX/GUnfDWZlBiJ5cNw+TwUJb
	74+Jw/9gT7Wu6+YqAPRlOCeiy6YcaO2wTzdIpk3zqw/5gIYXkMWZaAY5vCrohIhxczFfucN391m
	xZPSXH9wwb2tafAm/L6uYjAR7MMJlE7NA4TQxcfw83oka37tax1F9en+yVMEJqKsXbmedPDWVt2
	Zn8WRWHDAVIpPBW+yPc5wrok5Se
X-Received: by 2002:a05:6102:390e:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d2a151678emr1297854137.9.1793973357123;
        Fri, 06 Nov 2026 05:55:57 -0800 (PST)
X-Received: by 2002:a05:6102:390e:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d2a151678emr1297841137.9.1793973356609;
        Fri, 06 Nov 2026 05:55:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:25 +0100
Subject: [PATCH v14 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261106-camss-isp-ope-v14-9-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
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
X-Proofpoint-GUID: HkRH0adiRaW8z1hgHNnZEYFKDTAZRdGH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX8mLMZQh6OvTg
 MGSeL1EcyhYLDyPmH2+uur7cNmjPyknWtkS8B9b9/UWWk8IVOEOwWDnymjST0HEa23FbC9huTrY
 6pIDOChyAbxU3Nej5knzQbbxAsLGric=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aeddc6d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MWvNLhr-pL88feDBzY0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: HkRH0adiRaW8z1hgHNnZEYFKDTAZRdGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX+T/J+NSnpAXZ
 +1Yx7CNcWAnH5uzUjxeCd10bnDChwaaWQ6S9nHQKDpx3dbv/4aaiEj5SJ/C0ChgM6SHsMAlLmm6
 j05ZYdlU41ZTitDQE1e5J4eZFh5ZUCQ6/KrMAKwdx1x3T8NksKsn65pwk8on43uxcDEUIs2SuCw
 zucgtAofGnApv6vFttHTs7FnVrkeerlwgt7XTyNG/xkdgTXiOB7x99ryNjvhPsxFqgNrmzJ5dHG
 LcnNuTXnkCuTVvV8hZTTmiKE2OhhmbfQdiqAw+3VuorxSmMmZBO1ls7gNQd0pCfykGuMVXIojSx
 KTGFm127GkJMhTDs5TrHFi/uFHABaIIygXWvtAO6/WysM5K3IZ9bcNiRuIRSijxGaBbVk7i5ate
 1I0yd16ytiNQj3XfmTAnGj4v7BqqcR++vEyM5CQmFJ3qPx55TOQDsImQQDYgwhkJ4KXODOe0C7D
 2DMSMvf5UZHL6Oh2CFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060055

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

