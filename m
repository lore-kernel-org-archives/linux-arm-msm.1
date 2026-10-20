Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479177;
	b=Im0odryKCqRqtCxKkqXn8jryczdtQRwr3ZftnyDp3kR3z3sjKThHuNev5+Fp94R0SuzT
	 Pkr9pBxLkEi1qSPDiHF6I57iJjnCnRRgXN2+A2pRtnsJLf2RiaYAhckq7B4F+OE5yvqXk
	 hrlJ7dWg0NG9K2iuo2CcuXAcSJ9OSTfY9kV3Hvf9gmynBTnuC7KnfKbDYByT9GZynQsKS
	 PBbXuyw1r+SE8S7xSY88Y4PQgvZ8ZoVkBNuAS7awPlwzrqtMzpPQs0gLvtcpXoy6vBaYx
	 AQnIDMGVCGUdxM+7KM/SKJrXo/IiOmCva3VESm6nOwd/O//c09fS7HlWLhhdMGvrybA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V0N1LqszfxjpvXwsaDnQpJ6iNycJfBfQHLhhQK7bbK8=;
	b=3b7E8m8Z3zCMzW1ISSK2e39Aw1IxObf0UAGq5uQCz6Bp2uGwaH29kS4+5ZZKWgsAdIeZ
	 x1wWK/IN+w/uXK/CHwjRp0KszMQCp5Gb4sOiEDLhT9xV2yxdGSS3l/AbgYaOceRnbwoor
	 v7AfkLJQsMed7rLL+peuYIO6jiNg0sBaDkXYrMFV+aYlY5gWSGEJrReIPkFqyrgZ0a9xR
	 BRqF4JVN70Qa0KQqBTJDPkxvCc8ZMbaZYrRoHt7xLLc+oKW8Z5bii/brK2CyFWUkUmZan
	 c5bu1ujB8ObRwDjIAFws3/SaDzmUX35qd3DBnXT/Of7K2udBmEeNStP0aUNFKYw4cCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kg8f5YXN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IztpPkcY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290E606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4290E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kg8f5YXN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IztpPkcY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tGhf1254986
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0N1LqszfxjpvXwsaDnQpJ6iNycJfBfQHLhhQK7bbK8=; b=Kg8f5YXNqPlZctcT
	2C2MypGDK7FAYjVts0I4tpyRyeFLGCIET1qLxjOKmcD7mjQB2qm9qIYIiVFMYAef
	T3vSshHREANE5aLF7xvdo+YqEMyF/VOL1wpYjVIAeEkAN5yx487EEA7CWt0DjLLS
	Ca+l1eo9tSLrRc85+25hiSdCDzG2r281BSk8G2SQUwZG/DhcqFme1szZ5q6ogq+F
	Vrqrvz+ni88e1tWOL3PBKClWlzV9ZQVoQ9Au5GNObKrvNMhSpp+Kt7p82nGFsKB0
	XShL4e9JcxsJfItyg4obWhe2zHb6D7w4RiEJaVhnt6slhfweW7Kwtl6VVF5a58uI
	g6UeQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n986k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:52:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so42293585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479175; x=1793083975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0N1LqszfxjpvXwsaDnQpJ6iNycJfBfQHLhhQK7bbK8=;
        b=IztpPkcYzlEEg+lvnUPWWSEAiRolAxeiRecV7L4mBqKIgtoSPnBogBA7SWFg6bIFKD
         1m8odAEE6UG0MqmQNHyymsWpxtcD3Bxy1tbI/L+YIYc9nX9dc9t7R9885SWJu2zwvqUa
         hKR+iGGF/PnBxzIgaQwFqeRp9H4126eGzLz9zgNdnrJN0RvUxHtBLCRZiGPyW7QlVn3Q
         zxVFYi/YLCVDpzKvXDqMpbmf842TaEFCFoF4xrYMq6YhFgESrrJHs7OEHikddqsULjZk
         sW3PKSCkc5rr4kfyIgZ3xQi3mB7TvW2uP/ytHlfEMCllX1UJY+sCtK4J/hXvyvAakcne
         HlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479175; x=1793083975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0N1LqszfxjpvXwsaDnQpJ6iNycJfBfQHLhhQK7bbK8=;
        b=0Z4qtSa4PwvmhgKG6FOqVlrAY9yyl33cdAkeNxYw+Vuzr51eyWx0NgeJ8iBN5LcRob
         52qgcjI4Hi3n84ypVSE2roreT8cvnfUkOir2MZnKddCoIKZGYJBmaF9rz3DccFYcOxA/
         3nUmxHaQAX07K7KRQRpdfLDxudkbVo29Fu+WQg99FPu8cuEb+FN/6qFCOLQfIpcq+yP3
         ZTjGI3FvwryBuiILBnRU29doeeuY061VT49BdsQvS9pgxgl+T44jJX7fQKxWVHleSE5e
         JJag+ijfGy9H1kVAOqxW0RazxeWPMEc52+lliMezlcOA6OkZXN3Te5RRDmPe/K/8qtjT
         48xw==
X-Gm-Message-State: AFq9FYJB7dQMge0Y4yuSgrj8i+mY5q24piCucfy3mGJIxMK1gdK8Mwk0
	U+JEnI5Y0HUgbLjbvRBZIfe5ikP2kCOT4ENBZ/lbENQ7BTCAVFrUGzrLbHlqm/VAbWWDdWAOoxa
	cGrU0BMyMh11fmJo1UgVhx62hJRFSFmWGAKZovQQHwbLcC2UoE7J8y3nfyTgtnvoo2SaP
X-Gm-Gg: AYBFou0ZTkrWBgU8Ty+hbyzdXNAokEn4TII9SidwOwB3H6Y+BCAFt2ZKZrmfwcZQnsN
	MMuuKOxOcixyxUDBCwnb2bygxJkLbsmgwuUE5SN9WX+5pKYCIYR3lVX/RfvQzXZwc5xDtnXz88z
	m6iq9BN6HEj5QiTghN5rW9ue+sgc6z2VTTab8ARS2mDA1x96K+Lk7+GU65vb/GDLBs07v2grbzi
	5khnTOmngWj2XpW3wFfYVvIZLi6Wo8rpPbj65bz5E9o9UK2qAzgPBbmqwjKDbgmDu4h6CuBPMZp
	XgLpOBwD+OMcT2MqU2nDS9ECA8vAH+QUvrP4j0E23lrR2DUOoXHKCkAphW5ykjM9rO2tE6fSNMk
	cesXFp/flza9uffWfne5i0w==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1890991585a.0.1792479175287;
        Mon, 19 Oct 2026 23:52:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1890989485a.0.1792479174823;
        Mon, 19 Oct 2026 23:52:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9db0sm4984385a12.33.2026.10.19.23.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:52:54 -0700 (PDT)
Message-ID: <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:52:49 +0200
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
Subject: Re: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while the
 PLL speeds up
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
        devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yk8rYVrJry6qASY-mkuqzD4kI1F7tBKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfXzUvO2o3kldGu
 T0ULTFL+K5KOyw2U3FMr4+ZCLJMGxvZLs+mfoqY2yuxhh+L9JIGZfr0RiZ76ZgByifqzIsS7Gdy
 f5fE/QNKNROvNzkKUzM476EZaf9caUSguIG2fq+rodgt4HoPW3K4IrDTrhDlp6qhMzL5OnSQJC0
 KwC4SoT+ezH3hgAYzFpXc0qyNUfhAbnKY6kTc6I617nwHU2D+i0+CerCMNBpqKwVJ1z5rBgPQ/M
 q36C6eiK5NNd6wVIUqsG+VbTRKoYInPnJOHXynAPqbaFsO2my766+KiFHTo8CiVXWcsnrfpY74A
 Wa658hDc0XIbelfx6LPmfO1qC7UY/XHn04KaGDTdzGkgh5VjvMbZsaXbb89uMvDer1MDsUeqC1I
 nzzR3E0HVDKh01zKL4UEVm9trpATydYKklYQA6uI7NgRLxOKwTMMlJpWceWvhz7C8wj+9y4yKa8
 wo6+MMWtUWa4Ob3MINA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfXyfJpHNbGFaP8
 s59fi7gylnuoT5ZYRlnCM/Y6SUc6cN6ZDw0TKL02IxLcp487vIzAMSkiZLlXhuFB+TjRCsxDqZd
 IcGxPpiZV+Kgmy96r1MOtU23FK2A9xM=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad70fc8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-GkAsrVB-0cJHUZqiU8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yk8rYVrJry6qASY-mkuqzD4kI1F7tBKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The MSM8996 CPU clusters sometimes run at half the rate they report
> after going up between two frequencies above 600 MHz, and stay there
> until the cluster drops below 600 MHz. The PLL, the muxes and the rest
> of the cluster clock registers are all as expected: it is the ACD that
> latches at half the rate when the PLL is reprogrammed to a higher rate
> underneath it, and selecting the ACD leg again clears it. The driver
> only moves off the ACD leg when going below 600 MHz.
> 
> Like the vendor kernel, run from PLL/2 while the PLL goes up and return
> to the ACD leg afterwards. Point the SMUX at PLL/2 at probe time instead
> of XO, so that the cluster does not drop to 19.2 MHz on the first such
> switch.
> 
> Fixes: 03e342dc45c9 ("clk: qcom: Add CPU clock driver for msm8996")
> Reported-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

LLM has the following comments:

For old rates above 1190.4 MHz the SMUX output is old/2, which
exceeds MAX_PLL_MAIN_FREQ (595.2 MHz). Downstream does not do this.
clock-cpu-8996.c acd_safe_freq() returns freq/2 only up to
1190.4 MHz and MAX_PLL_MAIN_FREQ above that, and pre_set_rate()
retunes the PLL to that value before the increase. The comment there
says the main output is what keeps voltage constraints satisfied,
which implies a 595.2 MHz limit on that output.

Up to 1190.4 MHz the two approaches are equivalent: both move the
cluster off the ACD leg and run it from the non-ACD path at half the
old rate. Above that they diverge.

Either clamp the SMUX choice to match acd_safe_freq(), or explain why
old/2 is safe above 1190.4 MHz. The second needs the hardware limit
for the non-ACD output, which is not in the patch or the cover letter.

Konrad
