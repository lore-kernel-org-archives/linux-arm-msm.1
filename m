Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530583;
	b=1cXg0dfrYqPgRfxEernwEJlCaJMVxwYgLN7soknogbcmGppmrtP/NBLuzu3lvJ60Jycn
	 FCH1xisv540vVi8PlguXW3J8CvZSMIaMG0+kIlMlC5OAYyk2SRfQsuBbXe9iYw69bZSRt
	 YFcJoyzFw1vUVmx/OhBdR+9Ws0Zsq+FxJNwRNl7P8YNJz+W9gu+ba60ofMJHH/fSrlx3G
	 V2RiyR57IXS/iSJYKEr+/mf+3zqY1Kqje+rAzRWuyWL52hXjVHph35knC63U94gox1Rjs
	 wLrl+fTu+GSesA/Dm6oafYJkzZbVMVzkAv39Vmvj5mF/HDVEGH+CxBT+F8joHrg43Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
	b=3GfPnos77QROC4h9DlTHaEtW9BUecb3Mtc3+UjHXC9x1pOCbaVXzZINjYOOGOXxzgoIZ
	 QUsA6bN3qVFXJCuSOs5rZrDjIMQ6MPfFd1ZFO5a1VOFYHaC0p87OKk2IbA47th1R9xraB
	 gFj53Cl/lSjOMsrF/7BDQmMn1uwspbVWqHuB/jzJLO1tXNkooUUFffdH1hgZd6Orsklrb
	 nKXi1xt/GQDsDwiVXpy/JILOK9m0bcXEEEZ+PTeuwdezIbrvIzKudqSG5pkpyOEAPiedR
	 bAeJpfrxf0PAf70VIWRCED6Od+Ooq+2U3Zs9tf6Lz74GTr41sjB7AYKMvOqLefARTUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5AjI1ya;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDJygbmu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAC1606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FAC1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5AjI1ya;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDJygbmu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuh9N1291451
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=; b=P5AjI1yaHtygG2Vy
	K4A7EE51tYhDGAiplmjjtG5FmLKKjylOX85FOqmd7/ldvx7ycwIBhDCG8B2S182c
	t/GNirN5ET4HWNMUt/iEOtcAK3Z5CtAzv36Tp3XGtKTgqgLeefDzeSjmgsL6jLDR
	o1fqdwmZqDICXzN8AaDH2Ye5hrXTzbE9y+HNiomQLVJB7w24LiX/4K2WpF7V+cuI
	2rPrm/l3l8TNBu759BySPu4E4nS5YnrJ0YyVylxV7jmb4V2WujljOBYASEBi/48M
	TmzKwKMRBtzpTcH6i/F5qmArHpwICFu4bNaPhUD30tORSmhVsh4We43eznilIYmx
	L0tzIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrc8qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94967c6d4f4so491258185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530581; x=1796135381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
        b=RDJygbmuIa8RLNGq8yWQSHy5XqYGe9B8zX3s5IyCA1EcObmvSuPhE/2t1F10M0mQzv
         gApMoR4d4eH6QwDk5qmVOLi14TbLpqhSyVcm4FCxhtoDYtEneqIBaeBnnFDmYfYeHrOT
         jTulyzDpiMPTpyoSaKAdkEhRksPrNT1zlujzvnulEeFkYeYYs5Tcij6lvSk850HMoAfI
         0nyy05TPgyZt2Gsd0M/MdDSknotBDWFZ9V7tFkyJqRYb8FxEDydG+R8mom+L4A1eTaB7
         P6sC6/DsvaGOgPdjs3MakxwHqbz9tc0FJ50l0soy4J/GIq9GD1ELP0wsvJO/Z+enSgdV
         9K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530581; x=1796135381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
        b=GLEDcjh2ROVZeHUdi3pPsrNlOczhHthXbPzdyzuBv7J0Fuagg1hgJWxFVauvURhoDy
         0ZLCoCd0gxL8dMMyI78DbZzHFj787Wzjw5S7qeT0PDg007TaEXb+qJMMR+P/8LP6hkXO
         rY14lLx64iXotLJzQ/Mmnj3hfCU6+FgE5gggTB61So8ybsQETvkqKNZbZkIdH3K3EcER
         p9JbDJALYbSJQAG24kz7gVefy8mgxqKOgYmqeTf3Tlz7/0nUjY9g+FQLSSWDZNPn6hIg
         8RYho3UgObZEwS/5lt7hpzO9URkFAIcSvffrv3WNU/lFgneUpMQZ8f/blq5GGiz726ul
         rEhw==
X-Gm-Message-State: APuU4Z8e53kV5Xud05pazK6bgxFLGnf/6/2v/WEM/DnnzV1Lzz9t5tkz
	gbnh+lyF8e4Xw8ONOmscAEeJHbTSps0TNtDcY34AIBQmp1miOhKyET21wjOSnzXNqYxO0GRZntk
	iRXYHJHMEVnGzx0W9ePt1GjIr9ojQa3r3x8QSRtAptDmrmkqrepPSHP+GkstyU2NJ9a5n
X-Gm-Gg: AZFdTZeJ1PCph8+wPwNwNaChe25WayLWgY3QyFvql9iirOHTGHLE/jbmfKGIm5qjuKy
	VcVxwxbI4uJoFJHmdkRWglfWfIURkBR3wsl7M5ft74HJtd2K5aseni80WFkigj931F9Y1SPAlMp
	nMYZ24tDRAYFwxJyI7gz1lrwH1hL8lMwniESKVjSCpAxCtpzqxqHUI/EBzvD0RhwONnCpcT2KUG
	e2iVrJjvXmzIzfsqpYRrUltgQ4gOX0yvgynImq2XA2XEt2z7qHiEo9ptfCVfcfq6tPrUkeN/481
	PJwTyD9y+jdWtoniNGOyz2xFCapNZW2OoJCW37FqBr4ViKEyWlhCcTQ5stYpz7tkR6FwMIlkMKc
	y0euZyMYy8pQdYYcNM4MugK3bjwbTDKNOVCNvAm+FHRoHSX8oQhqIUFW+UCrvH/rkmTpoXMrPHX
	W0Oi3+8wnujhSmbBXchPbY541/dO7e36kuXR7rnTcbYlsLZTNTqPMbLzkHBwad8JQ=
X-Received: by 2002:a05:620a:838a:b0:949:7427:5e7c with SMTP id af79cd13be357-949bac80de4mr2436814985a.81.1795530581043;
        Tue, 24 Nov 2026 06:29:41 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:949:7427:5e7c with SMTP id af79cd13be357-949bac80de4mr2436805885a.81.1795530580248;
        Tue, 24 Nov 2026 06:29:40 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:24 +0100
Subject: [PATCH 07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLH3lnSsVsWM7ZJmdOj9UrSc8vTvxkJ3hf/pgHF1t5M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CEsBpNbQycOF8TWg6uYB8q2XtKY7VavZ88
 ByNtg1px7GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wyEGEAC3PHMigkehjMMkS0o02FkvL5CSj7Ilsf4pXY/iXJNpXz5N8pmawPatVKIGkDQIIEvJC6e
 U0ICUshNdQ5Fs6lDtNVOV8lmowctdt2PFCW8RDyOnPaRowCeeW3rKN6+GomDR0Do0qpCxwCjvIr
 zl9vYAPMsZtFhom6neN6oK9NhmW+7uGuQ+b4QOkv2VCyeLP8zoMl90O03/znhAnAUBkQEPM3VPs
 j16Ny5ESzND9WP+CVxaS04n7fmKEdoGItfTC9PE+Hw/R5rBPUkDQI5KrSsBgBzwHgFy/2N9SHgK
 /yqGwI89hNoea4Z2uKD9oFO4G4T6AHFaU+j6XO7YLwdx/P5zrxgUQQw7WLE4/ygQAQjG4ZZHkLf
 nvyriR1sc2ktiNk6ITD7heUL2w7O11wS2WiZn6Tzp250RdPuOEa2qLkSQi01rvCOCDpauepQwwI
 4XHpgxyInig6SoOQl1TgKwt4HaZChWDyh2a1rkHW9WpAsMaQfF9cHJbxkFfzaBGVBaA4dEsn+Qu
 wk6MxzlV+/JPiYYdDQFvskHo9z6wurf0D8hxx3hTMxKnzYxZlGQpz08oV/ls5f0Zv9W2W7EPWJb
 LmSPg00cC87KEyWbaf3+Q/GObgou4Y8wPu7/k9Pf6O+8UMRL4i1cmYvkDPqs91804Vxb3HXtuYf
 RbirVHwwDjd8Png==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3+bjq9lYnwzD
 six7oQ6wfRVDQyWu9kaBXq7F8lEJPYotEwpPHXGZKJZzyvp3jtZeWbSWxWz59mVgYCtIXxGuAYm
 Ryms6amSXEnrP+/ABI0+x6lJqLeL15o=
X-Proofpoint-ORIG-GUID: 8lizvrz5Jp8NQvrMCh4HXkorE6CaCYEf
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059f56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=rzi1cwwMUWT7pCUy_hIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXwDlv9yruM0pb
 dRO1OfrgLEO2xDin30JCyNmPQrM7ZJknB2WxXDDJ3q7VGuQGYHMUVZ3a5Ia8U95EpVr8G7hq9s5
 tD3fdvs/PtukdV2X/G2v/AO150BK/Vn2HxDxEXZz6zqyNqPCXkpt6OIgl4IBajdeIpv2mYGrZFZ
 BGpU3rQIRGeI1u4HwM7tO7FvCjHhhp9WqiBARoDEn9gxk+n4b2BaiTz1dOJ5YTlOLC7mbGC41Ry
 3EimgSrRqV49cVXDL0tGyPr4vMlI/7viSgC3/iflfRhnS9a5BFBMglhgMG7nwgHC8NXeE1bB0T8
 grZjVNQImqC8yVVIPfqTUFmHdz0H2mi5sFh0hx0z2eiqg7JloF0OG93hGKEWuN4PnqDQifVniyF
 ago+wZ88otl8VnqqJtOcFlHlaKYuUxrvyj0WGiiIF7lGKk+Aemm0EYApCDf1Et+WezzYPTXn5Q5
 Bn6qYVyJ0M2AmpvNiuw==
X-Proofpoint-GUID: 8lizvrz5Jp8NQvrMCh4HXkorE6CaCYEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the maili driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-maili.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-maili.c b/drivers/pinctrl/qcom/pinctrl-maili.c
index b9ff0f4479410656cc73567ed494a1cfe25bb56b..5b75994134238a263856ea2c0337ac196867b767 100644
--- a/drivers/pinctrl/qcom/pinctrl-maili.c
+++ b/drivers/pinctrl/qcom/pinctrl-maili.c
@@ -1226,7 +1226,7 @@ static const struct pinfunction maili_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host2wlan_sol),

-- 
2.47.3

