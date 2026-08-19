Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4719F312836
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144003; cv=none; b=u+vweUrTXhUY/JIuJoiXIweTmKvpkrKtFrw/bH207ijfHPouTG8Y6mHQkqxSWi2IniF4sgYokJjsMwLG0BPvNoi0vdmbKkW+IPo0A51iOYhUPegNLdsyc6UervrkqmwGufywtDeRdRYsBvadQoP00v3104lj9jd/6EDG5aPIIKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144003; c=relaxed/simple;
	bh=j5kfJArXSGGYxxVdA3Rj3Od6dNwzJftva2Zw0ljs6Go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nc7q/hydwd2pXATtVtb0oa7ootDO349lUNwUZhu3Q+WmrFAojIMrxeJfMkl1q74PFSRhHwKQ40EnmTV+VS4AuisY8vK2c+QdWS1qHXKXiiky/JUosabrp34wn3tLu7Q2zi40K8U+yhGJt3zPPo5bQ7RKhnjnXvSMfAW50NRocFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ITMQXfQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUm3dsvA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ITMQXfQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUm3dsvA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClPde663167
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IsJrkUV/LHXxzUNJhN9DwH4/o6bzpnIJzjlKORIFfco=; b=ITMQXfQ6lGeIorZn
	BSbOgxV13E/o0Ecsw/qDFiL61c0eXu1OoEVTmjzNmVdYK0/t3D/u4c89fOeH5cjO
	LljqOBqJHgCCA/3/eHGTCeLq8baNCcnzQ4bcqjiOEp1bM9VGhwI9vfVcIg3fq4ID
	LkCZ5bt066Iu1Av7CadHuV6FtywhvULgERtj9hmUj2Hm6GPZkA52nEJVdjpTQ5kz
	c0HI/zJItnTLRlTywZudMa19g2KG6KwdvCj58Fa3MTj7+u2rgBgTH5F+Vy45b47b
	QA6bQg1RdzeJ5QI2wbAwA1iG9U5JItzfLOBmopuKWpMOaMAIymfPi1OZqkm3tDPC
	XQ3YiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb7rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936d067836eso122430185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144000; x=1787748800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsJrkUV/LHXxzUNJhN9DwH4/o6bzpnIJzjlKORIFfco=;
        b=HUm3dsvALbo9lrzen9b/9vtXHIPDtXaDP/e9LB4awwOSE4NFEGLTmNxyHZe8psCbVc
         LXvP8uAWVhftktdUv0F+D8FqfZUV/hG0bDICmjBt2D3nEaMdLokZiNQJGSlhK+fFmQdr
         JI+CbhCtcWYE6HgprXk0hba8whoGoCCuAlvE53UBvaC/NwW0UCBngBzyWil+2oT3STMd
         cvvb2smEpScmgQep5n0jE1R4rcsctqoOVOSNUbcr0HRsWITm/skkQpWUlg/NBh34b72F
         fMK6EKlxFECJ22B3GbONVEseRbI6XQs7hiJUrXuLJ3JH2poQwAk4c1fBew9u7s2tPn49
         4B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144000; x=1787748800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsJrkUV/LHXxzUNJhN9DwH4/o6bzpnIJzjlKORIFfco=;
        b=LwC50D0HRowZ+u8yU8B6d6NZnEARQcl0BcKgUn6HWsCEqprkS61K1Ii6QoujGnUw0S
         /wLGrCLRQ5L2oUvHDF3TjpZHIodiq0TlgcfK+RK4bYg8czdU5Ql76sKC5J0Mmaxa9GqI
         HbYqRJ3DPaMnbM/yc1MmZ0zjqHYqld+qgQnHimAc3R7gjrlIYwFbGq6HE/CD0BxM6q93
         70RxyFzC1YYEJfGXEqHFlmsrKDU6cCHdckFHgxEHKAz4egqOhHalujPW9qM/6f3br3Vj
         q0Zq/ciDbuTr6ja5iUESjREnTWtriI4Vwe6UDOHAZnAgFYL1VRpjBQQgudTN05eb01GL
         0M/g==
X-Gm-Message-State: AOJu0Yzt2u0SePQtpnjL9J6BpLwCXR+Jm/+J3GROyEzcggN14zs7ZxqH
	D26K4LHlGBhiXgGZncKBd8EOUoeozgL88fmQbX2vHj5xu1voKUFqKM1H0iHjyvLClLtJBDLVvA/
	fP/QGCxykW4d/4eD9H1rH4KnvyrC4NhLMM8RBa+o9HkQa9Z/iWtp6ql2bTgXEX2LMkynj
X-Gm-Gg: AR+sD10+E9z8+pJqxet69Yn9GY+94pbt2AfxSxmfEfTkS7jFvVGTrf/Bqyqb+VzAqOY
	ClJqUZECGGgvtbCcf262aiLQbfjmZjuUmwWLqaU8XSRTI+Xnmgw7xIJW4Md0s7VyBXfXO+Tr1ZQ
	EIgY3zbISfNiCn0iEa4yPIrQ7MXdAEo6Ftk+UwMBp7M1Ow14STIKi4CPYVoIpgxLSraZ5ON5ic7
	tkkpRNrRQax8NP6u8ymh12HAKrn1CuDpwEgO+hLCIa0uBSHhyY3ld6PogPD1k/tukNubNGQ3lBS
	er06FZXrZdh4Q3pCCLwwHJOwa056NAPoSKCEJULXchHP8PGk0TLdiKrHLdaBgvJaAllmOaEbnaq
	2TNiIlvG2
X-Received: by 2002:a05:620a:600a:b0:936:576e:227b with SMTP id af79cd13be357-9371e44cf08mr413275985a.24.1787144000378;
        Wed, 19 Aug 2026 05:53:20 -0700 (PDT)
X-Received: by 2002:a05:620a:600a:b0:936:576e:227b with SMTP id af79cd13be357-9371e44cf08mr413256685a.24.1787143998376;
        Wed, 19 Aug 2026 05:53:18 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:48 +0300
Subject: [PATCH 03/16] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-3-840034124e73@oss.qualcomm.com>
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
 bh=j5kfJArXSGGYxxVdA3Rj3Od6dNwzJftva2Zw0ljs6Go=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhab5l8GMQwQ2yd5csPod/IfTZIT0k+snHorHN
 rOEs3RwkCCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWm+QAKCRAbX0TJAJUV
 VhyoEAC3MS9t5YT0T7L14XH3X1KbKNX8g+12rZ/SkKaWVAZ6aokDqDBzCLki74YaqA2qB1+XHL7
 ScTUf4Bob6xeOXGKAkhDfbHg4M/L8XPuxT9jqLtFQtaaY+O1Ydw+FLzbPueN9Y4h6vXVG5Y+XhK
 JkYEiwwpaSI36u0oMYjQq0K/qENzsVNFDmxAv1nnjxkr+NjsU6DmkIw/dzfnCxXCfPvF2xQrh+B
 rDIUywDW7Yj+goWddpioCEbtXyd8sk9MZYbZQVpvJzSZkfgISRngE+x14m1+Y1otk2kKzqNnX8i
 N7QHUYSJ7u6CITKtqf6jC4KFZiQA9z5BAXMuOsHG1lqkwNPUeGKR7vQsCbMRPA1ZZvpV8P3G+hb
 019ZMt0hpDBiq9kcCIH+IQjsi/6T+5kSl2RYXQKa6aL2u/0rJ2AULZUfwCHUDMXww3ksJwLCI/S
 nNjQ9HbfdH3jQo5+yBOgTJQvqKr3cRCWp9poZGXLETtKG/JbsZcgg6Fib3lUo7OOTOqh/WOsZZ2
 gndzIFpVVIbR4Er7tOOOHeyskJSzwSMSRCafRYs7sj6N/BijyjHI1MdvC9wtpXl+gCXAL8aX6fz
 jHQ7wJWsVCjLSuLRPgG0tBw4490MXv9y0O+zpwX6fCjrAfJFClxzDWXRskcXSEqP0O4/xRLq2oy
 JvGdG7UB0H1tE3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: eRIWBpOVKEhfl7qS6bLyiBeL1TC8V1Pa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXwKnh/PtwZpd4
 Pupo2kQRiTlAxDsRPZMIUm0R25dqPgIG20WjbaJx/VRLpPUf0tS6j1jZPJN0I3ZPyTKRMbpxf+f
 NbFdp8KVTwJ/31R6zLELQLlIqCckXLI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX+x/Zt/U2ApRk
 42iHd/sJEv4iaaNmQGitfIot6hZQyEnoHhj2IKpLsYShLEQtAugYsHM0tS2r8LSyhTg6xP8m9rQ
 XFDfmjuOM/jdtxgM/kNw1O5Wx2bmdf9WrheAXDTrubIHA+jiUCm7rvl/QPZtdkbi8Yj/e1RdzsE
 HAuNoQteSdinS0QEAbKPk1BVFCCfJceS7rbSiLelbd1t4RGR8ILhJBuyKEut48QRJ5I4gwGUN6D
 d7znWqKowNHkuvR2pL8VWG08/UjkU5HbUwlAVRL6EpDRgIDQLOTEWzTwnm8B3nvZq+Q25yGqlwW
 PtMMfSnxa/N0fRzZriZp9Qbb/4JRkWPkgnWB/lFnCehQtUlxzCtSwV7hn++i8gzALh+aX8T7+Ih
 EYN6H6br/hKSMsFvJJDoKQ4SuaENJKurs/+QbyTlvbECkSCbf66IRB2i0eKjwQsTaCn6umFW6zc
 58LXn9lz/HpZGsCjH4Q==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85a741 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GXj57v0THfv1quAxfRUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eRIWBpOVKEhfl7qS6bLyiBeL1TC8V1Pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..b3ab458048dc 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3399,6 +3399,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.resets = gcc_sm8450_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
 };
 

-- 
2.54.0

