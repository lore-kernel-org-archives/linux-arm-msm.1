Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670772;
	b=QSXfrw9oYpvyOs2suVmGuIjLI5INAdV3TIGVqGp/NWCeKLbhEq2mvXh7DpG+Q9l2WC0S
	 3A6/1JbNKNHAdef91/x1//KIrofM+OeoO6V2K83ebxW3BbGVb+obzhDALSGnrZUZ/sryZ
	 3j6hlqARtPKWx5x1lJyUxbA/0lcAo87adYwpW80m2WgEchf6GbkCm0FmXfDUR3z+JruR4
	 WeI78uErJ7sa4bpePhvV3+TiUfsL5tsP4skLpqluh+6LwZP6xKlQDL3X90uP0obBC0oyb
	 bSwgSGeXvG7DrTV9KVTflUekNSiAUg9m1CffONfrpkVb8/wEkhK+5LryDFckCmlQvHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
	b=NZZwU805o0/CtpCVVP2pQI5ceTHupFtv/epihdsLu+P21ZRMILys6NVA/pvUi3XkalaB
	 8iF0+OiYZNlVplbfSiYlqhs6Z7xiIdGJfOQA0Jpmo52HiuYFgdTkTT10Pvj8GEQpu4KfW
	 iS5NzIrwrKwkZzwGYrQMhjSKUnLE7aIvQR5lMriv2zBoYtXB+wWdMcaLlQDNNW+Rs7pEb
	 eZPuJKyEkp4xSdO1RDrNshf0fjDCoZnBjTFuehH4i40wF/NOVd1ozezInH7DrtcFo121D
	 /VjkTHWNJ/bfvdbYD8RZu7+o7gVnJt61Cq3xLuMMNdRudKWsozV/D2G862sUOXQIxRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CdQYFmAN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ckjtQ2E/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD05260A2618
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD05260A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CdQYFmAN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ckjtQ2E/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDk2Ah927061
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=; b=CdQYFmANNQYaiL39
	Qs3rz5EFvtsph67c3HwOmOjOgk4E3mZ+5zvqvcHZq2FP4R4vdwxYkSDkWHNkAJ64
	RbuPE/xRu30gyYNW74rOXAGinif/Z2JNDoAPQFnSx8TdL9ws3qB/wdb+HB6YcDZb
	qNwXlCFfqjtbpUspOHmUvjZCLAwR58MeNrmx4WbYp6DQKrKLkNmgIP0ZQ+z5Cn5m
	RNfdM9QLtj+gFohFJeiOMPiVkSXYmyw3VnLApTnxR3rsDGIg5MOxXVa+lAgnooGn
	Wc+pd6o3d4q+/v3LoCyg2MK+IOcc9Y2EMpc3SQHQTPMIEn+YWdcPviTE161ccE7I
	aoIaHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhds3d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso87776485a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 07:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670770; x=1795275570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=ckjtQ2E/L4Srvl+3Mz93nK7kXVRQ8DbtOnrkTf9RMtoeqPlj3k2KKb7/GQefHmAzMI
         hdrp+ohUMyY6ci+CvJHsKoqt3fVjhwAJW75/PcToTUjdv85s711mG4gQHRocO8wPbSJp
         RgvKX8BYJPV+PPv7laeydy8vTnIKlJkBL8ZB0D+2/WpcMKd0tnYaLjr8lcGK508ogJG+
         +HjDcOpSXMVGl7/UZEUEkl5mCF4U3hRpukupHCmaSxFwhgfUvtQeG1nJ56JllZZh31Xi
         GEqEV/va/Kc2xQLLUQZXAtyF2Qt1kdryq5YS1KCHDIPCaViRzcIkmrthzr9F+39rLc3d
         kYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670770; x=1795275570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=dffRhAy1iZdMPlysLe75tSr85poXXL6l9P3Zlp8IQfwTGYuOGHjmBwH98xmxtv6wsW
         dhFwd5jw4iLz2SUgh5yMyNhGg53plka236i4jNDk7ZW9eGUFgHVJXrGWL9+/A6yNWWqJ
         gtrT8u1ksadHYFY0rypiLkB9YVkdyxxS42x4ujOkZ+ADQ+RdStXAFi/ShCzsaZ2zO8DK
         oXKzReq0CnRNJLwIuXS9qaN/CTlb3CVhHwcIxF1x0GSpTRruN75tCB69Wg7x80jVTNU6
         BDASE7pxsHIdjD8eGRypcFzEWpb3Qd843Ox3qPIgA9EJaBOL+/XkZxjzNmfgAdMI5zpk
         ai+g==
X-Gm-Message-State: APuU4Z/eQoSVcqvGCHnYc5TmxsB6GN8NP5Nm4Mke9aofEd0hZTBtrf3S
	nI+jJJvTyuHbNB0d0F/yRzjAU1wLPghpnLE9b1a9IQcrDUyoRYA/Iwo+Q4eGQZ1SCR1XAbihdF5
	V7I3/7iQuaVCcQ/gwC/0sJjjhG/nr3Vu4uYOZHrC8gJb7FlKNaPT+dtoCjo3WtUmGowVh
X-Gm-Gg: AYBFou2IoSH6rLIsmATdrmOWENOtW40UQamgPz7Nq4LscFdlV4qvzJru3X2wFxq6GGL
	Ghg8+2dfG+6UB7bRrGXFsOjK1PdUvr7Jr2bgLDK+hN0c8jCz2DjgqLqlM+q8WXPJ9AJRNYJLlAa
	mB3tSnz4J0KnfiugOoXlXL9STLYPpHiqAovTSbbbKgCSXoBW8vS25h3yiOEUBncJiHl5VWv0Cms
	OMs/6ruX69h7BjeMpR+kHenzEeEQ0EkZL/EaPT2jXk8DtRBMZ5csbUe9wgckoXcioQSOkAxdK+v
	wKekq/9pz/JMaT2fq+RVRS46AxrEhnPGaVu9ZViVeO9vjxNoYJ7OPqeSxJApi+rTvOdyAX4AGTT
	OJXQ2YcUUpqlbhAMphlbMHsA6/H4qkfFS3hR1yKvkLQCN0LGfTZmQTufsVJoxlEJVy6g7Jxzypn
	Ve0hjNtgz8qwLk
X-Received: by 2002:a05:620a:444b:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-9494bb59a45mr995696485a.44.1794670770284;
        Sat, 14 Nov 2026 07:39:30 -0800 (PST)
X-Received: by 2002:a05:620a:444b:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-9494bb59a45mr995693785a.44.1794670769898;
        Sat, 14 Nov 2026 07:39:29 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:29 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:07 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261114-qcm2290-eud-v1-4-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af880b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX30GCGYP0V9w0
 DPldT7Fi4wbzztFAJuM+QeuRtGgWkfSaKk7WdHbLK2+0tHJP+RhQr2jwD/h0E03yXTDohIx9S0v
 vSGo7WHgdDa57bquLo+b4GqgrH8cSo4=
X-Proofpoint-ORIG-GUID: yXPsiYYVyCa0wa2qCMm0XMiH_O_zejym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX5i4xyLjS1Eij
 +lOQldW1KDoQXj+n4/A46u35g5trSYIvQJzTpEeEJfbs37G6PQkfFHDKPYlPlf8tJm+mM3ijEvL
 06Ku6DGLbIjOAObfzCRVeBz9SNX4tPmGB+yVAoKGZ0zSeW0aK6wXMvegbueFT/TEdBwq8Jk6zqn
 2nSyNioslWz3FWofGBL2+0tQbLR9LZWfc/UULKry/CangdKvOJZQQdubd9or35cBXMiTCPRKz/3
 cqmmRSDLOv1Wktxf850AiFz8AvChBwto1iLw+LMfVHU4P9eEtllZ6CEsBO9K9jq8QXzMDwjwBeY
 mZ9Q7RSeG4goKchQbLOBxHSd0WNmR9NFpkK2KNhEY3lgVAsQLAHi1TPAiAUQaF/8EIYbVMEmqbx
 xQ7VW38wHdL9vSTdjCIMdw8zmW+Op3tGazZe49Cxvkd+EHIjo5+wAVaMvXV9JJ7YbGF4ad/2jVa
 iuinqvdJoEdi4tKuVZQ==
X-Proofpoint-GUID: yXPsiYYVyCa0wa2qCMm0XMiH_O_zejym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

