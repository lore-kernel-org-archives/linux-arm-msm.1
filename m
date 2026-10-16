Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165240BCB2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144111; cv=none; b=aeAN6aBBLUPtt141IP/X1HO2oOoOl6ZlxpV/v1xSpRGh7XZJ9fK37NvAKhBmaVsNTgdTjjrbsDgVO5VZNV+6ZhYg5fbrTk0SVjKM8n6o6xeo+WZxlc167UT4gz014OSC673GPpS/v/Enh6dFu2n072upw2fG7TlriX/akpBKFKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144111; c=relaxed/simple;
	bh=IPB0oQRuXmO7WrlZ0VQqDmLES8GViOkLv24cXWQmR8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJaZXRIy0+rADDHpDcBR4zzDMBHWNk7d5rS0zxgSq1zlYYr6ai5KTVw5Ueps/Hv+FYMNaNy+pEDBd5npT638oCBMDNs0PpDMePtfd4izb/kD1lJgy3zG7zW1SLEOas7t9nT9+6B0a5BQzxDccBYKwX9JNwsGDaQmRR9x/1aVXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSb4TIyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpfU9x94; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSb4TIyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpfU9x94"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lbC12815564
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=; b=QSb4TIyWpH4wxXgH
	K0gXijTyO6bMed+/ymp6jV1C75Aa6WU/VXXbw8e6KAnUXVPhuPsVytnCzU7W6Sdo
	JkZfwv8uqUMW+giH6QDETVu345ny+kR24LFb/iAKtrUE4MTu3RvMHCqcZUJy++D0
	fo1zr174gi3IXyz52a2c+paatz2acUO4QY63dXnpLv1ZVXeLgfTRRcWFudjhMxA2
	cFpfykhr4hktMESrGURyuNx1wcmG2xPqY3woU90lCj2yIuBTwnfR34H3SsrIOxQt
	/KkqUjy1LyKQxMzMhYcsG6zkvECeIP5r2MBlf2wTsm7vBczhxYaloDEirfg+rgmj
	sQq8+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11ysm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:48:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350d8a2368so13769831cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144107; x=1792748907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=;
        b=FpfU9x94QfHZYyz1qGZwYuPZ2NcY/bgIbuFh6arOAD1EQhVnA8cpv2klxI4mr0vfvo
         Uc50cn3kKkpty76nfmlqEtYL9xXkF8+ma3ZiqquzPeN/vIRIHByJ7VgrxDWgX4ed7ChG
         p92QvNJUNyqsaXOfyAKDXY1PPJ2ekvKIc6rdwrGYyylVtgIfaGeEqu5+LQwA8KKDFzzi
         pXi6VN7xcNrJ7cAIWv+yvjFyDZkVF/D6ZDX/ZUI8KjFn8ZcMHou06K7PK/qvUDvURXkF
         hsppl8dowHsjhywOSlsxlTFhCpXDxtMKCucrUGiNwBY0t4sZMinMF1J+n4sWAkIgVK90
         B7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144107; x=1792748907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=;
        b=luODTutKRfiuWDcUEhwUBAARjmDpxN+pd9u/WcbhZuCv6EVW+QBHfUuPAStzifFb3F
         SZv5viZYfwP+Dwp/Hhb6ybq1/afBtUExU9KPCt4/oajHfVJYiCr/2vfnMg/a9LEqi8WA
         QwZrznJnuVXIl5uHn8I71GA/mfM+BgHHxEFcvbfksY2dbrdjNzusaVLG9IwlpmUdZQaF
         yFWU938WOqojdgaXNv4DUNeHBilfZwhof/h5+pBgfN+o5HRtDmLi+ANSlIIAiFyL5CC7
         fTgilVZBYpKpUUOxqFIGzFzh60M/eqqx4xwZ5RN1bOM9c8/yvTr374L6nK+TyaUIk9+/
         7l5w==
X-Forwarded-Encrypted: i=1; AKwUvByjIuIze3L9DPxNr9OIbeSrwtjltVItKEek097ieuOop09DBV2CSxyCwJNOMf8sz/1UDc1ekKMi/x2BExbA@vger.kernel.org
X-Gm-Message-State: AFq9FYJLzB5PLRJz4rQHlhS7cb7Q90o/YKd3O2j5t7gdO8AVmCUwKySZ
	p3Zxp1UT0YtsGj8/alt4FrzFfbfLHZz9AweR++9o/DBOngkRuspta+AhEQwbZPbZ1BzF8iwKtQk
	LFIyyzky3eNhBCJo+FX+BqFvv1WLlBpgn+/+PwQV2z3HRFHIHdUw1qbA1XKyksZmTHMqX
X-Gm-Gg: AYBFou1jxnaVlSj0M7RafiIeUQL1yohQMQCcTYNoyO81yfz7nPqGmwEXARWXnf/IVr8
	DYQujRXN3lMT0X/cwCRN/pKsBQxMtfRfuP84/1V5vspkie5MB8Lo/ARPy0He/43ahtFX2wyPoVq
	HdKAaEniwya4G1jv4vQj3OYL3qLKmNBML3evkMJqiRkomU8hSoMOqPVH+UJleUaECxIo0lgtMd+
	CWDyvuDjCVl5JidURImSv5eMZ7Sk7Mij0gQH2PBOHM7VWnjL+dgRd5n8ORyyrHDf4RnZqVVAjtP
	U7TRRUFo9dek7/B7QaOD/5bBPd1SC+y0QpSUSMTV0h6Z1FkRJC2q+PktlfxwU1Xxr7ifvkvMFLV
	t+8YhlJgnO3gsGZ3FaGgN3g==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr283776561cf.1.1792144106555;
        Fri, 16 Oct 2026 02:48:26 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr283776191cf.1.1792144105858;
        Fri, 16 Oct 2026 02:48:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm57355066b.11.2026.10.16.02.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:48:25 -0700 (PDT)
Message-ID: <aedf3717-338f-44fa-9fab-9dd167aed1b9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:48:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <43344f93-26ec-4a00-9249-6eb9423759c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <43344f93-26ec-4a00-9249-6eb9423759c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m485gCTceV3o8CSicCtB-_h50dMdvi4c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfXykPVXThFBK2m
 yT3JM1yBHci6CAkVwJzJLtBhRgsl5dYJPixDxM7+F+i1xRYvR+y0rjHvwsIBtQEG05SmxYdw3Lm
 OjosXudzh3OkFKU5NQ5rzPgPBilrp6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX/YZaoEo8t2h+
 +CSlQPg2dDqd7E55UwRIbdh514sLu378eIakozP+iQKU4Fwoe5CUO0Atxaz2BZY1kdfuIFmnG4a
 6NpVVKUSVdgeukMdtlVu6exUaqpPc074dKOkv4d6Cias7HibppidE8C7NQ9+zJuIdJDsNFrPY5Y
 /BFoA5mbi69ue2yGEALMabYyx1kPc1uN9g7Iz7FWdZeA5tpAclgWwKt+M4Bk+FX47V9vkU/I74q
 zSs/1RbPT5pgPr80BfnDjsMCliRM+E7lsTxe5DcIlCNSqToRib3mDUshpsxvWD3yexsGEiibPt3
 dkj419uyo0spmERLz63doUIUyyh9ne/YHgeSusZ4qJz0zzx2Z1ND7TqPfkVd/jzIhvmppVfRVGJ
 Y/cOcXAKg6RlQru0keebgyYflZtFf0okLMNVMO90fkW7BVjQUQ8jWsNY70vTNAzMD7czZUo2LYs
 3JltQwbq3shy2/VBR5Q==
X-Proofpoint-GUID: m485gCTceV3o8CSicCtB-_h50dMdvi4c
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1f2eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=N_Gd9SB1QsfJXT2d5d4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160038

On 10/16/26 11:44 AM, Konrad Dybcio wrote:
> On 9/23/26 12:11 AM, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
>> controllers are required to support audio playback and
>> audio capture on sm6115 and its derivatives.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpasscc: clock-controller@a7ec000 {
>> +			compatible = "qcom,sm6115-lpasscc";
>> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;
> 
> The unit address must match the reg address

with that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
