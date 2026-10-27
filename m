Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099840;
	b=VrXByhKNnomhjpkshZxCQ+apdcma0Dq5/xIvZuJBICXcVKfq05e3xApZ+ipSe9cKorvv
	 TChYoS7/nV/RdrEnMdOS5fkGCGaNW+VYRKQDuVdUkNznif+tkrR6AFo3YE3bO797FJy7T
	 iohm1zuwRCn6U6TwAL5/Kze9HXb1ZEU5M/TMaf5WPFnndhAig1wx+YVYSZJYBiyfPD7ks
	 Wc/TouzUtHnDYbKg2RwFmT5XfldHcfrEuBYkvEkCwT+Fjkqiuu+StO7cxwXIsTQJb691P
	 anPrwaZKKBVw6/dwQ1cr+KUeI1lKSGDSwqRltV/ieh1faxndxMolxXCTl9yukDqlL3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0HUZxBK6kLlN9yABBCF2IbW/t7a+9RUBtdNWeHBGZRo=;
	b=j3NuEHPIY6Fm/al27MTmGIIB34TdT08SdooZf3zzJl7090GeDkUHTw/NLDE1OE0wm2Tp
	 RSfCgkElcqD+pgKCNx9HHFfqRhKn2UNxfxrTnnLFav2E27Pg4FUEbTt+7Zy+4Ns89qwvH
	 q+0CJx8DLr8NEk1RBaNzMyiWlzNpdXajsx9rwn2cfsz5eSYk+PMlbLcIR8DargXxpkQ/0
	 /H0BXgOpD8VeDuxohtpCxj9Evg5vTJpe0TJ7rlqoT9ORxLl9j0cCB+dIcgzusPlgR5unu
	 67Ro6ux38yw+VUHi1VpQgYYoiJ2kynBbLvx/RN5K9IxS2tEtQhHCaDgsI9januO2TJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvI9dcQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctco7fI9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA819606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA819606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvI9dcQF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctco7fI9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3Ml432382
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HUZxBK6kLlN9yABBCF2IbW/t7a+9RUBtdNWeHBGZRo=; b=JvI9dcQFSN8YtCnM
	pkfMGvrVPecxUrUszM4xBRUQG+TkjY9VZl+aZjxwnyJtBYpl4gKa4u7O342w970q
	3/2G2ggrcqfk6CnEuSgL0QgKRBD0cZJYfQJHrOou3DHNNmnWzLFb6rQbfMmu4zmn
	WLpNGCEwPP5K1PFBPd+F7n8fFTfBaDbyiC6FJt/mVfIiuJz7f4wARc5AwGCg8FJM
	teipzRBnP2WagbRz/kVHDtkbUI3Ql03AJRwAcRCcorisscyKtejHO3nm/jOgwwm8
	CPf9DoqZorCfg5lHYborF5etKQAeXnPxcmQ75FhXYnG/NQxC0kQA5cNqJIgShgHf
	HViKqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kg7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:17:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so3506494a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099838; x=1793704638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HUZxBK6kLlN9yABBCF2IbW/t7a+9RUBtdNWeHBGZRo=;
        b=ctco7fI92RmoQ9jj0vtH3dFweR2+mdt/MjAYHKffvxgM5I7d7Pe4aeiCyraC/wb0Ch
         mHiyulgc2IAjlWluH+gvFjFXr8hBkZBtRN57cADcjqPu+KOgbK+4i4NQkxZmtYq5kNGu
         g1oBpB3DNC/rZ2iuF9nD1vSyTbb2pK3UAC1Gw/Z1mlZUwmbWMAQMiu5Du9DKziFB80//
         ZnhC+0Qp+xlJ6Qt+S40uv72WTaZj4xWbubfmbccl+BPSuDaFE3S3ltChPoaCbcMC+GIN
         JNziz0oe2jGHtq8DbrMfgSSSNwYAelPeL/hnr5MZtwC8uiimuyMQV/kZXt35tcKSD7tL
         eyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099838; x=1793704638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HUZxBK6kLlN9yABBCF2IbW/t7a+9RUBtdNWeHBGZRo=;
        b=FjLQNqcpKUMRXldoyREzxAiKO+WnRf9uu3wBIpXQDg+NU3vM+RZDuAPPM/9+iFn+m5
         RLkE89qdMElZmLjHhAQklIHl+zuWs7rkS1JHu2Nme3ntiMtZBa5bzLkWfjNL7MlpdJ6P
         3ttNESmuJfLJu/p9rs9lSDpANhuVUxlfhReeQ5fZnZ6HPLm0y4haJc4DTTP1SjE6dyOt
         ZJOs2yIlQ/lKOqjIulmZPwZAGiyH5pouy5duqxp3BrfYpERxXzRJhofG4Aoj18vTZlQ4
         M48qlCt+f1tIDNCQBm8hHpCaZXNndn5lInJ7lcFBMwbz1WIslMp+tV2KuWZT2Ic50zI4
         Qw8g==
X-Gm-Message-State: AFq9FYIyb3i0fyD+o2klX680RiZSmRr5b/f6W3duad876hq2rY6oM8kp
	S2jf95HOPZiwxye9+QxziadtOi7Vo225/sAzJnrVLOTenvHzHmEkbk9O5C4qZKthUeijSkrxTGJ
	bpVNG43jVzx9cUbCtntCOYArGV3cvs1ptqAwWXowWAoA2uWBTK+El/PdpDtZgk3JIAqC9
X-Gm-Gg: AYBFou0nTFwFykGKiB5PhpSj+2kj/xeQIhqjs5tMHY1RjshEzBU7teVhzslMxuubZIr
	SINQjuQZZ+hFe8ZUHGJ2k6SUATeaIeGVvTJBeGiHLSCg7W5Hzfi1DjMr+oIq5+h0jm3awdwAnoo
	9UIDGxRSiHZmaMQGQK9L1gNB7yoTYL7JOI208gI+wlrTUp1odWwudUf5Q6EBcdVx0/hkX5LLqul
	zVniA9KY/KF9HOUb0E0a+jjJeo0HuS/GrlRjckfD4e9nn8od8QqQ1Pnv/wD+sUMlINEWZ0FKR5O
	5QwJ35EidZEGWLO6MLPydOw2wHvqXsdh8rmE8gOJcY6KcMsFFw4qtnjBTs5gJKRZSvvGIbaGIkb
	LT2NN0OgzP7TmkjCUA88zJc+iL8w15zvp0SpFXOQCGJraITem2lW7maoEMDbX7QEVpWUBKPaCfZ
	ONQg==
X-Received: by 2002:a17:90b:3904:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3adeaae5caemr7900156a91.19.1793099838272;
        Tue, 27 Oct 2026 04:17:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3904:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3adeaae5caemr7900124a91.19.1793099837681;
        Tue, 27 Oct 2026 04:17:17 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba31797sm8511118a91.1.2026.10.27.04.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:17:17 -0700 (PDT)
Message-ID: <857cd18e-19a2-4329-8ed0-a61228112b96@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:47:11 +0530
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
Subject: Re: [PATCH v5 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV
 programming from qmp_v8_configure_dp_clocks()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
 <11c7f9f6-7a9b-4b46-93ba-b74153744a1a@oss.qualcomm.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <11c7f9f6-7a9b-4b46-93ba-b74153744a1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX+PtQLpdhR1Ua
 2zXWhKClJ2Dw3NE/qsUw22sxgrIBW1nHhcwet5IalAerrXQFqTf0VtgZtRLUxtV67lLuGX64Ng8
 F3q3VCbhIpAarIwDMMrPRrrzrrjurok=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0883e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aezud_-g-FnJNVpHNpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: zqizSZDtpsiHQYFPuSe9YTaWBFNnGqTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX80xypcFuVW9y
 D8vwpfp9jrr1v+/0Rbsyp3fZio73gs6g6S4EnEM+uaeuwYOmWG6VmBzp7mTK7esuoVdB5N8/x5B
 mTfGm9cZ1Ktz9qEmi1TyAyeiPHmJC2kbcGDsuf0tpFr0LdUy03/MFtYXvqLk6LqNrqjNKVP1xVJ
 Dwq9eabfLs9AJuzLGc9zlYkw5Olh8Z7stoZM3xLwfgBxdoUJSWd/0m8pp0S/13Sf8D6z6jCHFCO
 X5+Sx4AM8JcXGPKSG4XbyN0ofMmcJJAKAfqnCLXkTMvqixW6k6GXCuSCyG89tKt5NRQUgywUNoq
 Yo1leNca3oafHTbjUre7ugn365bnRX9IKN45d4t9EIPJdfizuAZG0lbpJMsrXwc2KaUhufELj+g
 h2sZFIwqyl3+SAiv/GmipP3VxC8W+mPDYZNGL3IhlKh4k7kOzvgEMcY94pGGmDDUjY4OUoTn8vI
 Fq8boEuhpNO7miZELTw==
X-Proofpoint-GUID: zqizSZDtpsiHQYFPuSe9YTaWBFNnGqTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044


On 10/22/2026 4:06 PM, Konrad Dybcio wrote:
> On 10/1/26 11:34 AM, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> QPHY_DP_PHY_VCO_DIV register does not participate in the
>> divider of vco_divided_clk, it can be left as it is- No impact
>>
>> Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
> The way I read the doc, it can be left as-is on Glymur, but
> not on Hamoa

Hi Konrad,

it seems Hamoa (x1e80100) follows a different callback — 
qmp_v3_configure_dp_clocks — while Glymur uses 
qmp_v8_configure_dp_clocks. Since they were already on separate code 
paths, I believe the removal of the vco_divided_clk write should not 
affect Hamoa at all. Please correct me if I'm missing something here.

Thanks,

Nabige

>
> Konrad
