Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E1530C359
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144011; cv=none; b=IslcBQjSm+Bfc5/PDQL00CghWqbgsoZwlz0mLDqZeEyeSsXgMtygUTyWoiuWbo6P+i2Wl0BW/FUSgYtbgA5Aubt5HHnWU+1/9lq+OL4MWHfoLjOEjPzsuVJ3lrRM0N3HgTruMs1uY3WNcUPUModf0yrM+imclN7EkD2CbXXZRvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144011; c=relaxed/simple;
	bh=AnZmPOhmmYGs/TR5dgqZvkCLEyNBmzduluQYAsbnWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svnXcfNy9qW3kzNUz4H8THrggX4NML44VHWk4B9Lqj7nNtvbphZmwsLu9NhkL9wudp2RgkTeS6lR/R4TTDA3nQMDW6cncBvQxlvBktWOijZ86yoxxZ/AwTEO3TeMy4xzhOfFjPdK/+D9zmBYpoUkDuazMWkYMGYMhI72onFktyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVn+rHNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWk0XYo9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVn+rHNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWk0XYo9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JCmWHE3305821
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZatwOHGSbrGYChqrIJTioE9V53nst3dLeKYEa7VY4X0=; b=iVn+rHNBLf+DJOwE
	76R+lM13ayFJU9sLu7D5Iid9guoBluo3YLCEx8omefZYvxVDO7LXke/NEniqGJO9
	XT7P/KmmExFKk9+a3TijXAPXcqrqBzq0ZsnnIKBISNFdOHIc8Vsq77qNm0ky6+YO
	D9kDp011TeqPOg+Hsgz1OpBGA5lG2bkExnieMyseBoinNyxIp1naJm1tkltVwiHO
	KfRSlRtvDQIIQNOt7nDqsaDmOWMxyRSx1iP3KAFLASO0YrVveqi90s+kJ7lnP6KL
	0/f6vx2Jbzm1vJWtpmJ60TL2Zmmdzo8DqTkz1wF8hjEnKVTeRr2zGVaeEECCkINR
	0uXggg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb9sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e8004d60eso184106785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144008; x=1787748808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZatwOHGSbrGYChqrIJTioE9V53nst3dLeKYEa7VY4X0=;
        b=HWk0XYo9hmnsfW+ufd6MEhPJ9icxoD2PRWfN9nyN8J8fTD8ZwIVyj11QsWBuxAma+a
         tQH6CH3P2DUXwa1d8uhhVieepuVMEaaqLrkVhKQv4H3x2K6p0ZxAbeCVjZVzZMntRuWV
         exM8McTFhiawmWwVD2D+jvTZV/uIBEUNNPoOgUblYPGUxcb7bVpHPSZVE2YywmoyBTXD
         an+I3BxKfl7x/9rrDYXhd85ogM9srBeYCcaKVhKArDtu3j3J3lMB9M1q/z0mMsuNXKxI
         cqfEclRck3z6YXuiNvHg9cP9fWS82WJ8rCn78KdHDsozM0I3bB3sbJSXw43Cgiy2WQpd
         Fp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144008; x=1787748808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZatwOHGSbrGYChqrIJTioE9V53nst3dLeKYEa7VY4X0=;
        b=bdWhDc6mdGCew5lSApGB7mZFN98MZ64uvxykragOcvW8DIhRg82TWPpMtrDE/60jFF
         s5tLk9q3CzGHhdj+9eOFunbp9sx4hi0xxSsjW/rOaazg2ZVi/y2moeE69UfD6Oao+KAb
         wKLhP0fRcha9pAe5eA1yz/0Ekr2/IzsAMnTjNEo4YAm5cvAMuxuheJkv3NCPuVTzN4OK
         EHjsgEpbbSeEopsvc1WGkeG1XaZTw7Fyc1qhSGyC9eKqtrW3JeGV3c9uC4dwKkGVb96R
         ZklA6uDrsXkcjh0J66mn6oSkcxcGj7hpWUF5VpYHwEiYpQQqo+1hiKDL67NGMwjGKkGB
         CraA==
X-Gm-Message-State: AOJu0YwD6aGdubXhr55v3okdF6UhJczf9y/cS15DbYZmOzFfwlGytoNM
	cM7R80mCfy6jzMBWQioiO5j8kx0YgBTgDOYz4+/Q+9qTtxLpxI4Mp3JHPZ26F5HJO0em+8g/f2+
	V99JyWh5ARcTRrHQ5stYDIZh0BM8OOORk1T1fu93111KR7LyHdJne/FnpyRkLnkCQ0GGx
X-Gm-Gg: AR+sD105q3VyipVzuzBVsrfdwcX58x55SXCIuF7AMevBsfii8lAdLpPrNQF2gswYJPU
	1qSrYqwJGA+sbSzrLYZlICroK6MnwxugvnQJHk/N/qOoTAq5b18CF+8fPRlEJBy+BsDcmeU1w0A
	X3J6En5v7vEAaBej0oHa+eAwisxfMiOmRDVafnpsT3JsYlxsxpyLZP7xwm5cb12O/Qvjln6ydCm
	WNMaEndpUgAv1Xn5j5c5F3BxWiEhOH3gjvA3DtmWKlazDuPreewK/H2e60PrNtSuKdBZttRJ6JK
	6NzQaNBi1hnXnbI76JVnw0xXDvI6+sLPA2MKMyTm5C4MlpNP85QxX4o2Ye3nsl8n1OlDHVFDlMH
	HWH716b0g
X-Received: by 2002:a05:620a:2b97:b0:936:901b:2187 with SMTP id af79cd13be357-9371e63bfefmr444598585a.12.1787144008158;
        Wed, 19 Aug 2026 05:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b97:b0:936:901b:2187 with SMTP id af79cd13be357-9371e63bfefmr444592185a.12.1787144007439;
        Wed, 19 Aug 2026 05:53:27 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:51 +0300
Subject: [PATCH 06/16] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-6-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AnZmPOhmmYGs/TR5dgqZvkCLEyNBmzduluQYAsbnWgM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacH2vk21tn3H9MmFbEvBilj1UVN0DP5/zyD0
 Yc8FDg1d5CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnBwAKCRAbX0TJAJUV
 VvZjD/wMLni9s2FGxhOeMOjICqZ4BhOL3vL4zjoQs2IsfaqnCVVeCMi3mcilAp5TVAIKyCSaTiE
 +2aGqnQzG9Hy0bwC9KHAkhoKPVVfrNC45fdZncE5VLXdYNH93WL6jhwOBckGqEMHoxQlQXXFd5i
 /xnLDLXWThdQ2q7U+73dVmvvoY6f3sulRrnTP7LzriC0/2t4wUH7edx4SbQePbm+4GshSmPTlhr
 sJWx6k6MoEzNepCbf+2x+m1Vv3Rq3cU7l/6DRW8UdvXHv9gQiUGaQlWDspVilMQX8XGNdlhuaZP
 96AJkggs5Nzhb2HRe6gdqFtt0LrC2eQ65ERvvW6AGJbKbmhuS/sebbYxr5ZwgG2QX8bAJbIEJKt
 v1Ij36HS7D5cXoxIaCMPgQ1Nn6outNixDWAS1+JwNO8YS1dy1W1tssjS3xFY2tJ0ppzVW1JeyLO
 AnnEKtaVm0gmXBJ5cBXkalqa439DySm5mfa82HY9SyMTeuqcVLrn43IDW2oBzc/ALHnElijNOdQ
 mhtGa/xTCqa2tF36Ty7n/NTiLIj18MFRtn7TTCl3aUcGCk/RuRUf/IFX3j3qGwo9sOaPp/i7OlC
 MZRZoje+GQxBSh46x4Ry6kyaMPtpVbWZiF01p7SC09GonW5bau1g5J2nhEh0e/JyNQS5T85V4M+
 K4+ISVdp37lArfw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85a748 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5OSBTYWx0ZWRfX093S2H8n+lIE
 nZfwibO6Je7T1wky6IJposn9HHKBWCHz0xgjxoHNx+W8ccm0N7RMr7z5uIMl2g64ujNRlglELsh
 QhKQv+crilOqx547701rQ4j8QgFWkZzJoiykhnq4wpGoRfabv61eQWAtblN+XFgGa9kZcs4sqiL
 v15DUxVVCVDU5DcxNa6PsDvK7j7S0xqDE5XMnolq9R5wXykbzYc/SIiL6b7pPgo1F8G04j3zLiI
 UhHqUk/8RBDUlufSsi7wpmF4KMlT+QgKu+VaBqFOIoK2nXC2y+TaPXDHVFsdkAthK01DLupPKB6
 5upjqf1j7c0DIlOFX+rPXmynzv69Hv34h2lMglsprqp5tegnbbr7g1eDkIV4A3wwQi+t45UoIea
 zb0MACXHvdV4QHrU59/TsSyKefiBetmwEyDxLSDEgdTZ+D5D9h9yKy8T8ifSSS6GbR4FrVPlN7H
 QtMtfslm9SeIFFannng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5OSBTYWx0ZWRfX0M249hA/EjjL
 ZkqBKIYmVhoOp11fwqL067fcWhTu+ZjyjdjzOGQ6Qb6qRHAemzxHuR+5HDK6/xH8JzDC86wcSq6
 AzZYi4aafHRR3eSiIgWrSGvs+NL7TAQ=
X-Proofpoint-GUID: QWO4nt4P_68yplP2_uD0qIb840cU7Omi
X-Proofpoint-ORIG-GUID: QWO4nt4P_68yplP2_uD0qIb840cU7Omi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190099

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 6cfe90122268..a4a3ece74f40 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3195,6 +3195,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.resets = gcc_sm8750_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
 };
 

-- 
2.54.0

