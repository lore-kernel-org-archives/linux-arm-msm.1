Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835071;
	b=kBSl21jUuXELVMlOfRmjNzhH2Y4LGAKJANjWFcHaQB+S5DN5VgAbuh6fhm4QMsDlY4uf
	 F8SZ19yYrqorRkfmmCSTeI62TofksVKcH5kpJDCU1BXy4u1bwogYt/JEFSMr7zx2D+cjF
	 jp3Xz2bjaPz+PskmITy1RonRMBgmv4yLH/PksUSrn0Rz3UB1Zi5UdWbLM7o2arqghUdVo
	 qX00JjfdcpmnQybMu/9zs3xNaIFTu81qMlFsEtotuHFkichhXbuDIJZI/ErMbPMRX7hIc
	 fqQHaH3Ax3b2zHAARsSSBaxIfIPiAg3mUcSjWtlXV566nX+a4Xrpa1W0R8hNGOQlm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m1nTZ+XmUM2edjkyIuwrtLsiCwHaExrIO3F3ymxsXr4=;
	b=42Gcuvm+CmCSCqcfWLvx8myND5xl4BIo/x0vD7i3scXOpxzCKLzhCB4zthw3k0bS5HAq
	 eqFbKe+MN6rhYSUaWjKG/RUp5RyOo8QqLvBHwF1gnFpakWcRN26qVXN79/pQk0A6KrjNw
	 lBSdRRgXx9h62CiXshkdZj4UN11Kk8q74V4Lk13suNkhWs1rueEwHGejmFrDGRbwWo9fA
	 /LobtLABDRtYQUzp4wAflcQEO3HNc1jfx6R82NK/65FLlLqh7XqdoV2Q+Y4WIL6+eMpH6
	 RjckHNLUUNixxWIQHEnCvlG99TY4NZ9P0hv57wPuWw5F77pwKLYRQ4/ywr+gOb5Riyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csSPYgpv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcxBHJZS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E4606A337
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7E4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csSPYgpv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcxBHJZS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0msa2212658
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1nTZ+XmUM2edjkyIuwrtLsiCwHaExrIO3F3ymxsXr4=; b=csSPYgpv+XU+65Vi
	3IwiCvKaI4srMZSOpGLCdepiYGV24awTPbgW8urs9f96NvoL8wnL6bSO1Z+b3yev
	1vWzgxnu2B9usVFO7sguTQnWHV7xkwiUYzwPFHy3MZLc2a3Uu7SKJn45zfNqJyaP
	wKAmAnuTTbLpRFs4aMviuUpdZ+AG38+6EHPBP2y9PmICIZsZhsu6GzowcUUvmH/g
	3oMMrLeslKeULrqxLoAfNYbzf5qrgh/cIyG7p2uizVLnqMplCkalN4/q3TJD3MBV
	vkDkMLC26E5xLVw7cObJz+hqTdMkz5FA17UCZHegzO8G22/bzOXgpiy1eMFZ/xvF
	pyhL2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfgf00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so674264685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835068; x=1795439868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1nTZ+XmUM2edjkyIuwrtLsiCwHaExrIO3F3ymxsXr4=;
        b=DcxBHJZSjmJFYnzJEUUxY91wS2Xcb0rOtHBLRWvJGhdTgfWhwqVIh3zL2U0EJpMMsm
         w6AkCEJZe7pyQ8pIiPA9OL49oC1jJWe5xc9A8JC/oNgovPJaZNo3nrL3F6OLzZSWrBih
         HLhdslG47MF5ooRAmFhSWIieiKDcyONwmNrPpd3vI1NBbK64G7/ANJbV0inx0IDuOkdL
         25iWn94XLtSy1fMMiki2d6uLja3l5SDiDI+7hpFZx4hW1Y7S1aM3Q1AI1i7HlCEVBzsm
         O55KshDEVb9Suxku8UO5UGxZFByoDRRbWVYtZ5IaJnypafxQw0mpSrHv6Q9Iz5vJ2uRB
         AMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835068; x=1795439868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1nTZ+XmUM2edjkyIuwrtLsiCwHaExrIO3F3ymxsXr4=;
        b=m4FFgqGMPUZ7Oi5derLxnN/KL4/aPTd9U9QP+KiazpK5p5HJ6rqSyGPUUZeSNqLLSq
         CJl6NYaX9jRtTbtj0zsR3uNWUkOa8Pr1GLpsLLmPfqGTush7+rX9WJob4LrHJUGzdOTA
         Nb7xdXXwaEVVWgW/qsajd3HS8q/EtRO5JF3tpBOPUCkkVGue2iHYU1vCAtG71yyUNgmj
         aRFrCRQ8x5qe3w9E4hFXlU5uVfd+sEw8jOYwdEOL86UGRMJs5FjYaaI4gndh/qvO48ql
         g9Q+ScUOprtAH/6UVo+SuXEFFeWaK/NtKKiDCnDJkvQ72/7k5UAhfRKAChDEg/4aCVXn
         BvmA==
X-Forwarded-Encrypted: i=1; AL+hErGXGPSWXRI/o4JPGOveU7JvNufCs5njYkCsPt0XrBWROlsvT484M1Cna1PpzuGWco/chb0z9HmEaYQ7rrCS@vger.kernel.org
X-Gm-Message-State: APuU4Z/XWtnluI6w/8GafN/gCPFnd+hAq0UemF0QC3eXpU8YpUTaLAdR
	Bp3UKrCO3oe2IOFJE3VJAlnAr/fHNbDzjDw0dEGebwLL0x4qpgk2XlWWTbuQ1OR3NuMGoc1nRXj
	sT+HfOR3XMg0Y8py8Jk9L1VWl5xelScq7MfWAjq3FCzZMwe4wkf9qjMTOQJPFL8B8PgnX
X-Gm-Gg: AYBFou1LWD59Es6X07Knl7x87a/qIEzC774FV7GXwfgiaIkepitMj4APc+8lUCLtRFy
	D6ZjPzDuHNWDcOmmn6IYVmnoTmtDJfMQirUaYVks4AbdOnUW1mDKQbqUAw6oVs+xk1mv8SzNR8H
	43Zq9Frqbhx4B0nh7FVvQXtLimN/DfRhYpfv5wXJ50IasWsxr6snJSPkM/Jqc8Nb61+/C0QRLcl
	ARwPoUjzRhdnsEZrGuTeuP6srwM0K1Oh7K2jw2P0SQmVyxsRlhh4d7MLU36SS++bHcB2czudxzN
	PVkTmQAKEmZO0IbNs0CYIu7pi5cP8rAT5k26Jjqr9QhSv9O24nAigLRj3qVQW8icvFEsy977A59
	4yUoVEuEkdY/FoWJY+HWk9wXHYIW0TbMQeTHdAbgnwNFpAIMLJBMs8X+bILxSCFhqZQdaaJ+JN7
	YF
X-Received: by 2002:a05:620a:4448:b0:93e:c12c:43f9 with SMTP id af79cd13be357-9494bc91605mr1621096685a.70.1794835067762;
        Mon, 16 Nov 2026 05:17:47 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:93e:c12c:43f9 with SMTP id af79cd13be357-9494bc91605mr1621088985a.70.1794835067193;
        Mon, 16 Nov 2026 05:17:47 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:46 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:43 +0530
Subject: [PATCH v3 04/11] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 Qualcomm Nord Soc
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
Message-Id: <20261116-nord-drv-dt-v3-4-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=969;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=3jZf2Pti83jqOcW2mSkjBOHEd4vR1NpTAkKkAceccnE=;
 b=JjgDh559AufDCmhLwnJspcdf6rZkZsuIPjkvbejQcaG64aoXPfcwej5CPmjCOrjOYXoKXwFkP
 LswwhwR6HLsDF60zELZb+9MpHsV5oGl+iM1+LaX96Y33/amGM4Ei+JS
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb027c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lCWEfuFUYIIHy-HYLagA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX5Ey8Q5Yk4+En
 wWLpugCbSViLJjF2I19bLGLvgcuhdw/5lcACYKa3G1Dc+2JBwUcRThGwaQcxfn87EexG2mk5TF2
 tyrKybovztlajGw2Y48WoeKudx3s/6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX9dGEwlaccZFx
 LulFKYfahX+lxbg6/PIbybeV+Wq0i80ZhoHc5NuDsA1Yoxgw84HeF4zBL4uBMzgbPmCMFBuNrSZ
 6S+rxZKinmcRZ753iLXCq0qNN9wQfR3Xwlpp4SYYEvKaSgG6qyj9o+H4JIX4gKeZ9txMdOC7Ogn
 Fpz3OBs/wNo88yqFjlgVCvpEs8NA2E/4wXmXgWwykBwClKXD30k0WmjMWFn3SLkOm8uaRc92mHh
 Mki/lrXcdJyTSStInYfT0qplq+AqdvRbSTccWAzl9Gl9HVtZBIcq1Qv+ha31zYd7v2WD5HtqeS3
 X2BPNWJ3mhZWR67O0pFMsxHe5V9JIZRwauitKhKTCBzJVwRaYKwxeX2PyN1aBwtEouq4YfFwt3C
 iRIQKHi+55AnJikldACKwJlsNKQ0WTJf6OP87AmokGQ+n3/wneM73ddsA/SbekQEIyYj2B2flmN
 mbv4MflabUJcqObyDtA==
X-Proofpoint-ORIG-GUID: FzQX1tEz_QvTg5-wqSK74JriB10vFng5
X-Proofpoint-GUID: FzQX1tEz_QvTg5-wqSK74JriB10vFng5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

Add DPU (v12.1) for Qualcomm Nord SoC which has noticeable
differences against SM8750 (v12.0):
 - Added DSPP blocks
 - Added INTF6-INTF10 and removed INTF1,INTF2 and INF5
 - Added one more DP

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index aa0cf0ec5b93..430fa02d18a7 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
           - qcom,milos-dpu
+          - qcom,nord-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu

-- 
2.34.1

