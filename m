Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260595;
	b=TTQe8sDXiBuzlizicWE1wt2wsxdVVCvLjK2ZWVlIJzRsMxNxLm8DEvKKlhJxzYpxqElV
	 Lji4SwB8LVaLRh96oUfC9NPQ+/7MKellJB0o4MtfXdYCwRtRSAz6mMd1cLlRQ9s9MoiSL
	 8g3l+c2om3bQhnIGFKXRsXbiGraq+btOuXofnOjqWsDO6AhAwoHfCYLvnZmA68FzGC/ql
	 cyCIEO3VWtF/Xk/GYf+zc4gh+W3ukfiGlFzi0si4f54TicPEYr1gaXGNj00SA3r3350XV
	 Y/WZ4eI6Cp1BQwmOxAKo/W0bvMckWIToFp4O//Net+lLyN6clVS2Vx9OxXmzHa24cIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:X-Change-ID:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
	b=BCEoPKkI/Ag5wMbGpslFBzKjG293ytChj+PbSe0wUaSvoruuJODuthunpYpIxchLevJO
	 JTjVMRRum+fbDWxrzs6x5rDGJFguloGz8Fyk3azE/JtoQOrnI0so2+7JdANr9kJ43vihB
	 zrnE321YaZrYhD4kIEyGHpqVJ05Dw5o07GC7FvTRk9mgQo/dNx1A4+hPjfHONGKB3tiiR
	 3z3VODQvCMU+XpZA13t4tOu0BK52Dbk+6kq/99yMZ1Y4K6oTYG5wHt5hAJ7jmM/I2G0EE
	 mbFndepGl/wo7r3QIyazcCGP/up7GFbdkiGeAwkJMTxt5VoY+V8dEYHL67BpexcPumw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMx2g3Rx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh0NGAU+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998C1606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998C1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMx2g3Rx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh0NGAU+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Guge3829006
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0BbKjuyacWjFfSxCUg+nai
	C57lOWfOhV6+ogbgLCjQA=; b=KMx2g3RxQZCfQzh5E9VGboxNpHvz9pwBZuWuqs
	53xFfZEh/+F2+d68ieP4gKJve5kNTMGg+0XRQ+F7AxPpV5DMg5Vaao1QewS1E+G9
	QiHPiO4qfc0xbSrKEPyFGnOVYdtHSq0aDPlzLkT1Dh5E6YGd92GWp08HfJ38j05R
	Lgmr89RlSD/+qDS4x3hsvDouZXdeftHSke6aO2e1ODqCOzANOPIgtkZ58eThXiYE
	nUVTnuy6ErKDbM8bRMg836SZbh+ZCT1KYNvUV/IiAXyzz6S2Nx8KdPpjNw5iGaaz
	OIwR7cTT8c+VKIKh2zdtwk9cLHgv7UE+w+HPlujcPcRXn2MA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp9k22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:56:33 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6f8edf0c859so629670eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260593; x=1793865393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
        b=Bh0NGAU+0JWTXKGr98Cgo357AYrvD1XOa6UAqa/gVjECEQXBefdVK+Ha78NlAdmg27
         RO4CxCAzbXWs9WQoIF01yC4ZyN7HBO0uglN/1FphIfMKo30kCdGMIEHTLz6P9AtQ0cp2
         Q0CM6Y62fMJjcxQ8ADNf3JvaByFQ3G2kt9E0urJZt9H4v4wQ+wKg4eUU63Js9OdVEPwu
         hhFvVA0jpyhcu7Zr07k3py7MIGaYAQ6HRyM6ZuEP7MKaAEXqON9iN06z6uFvh41A5Mc+
         oIRKjXtNddksJCgcSEBcjoAoiW7wsJ5dnEMlFtXEsU0ovohcCWFl4kS8zJBwKEyP6j5W
         naMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260593; x=1793865393;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
        b=kJ3jOlIxCTMby8F2Q0Aua5m6m+9sViAbQwAnsbNNTkpoqVAS02XMOPNEoIKOr1eIRt
         Ks+aJ15zNNFFYcbjfV2qfHEeuw7D3J3OANXb4hxb4iIhfyMtiznyqA8eQxfYA+y231UN
         l+vZdO850a6ebdVGoLRtvmjKVMdyJi3jDaSJsNp/YTIcczp5i0Z/bttSUv0P+4o7KHPt
         L5nZ2JQE68yA0aUQERltpTrh/lSH6xQSigNxT6l0k+cOPXxCNw99OytoprvJwi98eAyp
         p9xIef4BCCG8sM599CoD4Ok22gtyNvo6EUVlRd2d0gaYfDQxwkTdAf6caQp6nH30MC84
         JahQ==
X-Gm-Message-State: AFq9FYIl/8L+gCFHikx15K1DvAfpGkIp96Ks0Y6TYiShDfTKGXn9uYiP
	jfoj0/POX41mTe+ty3ZF6vXOtJljtCXOqE69FdcC5mjGRGE9HAGkO8PbBotUDBp5b6Z8QgxhNOD
	zRSSA+/+8bFNd9PMSQ7LGthQ4EbmBq3A5fX8ifKVefhDz1oPX7KgLwGEiq40Rd5tZItfO
X-Gm-Gg: AYBFou0IWYTQwADq2T5VDMyMZDAlcP0WjuvGfn34DFF6XE6P8CTTa6bUKW5mvk4dczp
	ya9h6tyS+CjKYpHs3kJIu4nhEKfnGl2lAHQOneT2WEwjldM0O35wSmwtbkJEQzwS9V/8b6a7Grr
	5c8CIQQa7ty+rQA36zpFYT+qRRJ2U0A5mUuRxxw9KyJyynMc4BBnPDlfdVxEbkBaxVdZnIKq0Bz
	e54UGnRm/secYW3y69Z997mBCfOxLrMlZkov1LP3h+kJJIW0BS4tagWa5LK+RnBO+aTlTOTfZ6d
	+jtdf0mNs1vSewois0uxUb2i/tIMwecfjtpo5IxeXbMxW4+wmj7o2H33X6U5bKjLY/kM2p2zylg
	98DWfTDyaMCh63x2FK2BuH2yed1uiBn0mE+9eq/wSMeZ3Pgab+hPh6miYfMxQrkE7L2nFfrhEVG
	DRTEasNqbACq8n6eZ3Cx+eZw==
X-Received: by 2002:a05:6820:628:b0:70b:8cd5:891d with SMTP id 006d021491bc7-714ddecb937mr879413eaf.22.1793260592750;
        Thu, 29 Oct 2026 00:56:32 -0700 (PDT)
X-Received: by 2002:a05:6820:628:b0:70b:8cd5:891d with SMTP id 006d021491bc7-714ddecb937mr879400eaf.22.1793260592290;
        Thu, 29 Oct 2026 00:56:32 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71426f16f66sm3336632eaf.0.2026.10.29.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:56:31 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-advantech-som-db5830
Date: Thu, 29 Oct 2026 15:55:43 +0800
Message-ID: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Change-ID: 20261029-come_kvm-0005cb782051
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX7s3MIDhZZpC8
 7ZHapd16WocVbwb/17MYMHsl8lLN7VzRQqnk14X35OHJ9eBjPC7bRUCpxIT4xgy1554cIANub1D
 ZrqqLiW6A8S865x3xUDVqGnCaPJgZ01x/AFmQAx5gRfzZAiPgT+D3l6ukpWnZGZVt6z13NL6qH7
 rqbkSG1bIkYgDT6fzReFK7Q7S036gHKf5d37ppBMP5ikOyl/aki1Ywk5bL7VG2vPAFToIRgVKhK
 KF31oIkiGLjBSiR2tSnCyHm70z3TsZvsTczggSQmjsqYK3gE3xWH8EhasJC+IQMupK2pG797Tyu
 xfI4Q6hxiFLDmn1MygGWIUIIAr+S//ixX/60YG11O2//biO3jtIUPrTL48GDqRkLUmAtr5m9ZbR
 yIoGDW9lA/5fW+XwwcTacNXAFaewxosGO0I4+k47KHAJ447zQvl8jGX7T/bZs3s4TRERTz7F4+h
 jhDVN3X3YbXswfhn8Nw==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2fc31 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=50O9vvR40McnEmrengsA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX5adQbYPE9H3t
 CuOchwW3jgkBbr9Ac/dU8u3BGOP4kzHHYxZ9h6Zue2FIZR5JPXTl75mh53QXhcaK2fse60q/74m
 s7TJFHct8hqUb0mcq+i1lDNU2PBy+KI=
X-Proofpoint-GUID: C8VVaUKk4VaXZD1lYIjQmX4B6tim30Ri
X-Proofpoint-ORIG-GUID: C8VVaUKk4VaXZD1lYIjQmX4B6tim30Ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290030

Add support for building an EL2 combined DTB for the
hamoa-advantech-som-db5830 in the Qualcomm DTS Makefile.

The new hamoa-advantech-som-db5830-el2.dtb is generated by combining
the base hamoa-advantech-som-db5830.dtb with the x1-el2.dtbo overlay,
enabling EL2-specific configurations required by the platform.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..13e0f47bb8af 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -23,6 +23,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830.dtb
+
+hamoa-advantech-som-db5830-el2-dtbs	:= hamoa-advantech-som-db5830.dtb x1-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-come_kvm-0005cb782051

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
