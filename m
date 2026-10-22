Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655859;
	b=cLD89zs/iNkapgySumytwpwFCWbv3DRpwVJNYmLGedGOLui/yNoa19+c4L4AhI2mBcjx
	 FM62RhUg7YL7BMYw9TkZGhLnSe+hsIZ2zT5dB+OhO2x9akdilCYX5NPIyiy/fSnduy1kh
	 TFIv+ZcrNFL+txxHQatcBwRQvm037wdXR8J/d6a2A0yE9UnZFV45Wnb3ZiJEDTq2PVk6Z
	 G5DKMys/fT+3QyM8pKszhaXHCUvjLAg2DLggkkjtEiRdqeClDaVFXsqJ0KHG4mo+4YWSz
	 JwPzNyBd+dNTpb/SySLzsO94iXxYJBw9Il8QWWMv2rBJbwiRR4EAFGKUuqOkyjOll8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
	b=nhMjlV0YAi8Kmkx9Lj4MHJq/BWb6FpWKy/rP2OR19jVqsjhIVnjnGsLMpNGQaVJM2t5p
	 XY0QRAb3Iqz4Xy3CPV2ndqoonMAKwUlKvPoTm2/AvrSggzXy2/xtvrH5zYXVtJ1bTO4Qz
	 g9GogWUpnzpP8qlxsdywsUwRe3X/iv21bDJyhcmM6s0YGwRlIz5Lub/Qs6hE3yWSH5ayc
	 fXN3QNaxnLRSvzsPb9MxfyGUV5PDFJJ53QFqkSg01aNdJOOzr4VVuiZ25o25KZ3DX4WZ6
	 nW4XCQKcv+UJdrlQ9RleaachuLb5I0Se9OdRgqiAgE3Oy34N8yJVxjpDbrZnDfs+VDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPanwcML;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lhh1YjOn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E67E606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E67E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPanwcML;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lhh1YjOn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M709kB4136782
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=; b=XPanwcMLU450Nny1
	O39Rxj7Mb+9DMrJ2NOgxIRdOPoAcjE/+Kt0py18B2SJ7+Jz1KwERJV/AEUlk9eqE
	1B/F1FiErLSJx2NY+0dUlwl383iEHHzpmXuCosLdH6xtOJSJlRPVjQt50/lwXiwy
	Byhn27ASflHSvBH4TNJso80dtGyW5P6QEEpI98DFny67Q/eW/re1bg8bT35GVYsc
	xAXEK0LTnxqSPBXC3BiY6usvA9Fdt1sXYwpVDEiGb9mLQK42rggISvvFxKPngCg9
	ciHC8B2IZNpa+8fgijztMhpIenzrd3wabyq9MBdP96D7+LVTiPsvyRGW5xC1PLlH
	V/8p3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9b47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:57:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so37379785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655857; x=1793260657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
        b=Lhh1YjOnTO9ZrF5YTTqwhlurBw6ktKR7VWjTcRDjGGSdL4mRRS7iLAtcJFdVDPELcw
         vxbq4/S50QuTeZeoe/WQsVXY1RLcdzdcdl7IjJ5crnvb3ALDJJBd72qDLKUHGPKStBw7
         K9ZW3FRiAVA/g8bcpPDkO/7/D+FcDF1hnyjj3+SESEa5r14vc9tXlZ6bGEAtDLPsN5e5
         Wh+TQxOrX1cmkHsY7KXAGV6y/Bsf912fpWcwT/gw6OWqWbbnSkcSR4ZJy4sRtc8xZ6gg
         equD74pr2A/M3LUlaIlaUsNQoPQaEY1y29TBL0kp3JqaubdJ1o8VK9QWfpP5DTzg5NYG
         q6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655857; x=1793260657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
        b=kosnNRHFs7kK5ocJIaTXfjTyElVKtqIZcELF2Nq8gG+HHmfjISp1pAEw0Dh1GtQCMx
         HeKj5uJfFPn1Vrl993vSd6VnGoaAcOBMGEZFSe7TinQusad2UC2Gd01MODPHbo64qv3Q
         +7a5BBJf8tdbpxt7fr4FuEhbdEExBmJxQ48xe1LnARjfqgeCPUeEBasKaINX7H0rLboX
         iGP35KmUqseNT9w3RbTL0naMxRkRlIx3nJj2iQDUR0ZLu6JvAGIuBoL3dTCfbQ7iVhAP
         eDN82OBP05Vu6THnuozICpWiMUkKtVfkQAj64kwxNH3PbaBqgu80CjRbsK1CYujB8Db9
         xZZA==
X-Forwarded-Encrypted: i=1; AKwUvBxDFOngvcZJZz/kWXlhfeOHMGXZGhsI/hvbTyaRtsqmfaFU0JdZcqlG4AgsuLNklWxGRNLgo+Eie5t0NVMa@vger.kernel.org
X-Gm-Message-State: AFq9FYLTdfM5m0/exWLb2+3UPcEvQ6A8e+Qae4bKjKejQXxtsZmVHYLP
	qYCJjpSIFfNas+7N6TSL2GYoQnVjspCYTJ0xsqDSap1QQuqj2UWtqLlneTojy1JVelQfFn2v8bp
	AFDdAC7Qz1UaUBpKpjHtJbtp8nT4HZM347qaCzaMi3Jrgx7jZ5rWoYBZWdchYAmV8uJWf
X-Gm-Gg: AYBFou0mECTgCjwTX1vRdNI/mItsHIUT1X1ZjNPeYFOA44KYxh1N87xzCWScQAFDj7+
	uhKO9MADIRqaFtR+X0hZ+X37NZ6Kdq088Ckc8HwmW3qScjcip/fGLkAJOn7O0hp55pLkp567ERt
	txPrrsqznr2CxnsjKVJ2z+9Q/7bsv7A1UCjjdvJFWC2W1E/pZ+oYvf6DPiUPStWZ534uqLiNQLj
	mhV9Nq9BVzj4k8ZtwANfJD6v2cF7Jxmp+nt0yHoanP+bnFP4bn+8uOZR65AZVQ94ymLjZ3Rc53c
	WEX+5B3tCj7yq1YYOfvDos1v2eGwwCRaVwC9Dh40k9VWvkqNvn3zfX503ARp1bxd007kYruuuZM
	RY7aEpJVJezE2qjYCnThs2Q==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr930074085a.2.1792655856885;
        Thu, 22 Oct 2026 00:57:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr930072685a.2.1792655856386;
        Thu, 22 Oct 2026 00:57:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafd6sm1582801a12.7.2026.10.22.00.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:57:35 -0700 (PDT)
Message-ID: <8bd5b87d-b5e9-4594-b3eb-cca14b8b9667@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:57:32 +0200
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
Subject: Re: [PATCH v2 2/3] clk: qcom: camcc-sm8450: Retain flops across
 camera GDSC collapse
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-3-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-3-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX1XqpP5bpve8Q
 BEirn6HZKpDYEFzkEV2bw/8EQG9PES+pUqoLC2xP0EVPMrr3n2wCppC/L/iJ3HX+ioGydwnbnL7
 3pCm4j2cMMhN3kM2XnrVZ4QR44JE12E=
X-Proofpoint-ORIG-GUID: FuzacD2H4ASfb7EC0kE3moBMKKYUoT4V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX5DErEsC7foB7
 yDVU2s9VgpLXCvqTzG54qhZHUdPE+jve86q1Dtpmi4ZHv0VokxtUX0x+KPZNd/rIbqIB14zP2c5
 DpAV8ebsvXRJ6OhYHrpDYsJ+2Fna4eB2SbBM5QAJfuQoSIG+1kAhAsBRdeNRkfUETDUYB9JgT3b
 LU2BknnOV9CDJKfCD/057DLxBfU80Ub3/lO+ltOj+KhTKvIg4Gf4f693XQb6bpnNF6/yNWhRIGv
 rslnC1SkesXFCJe35NUJsklAZWk5fXHWwkOA1CJeiedAUtBmSk4SKw2B+TrnCCziFj5Bq/DcMBb
 KMU79/LzwN43N7c6CfP7ANrMVlb+dU3tqG3xLdoJOsRzUsrrs7XMNzHSt3Hi8pCnAgtuKVi0t8j
 mvIEfxxE7TW/na7PInDDAJgF2eDga4KVKTHzB8A9yBbiPqVNbb+gM29Jx/jp2YXtn7eOZsy2aGw
 BZInxertrTuE8pl1SKA==
X-Proofpoint-GUID: FuzacD2H4ASfb7EC0kE3moBMKKYUoT4V
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9c1f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UF2wGm-gxhqBw71OckEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> The camera GDSCs are collapsed between camera sessions. Without flop
> retention and with the default clock-disable wait, the IFE GDSC can
> stay stuck off when it is powered up for the next session.
> 
> Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
> and the downstream camera clock controller driver do for these GDSCs.
> 
> Tested on the Nothing Phone (2) (SM8475) by running repeated camera
> sessions.
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
