Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9895439905
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973126; cv=none; b=LWamWWkeW3+ZmCBegs41XfCf8zLL+GyiKjxpNTkma/5gi9GX+KG0uyr6OUrjR3UBwlnXS4WfAG+PCfLkBlBhKarxeT9b9aSNOVADGRFkOYzh51/MQw82UGR1z29QcYbuMAqaNec0syk6saBfZwOvldDBx4tpEcxU1RRS3EbEVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973126; c=relaxed/simple;
	bh=GXDnqv4IufDcpMPjGsoOmnbxEx1h09J0mGjA6yUpyEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiQVQK6Te324QrZ9DQkgtQ/ai2LvQmLIGna2QBQWWfI4SQafHv15lWgvEYmqsBlP1ARj5XJZ2mVTNMs5HoKwCHJPZdKInN4dwS4kuUQHMlrNqKY5V5BK88E2IPDEd8Ltw/hZB8/OIE+eJY34OvJD2TQWpPh4kwvucKh/M4tKN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMmMMqJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuCW2WWD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMmMMqJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuCW2WWD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6CnA1193709
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=; b=fMmMMqJBlYjCqfMd
	HyqpcJy5MgaoCPvIDypo2cWJ0Z350/W9xqJhAhDtiyLM7eEhOj6UQlvFA7TElTcj
	gqh9WlRQVL+6HWl4YFkxx8toHwa3JY9EX9+GHkQWeBzdv2jTvfE2EY6BXQGiFoZx
	n5DjkHjikTuOzPpfhRRLTWWov80K290qsqd4POpSctGs8awR0cenQDIu1Zufdp6u
	XfhHKnHXjYT4tC+XJ/tuQSUzDroyAfqusVYB/UNnpt9Gy19vFempvGPPZAFa2LB4
	zYOJ5s8rclBHmRuLEfjO6SAjy4SXZ0I//lH5SgpTBMul2zzHJC7RNRxSwHNXGhem
	gWrpZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1eyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:25:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d7ef17031so2413401cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973120; x=1787577920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=ZuCW2WWDS/ZGBmjzVt1vJ+tZTIJ0KIFwisfY1Jb9ypGK4+38xTvXmjmbvQw16mTorf
         hzFsvD7MWsvwuEjRqkN1ilBBGsyb117pj+SHxRmqk8TOtj85m6/iGJ7ZJ1Zf+Z2klwH3
         AcOjiwwIy9Kzvfl7WC1ptPgJOAlPka9Z4Di7WS1UZkQIGwwbftghFRNNiuYo6YR+nphI
         n1xelyIZRI3GLlxUp+Z0WD+dYfb2JCntlorJ1/U6vSguSxsdt6VwgXx0M3MANzpaV56O
         6RTLvFj38PHW6p6A+C0fhUDrpM06HH8LGkwgPdZ4dono0OFgHp+fPm8Klo7mjK/RdSZG
         NGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973120; x=1787577920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=MYiqMDOl26BTkYPXnDQTslrmxqfBkxYTF8vkn7t2LFpqAdApXD5tEBta+pqv+X4zEH
         AC6+Srbx5sjf++qqTLwWHnJSAFxrm6E6y9cwq5uweLWlVxaJSistErym3JTF2KZ0y7Ex
         tIEAAIQxhJXJnWjXV/Pxi07E8u0YQDCv/yomJY6KMTxanJp/wk9DAHW5Vgd6zPnFBApW
         gm0XPRNyTqsNcTA2BPlS4X2ZWgs3xa/b1wVmGqJd2MnQCzdfigwGXAWi7mSmesUIVjTF
         CDa9E5PhWtQGzSnxCKTndOYeFX0/qxNHHTPASy0knYlIKF9oNfIlgOEMhrVV72NJqYC/
         /NJg==
X-Gm-Message-State: AOJu0YwJ92mXvjzpPDx253KqSW3eyEMHcy3ePaApD3iPlXQQL/3HNcNB
	LyOhgBSTIoLlkU+yjyBxVejTyjiClpKK5dalTsLu8wMfwZMc3ie74RSmvRSCLiLes6jxDAmlroC
	iqs5sFHrqz7D67IcHwJIk0wQfUB1jSZsWlLpNhkQRIfr4kOB63hI59/4jcH1udGFsw1x5
X-Gm-Gg: AR+sD10zZ3IveVFzoaNq86CWi/uTJdNKJ4O9HDy7mlmo09Jk9itg0ZtdzjglmsOKlg+
	kgUwCFLNd3PAZOMWYQX3DzAw6CcGTEZoWuZk6f35Htky/QA//hDguIYjZt+ShzG/XQOUXp6pVY+
	lz+3VLD7Atkw9t+lThD5RaMMBnd3RVKaJbZkr540Dtti6x3PPGFHOR5V6zwpt5IH6J1UBvORCt7
	iqKJG+jcxCF5HnqZ2PLGvaeAeG0c15mMPqRBnUdcePKqRuqcBFtD7BmC8mYwqvOvkJGNfiC83+b
	HQgbfC25cmUUqcLT/WLc6cc2T4avXDTdtTSUFBdPIaPu5kjCy4bWzW/cpjN2c9/iZPNg5lkrNnG
	OBTVQyj6GzrzraPIXSDTUXbpQ
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072591cf.3.1786973120251;
        Mon, 17 Aug 2026 06:25:20 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072121cf.3.1786973119817;
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97936sm29266066b.43.2026.08.17.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Message-ID: <57af0ad2-2afb-4951-b17c-918e9ed08ef2@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX9PV8BtNFEOom
 ahJ8cbUIn60ziURmLLdsEmj81WAV7FibQr/mNtwDu9535M0XW0RPTdnBShZHvJkm2lpQsjTNQ18
 M+OP3Yv7R/1h041e1FCYhYNfTAbrt9EZ1GrRcdJRueib22mkNAwRYBssmQN5lIuYMIk8YhhS4Rc
 6d2iyH0kMKtYYwsqrZpBvzwKhNif7In/R3YRA4LPpNxRSPoUQNX1jyW7S0jPDGihqra1N/UHZ+B
 G92cLfyBe7hADocIBgdn0pzUpbciXpc88AZZbnjq/U6No5oIdcnjAFunvxdMJRIUtUcjYw3dROu
 PEAOLDx6Rn95rfr0YJdFw/DyQTA/VVhoKTbYHLvNMeoT0vtunto8GxXwj8kBJLFF7ZdybcRGzmR
 oS45n3lJdIjLirQ63HC098XFbOXST74b8TVv+hcMoDh0cs8l+Yzpl7naXsMhCu1uK+BU+ur5S5T
 bQqBhry8aOTPHdd5rZQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a830bc1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KAk2mv6VNxiEomuprfGdhxIYGTJ2vEHj
X-Proofpoint-GUID: KAk2mv6VNxiEomuprfGdhxIYGTJ2vEHj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfXwG2TgTmwkbHG
 JvKBHSbK/Cfff5f280+2ikNNq2XM62eoXn0tjVmIYV6eawNSEOBVSLCWUZphYZFBrI+KqmAaKcv
 M3vFESmy8b1SVHVPp34a7tR95gBx5jk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
