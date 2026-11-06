Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973335;
	b=1+zVxsENcz6BXxxD5eP3WUVfRGIelHDukDye87ciRrwsO5MUGa/gYhWvv51zOulxKPZE
	 M25qiADmhRz3CI14a1JeUGXTKKmtyprhNaMFx6JyxOMh5tSPzGTbm91I5P5Zwtb99jquQ
	 5x/dq1FqE7Msc5hcBL493d/O5bsr7YT6oUR/pNGsR6Dzm5jxzGIxmSFgYwWMEo7BJ+DFY
	 yWR52ydV3uSb7TJOTUTkBV8M9dEoRj1tOh8KOGol4FEt4vubDG+nxEwSWf+0TRmX0UsyW
	 xYxSAIzO6CILUtJhZxR9acMGoYgx5ZpfxM+9mwCpf/AiRyPcug4W0OXRy3z98hs+Mcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=ceFjOf/tHCKhF2DpxOl9ic76p1ns6vcnT7VBG+VsBpZvT4RajPf7NWHjMjufNPlkEeFn
	 u3D8qq7ceurVlXsr56y6FouVa3Zn2LEiKOnTdlQ/sStjgD6ZsrYydbJUzJMFcdXgk436R
	 kJVcLgurtMsClKe5ybWhOTwZDwLF3BH/0muadUy5JusUknB/ax5Qbtbs/jzF4VH3SpkgN
	 M7VIKKNrzJSAEkGh9DgwY86oYKdtz+4P6S3rpD90PR+5al32DCeTMUs+70OjQE2bYezqX
	 AkqIDRM45r4XHxJYxBaNk+nwzTQ+irZYoJXKof0jVV9Wl+vkYd3I0ODbN0OwK3M0VfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NCFwPK6f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkjHaswQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F4606EEB3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A32F4606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NCFwPK6f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkjHaswQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoDTQ2520948
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=NCFwPK6fDMZUeEWu
	t2YavRajsMg7gc8nQ6+sZicIILKC65pRTJ5e3G/AePMj1kccWyxK5LcA+Ag4Xs4z
	Atqi5Fg+6AMPROVKn47l+9r4e/FzEdBz8/wU/HN+YZnPgLccTYi20HUWyobeUGXw
	dYj5mqKL07Gr6TqDIVGg9Rv7vM6mPt96fDixg+Km7/wyGSCPpeTfH0daw1pESJ2o
	oIXC7QLjczJBN29Ofw+l62rsRYvxMVgAtDUqTw8JPOUjodR/eZdbra9zUSSs8HpB
	b8gxCfbaftkWY7W5JMlHrv2oQlTVXfbazT7Mo/5oR9UMhHgXp+7EyMNyx5fnXRHD
	sJKXGw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcb0fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:55:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf45382794so630414137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973333; x=1794578133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=bkjHaswQTdmQfelP8tvgty8CPdkWVMxqsvNDHNIOF1ljLc02MnZaE3RMsGCmP3Y2Mw
         V/o2py+3OK5xfngJYd4b0gF68AKT7Gi4sCHaEBdhDeE90PlSsujnyozWAVoYChg+yE2S
         L1x+/Novk1mbUGdw5yN5NzNBRrlKJk1vnD+DjKN4GXwuEisMHA5yPHHhdVPwuMqJv2zS
         35ts2FidSCcedTEj50FWuBpbWV9RUCahw0fEm7aMIRZHKKzDfI5OAi13i935XnvXc6xC
         gyfoEXrVMMtqPt8t8O+iqS5PjI4FY4ebz9peSrAHU8Hj3Yh8XHSnYQCR4PICJuCn3Hvr
         wHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973333; x=1794578133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=uokh87/Ll2JiYQNRdWvKx2NzmC9/OzlBZsdhdlUzbfsUqC4V/LDoktlepqDkkTuVq8
         5iUKjg37SXLQ1Y3diRgujmFRJPMV52OItksr+l61e7Abyk+Z1FnAJCNmOmjfI3/dNWtv
         PpOIP0et64R9J1XHzDCY/v4A6xmr+I1gnTJVS8jdpBtEERf/24vP1QZnBUcReDnU2gTk
         6cBqN7xVosecrMEMDz6oOT0IJ43FVyCVABbCU+sE+MYHIbk8OPokH/ifCUaLXmCuRhH1
         Gzh702PLvMa3fB06L3MI5BNdxZyhjPQP46BUK/FLWZhy3h5lKWbsk0sE28538Qs6uUTr
         IMgw==
X-Forwarded-Encrypted: i=1; AKwUvBwq0i55PeuVrJXVePFnB70pI+imkpm5ySujmYoaeA+FPr8xLsvdBqTJjn2W/czNWGKtgMdpuaOFSV8p/+60@vger.kernel.org
X-Gm-Message-State: APuU4Z9gBRUmnzeHydmRFVx93VzI420VrY4kDxV/E3OOQXIJgL4VqqJv
	K+m1WXh97tX1+9MC5PcOCAUY0aEZZN1kB9OHX2FjIGYDqQvXwVYRlI2onfjbAZrMo5MaFCDiFNA
	pOl2ZvB5LkKXh5UQ6W4bnc06X61SgiTz21FzXEEESfTyeUNTRlWH2OB57f7vEydOirU/p
X-Gm-Gg: AYBFou05lJJE5OBOLOEveYIoJnXhwa3Bq7rF5bxNCoeLJdm8YcAaAuBsnWlqF4FReOm
	ySAwZ2QwQo0kUieeoiNAbA7QFk8g87u7FzdW2dpQXMPnklw5ekFjNOptGW4Dw/mPv2N/XBP9tzH
	rD4E4oFJ+ESSkNstCFGoH5cFQW6xxpLnu60vtPR/eZjqJEdHu5fsIxqP26GyVBdBVchR6s9k5I1
	y0/7p16UrbwpUd3qtcTPSoKTZmcZdv+PDfFGWRJuiDTzUyR09Ly6PkufxnVPDVAqFFWdT1z6xv8
	zbDo6tIrzyJEUq2m5q01rSaORCFSlC2PQGUOSWJUb6wzlW5GPYklQ604UyO9fNHE50LMo+GJIfU
	/FUQ21OVHGoA/qnD5osWysp3j0R00NBsC2YuaFSlW0BS5q8JnBZ8piSwFafFxCRbXu/UKywVNFD
	b/V2MnaQ1riIpA1w9sUr4k+W6ADrPD9J8tpSx6HAu/3r8hRaNW73YXcJ92jet27YngGfjSSyaWa
	TSvirUiLS2D3W7XHfWFhbKOswBa
X-Received: by 2002:a05:6102:84c2:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d2a165057bmr1093474137.27.1793973332880;
        Fri, 06 Nov 2026 05:55:32 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d2a165057bmr1093455137.27.1793973332363;
        Fri, 06 Nov 2026 05:55:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:19 +0100
Subject: [PATCH v14 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261106-camss-isp-ope-v14-3-49c426cd2715@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 44j9UlNXOi1i0qmw3AytI8kk92ROMy-_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX5QxtLGpsA9l7
 rk0YtZ3vFAt3P101/6qr+nQCpzMfstOuvLNcvvUidGSfrrLxkhPx3HDW1/UKKaVYQE+srHfpbG7
 qTEFE5Lxi6YB6P1QrpJH+p9bm1Lhy66Sev7fTDh6Xy7mQ0QiCHgIXbrpIwtftxiLZZqWdxLUuGt
 MmWqwMWaapcO3rh2NGIKVqBq/+ysUiUwTddM+Zqaf0KPa7VTNFgFk5LeEOoP04d62CBljE3KffM
 VDeeiSH2N5xriC6WLucVhFSAFH5DkcT0pFYKEESYj1DbjQyXSBRVsFNsNy/Fz2t320oCaGlF/3n
 NxIuJrMEQDiFVbc0mRvJVEESSD9WUlJ1znly3Pb/8fGiPFGKLrAWHmH+V76MaAY7RwbUFhKUKo6
 eIxA0G5YeJ/TQIkqIcCtHdSgqq/0fbaoWHlzDbq3/oPGrszVIbh5ld+n8kWsznAwpDXed2rtdBE
 ZnsVnlXbExpf2Vosmcw==
X-Proofpoint-GUID: 44j9UlNXOi1i0qmw3AytI8kk92ROMy-_
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aeddc56 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX8rtABKy63GNa
 e0gXaTfA2LzeLDXoQnQ6kVGmr4ns849o6FGwzx08Z9mQSimAbMA1oCQ7CWyEjdL2+aeoGj4IijT
 juqgdInjvyh5QB/ZMrzUR+NaZFEb/gI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

