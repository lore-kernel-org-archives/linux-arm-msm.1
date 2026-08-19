Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C6E48A2BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158107; cv=none; b=ntHtvPQMxIg4lC86OACj7Q2GXuliD3QETha7eySNaMaD4MFhLefWxZc6TbFztRUmECWSF3OZyXk9nZKL1Civ65NhTSWnI1OuWUcVj3lgwooMFHu5g/T/3XVwTi5/y9IYOXelLrXcyc5mSzLqgzxTFnVuauC/j5fA9k5n8taU6Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158107; c=relaxed/simple;
	bh=FK/YKI032WnFYfbtf+dIqJfVP2pVl3mGpbQL+QMkSJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgTlnhJTRTWZ70MlWyU/odR2tjZXjZvWTn9lW8s5LI09FHRlfdelC0HMorgVhYV/d++7QOcBjPmyxxKsvi/ORxqz43FUPpoI5ZljeyqLtlMAlcOajPYR3kEMERBks4rHJsppD6WrU5m79S4KuogkH02cxL8Fev/Z3KUvqNnUZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jw523IqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ic2wc4LI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jw523IqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ic2wc4LI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1ABJ3869639
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFgVczgZo7H4OwQ2HcYCs51a3l3OB7VCV1oqx0nuVcQ=; b=Jw523IqOi3DQwL17
	4rvEldBNetWSammTrtbWBqgb5o7uuv4MtBhqHQJnnxYJahBWGVzQuzpnZPAnlBMw
	F3kS2mRogUDOdHazaamgtJJ/C4sUXR/AaP6AyA8PqDRRAhJyaH2zbkBmHkyTGb7o
	XkfLvXtBlPs4Iv5kqPL/gvVy1b+LHYxQzxxKUnx2STc/CmRr6nYnmITgfGtcT5IM
	niListF5ntJ/zb2SzS66QALJhRht0V3bo4Snl0vDiubjrUsGW3fQPepjiHd3a030
	+4E/tlkuW2yDgDBV4MXsG2MZfNrmXHMBTvSrkdqixcD+1UEAIVmWxE5EaahSDmFm
	Lr8/lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervgkxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9d953b71so1761581cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158105; x=1787762905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFgVczgZo7H4OwQ2HcYCs51a3l3OB7VCV1oqx0nuVcQ=;
        b=ic2wc4LIKK1KiodDLoBlvwxjIrTgm/q9FLtXWWvPWthmahSfaVKvc6MGvNdTM7YgN7
         ShEAbbx/I57Muj0/aBlGwb/Wur6MsoLIpMQSvPCW8W0E7SrqDquUXwYY2sHP/Rt/x+31
         6/sMR1F5p9ZrGpdU1KagUV9wfMBATOkeDGVGx/aXy57n+wuo/3vtTxoX2+u+GEjq3n2W
         cLFJfogSWwBHCV7Hw2SaPS+own4aZS0u6Q995M1eJk22kVh9W/5vRVRp+1JZYpaTFHlC
         Pj5X/qtazpH4g7hwKR3W6VDApXFJviABQ4B5Ov5BWQVtfSRar/j9jSKUDtzmAFoaneQx
         rU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158105; x=1787762905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFgVczgZo7H4OwQ2HcYCs51a3l3OB7VCV1oqx0nuVcQ=;
        b=N9Iiu/7CQZFq1HPnQjaYiVA5Cw7HWFlUrMeZqM1EjBUKKmXMFAxXq+3OZGufCQk7Ws
         kEQFD2c04S5xx6JEtHv6D3Mosx7z784rydXro5Y39AQ2sI4H9izv+8hAxe2Kvu4KnyU1
         yjJeBBP45bOBxmvPZT8dXdicH88UKkjLvJ5OrKQqdT5M3w1Y3a+tbeS2iRGKJ01MLo5s
         cyEAT4UKphKWqlKA83uoJVjNRzkjiAxn33CgFoYgB6g1JOAlGj+MdGjw0GTBW1gXuuZd
         3pix4GAbUI3s9zciHqSURmi/JvjU/KE8Fd23E0XHmDoKXIr+wCDFkRzQfwlnO3ohK3e1
         68rw==
X-Gm-Message-State: AOJu0YxgQFHnGZReXAnZ97PGkXa0oEzTNpgE0GBuTxQGJI+S8hf6gkQ6
	W9Em3KHQ6geRM/9vqUdXKVeVl3QrmAs5hldF1tJScb48npN8a2tgsfOQTbQ4XoahOoajSpdimFy
	XBa6ls7c3NXdp6Vok0uGXgO0yUyju03wRwq6+rykjveJ6RN4vBeewFCfv87+ct8e7aflM
X-Gm-Gg: AR+sD13qlAmKSZlALbR6Hi1er7XQAGDtjEm/vv/REcHeDO9WYrPvEw2LVOMGm+HQ77M
	wuscv6Y3Kwzch48MwxBQi/uH5ZCVLoRxCBA5GZZGsu7Z3DbslFTqK5Duliny4CEoZQoQebJbwou
	oQqQN4v6za6bilVdF7mDHA4x4JuRV/seH9/D1P/p9NfanRhtJ8m40a6Sn8bRO9FC4QOYIrFlwOQ
	xfeeAbpKjto9ClhQe3STEIUVryVo3xwIkZhuaNC7N+Pa/ACjWrno7dyU+uKjdGyj2bMqahvBWMg
	HCVf+Egh7GEs5AhnNGqHYzbTMpHPJQIUtnmCuuaDrMwbiYpKYCQBtCeXoEzYrgpnBgsDoJSnmTq
	65+OZkWsmVEpav7E0Ep5pwvLN
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr42780421cf.3.1787158104739;
        Wed, 19 Aug 2026 09:48:24 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr42779971cf.3.1787158104322;
        Wed, 19 Aug 2026 09:48:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:22 -0700 (PDT)
Message-ID: <55597b87-be91-4d5b-b3e5-6c075fd239d7@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] arm64: dts: qcom: sm8550: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-12-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-12-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -UkqOrKp_boRzb3v2_zJin7DUD6xGOcV
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a85de59 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX15/spr3iD7HZ
 wYMyBW7/DhWMvccihJCmnMCtDcLpMPA0IXCcKlrY7z25tI9ALG1jRijmLKPbOEY4wOyEvKWh365
 B0Epr0tRBrtPZTXIImYggF8Nx7gEbClT2voC/mimMFHyg3BvdjgIb0Gb1YTPfg5ZGCnD6T4Eg+d
 9l8bfOEFv4UzkuGHYrTddW6/FaAcNy8Q4MPEAOKwX9JXnhBNp/mTSy8xvRjRXVrHyKOKNmJxtYV
 RXgUBfyzXL4z4uCqW22/7enyHjG8pl1jFmVDf8jNHJ+bJX//0S4f5Nmucpzx/tg5+wraniTg7F5
 y8oL4CBU2B3WBzGch1+o6HM/jzngHiSLxvDhaP9E0ez31Kl9zHtVj9C2Sm8Z1BALMfjudB1PsP8
 OdJpLU1xbjZBT7BzjqW0ecdgu+ed+xg5oK6EBuixkyPizM53lhW6v3iinlAoVeqBBtUsbJRVd+3
 crLvgeE/sxBQArsXvZA==
X-Proofpoint-ORIG-GUID: -UkqOrKp_boRzb3v2_zJin7DUD6xGOcV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX+UUhos9jVg8c
 gZLzHI5WknQ9PhETJ4uOxmjpXWEXk4YeeylnAYZIYi2LlXeJ61QT0sqXOWVMQp5NC+ytewmk3CO
 zY25og3QAFfCI/u/9M1ubZEZCc9Rc0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8550 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
