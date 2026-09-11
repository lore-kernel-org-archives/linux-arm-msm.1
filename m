Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642AC44604E
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133736; cv=none; b=lpt981A6ZtcXrCh2UVKeovXlhvofzjfKcQQCOInKfPBD3Eiycz6ebigiacC7SrKcAyKHMCJsYJfnkmp2iqsZZphqTWLZtRNpNlg2Lgtbx3jeBGeB+nE2UnSP3K4//jdESXwWjBMJcPVl5Xkq+cU/Lg/eJL3D59dxGpgG0AygCVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133736; c=relaxed/simple;
	bh=Bdr58TASYAcnDyr8NYgzvmX/VNnrlFvX5qTimGt4OLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsFJFVpr5tOxZJRYqQKfBZ0ePyzW+qjhvF6HfObWJfu/Ldd4FetLJ9fDytK4MdfyjG6G7kFdVv1MJDg71wx73rve4SM8qp6TswMP+NyKzHOOd3L2656fnugw1/nkvIhLB0AG37sq+7itYQqrRWYzqyiT/Vs/Uj1mrCEoHQdtn9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QS0btX3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVKpvD/W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QS0btX3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVKpvD/W"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiTpo815072
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7fDBLHg2JhK2hYvJq0Kdbjyb
	j3USOEIeZfURdTQMJP4=; b=QS0btX3VTC64YMnoJ0GS1sbqxEsPlWBbiO0cKvwV
	WZAQTjjtoRpG72dSt83l0Rv3CBXnFLuYD6YfMH72HScYda8Y+tW5eEA6vBMzg+Al
	Qx9jCO/3SaD4tXTzS5DypjFJQu4f9jXgRBXEpUIEHRcLIymgY3/57czuEXtXeTms
	VPBh+tMEZbgtgxe2XyG2njcmnaVDpS9eqIqKtuC9nWU83oNqDzPOZW2KcddrYLmE
	P2gsHmWe8uSq1XrQQwj+Gr4eE/G4Zrc/UU8A52gWZNDd2HyQgBBX7UHuZtkCf57l
	CgSrBC7fDh/+nB323OL7SWYvGDLrndMwuZP9GiwVxv9kWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd39yqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:35:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9394ad7f64aso132909685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133733; x=1789738533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7fDBLHg2JhK2hYvJq0Kdbjybj3USOEIeZfURdTQMJP4=;
        b=iVKpvD/Wx5ttv067ZJzAwzpPGeZpsH4RQoUKAfv5CIRMfW/4SId/cPYKbog8AI7wlQ
         se7PihJqxO1IyXiIIMYElf7+r7vy9Mq0IS8QwjwzCmzU1hbzNd8ybatf8ZwYHf87+MKs
         72gkVswm0WUifgXhfTjsmW7HYUZTprZVsNjlo6MoB/bM7UWKMPhg4Fq3LFokRGeoZT+b
         DxCWLIbjLewLse+Nmz6SiIZoe0/SXl/kgm8wXMFqcYTq2siVnuqAes6Hk5AbMemrUc+n
         glfPxf0ZuLzT4t+ZwopRwlpm95XzPPP4lr1ozgpA8I1fxlQ5yg07PYpLL/oesqXgU5xB
         bd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133733; x=1789738533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7fDBLHg2JhK2hYvJq0Kdbjybj3USOEIeZfURdTQMJP4=;
        b=pcdxGdstrH2Kq0qYAYWT8TdWGoTrp0/yrXzG2WmwgftOD/JUEAItHtTLBXUg1Mbu+t
         pqigUgCObIrTVK6HSoI3wc0ORLeyrPNJE71SoJl8SQ9ufyZmw2PIgqO9oy2Q3YP0PZRA
         TOV2S6F4aonYU2GmayWGZ9Drs+O68HZyiaiLBkARF/RWG7sBqTOmuMU5yLBSsck5yp/2
         6DxlBgCXeXTfqSxzleZ3LL2M/Z76HrzFIgGX4PaOc4AHfwMk8prl6IdpzVfeYo7ITy1L
         ccRdHsLuzCaPr0KG2d2CulzlPJLsRFMv+C1qinqFdQ0fxv3XUE4c7BTrSr+H0VMIt1c7
         cAqw==
X-Forwarded-Encrypted: i=1; AKwUvBzw7r5CM2oZV/AW8OBb7B7gOA5PVV8bTfUvkvQHjxT1xTSl/YTPHia79WQxXywnLHcYrgO9xc4g9zdjbOHO@vger.kernel.org
X-Gm-Message-State: AFuF++lt67IGrJpXVC51bfXzTFNCyhguD0uo3LbynybUgvq7ZYK4Fs2+
	iRDGlxTjB06Sgi0yS0dfRmS14S7/sp1aJSY2tOyOcj+rlYGiG0R6oRZD5v0rQGAtXVB29Tgy1P8
	XjfsjVgfxGGKiwTFBD6v0SJWdZ0HyF34poqfxTs4zMsnWKnryEvHBnyhZrQHhr6S/mJcJ
X-Gm-Gg: AYBFou2uH6q7SvWUR99Lsf5Klkm/YrxjdT0q43mtM+UX+S4iO4mWDq4HYknp5jDiXsX
	LthdXC9T5nn8ZuHnJ75p5w2i+r9fJVdYS2VGppa8oLx5wSNklXCp1GCc3OTQebBW94BGxxvw4Ss
	WQDvGPrZ/FA9XgkEAnW3zl9CZH67dVJxQdxCvfYhF5ro/ZrYWcw/odql2bAyy3czVdrauR6VoI7
	NGlgb3C/b2fRYNOUiC+eRnwnLA6s+7EGhAC2a15/tjIK5A/N2/x9hdKPi7DnmkTxWwFlScIk51a
	QpzbAmZeJ+qmVlmVPSfFezdG7IF2XmKW4NoX7uChj9mWqFqwpXfj5qkVfstggEqT7328zbsXQU2
	VieuJYIPyEZG3tIU=
X-Received: by 2002:a05:620a:630e:10b0:939:f978:c1ab with SMTP id af79cd13be357-939f978c3b4mr135519685a.4.1789133732618;
        Fri, 11 Sep 2026 06:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:630e:10b0:939:f978:c1ab with SMTP id af79cd13be357-939f978c3b4mr135511385a.4.1789133732044;
        Fri, 11 Sep 2026 06:35:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm6290623f8f.27.2026.09.11.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:35:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:35:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Enable SD card for Shikra EVK
Message-ID: <e3h3volimyab5h6nov4bzassb6qki72c3wev3h7yyaxkdn4gfg@l2f53ch34aru>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa403a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vBACkDl9X50tgIqftl8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: dhstCwc4cRF5pisILePQBmTu4-3eLwMr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfXzGiiTfDZktl4
 ERkQVmKMbd8tCSXnXQezZx18bv2MUwRpg621MWDsrzxeiy96p8GPJ+kcnW3f3CMrfNXc4LAnh9o
 7KptT6MGHOBNY9xR2zG7TCKg81DMZiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfXz3Srn/0cW3xO
 tciEDpqGbr6j49a63NNcQNbZ28y6W2ZS/564G1Azyc48E+mOlTSQ+QPItYTriiVmxXYkYaRadMY
 xZK/MCW1Mtr1f1pPa71uoZjaQLtQmE3lay7ynxby/N0TxM5BXk4BR7/lYEyAnsC2ApSoMkYtE2Z
 tbGd95YXBA98n8IAXuzuAAlRHb8JdEXSysmrmolWEsUK2O36zvah5VowQ5f6o+B++qSqN/UPcKa
 cDpeeGa0Mtg+x8WiDPmIlhORRkno1SKsa7pgABy0ewZOOfIhZL4Ayvizft1HdQaKBxi24za2kZW
 cyj+Fd9AoOz6MBkQyh6DAo32c1wX/OSBIYNaLFiIprGQ08knB6jiiXGJG/Nn+N3L1aqoj7JHJ9h
 yCWo/66jyzBVQLPIuTsdaTY/LTPCSkE4z/Y4Dsmd9wpdsAWY2NCDAYX++xcXqJPDRCh4bJFyPF2
 YSdiAcwCMZQ62VMK7RQ==
X-Proofpoint-ORIG-GUID: dhstCwc4cRF5pisILePQBmTu4-3eLwMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110189

On 26-09-11 15:09:32, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
