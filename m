Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014234;
	b=c6y7kSozr/sryGvRsWllv2QDA0QQbjclu5x1HSn5iov61ozSlDO/93LZFO9RUVHxh5/3
	 KR/iAk+pHoqNiNXV0PGB2zYMTWEnHJ9TlmnWjv6/cgxUsBhyEa7xbr3xCGkQOPBRQk1Xh
	 eg8lLnxmIW5aXy7Na1Q99LfRFSkt0zPUq1RW6muHppnL7hiuv2HlfspzlCL1pPn7o3A/h
	 HNpuvx8XtZmeHVwm4dgAjasiKDRLQ99bZtLPOBuKG5p+nUwqTuN1zi1nuL3lG/rYNY54Z
	 PDrKgEswv62t5iQzvGuSKkK6PvQj1IPxeqm9JOfR9SHYh+4xuqpYibETxfP//42kWsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
	b=NjVD3VfFVR81Mmp017FqraxjFc42evkOETZAL1ID6aDKe4dKJxy7Si30VEvyuPGwwZVD
	 VHm4bCnAnGnB4Gt+yfqx7iDCK4d4iLUcjjDmPkFw4BGDbziSv4kaLO8O51YCElCjo89+t
	 nZmcI6UQ7S7mqxU4+CU+uER8dNtOGquTw3k8B4G5cXbNcZOqSgUyVGfDh+kfpHfSt2nAr
	 V02s1P9ijjzvcDuJGi0H389k3xsIdxwbbLyzUcrm/PHNhkICEa1/pJ/Gnf6rjEnGimSOZ
	 LxA1Ao32FJgvyxXkngd9fVDx/46ejeqYMeI3jRM+t/PcsaQsHCySP3bQfm6v6+daiuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EO+mXk5L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFMUWVnX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F2F60A2628
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F2F60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EO+mXk5L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFMUWVnX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtIRE3085493
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=; b=EO+mXk5Lz5FLLXjX
	HVQdlKor98Xebdy9/kOV6qz8DgTUBXZmn4uDnosnBovS/QGTQDn7+01mQrUwMYVU
	nt4yRXVLhs44W2ekxGeFWV3ovCC5OFKmdrCpbNgvXJDPzijk9YuE2FBL9B6HJLMN
	jEKLANIe9K35jVivIBkodPUYAZMJE3PfNkE5lH5LWSv+mDa5iaGOSC8euIKMlsDo
	08wnXCgypjjHy4p9Tg6jocXM9ncIUOMsw1oh80v4rOPyq8rRqlcYnu1We39dMa79
	XOQUxBYs2LOE8V4McV0PNIpyy0SYvMlGxNMHtlkVtUsDiEiKrer9jwX/qo9XSrD2
	3vFkGw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p4hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so2676962a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014233; x=1793619033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=AFMUWVnXJPI/TgXi1xCQq/+ITWPKFt5H4dHZOY2sHsNUiT8u+lPEPmv6lJMLvA9Pa0
         mp3+hQnfOyrcXRe+/xXZ4h2GhHbzvOlb2yrW9sawMyzCnNLr7PRiNuF1TCD6VLKGG0pT
         aR901PgMq36I0KUAPbLMPzWmmeV/u/DTB4ZeMWWxHxsjDQXBJfQS6ppq7pzp+O3lf90y
         KVFtt1l35/5D2Mj15zXa6A9TjIFm2yztEmNbRsTLOC/eFohtjHoFAEmSXkl0e3UTgchE
         qRGDV7eXBUXovRxg8c0H9ylr0gQTF79LE+Up5c7/xiHVmvhuQCYJ1dxbBfER6b/nbYDC
         X/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014233; x=1793619033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=H3E1ylGRpiVEMG8YPk/8u8Fe6xGKuDffBesqM9/DNqRFgsnidWYHlVx9A8V1wxeNIV
         UJ7qk3OAAF65CcfEZiVo512OnsmspNx9nZZcQfzccjJwVqPvhiyo6ncZPsIzG3oOSTje
         M+eitcwSP98jR4m7cUTggnEXgL+NZExkk9SAkRBAAThiA0wJVe9Ndl3G54MO6e7fRym8
         alwjJqEK9I6yQMmxMvRgvVU0pyusEMt2pNIPbSjJf6R3GrSPzdu9R26QpLyVt7Ar96bJ
         TXowViojmZfWX7TcC2fszGS/8LTYWSbhGl5V+bZQgHcQDog7nRPmeSZEwZPBvN1pdY6K
         /X5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTl3mzSWvBzFJgfIaEtpv83HjihZodWKdaqVmwJQ1DvfwuYO8Qw/inKEnniMhjOhx1jvjrFgSmoA8wvQVk@vger.kernel.org
X-Gm-Message-State: AFq9FYL5gqCs+9pb+AsVtUZelpA4ms2y6ub+rRV9vqaa196hUrx2Yrq4
	QHxg1IqiHzYfcZnpGEbjT4dHPgNO7adFLdSjpdTb4d/3ilLk8OdliDOfynfTiV+AUH5SwTYCjCG
	WK8iWEKA1VM4sHRyM1jtLj4+/nB+Ww/fFrSXsf4chCVh3Of6pel1LWNVZxkizLzM/stJz
X-Gm-Gg: AYBFou0XiYWI0gDJlzHp0GYpoomaajwS+ut/8zlWkWYtq9IpwRJap8kVC5idWtYo3Z5
	zLqWKDhfL0DUYbUnkKPTqtO0+mcB5h+89tJhiF/3iwG8IU+aNmbUrdvUnW2xQNIbSzcC1G2vWvf
	uBbth3wggbSq7gO/Epcz6BjwSYZQf8MHHkK+kLXnD0uwSOUNZR1ypSmCbL3oTTysuwGGAhqbSAF
	bMPvW0zMk5c2QQCIjyqm4b+TpeScCHRJ7/5+Odc/B+sG9rwzZkl8b3JcBKxk73Ee9ofOKlHV7Sa
	OXOUV2OidcQyiq0yRnUkLO23HEA+6tBNperK4+S7AtZA0bGimrvFYanO+cpNLj0afTZUQFpyVtY
	4yUa/vPiVgxTzP3rrUqYxLtc=
X-Received: by 2002:a17:90b:2686:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3adead2e19dmr5438047a91.35.1793014233057;
        Mon, 26 Oct 2026 04:30:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2686:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3adead2e19dmr5437971a91.35.1793014231659;
        Mon, 26 Oct 2026 04:30:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:31 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:32 +0530
Subject: [PATCH v2 06/12] pinctrl: qcom: sa8775p: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-6-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: TewfSs4lEqpHYx_u2ebR92rZFTfTfKnQ
X-Proofpoint-ORIG-GUID: TewfSs4lEqpHYx_u2ebR92rZFTfTfKnQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX8A/a6LJReWCh
 GJL5lmpKHitx8Xn6sC1OmuAYDbR5IyNVv0pH85792wYDb1F1l0WG71ruxw53SLzJQ4hyumcT+nD
 aAg6ivraU1utzsSgcQhrYIb6qMIAP1A=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf39d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX63xYcXg6IJ4f
 i/S29oTS1fiFf+RIYKzoI5aDHfylqHWhQye9k4DxmX6vHdSl5HHEBiScKQs0SvulnRI35zvXq+a
 b3LJpUEhTCoPhe5cIavWQ2/vTpOtBnKlU2y5ayEa0Ed2cOqPBFupucr/k3vbFUHg0JNqSrE6NUr
 1QUJj9P1w+TT8FsbxVpeM9hrjbYBtIapCTHEtJ2mPuLgH7IX/61bRQh0K+jAjm6wflBAlgqL4L9
 lcUDwtS0qTlqPOiNb6DAsb6lNtziZLdoE30iFkjvNQInPIXvy2Z7BSzQVZegytzPlAOuGDaHnR5
 NF825qDsEiflU69HHdSMM0tKKEw0yIMjY1p7ysHG2/KZ2l+cBKdf8s3BhErMkWLwpyO52CI/yhC
 eiQvv3z2APupe62Heof3o5XxRttLZYoNLMb/RPimECthoSpGe6MB33d0m957FOdY5ImEj7NfJSE
 H40bNeW+opOJVnuJFLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

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

