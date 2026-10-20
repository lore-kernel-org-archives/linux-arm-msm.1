Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485348;
	b=CMF/dpllmPO5Fb6uFuMYIkk1HyQbdkADi1UAbp7wz4DEcIi5U9AZ9gfP00ZcDY1XQWkd
	 tLMIOgdVMwvaBmdcE+sw7cs9G64FgY8RXTWZNh8spIvxgkae5PLqXKlvGndE/Z7aL0m1t
	 /LFLmj552XXoJm3VGTY/ulcOrUKN/tU4P1mu0jyiZ3vZdk8EoTW9C0ZX+VHuPY0XseI7p
	 0xdUPOlj5AUjDlFvCXL0fcOtwmczk0U1q7C7ZSO1tJ4VcqP5xL8ApCfK64zKJG8nGi0xl
	 qBdGpL8hkNH0jYJR3wuutQIRTw5tdAUDZBVvrSfShIT0i7beiSNEJCNpslrAMsCvzkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485348;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
	b=j1d6zt+faUUP03R7oxdij8MELvOz+cNWr+QhNHcdrCKo10tKmwV/Q+iVOp2oNaQhn13m
	 8xY0GWihrmkLgXBOWWIRcJQCw+xs4SpCI9GUaeysQyfXb01A7DXlhUbu/d1e6viwmIqJJ
	 Pcz0DLOU1HHsTw0mry3TcSqskO6R4OWFR0yThFDWMsl/Iv7L3zCh3sHOi6V6EScdBYUdL
	 VUu7zKb24JjAPCfLTm6W2yZG/5XwuBog23L1jy0UtSq13aBFgrl0xusiU8g5/+py+qIsX
	 8vOf84VavYVzSO5dNZAj3r1DZtMBj9UlfH9cusd+49dKxoSKheYMQIRXemG2ZU3UGaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g7h/aEHm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bJsDNw8r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3B606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A3B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7h/aEHm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bJsDNw8r
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8RdJd1254519
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=; b=g7h/aEHman4Gol6E
	CvpiHjeAH/SLbNfmctNUpdPbVFcEqKeaYquVqQ7tvJ81dTk9UuUWq3OwUZCfzwum
	Yr56PXCEuHp8SXPchbM7VjBTAtXEi8M8hNPRWkiIe/xjKdEZ7edA9nXHcuYO2leP
	26Ij0z4Iv4fFvJeoQ1WGP6iKglkKcBHQmVYCedulvTjgWQXw7gKFzYAx7HLGT5Cc
	B9EFiqbZ1jZnxpVloiLaBFX5geIjp/AKdS9d+IhbLr3H7kyTUibSpdXtvx/hQrMe
	WK+jv7Y4+nhN7d1Wdhtf+kEoH7zDz0CGAF0GYWDpzwg/b9KZZgUEbZUK164/+Wu1
	PyAdug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9mpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:35:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so98626685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485346; x=1793090146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=bJsDNw8rj2onH99rsVNR8tIk+JW9dcmFHZ2OPDEYh6i6UY05L0xFZG5R/MPmFzDkNa
         cQs5fLx+9CtfcrIyHGd9eCeE7ZOuS5Dse0TQkcimiFbXwcNlGkAPzFRextxM2rsrju0T
         DZr+Jud2om+b/itgwCuBfIEG97GmM2Uiyf85kqCasvIyuM8JR5JF0Cz0Vr0X1NjGuH+w
         8jiKmfk5adV9EUV7kkAHBG3IZJxpBWX1GSlt3W6AWzAnwLwacV86SQD5CDiUoshrvOFV
         aQqSrolDVk2rBJtccAoVJfDKdzXj7MzL1J2i55Ey/YGT+ClY/1PIBPkTNl7QJQwkO+d0
         dOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485346; x=1793090146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=X4FHxHrZMCR0WTHmrv5xKd7RAaIBjxqBtoNq2iKrctoNIYLNZTtwLNfGMMBtSXMlkd
         zIWIo9KC6L/FmpXmlPMdmW55jTzR55KPvQ9CS0le7N7GGVIMs43KefSfbAh+kCHG+kTE
         3s6p8xuXhgS4aoTXORBOazOuqJfX1Z1wViDJ0giDpcexsfe1nhsZwSUyqc3rmAGzF42X
         OQr2VjYcAu1exqJrYfn8nJZUp+hC2P8Gy2nk4frgtH5pjQlL/YAl/XaarslXhi9pfdVq
         byXvQnFkIgmqSB54qSL5MjcpyVJBNU9tFd3xnjnBXX/iGPxPpOms46AWlHhDi9bWMsCR
         e2Pw==
X-Gm-Message-State: AFq9FYL1avDGd8o2/cMahjpAU8hfKnCrFqo3+wVvbj0Mt3G9lAs4jNgb
	aAZ2QGUZaCQDuigD3pQi55J3wpkcm6wACSBbyzoUXD5EN68kXJ+LZQ4QQ/LJd2YbqEAzJNYPqoy
	dIpL6poOifatvmgrtPExuz7Bx2Vkku+xm4v3oLuRE1x5fbRHDrPOtkWLP95NwjY9NVBuK
X-Gm-Gg: AYBFou1E0lPSXknZqxYBy+Pl/m4dJaOL2Xeebqwy5tHWRTXkpd1hk/92QtBPvNXgY5B
	bQYTViN9cQB2Dkt14g/Mb73o6SwEr9BKec2jwMGvWntQBKVkav+LqtHnmmqun60EOZEJE3mwdTx
	GIFJ3xmTcR2etztyA2sHyg4mWdWHE81XfyA/13AyFj+CwSrwINNI7Dae2CTmZiRnJ/NYRhcvblC
	HQF2+zNeJpjSnIDNm2BEVyxJik3PMGwhqmbKskhS/AinSlu4KxQxXjmBmcBgAJiaGfXXOKsoeMH
	ONNSm4i/ZOFnCiwD3RTe5fzCl7NQFcNBhyNDuR2RMmxzGy75IdO8mFkycmTvHbcGzWDzzVb0P49
	qUP+qUBQo7YX07ZJxqdGDDQ==
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945704285a.6.1792485341357;
        Tue, 20 Oct 2026 01:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945701585a.6.1792485340917;
        Tue, 20 Oct 2026 01:35:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm5053676a12.22.2026.10.20.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:35:39 -0700 (PDT)
Message-ID: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:35:36 +0200
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
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eF2xL3dhojmQ7229FNk1uF04I3DWY8Y-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX4QotJANjG+wN
 tBP5NwJBfqTIxVSpfUvnemR2xqRmDEzY9VYqrRxeDEENybM8tSfjYDEx/mHrSTXILLslSpeoxcD
 80XfgJh97OWr863mP0+avYd4yMJBdKBv7POu7SiYn7PQ/5fdDci2BTGenB8ASIQ3HK1dT5+0I9t
 6jvuKdZjxSKc3VVAcEI0tlhsRF/CGMZefZI3Mdjx5r0a0TmdjVgw7EqPAXHbArmpwYw49nM+jdB
 2mZKxNeqsirsSowBGo5D7KHVLP1XG6DKFGQMBrFkxNujzqUn0eAOQSOsmHQuTjK9aLnS96H3hMw
 r8cHKRbvZ4IVDNyGCelZPDHV4U5qRlbk7wL+fmFdu0wsNPx5v+oAdOY+L8k6eKzf4OQHnlZ3xDm
 xbEXRhYnVg14Rh2qWuWDgPZ4CArjDey349c6PiVw2LA6LzkwpNzxEePaWGAn4c08aNoDzbt4sNB
 upfEkjLcQMWdy90FE9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX0tlY0CCcuVjl
 pVtKUQXxtzhRnUCQzr/RBVEKLuSp3LM1bAc4WPDTMvpJURkImfPr2XkwKkYmLmMgucrJpnrL1X1
 BcPmxyBFSFzDi+wo5ddLC7DQQY5lF94=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad727e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KiQJPOv1UjsmjKsQXtkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: eF2xL3dhojmQ7229FNk1uF04I3DWY8Y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> cannot leave halt unless mmss_mmagic_maxi_clk is running.
> 
> Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> because there is no bus driver to manage them, but missed this one: its
> siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> mmagic_video_noc_cfg_ahb_clk all carry the flag while
> mmss_mmagic_maxi_clk does not.
> 
> Mark it CLK_IS_CRITICAL as well.
> 
> Note that the halt bit is truthful here and must not be papered over
> with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> silently resets the SoC.

Will the right fix forward be to grab a handle to all of mmagic
for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
a workaround

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
