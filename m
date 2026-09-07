Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867E42DFE6
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768251; cv=none; b=P3qij+uoPWGgA5T+nbqT+L0ERQhVsurgC2hYKIWGLvAWTkI0fM+Q7ab8Jbf2mXVQ7YeDLkAqSTMnhYGPhqnm2N9NqZPX+VY3A+zKsUhH5RYy/I9MLfBEA7JCiwfiqYNVzP04jvRDmK5ept8tmls6Xjux2TgUslv9c47Gp2V5Ebk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768251; c=relaxed/simple;
	bh=oziYxAd/m21PsjsH9JcZw2rfYlL/dO7h6Gs7rvOCtnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sqoxbo5MYXBgJ6h7VKFMpb4uBaxPm+lERolYlWJ/BVnPrBbSZGTBrA3H7uz3Ka45j3n5wXzajB4y9ltjGc8VL2Fcz5D1Od5sUmk2RCmmmdN6vVXYwCRuJ33TKCug90Zo+/gVyrYi7kQLH+xwxEAnFPerwXY6D6k+uabbiBgQlpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+Rubs4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZRWRxEx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+Rubs4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZRWRxEx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Mpx3352435
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=; b=a+Rubs4+SZNwG0Ac
	YBO8tt392ROtPd62Mv+rqJy9OkmmHkJybzwbj8BdyoMw6/KJb/0t4YUqHfEFLnrB
	gtsb1iKB+YjFOWtmn9/ouCWHC6QUIEFzE6nCg2krN/d+n+0iDWFi43T13iIIMkKx
	8FPwcoUq4QPwVEtYhSUUFypqrKF7SypMJ7VrqmnSc1S6Rlq8GT3hTSyvwOK6CzpP
	HmyPdGBCaL2c60inti/fwjFfx1+GQLecn1dFgjTpoqGIdrl12fLp0dbw5YNSdAYV
	F8L+HyytdKIc0WXxHFBdHOL7PMVRAfA+P2Ti53r0rqquYAwnyUY6B36ZPO6ZgvfS
	ATfsCA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gq0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:04:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cc288296fso7070676d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768248; x=1789373048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=;
        b=EZRWRxExcpv5tZ6Z9aeVeVKrfcz4puHDMNWQ5GfTSk/Pv4lY0BrMTu33mVVVu81LBb
         NUuyQm+Y8hrutgOS6QymGfIS+/oqKcNIST/1RvpysyRtJBcaJVE3kNFcLnHUOuwI7rTs
         1lmof5mH0rhrnmeHPfuTaBJavsoq607reAFxG23t8aBXO6SSCqvlWZtcImfR81YOwMiM
         gaY2JfO+9tGb4fb1cdJchBFMMQZqPYRuV8fS+KJ9p71CH9BbRTqtRbnk7EvKtvCsqStM
         Pt15AXYw37y5m8K65LxPf9zewtc7B0x22NHVRw4b+qSZRzZrC2K2o/E2n77NyVsqYpoC
         ixig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768249; x=1789373049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=;
        b=NWQZwMDZTVcJkrhkCqz1/AU2EAnjabHhcToRhHjci5RKZym8bq/woIJMFZkJxsEyDS
         K4+Qn8+gdDM0JkjMlzkwhFSiX578qX9TmzLTa/0NGQgML0tsPQ+mpbs+uwDf8dGxJVB3
         Z1U2C9Cd96qormWJbg7A3VHF8Q1Doryg71OGiMwwqgX/uF/VYuzy8Lj5DnWCNa6yoiOt
         2Fioa7+Hc6JomsVD/4EVcGjWMdbB7puth7ZBaAp/Z/moW+wIvGJeZZBg/itKoLdq4nVV
         U19TF6OgSYxkvbEJi5rcizxsYjN8BB4SPrY9Yufpftee6T3Vf1+WrXcc2asxlp+SEVKS
         H2Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzaTOTMNQmTuW75cEqfZej07AMmSqUru2EfH3okKqBo8KplNnSJRAe6dxzIaHloTq44nJBv3jv7D0o7ex3M@vger.kernel.org
X-Gm-Message-State: AFuF++lXNxlxqMc8msSWxCS7DNFzjYZnFN+NFohkx81x6aTGAgOBZgDb
	Ghwf1mSYZ3ipZhPoRWO+FW78HJZJoVCYTVPmdT0htC0NRJNZj5K3i6Ma3fdzzczFCSE/qv5T5hB
	GuiHEWD/nqSPdrtkw+/1kXgztO9gCzmA1a94MNdi3uuHuxoIrJuCgo1kttl5JfyHFch9R
X-Gm-Gg: AYBFou1iTUsgxiG2nh5mt/c95TMiWl2E8cxF2wwAHYCoXrbGmhOyVLvpPNBfhvaEPyy
	6i7ecauGK65q5HIugBW5GFk3a3YH+pgT53dPDpfQ2pPSVDGmZojH/wSHjgAAe7QkHpRPoagHwyY
	Y6Jd5FWT1QnVdpmorn8fXvHJKVav+rq9QJ/t9SperOcyuhGN/ZlksTQkvUCLJKRyswgABdcJ9Pe
	L//WCLk5HgPzHJaoolOCjVMNBp03AwjLG2Unba0QAMFg5J8iwNDrjQ5MXk2s2l/Yfw4TxZmaS4f
	9+fnPcoLM70mxVWpk4XgVEEVJQ8bo6b4TsIQIwC3COoB7peI4YmrtS9m0pUDxSY20eqTz022/Az
	Qv5AOWG43vxKMIra+Y5zPUw==
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr689786485a.5.1788768248620;
        Mon, 07 Sep 2026 01:04:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr689782685a.5.1788768248240;
        Mon, 07 Sep 2026 01:04:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d503f96sm423598566b.26.2026.09.07.01.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:04:07 -0700 (PDT)
Message-ID: <92aa00c5-b089-4381-af91-7bd063e13191@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:04:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5210: Publish the OF module alias
To: "hpp.iscas" <hppiscas@163.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
References: <20260905134340.67477-1-hppiscas@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905134340.67477-1-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e6ff9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=UYzP0Bt1LNVb4JyMi9kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Qc16ijEvD3MpYcQ4kD9qPHsRVQ6AQLmT
X-Proofpoint-ORIG-GUID: Qc16ijEvD3MpYcQ4kD9qPHsRVQ6AQLmT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX2ue3VxCEFHjZ
 9LF/E9poPQytwzatiZEdA8Otoov0bpgN2EHWddGsoQT6Vui7i7/wJyT2HAq0JS8KzNaza8VMwCh
 KauJCYnuIK9VdWljgeQ2Cfcmf3jFxYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX0KUBSNxhivPw
 CvkacH6e1Z1aTR/eBXgAu74hFSoAIZoBRbA1HYkNbmfrtImAzqGt8fViOcAha8AYq1MS9Q7jYYr
 MZPRymDco+y5yITNOh/eKqbFMy+TmBfZhdmxeXdFmXbrOct7ATov57qSV5c43pzJelE4K6jfxiK
 heZiCbSOllNyf+ncY56FpIOkQBPENsbu1tiRqSutqFfCxlvEfI0WE/N3Dgi+e4rAFwxxDZYEQq8
 V9lt/lwzVOxxZqSz8TQd2xs+DFugegHMywlAAt3W7XRJrg97TvXpwxzgWbk3GoFj41w5M0MnlYY
 h9O8kARnXC/jpchBkJbT+7ONtr/fNVygdPyaSLO4/6gwv4H/UVn87G6sYZgTXt26Sok+M/lgFCM
 +AeIndN7OFF3qbJSf39kOEF1S96I+jE6PBYlrDfLogYCin5uvZcLoSq75GVpVH37OpetDtYyW+M
 0umo3FAQkG6Ct5EYR8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070086

On 9/5/26 3:43 PM, hpp.iscas wrote:
> The IPQ5210 TLMM platform driver can be a module and matches through
> ipq5210_tlmm_of_match. This table is not published for OF modalias
> matching.
> 
> Publish the existing table, preserving arch_initcall ordering and
> the shared MSM pinctrl probe.
> 
> Fixes: a549fe22376f ("pinctrl: qcom: Introduce IPQ5210 TLMM driver")
> Signed-off-by: hpp.iscas <hppiscas@163.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
