Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491393;
	b=fiUeWeNK6WM2WinSg5cY/ZRBqcorjxe4AGXHoakbOTJFVzND7BH6zJKTZTUye601GkK0
	 yOKO5f80VE+kUA/XBTgkPpZ8E9k98CPwkxwc5tNF/jFwh6IKMRgW0GVk+dLwxX0DSY/hg
	 9W3WJQO7zBUEfzUor5KD/ZXR+FV+W8OHgdzwsY1hsPriSULwOeVbMfQdoHEKXLwXs5YQA
	 p2iNHENXlsrHZM5jh8Xuou+mqqDZpLK0rCb6OzzRFWe9LjQxylExEN/3K9sqxu+rZxNIF
	 QSa8lAPLeAG1JRwlDlbYrjsxCupExHj+XD3AU4+viD9QFqKBJzywD4ku52h1/tq8tFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
	b=aUZMR2XjZiOSlM97mnwqjTMfrICC8lA0Zvt1LAcZr8e55nrcKMEBuuF7qMffO4BQpUM+
	 m48SVPbk6pTjFiy6jVmz9o7/89hXi50h+KwvmKW7jOl04Juu2WXt45ANmnp6ay+sA94Xf
	 yuarqGNNzO+ZTkmi044Jj7V01zM8mk0hXoE41V/BwmDhZoRjc+Xjbx5yWyfx1rDEMzbVV
	 xLE8+onf3MtwJie1ZZazjjbfvXe9ZEBrSXPn0lBH25KDVaYfQ7ZWANneme5EpCeNpTR+N
	 la/W+ExFEhmNElx3327667E9CJhJzjyrFf7UJDTbRigE9RiyiHQ+AuUAf7RBwkbQQww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7m5X7eB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpK7mf0+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D560A260E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E19D560A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7m5X7eB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpK7mf0+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8SRev1253906
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=; b=M7m5X7eB1t4mV70V
	CVRgyiEhRWBi2+jzFZm0kcZfn/KilXnnSV9KfM3336T9YaCxrxPyQ2tb8UlR1cqp
	31hsVz6srU4q6y5GJ7+EYmmSSnTTvNjAw+rjw2FSYK0W68hDqRWTm7a1Zs4pga/n
	z9K2gA/ai3XnoCCgxVZc+0VkjjOd7IqB9n4687tBeQdjnkGqzwftNcUad1whN8xb
	Xit7Sw2/izjW3e8TwPpj/9zcUY4KGppNggJqh2rvEanB1Jz0POCIQY0HN5Op8KKt
	7g7z4yo1yiDPDqXQMydBrWcnjSKjhGtWwKIdKIFnJJTlVmYWrA/Vxf32Ih77EWc7
	Ik41SA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5na0kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso45331285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491391; x=1793096191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
        b=KpK7mf0+ln8S9o+AYHdf/5Qge1jvuO6z3SwLsGhapaHa64XplPWXiucO5/plflhG1O
         p6X1pcawiqve1c4k7TZP4Zc4T+gPcjhn0vUirBS2W0xyRUijcmLVWXo4hldOg2AuQABM
         0fJ1QGU09nh/sZVuQT9v6qDNLIHuu0GLWsvX/S7odYhkmwUnXoXHj0V31HAyg14T2VQ4
         WYsOwXP7rFeCKe4JImvCuTX9glDBtRICdUN/agUqtk4Hq87yZShX93NKkgOsL4sspaRO
         4H1cCC8LQU1rufQBUcAaYBik33fnFKur8/rwqtY8oQ6PdpjHb4EYi626aJJJ9zpDe+fJ
         RZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491391; x=1793096191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
        b=WYhjTrSYwkIWhe6OEoms8Qx+Y63VIzPvgANKWNwlkFf7taSjEZZinrH6+Bnj/adcWY
         UQ8cdLmOsHjgZN6Agjot/UFWLW71krAaJllKDxFNBLp4fRJfC+L63VepZLSC09xbpGH7
         dr31FrrGJ6fBEpifSwvhsvQQnQghGQhKr6hj5CK7UIRGmHaDYfIoaTGC/lrWEbb/Bn2C
         KNghd33Hfl5gMC67eGlPNGJ/omnVh2l0T3fS5g8TOKItMMj5JbOFGJ8SRZ3LrrjXdXxF
         PO3sndzrn5uc6YATq6YyGkXtoijXMJm+m2unyNbRJnbgPB604j1LBcLiNGtoozT3sLUb
         YZBg==
X-Forwarded-Encrypted: i=1; AKwUvBzsz0jMmeoCEnGOcbie1qe9knHtPXGigEjs6dT2E/n0yNfJe2uzZ1malGeFIz/dwBX5bqMrmT5Z60Tl5uJS@vger.kernel.org
X-Gm-Message-State: AFq9FYLZeGWxP7/6zU2898GAgXz9/xg2Vqw+CDJpqvIm4VSWP/m71Cpc
	sVsiXeZ9zjSgp7nBVAEGdIYLgiEjSVV80R3Nze+RFaLD6QwGJMCLLk3LnHvIw9epiKqrxwD5eo/
	08B1sgfXszjK8KoGuSyE1l2s9cGC18I2Nq43zHwpL5Mn8eV73w+klUTnMxho9wPjZBDCMJAKvDf
	jr
X-Gm-Gg: AYBFou34e3avp/YcvxOcNMZ34TFLAprv33Dn2SMlrPKe0ltNulrTgcj6SR7XX79Oz+7
	hsX9IY0nQ2NSoeKRn4an+s09iRcvXHxxZO1+Krimfgah8rOHFzZprpMkqbHD+rmycxevCNM7h8M
	CEiLhicsGvw6YOYWA1Zxx1nvsSl+mfSDiEpLE0RMNJY8aIakBcIzgin6tzwgCeytSNXSbpaCy3s
	asAzrzNiQIjDSfUs14x4J54H4HcYClLYuK42ghKIjZaxuIHUdnkkyha38A/DH25Ft52Z8IvzPEA
	dgpqOmfzfpJOdr+16zLXn4GZLGSi+MYt1eHq52gBmY74RTgXBno4eGdfmTY3v6EdL1GWMDkBHjn
	NRsj3duHO7IX+ipoYKuHVew==
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr1977420185a.2.1792491391043;
        Tue, 20 Oct 2026 03:16:31 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr1977416585a.2.1792491390567;
        Tue, 20 Oct 2026 03:16:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm468649366b.5.2026.10.20.03.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:16:29 -0700 (PDT)
Message-ID: <40a4cdde-6eee-4018-9358-2779a9fd7328@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:16:27 +0200
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
Subject: Re: [PATCH v3 3/7] pmdomain: qcom: rpmpd: Split SDM632 pm domains
 from MSM8953
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold
 <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-3-95c47d0f26cf@mainlining.org>
 <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hlXuitg1y-rzb7KfRJRKDMBojyDp32x-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfXyKzfIaDGTZ1X
 szSudJizznYIgLDidD/ujtvS3L8k1tDO4MT/ZqLBUfSnU0gdQmobA83MUdvgsvTO3ChP2HT758u
 co+jAcPn8pe6I/J2v+PqxMp5RLCC3nJPKEhFkcNdJb8CUEqSTqz/73uKTW+ZQiQx4I/96m08/SO
 mgeR/cmHpPgoCI45URnUDs83j9JDUeITOGQkxUAIyY1pkCEojnj45SdUmyt32IrTkkXiBDXGmrg
 EXkFFyJEkCMBd0rNBeAt16z3XbGEYKFYozXN0YorZn9V40GjVpysZmSLf9kHjMgp2XPURdW/JuC
 265FkHWJre9Wdg8+gkoXvWO4+ERceHGc5xJlcAW5hlv+loLvGs0ZtSfbcLP3a4H4V681qeqE43m
 ejU0eTwVb/FFSyGl45fueLvZ9h2OVkESiV2BKBBZHN4Jc/Rdb7yiLXBxHpqfyrjfBw+h0r5VfrD
 KXmF+xbuaV2ytFGdRpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX7R8IcBcnHQg/
 YUE5kJI57lmsOahzLaJ/sry9p2ZVnVPeVaJJzM/BX7/vInFlJOXOVfTWYfYyDQJ9l0luZRLmPvj
 O/iy1l9Lhkizi/WvcWKd8WBouFKwEKM=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad73f80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=7gWwhKplwqCMDIKiNsEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: hlXuitg1y-rzb7KfRJRKDMBojyDp32x-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On 10/5/26 9:04 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 02, 2026 at 12:38:31AM +0200, Barnabás Czémán wrote:
>> Remove modem related pm domains from MSM8953 rpmpd because MSM8953 MSS
>> is using mss-supply as regulator.
>> Split SDM632 rpmpd from MSM8953 because SDM632 MSS is using mss-supply
>> as pm domain.
>>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  drivers/pmdomain/qcom/rpmpd.c | 29 ++++++++++++++++-------------
>>  1 file changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
>> index 5f55fc791131..c37a79d6bc43 100644
>> --- a/drivers/pmdomain/qcom/rpmpd.c
>> +++ b/drivers/pmdomain/qcom/rpmpd.c
>> @@ -503,19 +503,8 @@ static struct rpmpd md_s1a_corner_ao = {
>>  	.key = KEY_CORNER,
>>  };
>>  
>> -static struct rpmpd md_s1a_lvl_ao;
> 
> I'd rather see #define RPMPD_VDDMD_AO unless you have a good reason to
> drop it.

It's software anyway, and I don't think there's a need for
"keep the modem power domain oneline unless the cpu is
asleep"

Konrad
