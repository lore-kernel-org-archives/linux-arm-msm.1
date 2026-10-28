Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192330;
	b=o9j9yra20DvtiZSSUJtbBMEW6MV+lsYNfb0TnylSvEnx1lvG+iANvu1YIKWGBz9t2yFL
	 Hj9ya+guc9dIJJk6tpWDWoLjvvsT0iCEH9Nqgaj2T2L/bNdX2sWLo9/n9AEonBuSVdZEY
	 cOdcpEg/7wkmStR4rWAfAlfH1q/U/fQM/i3b18MC6nCvuCcs0DgVYQhwcFKiY24IDOTom
	 rSrldj7fjscmxZg3kG7+HaRrWMLb72ySw7p7zyE9b+UTquPy5ULZNj5cVUX5YtJIhVA2R
	 pFQBpmBnq2Lic2r8xYVoevaWtrWyQYRPKbhK//OUc39Sd+IBtzz8J+a2+wQlYLwQQQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
	b=vz9lo113oLIFFROhDzq+8Hjlj5p3lF5TgZusGizm3cnFibMOAbTFlzHn5tU28VITk9/S
	 jKbmUleyypBFUL2sGbt5w0meJ5Dnxyp/8ElIUdAasLCvfzz1nvdu0bEFsHwEJfSugIfgw
	 7Zo7Hxsk0Msr7g8oGtqmJ5x1OkCqFrp0nWJANN/VkUtWeqIrEpfnD/D6gNay5I188hYBt
	 VdgFqapcbh54DsahEPCeu64jlAoXa77HUXZ3tDR9G9dcTocFN8QT+6yDPIg+52emd6+3k
	 AThHhE0s8g5GBtqlKndKxPopUgjAKOEdAauqxINdTt7cLwvDEwBPmZ82/904mi1kmPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oq8ULE75;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIYDkh45;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9A606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C9A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oq8ULE75;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIYDkh45
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6Nq1053363
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=; b=Oq8ULE75Gcg3exfC
	6U+Zi+fxge98zTgHrKQJGltM0At4YS1kOwUduX4ot2nTU4Ax9wPC7+QwOfnB6mCc
	HRYHNEi8TJs1smjDbYt+BWwTPmYVExpk4QH0YrVfUJFH4aDKYzUfeMsi6snXwTd5
	0nw6p/djbHn05Dq7FoGIa1BlElhlwodV2ea7ItrKZ2I8OK54k0+8CMTlTQ0OLRNm
	DdmUzeuJbzXbqsRi1D5L7swvxd6UXpIrqd64qYG1rjqMKNPT8UFRITJ87l88zrIk
	Ol6RhJXeYao0ms5R9q3K1Kmn0+vZGhV8eyJnDiQbozHXkPMFauMPyIw38jPJ+L12
	5bLIsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9fmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:58:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944102381acso4127185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192329; x=1793797129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
        b=AIYDkh45J88Zy7n72stG802I+YSHhqvGJjKH8D7/olbp9F73Lt0F2VJT3OOi/i0FoI
         a3O+b7LNomDV27lORCTV4ye4RDVcHwyiTSFfFe3ycTwL1IvOBHSugczPaOgbdOVfHWZ9
         hYMqUqXbT3p/zxDeQUl7kJYWixc8HBlr5BDrIM2OVBxgYOhs88FR1/3s0sdrtSb9Ot98
         QtWpisExA0pKdlAsPEMmemUQvztouZvgj3H4+YTTEnf4XE0Aw8xYQ+nj8VH5N+ZLpd6d
         UwnbyPizO5Cs3Bh1UxPM69TNx9cIqg3gb/iJX0KO1WhjVJQO04Lx9B4cnJm/GS53TJRe
         ITHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192329; x=1793797129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
        b=0HvwFXiyORoIgj5W+rEYQjEmLy1E9Yig4kDdl2lUZNic1IwXM0BF5A1YVMIZ7R1Y+g
         p0q4rGLjspX2bvDQpY+1o9doyfChyIW22+VkxcC6oT1u70qPOjn5IGKX8UAklkRpE+9S
         GCyy2L66kOxxjPX6f3PeNz7HqLmZA0cffjDmli95l+o9UMmBQkspXN/WWPFVsQWe6ml9
         bYuKEFYmilBNvixD0+xSYmop9rDBvWJmPO1INt1orjgEHJMnfIE9UJ0huc9erf1JRZhi
         FpTRG8ETXirEYRxWhtePd1mm2I0rUmXvuBa55ru8EoTCpKveOxlH0lChh7xMEU9nvjk1
         9Dyw==
X-Forwarded-Encrypted: i=1; AKwUvBzHjEhx7qIdn1BmNrfi+/oVx+7dNL8A0bjgZ+/zpIbuIlUgAZNXXC82PJIyjbmgd3RplB42hTFVfezb5h5J@vger.kernel.org
X-Gm-Message-State: AFq9FYLrQi/dBIh+rEViIjK1Don4C/3adc5mr5DCHAlccFnoU1pa34hE
	oey3QpMgkakLKOJfFd+7cYYhI4hVWjamkWlNBiD4rPDUwdHKxXdcRQJamZsSqB96tac6EyawcmJ
	rWXQJkB09I3eJTh3HLvmld6b1ufOiaQS+B5hVrCMtWAZK+ZguCQwYvSFynYbpuVVnGasZ
X-Gm-Gg: AYBFou0fobQgukYozDdwiSo2u3R+llc0fE62wzx55nDWzhcQ/z4X3lWWCqIeI5xQIav
	0tp0ZgFAFbQlaBCK9P7NEuaPxc2dV+bn8WZQ3pR9+pN38LqYtAWoGBdExFZjpj3+Q+Ac2LS3QKg
	f/CWADhuAbbhhzP9POXkuaVzzOg/ucr+zJgcTErWq7B4yahMQM2mSl3dB/4vQtquJw4ZYH0fFcR
	JVw1GtZg4MMs24Q5U4VIVLR804CxO9/gDI9fBqFu6DPtVMnmGcnwsceB2PoeBRtfyXHo7k+s1Wf
	dEltntx59O8Foe/nergz1zQBGZezLgKd4O5KLvIfdngL4N47BzoUap+N4kAunoM2kisa0oyScWo
	OZAGnxa04KPKEGrgARbDv+WsQNcPZsco4w2ttxk9f3ffP6p3osnMV9Zj5T0fs2AgukyXLszA=
X-Received: by 2002:a05:620a:871c:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-94408a74b23mr306447185a.3.1793192328839;
        Wed, 28 Oct 2026 05:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:871c:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-94408a74b23mr306441085a.3.1793192328193;
        Wed, 28 Oct 2026 05:58:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm599765166b.67.2026.10.28.05.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:58:47 -0700 (PDT)
Message-ID: <3bd30903-5284-4bcc-b740-19635ec9bb71@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:58:45 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eDbHX0-9abJoBzF4gPXe4Ax7pQwt4Fpx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX3fjm0V8hx6zG
 E3goyBp0Ep/lsAUYBMTb9kBSExFB8MGn3+nOk3fDQofnYKT9R8a3Cs4VYnwUncwJmAePlFHfIYP
 vipBo5cg4nbrej6vKrooRv9/Q+9YX6o=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1f189 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0I5sxNIOA4Q0ZI3ESucA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eDbHX0-9abJoBzF4gPXe4Ax7pQwt4Fpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX+cFWmbAw2uqO
 4trWDf0NNl6PfTbxw1BHpFJQvJx7XNBChJ2zJlrgVRN5+AlMfSGe684UNbxtDxAUxGhpB4x/JSS
 79Uh0dOgKHCenU8xnhCHWGMx3QQUEjIbYWHJv3neg2FKC0hXmVuD1P32zZddjg56dk4LC6dLlsM
 +pDsIHzUGaREINPR7ti+abz4gmQeZgE0X3yiUrmocbvHF66Nn254KjlHhHJ+7247MkBCMBZLcTq
 XBbNJV4pxZjH/8yFBY97a2xgsPqAWFVWr53CPUmDc6SYO/NHDfD4vITBEAgpl7nFDCYuh2/v4g8
 VFVxZpZgzL68mOi+4ztQJPdE+zvbZk8lFxQvhOa6VImvrYsGJ6vDnTLqTBV0qX2NOlTxeowrEN8
 qKY5eyrL0rctSpQ+FWbYo1otxaBa5Gr7TFcCepZ7XiIBox4VD/yG9gBQAoPBWZyf/JmutxnSvmS
 lZx199+XCYtgVFmeHjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051

On 10/28/26 10:35 AM, Taniya Das wrote:
> The PCIe GDSCs can be shared with other masters and should use the APCS
> collapse-vote register when updating the power state.
> 
> This is also needed to disable power domains that boot firmware enabled
> through the vote register.
> 
> Describe the collapse-vote register and mask for every PCIe and PCIe PHY
> GDSC.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
