Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7330B48425C
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860498; cv=none; b=mVY/Gr+FIl/EwJDyFy5P3McX99NXQV3Yn/JA4Dn6l0JIgTUCyEyXvycbbt5Ti7kA7EqI7gfOAiw24XQFDSLs/hfdU36KTCtXZdVijrJo/PBtoMt4MhVwc4xmYC/1g3ErWXPD1072kVnrFzFrNzyGT5hEOPd0OHevJ3nr4E7HwOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860498; c=relaxed/simple;
	bh=aLYJstDJeMfrU24y5GHb4TFI4OXo5/ub1Q01hAshd2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWnbz0UBJWXZMmh/afuW+p+IaDfmWEX83uz8yyPZtFM5vxvXR4JWAaxSEgtCJlrlHk9zTAcMNTiio9L+6TpFAyhs/0fTU+wLnn9IYwrizemdiBzNzy5rc0Hq02mwX+ThEBH8QyXP8KoXYymC67x6Oxd65XGfFtpE3PajaesS7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwtyXP65; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjpnJuk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwtyXP65";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjpnJuk/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Cjwn71933074
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 13:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdVvxn/rNxjV2Wxk0pSxtdz9QKHEvAiBofKWCfzPRtk=; b=fwtyXP65Z5tghmlP
	LiMq3NpSZJze1bBwY97yIzL5/6CC6u2acyzhIanCFBUYSqBWipIxfDdAl6FljVxl
	yPdVVqi21AuWBZMnsUU79G1CdMDS1RVp/zUK4+lcMwDU/ljuGoN8piUE+GRAs356
	IprWvvG5xpr7kqaP7muevHzY410lEX9gJ0uYM2YMkNDzjf3EnQZr4qNYId/XEE+O
	C/ATJDYjXKER9xdCkb7rzP36NzvOz5NrYdRbzhNr/Y9NRGUNg2Y5yF9QiYhzYeui
	OoKyK1X0r+0NpklSbG2YEUJAXu5fgo6pk1Inn6buMFTmIQguu6FM6NUPmsUwQ/PC
	j/Se+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfsp2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 13:14:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e305755a01so10855285ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790860495; x=1791465295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdVvxn/rNxjV2Wxk0pSxtdz9QKHEvAiBofKWCfzPRtk=;
        b=JjpnJuk/MNV2B6YvA+nQ04BMH7yoTl8amw3K7WxT3Y/mHo67VIZchuCuEElgbZGQ2q
         JlKst3O9WygK1Zq2z1HFUjUsf6frTwjFsVJb5oSAIJRGnNtlOMPRUvhdDUZfVGQA48Jg
         RdDXWv6kVGUYoa7niK1ul55+TvErz61jdOW+KF/HNumqmC3AQM7Xh44l81d30ftNGT1e
         /GDpS4tfnls1XBNy/YhPQ5igunjffZVyLvvQesiirV/xxA7LyfBQKz/CsRL01WbASikZ
         +Ag8oSYjqDZ9FcrruWqOFk4ki2dCuJs3M+rYlDQXhqM3XDq5P181yQaE7KLmbcOxj41t
         wdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860495; x=1791465295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdVvxn/rNxjV2Wxk0pSxtdz9QKHEvAiBofKWCfzPRtk=;
        b=zTASnEreZAQ1hwKUuUMngBqK+23Xp/t/dSv3YPB/GTG1O0EBurwYMqOvBv4fmIeYbC
         2Uu/O5aZPJlyoWQ+UG4YsSE3kUdNQxOrrFe6fiK0tAqyfytEsLQ3d0/8fqJjqOPaRxzF
         r3ZE0ehW2Lw277lEafnrdGiivGem4LkW2OPc08BRV0M8dYYmQXARhbuimlF/ewMT9BjZ
         cPWg4JeZFNPxT2WYnr4OThumMKYuhsKBIKmxnYkwVu+b4bVdoBUQnhF9WUV/dPqnoTNB
         OFeW4TNNNMyCRqrMUkyMPXXff9r1XTbvlifYJ9oYBG8CB7Pfo4ABP27XcK+jSk2lbf4X
         dnzg==
X-Forwarded-Encrypted: i=1; AKwUvBw+0cuzgyqGOMaNlgYXIpHqGWemio+bni1y3y0S/1n0v1ApstOhDBy5sr3Ul1o3XYPxjMC8ZX/YPeI0Wl/6@vger.kernel.org
X-Gm-Message-State: AFq9FYLPrSgI3QEXptQzj6y3BYD6LAgRc5YWjSzslR9FQr1qob+/DChS
	+XsdP/kZRKHvbh4uzTIVCnspvKJ55m7iXszEMC3amyhwUMOBFqrAD68AB1By1lufFTpOzIrzunP
	1C2lvd+MiGoZdI4SB8zhfj1ZxPCz7JgC4B+6x8t4bjSm3PxSkUAXf/BJKjjs/ZugD/O3t
X-Gm-Gg: AYBFou09K/T/ramOrkBBYXKeFGrz8eqQroDguLAZVpYgMZGMZzd8UHHcyaswKsWbKxz
	7GECneTn7QLgkf2+W9117+pdTjD4SuUf9zH/Yj5hvrtWC6WgRSZEFRD9enhUKc66boyRHEiQBAU
	MW1+OR0lL7MywiduSXPGVXK4gSsUsrRscWjV4JS7vjwwdSFBkRhSS+BSiacR6NAKuFkh9FrC2W3
	f+aMtmMg2ybPym5A8Pz9KnmVHBJSupSJcrspQX/VM3IPuAXeq21717+drX0ER6R8xdPHIbA901s
	SXr+6DWYowxY3I59kEi7qRk0h2vfd+4cioKvbVtKJXM0MIEIc/ub6jrxs3Kc+EjIux3sOINkzM7
	XBgmY8tvhU8KeRCqc1yiXbQhbFejo
X-Received: by 2002:a17:903:298b:b0:2db:55d6:349d with SMTP id d9443c01a7336-2e2e49fe3efmr39712845ad.21.1790860495066;
        Thu, 01 Oct 2026 06:14:55 -0700 (PDT)
X-Received: by 2002:a17:903:298b:b0:2db:55d6:349d with SMTP id d9443c01a7336-2e2e49fe3efmr39712635ad.21.1790860494592;
        Thu, 01 Oct 2026 06:14:54 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b04ccesm10512655ad.48.2026.10.01.06.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:14:54 -0700 (PDT)
Message-ID: <4bd4199e-8552-4686-ad85-9c3e27b1f967@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:44:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] phy: qualcomm: qmp-combo: Ignore Type-C
 orientation for Glymur DP mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
 <rp53rdt4rseek4cjmyqhmwg6rm25nnm7e3p2qvmjkr3l42ymmo@25os6fta5wm3>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <rp53rdt4rseek4cjmyqhmwg6rm25nnm7e3p2qvmjkr3l42ymmo@25os6fta5wm3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MiBTYWx0ZWRfXzhyw1B5FKzJ+
 zaijAdMF6bb8M+VFydWhb9XsZFjbcrrimbnrqUPQwEP6PbI01S7ZxXwwrlJuieOXSdhu9XVRPz0
 6suOcRUuXbaG5fGwIf3cp5zuNdXvLv0=
X-Proofpoint-GUID: 9nUOpU-AiTmCWCD2449-NEF0uEVMMGet
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe5cd0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PCPe1U30QhSBGYhJ7sAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 9nUOpU-AiTmCWCD2449-NEF0uEVMMGet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MiBTYWx0ZWRfX92S/pD0hx1bA
 cuENOOu1RQJkX6/B7JXanqBRf3dFWv4925TNexBHXcSmTbSpfwDn1E5/Tx73q7gSB3wo/6tSMOn
 6jkq1AyD7VcuMtcZ7hgsMRdmJUUVNNM8n8noOma0B+67tKzXwWOe70C9RcWDXJ9t9fUwk4bPgR6
 ecKM0keCmAAvhTdUcaSwTO9RpN8XQzVTDLuDf1E7PgJrJKd7+3pzyGySbHa00TL8AC63ApTPHBp
 bdB7Af70Er7vWJSDE/TE+rx8B8NZjEYZTSx92eo+0SRmQtO8PIYz2+XfxORoehdgzgFN23hHuFh
 15A3nkzQS6GAckCjbFIucRwWXL67xk3Typ3G/BYdy9Y0FJeNyxkRa0//G+6idErCAuv876/Dwyg
 K6Y3vmgIlCuS6JwrH03omku6HwreRDrnn+VMZ+NaHQ7LLgkeZwPsZeJ12t+IIqrenmPfNMHvAPW
 jSIi0wYE34pHzjZA3fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010052


On 10/1/2026 3:31 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 01, 2026 at 03:04:21PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Glymur platforms use a fixed DP lane mapping and do not support DP PHY
>> mode reversal based on Type-C orientation. Add a configuration flag to
> Does it handle orientation somewhere else? Where? Is it a property of
> the SoC or is it a way how it is plumbed on a particular device?

Hi Dmitry,

This is the Soc-specific property. As defined in glymur HPG DP_PHY_MODE 
should always be 0x5c

for all the case 1lane/2lane/4lane and for all the orientation 
(normal/flip).

>
>> ignore reverse orientation during DP mode setup and enable it for Glymur,
>> ensuring that QSERDES_DP_PHY_MODE is always programmed with the
>> fix mode value (0x5c).
>>
>> Fixes: 815891eee6687 ("phy: qcom-qmp-combo: Introduce orientation variable")
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
