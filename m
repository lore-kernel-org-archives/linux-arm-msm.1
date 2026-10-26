Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010116;
	b=obGCB5feNgatHxc0lefPGV6v/11QEoyn6R1id6tXX1mPQ7cCjmSvc4+30EPbn3s6q5yr
	 vslTXVCyIhqS9IMCQaK1qz5rndMDbs7m6NDqBgJQNacqjYUngbA4swxcF9hwyRjtCt1LW
	 l05VSXmhVSL44oXqNamwxPWhsW+d3HCBr9LokuJb8HIm1MqVDSTszpsMkDGLxIyBv92zQ
	 WESGPOTWN9om8bd9a0wLX2/rW66uQyanrTE9iYQllNmKgZaZp3Xm7BuG2k+mGoAZQ7TVm
	 NnbBNeJPxbKQRUxybKhVdlczKjo/fXUfQmcuyMn8+X212LKN5U6yXceJhRjJ5OhlPlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
	b=cBCgWpfcb3dZp5FxmkbQRRu3mlSFETyv2baj7gtsgm3GjjqPbJuNhMJwncpnMUPe1ZHg
	 LAJqAtwP3uwFsmAnQHtH5/HMnD/UX6mr5sNItjpNGRLjcMtehg37kE4S8HdXjhgcc68c2
	 v4Wd6ySvyqjMARHpdPZU6udMEWmPQga2WmRZhLeU3QgExYprxY/milDc+bQ62MGUa11He
	 N/ps0LZG7B148QL1J7BWLecOsoaL1tOa0DJf4JJcVK9ERAYcUS65lYClTElI45bwezFiG
	 xjX9RgBxn2Qob9nWT3Q0LmAcPteUwCgWvdVKXE2LtV9U8j3YnngzVLeqXss3sRVzBYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OS5i0lei;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bc6kui8H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FD4606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FD4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OS5i0lei;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bc6kui8H
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xFO51911554
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=; b=OS5i0lei1ohGckgk
	LVcMu/jYPZKAuABOyZsoNC+h5dRCUfH/GbnKbZ1ADqvvkrJmhL0yatJhg4M8QUYi
	XpvXhluNL13SUs7P6oAjEbDEohq3dvXCaKCP1Ogy+di5E1b7sw/wEIa/gcA4nke4
	xEbOgsHu7kk+mRw4y2lBfRrI2X7itoAd3DWlTsdLWSv5tTz1JghFfnM3+VDy3TF7
	oUVT7PBiU54FN+9Zvwa8xF/wCZy5Nh6P0qWNaedQQzXPxB977+eh54Rd/P4XIQl1
	kTqqZYE778swsIGfAAsUQtuiSOrD9S/jcZCsPU3/2PHle5SqediZLpRPhwtkcPt5
	rBC62Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60a0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:21:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so525163385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010114; x=1793614914; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
        b=bc6kui8Hxjm8/L1LiUCNEUnhUmvqkCx/W/HWctG5Z9TQkLS1ICjqWWkOyAgPJi1b2k
         oVNiMvwiGSdAD8VwYDrm09tGOWJeuA5dt1LJ/VKOuhJVDoH3EusexwloCrs2y5CN/HoU
         3+6gCJ/W98YvVt3rB08azfUAM8tG4b3pJVJGI/4B3YOf4HALI5QCwGjH2MUq6dMPY65k
         nEuhL4PIzDXehN2lNgv7Y6hKNnDLlQ3KiGqOI0A+vhPRPSTusBao22jh89GJQ4fgywJi
         eyTguFlJzGKBbb8JWwTvy7ACEux5AZZ5J2oUifLolaFcfP2FdPD7p6E8/1RoC5I9jYXE
         kwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010114; x=1793614914;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
        b=HuqQ9t/v+JbsZQR4iGiYi4GOtwXZGPRkjOFYqAtxMcFjgfaDA1ZxXISyY8EZzt0G+K
         tabq+93CtHkxppYrZfj9erYtWLgNA2twmLI04dfWpH78/a1wwoAyLdIvsCZ3RDUdhECn
         NmCec2Trm2xt1DA7n9vFKFixoXaCPLdmuMvXS4ONNh2wUmVR+LwtrjX0xNegj0tdMfrK
         OFBWO1uzzG1l6sS8YsBmbpZQ6fPaYil8RvlEtEQ2wHW1lT1YjfRdN/sV67PdD6/GIEpT
         5dXy2S4FE+Oqt9Ljpv/z6WtRqNf+JGxddvfM+Ixv42JbGmhXpkX95Ww649kpmzGhghIe
         8eqA==
X-Forwarded-Encrypted: i=1; AKwUvBwfMM74gqNAbNkIY5YjrHPqZ4wFCoKdRz/plcHFmt2/smtnKGn+SQq6ql8xAqEbCL+TuSIoW+tMmexPpq72@vger.kernel.org
X-Gm-Message-State: AFq9FYLSUw/PAVs0XUc/5R039EO9A9ra9zQOhv3wffMKoWEQqImPAn8n
	8i0IVPTOXganzgkfmeex/oh4qpVyhMU28jezsJVYlaD7+yJ+IFqcsj6XB9VAwDjhysmeaedDGDH
	ixy5AsOzVTZNlw+zZULMiPjaI6oay8eSh26+QelLf7Vu8Oa9LEq52900PLbE1KGP8kYXI
X-Gm-Gg: AYBFou2RS7RFgEVoYVcJOamtdLxKmfXvXE3MMSsAarQKevXek3346lovnR4gqm9md3X
	dYr/iEkNzzEV/kZGT9vePfPhcA7wnPNi2sJDt0qYf0938fLz8dVTBmJ1S+IGEJ9a0prgpoDBER1
	EuAKhFPTRvK5NeV3nnhQv8pYWpGMljn4ppR1M7ljkOQr4VCfk4/CCL7+wDP3UdrKCRlANhm7L1w
	Y5iKdn5Al170MSVw72MKg9wDbLbq8e2ySGwy1+HyLNXU9kWFbDZiF47RNcCt7Rx+hyiSPOK4Ypf
	N26OHxPUPuFwOoeb9gyzxGh2rf10jsO84g0JywPzaEQGv2t6cOqSDnev/7bRLQwGmtE1TjBEp/5
	naeR/JkeX7A==
X-Received: by 2002:a05:620a:4001:b0:93a:1048:7d2f with SMTP id af79cd13be357-940ef93327bmr857662985a.41.1793010113959;
        Mon, 26 Oct 2026 03:21:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:93a:1048:7d2f with SMTP id af79cd13be357-940ef93327bmr857658385a.41.1793010113280;
        Mon, 26 Oct 2026 03:21:53 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm196226895e9.15.2026.10.26.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:52 -0700 (PDT)
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
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for
 HDMI
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-3-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
 <20261026-topic-sm8x50-next-hdk-i2s-v6-3-0bd654b8388d@linaro.org>
Date: Mon, 26 Oct 2026 12:21:31 +0200
Message-Id: <179301009154.3833661.4687696587079846041.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=297;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VDfkl1pHrWO8x5WUnVdyo5RLejkVUKoVvIZynsPeXcg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq3ym38Gmfkp+9CDmzVg0zP2nOPOUWypdKV7+Xp
 jhzXrIm6PyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat8ptwAKCRAbX0TJAJUV
 VpJPEACS387mP8Z9JLiUK/EEcahtHNDmtIgNJVSXO1nWeI8H1wYGkUTK4sHFzaNZ05wvvk63nbs
 vv4Q778+7kAvRUomzy8jSlM4Aoxz6CnDdIooM68hXf49sIVh3B8P0jyvJ8v8+Qdg+oUHiXOnEu9
 qs80ySTK/SN+YWZ21Ii6gS1YavOFd2vlGfCFRJ3EEvYSIMVdt+yjlsDgwvzOxMFVvpfa5CrciRR
 Eo1QCQyfMOnu5+fawkvFmVGVgo2lMpz2HyFkzXFU+5b/028wyk8iImUCYmfETXh88uYXYwsBbPo
 5uLGAlcBzlhb7n9BfPvyKsTypTu+L+MwRhfWTmXrFuvVcE/0Lnh5D64VDZDbdNtJqr8xYeD9CzM
 NfvdnzRikPTntBuPb3L+UVeacr3a68E2DLXZ0VoAl9iQylYw1daIEDcHp5u4c+s1ATT4bYojV4A
 JrQntQnhdcAN6/lXlgQ/XY+nnxKmE1Ql3Dxsrw2OEDMJL0yYAsv6WJk1wBUQaeTjZZc3QDfJeMo
 Lw+AY8KdIuxZMg79gHEzuei9yrAtIEfnAHhSv00L+54UoAq9A1P5xZBFfritdahfSuiL7xqLYmQ
 sEijK0aqe9CMFAbjXTKF6hS8nkih4QJi3igWYrgNIR/pfa3Drg4VMURWNBG+1IdYm4GHMMdbQVj
 n6dp4MKWAWerh5w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: RB7xjS3DvQbfMAMC08_qZd3ecMH4w9G3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXyeW0Sm7W7//b
 gzGDdkhLL0FVRKs4DB/JQ3IVtASPExECs1neafDMaHmsro/msNTIuXa3wN46HkljJlsnXgKjp4g
 G45Wzt8zUCGAPfDDDNSoHdVoML2iQZNaWnK9rWXzQajT1iT+FPusuU6YNdWr6aCeKM4VmPYX1y9
 kFDfuWMlUOnNuL312+3DYTE5oUJ/kn35B6BLVUl9+VL/MeCDclLS4hqAOBwxtWcEFExv17fGiLg
 CZ0zs7Je8hNgjB7S8Mn5tJeawjPxN+f8ZejvMP2MpJ2aIE2Z10oLeS83Hnm5Mb2I60vkklth02z
 gigbkW52F0P8hyYea2tv09WVpk9AlAWHqXptOFRUgRw4XMgwQ897bNM+6kos4cjaWLZ0ziLhfpI
 n+x70MUsdiBIWeDauUcB5+vPsZx8ng1yXgEoblQm/XKxXN7e4z56QdrNtzxEhOQ9OEJqXanTuSI
 8ndqTNsqzUREmd+IZig==
X-Proofpoint-ORIG-GUID: RB7xjS3DvQbfMAMC08_qZd3ecMH4w9G3
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf29c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX1Gk2187hsfcK
 nQZcQnE0S/96XomOS/DDT75QiAj8sOuIquIwe1ydbRB+DcCGEr4xvtEsSRGbs98pS2rM4KGaTWb
 AwmjAnr7VMzDGSU4TGkeQOj0S//AP/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On Mon, 26 Oct 2026 10:50:38 +0100, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
