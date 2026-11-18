Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981788;
	b=TP7mgjk5DFv+ycaR6CKjz/aZOOwF6iirx75vf0ZiZmULRUXsbY8RlQysb81/TfsuofhM
	 RaWJyFFtDxUkG+TsLSa55SnppslDKEvye52O+EukgXMmLuEFsidfRVsX0u/dObICwU6t/
	 7P1AXU22+fat5h1MIejb/tZISPquDvcua/qelmi20CEUksbNth9+qBzz3brA9ywYpZeiX
	 NgN3ktYaa6zFHNwsUDUSlSXa3NctpowypLWY953tmSPMuKMq0k7f87jc7rz6/+1oG+cT7
	 Zakwiu4j3ggEgaIfJ5HXZbe+2Cx51jwGL4c238YT83xCRNDO1T6EUBxp655Wrjpjnig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
	b=FVxSrLdnEHwcQiFH3TOspqW6AlO5+zHJCggW85c/PZbOh3Ctju46scNRJodBv8N8zygs
	 Sj7fga8Gfc3CR3EiWfQNh/fZAKGwpKEvBD4sNcq1nprLhiEcxu4JoDcq2PlqiKU762vWq
	 bPr1ZbwkrnoYBvOdapKVJeD1MhV2IR/2AmKF8aWQ0W50X29fpnrjrMAlZc2k3wQYvj5yo
	 YWDCZKslQ26hhalMNcQ37GvHa4AkFLmm07CSHYtrflF8hCXLUi1hsiis8zq7B5jJvJH19
	 7ad01UYhiQnbVSI3Htvuaxsbfhx997BaP7a7c0PEAZZVWdUs6WVYTMzfSyOeCX5ktpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pr1t6QGn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3dtukjw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207A5606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207A5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pr1t6QGn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3dtukjw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvOJ1959712
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=; b=Pr1t6QGnyFV/mszV
	rMAcKUoJ1E27zdyrXfPBhOJOKo9KLdYdWlmZY2B9yJFip7XDUl5R3d6YQ8aunJMe
	h5y5/7W9iA3Wyg01WraLCs3Q6Qp7R5nDG+iVc09NMxbqliThBVUQRjvih6aZ7wWM
	nqpu8NGcRnEobkwMbIp0xsP0goBMTkpB2dllYylIw+bNAiigiIwQH0C7+a+fVWKk
	lnlYswJN63L3rQiSetVpQlbMNiuMYxJW3awOb0qmijdRpGWjKqXWXPwEEa8Ohyji
	W2uFj9OSY8ie7uGpD4eZduRBdT3S+KbPowgYQK42pZDljyvivDC9OictKy/TGXcF
	tYuCEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9heww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efdd509c6bso8221275ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981787; x=1795586587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=d3dtukjwohyDdRlUtWH6YjRxUr6gp691s1iYltIgSfxEb6jgtkungWk874lGeqXgkF
         bnxcA7daLkep3drsVSLZ9ps2LObfyRuJLhaawVg9SBeMeixk/V27Lxex9MfptL9dHe8r
         4WaWZ9FRrNDtygmDbqTB8w/SsWWEVJ2mOh/GtDoj3H7WGJwgciavx5EBHNl3wiHnWWZa
         iHU/56GCYStpAyQ7fpafd5PmXwebSWq9Hql3xuFCRg0SWkgo/QjR1OCf+4TEXpybRrmT
         7rbXEDxfCJB0WKcE94acHWFjTBEYLAqg5MfdEtGNC/Cq4k6v9FNxz04jx0HdWFx+tSh9
         NbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981787; x=1795586587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=i/wCQcB7PSM6yynVRgNDyBHF5U5807wtFPtV7Afol2j2kGwutThaAxLhV8oiAnpChC
         uGvGN8VuoDyipdJ8TohfplYUuid7wRZUrJWJUOAy72yIfJRa2Yx4dGJflYzrteToEs8V
         hlcH8u2+XcW69YLhUHM0wg8VjaQHdLhv97RUQMabww8Cdyuy6kpKgE611+ERfeY0FvSi
         sl4iTvm+7rpKJ7YsZ2oYlOZmlOXgv5QRO6v89brUJpHPXxqN9MoOlTm/43EDT5HdCgAD
         jLdlPHY0PuBToyjaJuWCd6zYXYWdWlb+/RiN13k7/LtuKaoX9Czl4/bmY/PfaDmsJ0yN
         RZPg==
X-Forwarded-Encrypted: i=1; AL+hErFZE7evyQxpjKzdVjA+rzIHk5GYzbz0c9dingqLHjTAAvrmB9so4HjWAODPsjeTpvMC3/X5A55Lv1rvX/DU@vger.kernel.org
X-Gm-Message-State: APuU4Z/5EO/S6vcUZQkJ7QsbN8D4pSC6NrzSUCJEdUWlLkAotUMD2D1Q
	+6Dx4uz8qf+5fH6GU54JJFhOLcLu5jYO2LrtI3Mte+aTu/aFgCVCX2hj3DE7CaKDd0TEKF9pot3
	+RHhGIphZcBb65vm7c8xo1Ncg/OxIiLkBiuETPAAJDuHAmVHnygNDu1bApt3kQoz969p0
X-Gm-Gg: AZFdTZcc3rx4ZeyIHz9fawiBm4FIlCUV+eREALJLKpnOZQTTeaS2IkzXUbbLo2gVCMX
	QMJdfrYIXBFN/T0wIBt3rKWvrlme6R320d2+cmruLLROIzRQrNCZbI7dTK+XoPX3Y7PjEX58fcy
	fZ+Qv0EKnsMMxj2oVVDItfQZDF8mmgNzVdelOlMngF+w7MXDzZZVD/+ASzf8DuQopm9dG22GKsT
	1FWTcD4z60gKO7G/N8T3KXVOhQ8e0dbJen/4Y4hvwX0CbfNsZTIERUpbMBNxU+rIijEXEWQzfPt
	7y8yIWuVEsPt8NT2JQu2OKGZNERV/r41f3n2h92WaTffLZTpPbvyRLqFMQTl+czSUOV7nCNKXAH
	qWLmQwX8wSwy+8f2+NpOQptWgLINsabQBKTmCHPyzbTKduZhnzdgJpHc/P1r2p3W5PJMli3+c6Q
	==
X-Received: by 2002:a17:903:234c:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eff72db605mr16730005ad.14.1794981786465;
        Tue, 17 Nov 2026 22:03:06 -0800 (PST)
X-Received: by 2002:a17:903:234c:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eff72db605mr16729705ad.14.1794981786017;
        Tue, 17 Nov 2026 22:03:06 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:05 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:35 +0530
Subject: [PATCH 04/18] pinctrl: qcom: sa8775p: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-4-703f7badd194@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd3f9b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: mVuSZ19ZxaNEI9DP8y60HHHlLrC7dSEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX3tt6T4SgsjMN
 eT6g3Wqs8TeSoi4s/Ox0zSKzBo0Wca8qBE+mYj56bEazrIiMQLdmq1vL7znlNIJzQbggpMZ1ZGs
 2V3CSuH+hNFYeeT0NL7VzZVvAXejePcypcuJkfOdk5HF6VluScJDQJfj+nGuRfslz8uJQ/X3GiM
 Pn5y2eMRxdfxNyaaM66i0GnfZclyFvi+iVTte4ckTSr54A9biaYe8rZMP1XCOSeH+UPat6QI8Bv
 R7a5iNYOGGUpxgIYkxLyXgl9UV8nfqN5bsSvFnCOOUxWUHEAPTx7qUU/vZoMU0L/a9ARCYxPCNQ
 LpAHHOM09iRrFxGfgzS0kr6xwxXkZ4xrNA6QD+NwfHGm5V97a+iB0of+sfEP64Igh9OTL0Rav4W
 4hT/FaPPQIZLpa25daV/Y0GTYOiQBA2DK+tGL1C54bKehFIl7pruf04bPd6N/XS1yDw7Q5JpOmS
 JlixwR4crJ+fmioQWhg==
X-Proofpoint-GUID: mVuSZ19ZxaNEI9DP8y60HHHlLrC7dSEX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXz7dIYGM1v+YM
 UsOoHxWmhZqx0bz517ujSPJDtX8C8W1JEZPCo625D/eT4vfseuyhhSVlFBr9vTWPoVl1g/z4RGV
 dC2wSSAVeLmwlMynMjrmYKWo6OpnVQk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio35 of SA8775P. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 5dbaa50cbff008a2605876eb329496d305735700..d299f47a0bd4ab1a0cd0e553ba50f9ec1e035686 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -480,6 +480,7 @@ enum sa8775p_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -828,6 +829,10 @@ static const char * const gcc_gp5_groups[] = {
 	"gpio34", "gpio42",
 };
 
+static const char * const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio114", "gpio115", "gpio116", "gpio117",
 };
@@ -1230,6 +1235,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1361,7 +1367,7 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[32] = PINGROUP(32, qup0_se4, phase_flag, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, qup0_se4, gcc_gp4, _, ddr_pxi0, _, _, _, _,	_),
 	[34] = PINGROUP(34, qup0_se4, gcc_gp5, _, ddr_pxi0, _, _, _, _,	_),
-	[35] = PINGROUP(35, qup0_se4, phase_flag, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup0_se4, phase_flag, gp_mn, _, _, _, _, _, _),
 	[36] = PINGROUP(36, qup0_se2, qup0_se5, phase_flag, tgu_ch2, _, _, _, _, _),
 	[37] = PINGROUP(37, qup0_se2, qup0_se5, phase_flag, tgu_ch3, _, _, _, _, _),
 	[38] = PINGROUP(38, qup0_se5, qup0_se2, qdss_cti, phase_flag, tgu_ch4, _, _, _, _),

-- 
2.34.1

