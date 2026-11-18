Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981794;
	b=j77oHCyLDOCo/NAAjiqnZ4piZ6Il3UZAhjZH6oP+HoPLzBJNCc0/2ISRHQd0yll83gyV
	 TBH/hE4DiPpQlOgD/4j0cYsiuSMZ7vHFIei9HE95fFMzDnZCKAet1Ept44BD9dky2tQlR
	 wTZhmUUOOa2vW9islxALZxCZeodApNN7bK32JxvUDZbTmJrT8+2Fm70WSXP/ce06UrdX9
	 yrS2KLd03HkS8mqgucBZaV8ETtb7qc+eEURWiAUk/kT+dtGdqO8QUZ5VQAKhb8c0XvGUb
	 jpA0ESd8hc/9C84YSHhUxGHxAlRMVzU6XcpjTOIjo4rR10ZneDZyqW1HoPeorM60YXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
	b=Qvdj9tx0D9lrw7YaB2U8BHO4ldkCG/xhtz3wu8CHlpRKccHs/8OZ3gzFty+yzITQnCE4
	 dSI0Bpzd1P47yE8RznDsRwKS9zIVhXLzpV6nauvrW4WNSh5ExLnBXZZwQdN167WdddMKl
	 tl8dRrHduFcUt4WXV79QbFbtfOLMW01iZPpvNAT00oVSgIrWdX2dCVoGPuVJAMWVQ5aQV
	 gj8dGNRh9UigX+fIobKs3DS1ThIBPuvZHUqFOQHI8s6kuO3lFaPBdf97jpml+xFtRmdy4
	 0V0bXx7LE03I8YL36gl/dmToAwG1FOwfXBYHdPLLD5iHkLPzeIS+AO3O/zyJiJLzOqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCfXUpoN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXxN4mHu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B3C606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B3C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCfXUpoN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXxN4mHu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ux101430548
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=; b=bCfXUpoNIdFsrTD2
	78cSneZxyRgsqgKbHlmT1xNF9jjjo9AER2ZPELbKCw3x0c0/y57F0nKLnlSED2LB
	lWqYEV/yhnwX8b4uLudgxpATOGc2hBV4AEeEM3oWikIYJpbqdrme2DHHRgc8/sFs
	z9Oo268/xX7aT1eAYESRUNaveYEx6ommV0ShBtBs6MZgmXapOxKTcjgIL6fSjHVa
	SPgyTwv07n3pOG2+/ThRQLSzXrDvGLF6XeuCS30JHnrbCjsCcRZp/30AByDajtPl
	hNHhwydUaj54qjZs88F6HH+lspM+w1uJqDTwo581FN0L4op7lJsm0v/mP47YBZvi
	9LieVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91f8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed02a00b24so5986915ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981793; x=1795586593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
        b=EXxN4mHusV6m5ZoObFBDWMKrG7VMjRZxaSPTyx5mNeUWTN8l5QGIUTOv14gyZnknGR
         vbEGKfvam9j5sRNN35/55rcG93C56cSAyVMP/gr9XW7gPUChgByc4edxhc+D51LpjMf4
         OWjTUfHiYlaNY3KAydzxZQjyHrb6XUdtzkeld9hCV5ofJCn9m3Cpew0ak9AlPAkO8w4N
         DPzpglmy2UwcoOYDctNtFxMCBcAqeE52Cqq0h71iBJacRep6Jsd8zO2K16N6zOd2Njcf
         OdPGV86/RfqO20KZ9u53fqFqEsMRKty0Vo8SRXZi5ev3ZJNMlhqGj9m0gJx7Ic/LTl97
         xAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981793; x=1795586593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
        b=flYDyJyDjC8ltnxEvJBWNrYtKIGXs+Mw6B0sUUAbFPzrgj4ZI2aNxERETkwDI95D7F
         o+X3yvQiI4WH+7CeR3n+3jgjOgiJ4JY54ptglKXog7i0tbCXK0haUsSixLRJeqSiIAtB
         fRhRmXVVnA/WF1ef/cmpgMo7QPBHvHAGJj8tQh0bcFp+BVWj3Wg5jD5qc2s+kVAR+mJt
         lN62ohl8pIRWZHxOonsL5qA2KEJCdIO1Fx3Zqtf53fBpDDu0HjDY2scAzMfjPA1ov68P
         lgoQAU3pp+jYfvwTbfk2N31y7Y9mHbLIJfKS9bccQ3sEHlJLKt/LcfMVxl9TmHB75kLs
         qKpA==
X-Forwarded-Encrypted: i=1; AL+hErHvrlHs3VL4q4MALAQEG4Y7UJYCAgh0zvd77HwBrSnNX+sDYA7kDIG8BK1M2nHB37VmwXstH4WSJFnlLFZx@vger.kernel.org
X-Gm-Message-State: APuU4Z8zUpnWJiwIXjl3KD9ijWw4DXC35bNfawCQ6C9YsxIGRnhnbyDP
	WgJcxbKJF5qFA3QoHObvBXZPC1yrxCgh2sPOOJ087Gv/MHsFt32rQS2lv/BUyLBTvYoJ8I89Dct
	tFl2/IU4BclLqP9CfenP12WKaIaCjcx/BnHg4SQbBt7B8wWPyHtLkArsBALSjRtZSZg/C
X-Gm-Gg: AZFdTZf9mL1Ov6QQeX1tERzGR78LNCXAb5aAfpxUcINPgbpoUpJ4i0B87YXQoOwMfWP
	xnITygbcyqUdHbEp3SCiob84ZXTsH0rsY8fBM6UvJY5rxBGy1BwlPN0ciVhHiIanIfJs+QR9tbD
	oFFA/3Qsx2fIkHxJ9lyW3xjZsbf4U1deIb81DB/bCdb3/j+PoCrw8nuLVPylxanfkEX5AZDAFvD
	EGICxlej505Gm/UeHR4rZvO/oTYl67ayaFclrn1DWP2x9LD+0lW231JfMS1HKuO++tXsLyQDQDi
	w8wEH3swzIU8dDXq/n6eQyEYWAqPlanT1HCd+sWO6GbMlNBCIuaS10h5+SdRqQFzY2v6XX+1NA9
	g8S58uZCTFpC0JgYKFdd5gY9qgl5DAi3dNvdlW9sqJCsMlsFnslooAo14ErWnOJmAW8KypfHULQ
	==
X-Received: by 2002:a17:903:943:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eff71f7733mr15105335ad.5.1794981792561;
        Tue, 17 Nov 2026 22:03:12 -0800 (PST)
X-Received: by 2002:a17:903:943:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eff71f7733mr15105085ad.5.1794981792074;
        Tue, 17 Nov 2026 22:03:12 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:11 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:36 +0530
Subject: [PATCH 05/18] dt-bindings: pinctrl: qcom: sc7280: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-5-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX9tn7LB4MwWi1
 VLBuJ+0nFCh0IsJTUsfCjQZuPkU56IPcVx/u/WXAVL/yESbHwoNcqNTkV5OqsUFiuC2lWBsX808
 Yrn27HTK5gk7FhOoiEQsThXSQGoIp45BpB6yAOFMrUVR0qnr2WxQHBTX5jqt1JK623nmKLJ6OZ/
 IUvAtdcQxV4FMUMOgRc8qj9pz3zlI65I7OKG6ne/vVx4RuTTDHPh6IEx08Bp2w4s3MW4CSRRUuy
 l1zOEJEnpmxniSPfn7nZwobaXh60AgjawUYAm8M4EEW5cffMnbfa6rtdQUJ/cs1Ll9f8UEmPQix
 Ey9Kz36N4iqcEzyL44MbTHTE+JgOU5rB808EaAPIx6FyuN2+gxwZUXf5XC1/o0H/8QUFJDtxfug
 EB6XRCJPhtdOGAMV6mXiL7ZyBfCe7SXGn9GLM/NDNrHTw8vpqFJiWqgy2KsaVmHkMMEOVzjNmzj
 S/jDCJrM/BiYcr2gkJg==
X-Proofpoint-GUID: qjmAqCSB98YPLoUUZW_Y2KUWJE2csfja
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXyFFjF2WwEm5d
 vo6ls3CiiPx2cPC5qblO50kSSarBaNCA+UfJHK6/9cQBFE9joW7B3/EXEAIQTCyUWBE88LWh2GB
 naEw9oTbbQT6hF7cpm/6P4LW5UOWrRI=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd3fa1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rOX_z413SjggttUJAysA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: qjmAqCSB98YPLoUUZW_Y2KUWJE2csfja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SC7280 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 5329fe2a439789ca1466577db26f56bc4c779d65..9ae7183976d3713affe2b798ff8e6ecb93f877db 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -75,7 +75,7 @@ $defs:
                 cmu_rng2, cmu_rng3, coex_uart1, cri_trng, cri_trng0,
                 cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, dp_hot,
                 dp_lcd, edp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
-                gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,
+                gp_mn, gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,
                 mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3,
                 mdp_vsync4, mdp_vsync5, mi2s0_data0, mi2s0_data1, mi2s0_sck,
                 mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,

-- 
2.34.1

