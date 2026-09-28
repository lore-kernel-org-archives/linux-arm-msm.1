Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB03B46EC9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583240; cv=none; b=oGb3OTwxFA9ZrM9PwSP3CQDMGd/CEtpqKvHaxYPRQ6p0vghh4oVtc78ySk8rq89amEe/zshqFYtSy2mXwulhrsOzKuX9MakxS4+JYqDIRg1c/yYqFFvLTolPINCH9TRa1G1evWiQh9j2LbBkL5x1zkWd5CB+5XXgjGEHMy91oBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583240; c=relaxed/simple;
	bh=fUtDTQF5AlpGxLechFVY0Zh74+1W8n9TdovwRc6CYOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elXN7J3v2mt7zMLxv6gnLlQoOkjvSecTJd57ozbWC4jhPopE9iDOoByQjnFyXF/Yex+FtE0aoL6uAe26bH/D2J5M0VGIH3bGvqJLssPOIUllU+acuepeEWFVr945+yhwJ/txedNDPTcWLaq3T+eW2rAkd9WqFAwJo0HFYwtUVVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFmbm4wJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OahM3W4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFmbm4wJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OahM3W4l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xSFG137050
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=; b=MFmbm4wJMmN0AL5c
	8uAQtdRPzfofdZaSK/kWkW79c5efOjMVP3sGKf6mTYTOs55OzQ+5RrGLNlUF9rv5
	p772rIht92eU9OF05waMVmIoD+GYPTjX34NuKOXlqlczpwB18eh/uktE51QGezm6
	ZW/+WbtEKnnM3+bItOLaYayW/1RA8IEg0xYwzkBcayTxIWUUDm2tRqOtWee9yusF
	4YKs5cP1Vnvi35RA0jeKk/MNI0fLfbldexrjbCcEVKBD/+IX0Ve9ftfHo0LfV7xA
	tUM7wBZH+r976wPvtUVgPulAoxdqhuwsMpxqx8Oh714xHn3Y4CijMxQ4Lw8LcYLZ
	4gNyQQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq165g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:13:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc489e7a701so3445406a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583237; x=1791188037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=;
        b=OahM3W4ll9QJm6ZPaBVTXE0y0jr06S6YhKJ6Y8URnPNHqBOg6dMZZPyU32PBWGwbFT
         RFtwpmDVhdgfJGNBNu7GObNgsFTdvgAUzzMuCPjtxhcTLEkOPBq6s+ZoC4xcGIbyAX3h
         TOEYqsUH509/MfAQUK6DNCL6RNDtz4Dln5uqr29arkvLYilJRHoQC1HZn8L0PpcAqq49
         DHzK4GmhMukLiYIXwMIu8/kqWnCURVDP/DuAEMVXWW6x9rFq2ZqPoeAL25vRyM6jV6sA
         ouYQwjqCWIVbiKjZBhDUXcwvkADaf+AZF4+Qqxqk9vjORqwXtaOqXtMM0DDLZ1KA/gon
         gW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583237; x=1791188037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=;
        b=R7ZjhV4mxrqH0Yp2nTY+piAQxuYf7bVpIiaZkk/RQCJT3uTbNwiHal4WvW1glGKVaQ
         /AR/MTouJ81U/TwFy0hh2hrwU6eYjzYjLSlYuxdIsr/S5l1cWcsRF+hCvRauJSMnPFtj
         fvc0QV/vEx/y20WotdYXd62z9RpSqC2DMYypJxx0ngbxrQo1emtTsZtibOj6BkakP6X0
         oQ14mLmBE2R7bxXu0SF19nAMTd6yYO1yMVZwY7o0TSuNWfOexGFQMm8lCqDdS4lo9djE
         O0WzkItOKOiFEDCAwWcUM6ks02DWc437gsveSczj7QYuSD92gRcaBGJaoiBrL/Au8i54
         5ysg==
X-Forwarded-Encrypted: i=1; AKwUvBzepMPdkQHGJ7kq2iX5Hc9/5MLadhfX3dy6aQyrm96r+5+x8heDVgY8HqU+en3yAv9EsD5lC9beE3zIDPJc@vger.kernel.org
X-Gm-Message-State: AFq9FYKnk2mYiB9tZdTl+ZDSBBSaX417BFio7qEIoaYt3ZZI10GbXLN8
	MHiGmix02pzKobBZXvNk81DIC/tgp9wRChAJ/Q4EWpbvUS1hyyBgpguAmrtQpQq9M2Oz1RmvOG7
	u52ftRdAofnHgcO6mIG9HZX3z67K1Xu41i8/mpRKJMJGgKPHB3xONuRm4+bHY4Vxxpnzt
X-Gm-Gg: AYBFou28W5NUMZ38kUDQkbbJaDbs4qN86IZbDhwCzpJWkQn7nlHmt7MwUsKr5LQUhF5
	DFGTnLgg+loODvOM80EZWxyC7pfvRjEAovYTsYfFVOgtWNNFUACYD3uJvei6Kne9Z5L0wsLJvNO
	9HuQxSjD4tO2yo517e6ZnYYA4reruHE/+0XlU0L5mTRlRpNQMwnxD8b1Be51nb00XSrL9fF5xQ4
	a8mwrHPkAzOpe+9rlw8aSyNtR/LgPVrgURrRnmrA0Pc7sx45C+cF+gocRJvIU5FZN7aHPVCJFAs
	Hta+XGiJKiQLPfw5V00ZkiFx99HwwiYhKhs/dZsSC+Ph0/hlPCkfzP5Xe+xgbnnEQffjs+9kT6W
	r8+Q+WcO9/HX3+1Fecr1pzcYS4BXjLg==
X-Received: by 2002:a05:6a00:908c:b0:87e:35ae:783 with SMTP id d2e1a72fcca58-87e9c53ef9fmr10079882b3a.51.1790583237247;
        Mon, 28 Sep 2026 01:13:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:908c:b0:87e:35ae:783 with SMTP id d2e1a72fcca58-87e9c53ef9fmr10079859b3a.51.1790583236769;
        Mon, 28 Sep 2026 01:13:56 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb385ed8sm3799547b3a.45.2026.09.28.01.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:13:56 -0700 (PDT)
Message-ID: <553b2e77-d646-423a-9a80-4d0ae539b919@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 13:43:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-nord: Correct camera clock source tables
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SCNXBXrvKlTkAb07VVyUj37kTm9d229U
X-Proofpoint-GUID: SCNXBXrvKlTkAb07VVyUj37kTm9d229U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfXzjEIDoEHq7WO
 uJpSIaibNCRWcFrt/Vgn/hNjKaqogSKqc7jhcEySNi+u6bcdVpLX9Ax5KKeD8IRbfXEuAbkJ/i/
 9cD5heVHn7DutrE3D/TNStnBWA4EIbg=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba21c6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZAC9QuG5zvkjJuggSecA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX6OuC9CV/NzNK
 XuxDf0Q86ZBBg+Xk4nLiZsWCFnj1uu5JosG07wsYTTw0C5g7kwBtdS0SdXjp/QPuutKjmYPPmII
 cpMC4GneFxW2RS6hO7gOEZx0czEa+2e9ZJLpyBG6KSRZkR9gbGb7ZavtWeWr2wx/fk1gtNO29rw
 +aucaBljDJnYqgU/ipTL7+cNFvt2rzRvn8LIAdWttdFwXyfhRCHmoiVdP1btNBtFQf52Ry23Mgv
 2Rw96+ceR0WEr2KrLHVSA/3QK4dLXsO5dMfBrYwmvLtsclIRq+F4ZvheoPZpDiA5k/DiuNiTuxd
 rCzrmCadGIENL5IcnkAywcTZml1nGTtNWJXbOWf4w3nOpgc6/4rnlqdBLgmm+gUCqTFHotlob8C
 qCjHbeqZMva8XKVO8w5DKTtma5E9uQjMvEr8OVFzjttEPy/PEzUmRw/eHu/I+8RNFP3TPbayclH
 tapyBcTCZXTbKz7IoFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280032



On 9/27/2026 12:07 AM, Taniya Das wrote:
> Select the PLL0 odd output for the 200 MHz and 400 MHz CAMNOC RT
> AXI rates.  Use PLL0 main output dividers for the 300 MHz and 400 MHz
> CPHY RX rates.
> 
> CSID and IFE Lite use the CPHY RX rates, so share that table rather
> than duplicating it.  Remove the unsupported 300 MHz CSI PHY timer
> rate.
> 
> Fixes: 7647815dfc8f ("clk: qcom: camcc: Add support for camera clock controller for Nord")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-nord.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
