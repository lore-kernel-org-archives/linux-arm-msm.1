Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394971;
	b=s6cTo50LMCTYGggVGWjm4GtBQsdVOPHus8xtUT41WAtDDgiViQhGXOny+c1OEdCJPMVi
	 P16mKNnAJm3JtugWf3ZP9/9H+k3OGUYb1iQHCivziRcoWL+b6IJB64Lek8BYP58XomaRI
	 o1n6LwjwcdAx01NcBQce4Lv+HL/jk0ueyAhccpAz7aOfj92rq9GwFzYWvpymDVqdoihFX
	 i7Ym2U/URNIgcUTr5hM2uuyqkzDu2uEXuNJdpJuEif/DXDjD0MCkOj6ekAwizgXHRuJ2V
	 VdUaA2qqQNqlKqs1qT3VOaeEjVxrj9SIXzm2tc+5k86taDnbVAREN7+GeseznyO8cXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
	b=IMsxyx9DEE8SwFpcHLcnXDpXmLdf1BEPRjica8F/7/j3fIUJ2rz+LyeCxEX3VBMQViZS
	 nICVbiLI0+JyMf8wGTCOPMDv/tvIlKei2U6E9F37LVOP89Ei75k42AF3DItweeNabApdG
	 hEuqIyXGpcZJ4BE/CXiGJjv4fxE71ympftyv4/yvn6oB/dQjLX8eyIYG3AyHdcAqK4nvq
	 tMVhihnEGRUt4UqDokWeuOyxPf6RLfiCG1VYscnpULzI8wGPaZ/tXvgwrrZDKeNaWpIXC
	 FxZLcPap/mf7HkKmwxF0kkGJO0FAieOC+9KhGJdWeBA6p3eQwLE1hpQ4x74ecBF+9xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGhR98c+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W20JyaN+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374DD606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374DD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGhR98c+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W20JyaN+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAWNQ1253625
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=; b=jGhR98c+jZQZ19n1
	EGXUDDWVe1dFey2lsm6xqJ8+g886G9A7zzqLyQ5Q7Ze/91w+4ILdPec9ULtbfm99
	DTntH+4FIDCTIv4tlWBBf9M//bXNajzo+PTLphFt6/SQu6CH3nFoetyEjH61g23p
	NCzcnuoODUEgUTqEHqvQwwhPutPDQN2+PRJsAQEPhhRw3EnkjoXKaS2mXTk0TKCJ
	prqKPxTfbwBTOXz6+WqKP3Va12hcMtXenvCIRTWGqPI2qtCA3JvkJ1q11DqzAlXA
	6Y+a9EAkLOJp/Bv+KA5rRsJo+mUP4TiDDSg1C5y3as7C3ubLtKsNKnZ7dh20Jl61
	jNGfnA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x000n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:16:10 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso1271489fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793394969; x=1793999769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
        b=W20JyaN+v7v8cz5LVFO6drgAYOZT1Xs4zVuVv65bx1Yfrng+zGf0NEjIfrxsGNCUSe
         lEXkDWJbaukosMP+Inv0CAGSPYggl5UpSmWlV1KYTDuG+f9JO18Qx7NUVzNr7LE5UJPg
         7JxZMZAtcPu94xnZbxRCcoS0x4fEebscSsx+x6rmsRMeuoRl5vHuOm7OUHkuScaMK1Er
         IrOnFAzCAjJXKg+/lZwrkxgyztq8aT/5eHXjB0PJW0z6kH6ZZGz9ELJV8KAADulX8OQ2
         dOGM/X2gfvBIG2/CKY9fmb1vz3tkVSobrcAOPmo2bJo3hmfb9cgfshtaBUhxsHKy8YD5
         YnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394969; x=1793999769;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
        b=twmr8kxTfG0TvjRuriN85cgJM5aIiSuDfVVQMYIpwd1dAkdaW8Gar8nqfcVw8pRH4S
         0u3s7XT6d/gQqP+Uj23W+PzepT3hhNzE6yL+6xw/WtXEDK4x1rbpuUefzV2CWdlA8uk3
         8vzwhnGU6MT55l1AjFLeRvZ5cKokm/Kd5AH34ri3JFeVMKauDwAS1jY9E4kid77Dtrox
         DoonarvsR9UXpMMAWX12rL1W0QV0ROAaTCqIF1VOe9p9n6rs9NyoBIxOm8kfI+l+xrqJ
         AJV/WHjatylFaLNjxaf07ZPyplwk5zHqWe3I9+do4cfnFZ1ilbOKGbn5J6RgKLqKfSDn
         pwsw==
X-Forwarded-Encrypted: i=1; AKwUvBwUIlqRi9nTvyDgADZACuBALSJ98D49VGBrc3B0lvTvFUFl6G1nEpFX2VZBj3JVfcXhIhTk59xzXdArIiaf@vger.kernel.org
X-Gm-Message-State: AFq9FYJmcx73wfkgVkeH/3u8cOdIqlPQr7Z+AshAO6JNpV/oPKSJNGzf
	MtObAt/D/qsZjfg2w2ibqHsZuOwER1nu52nWRUp201755fwasYp0uOcFcxL/w3MbNP/3v+jwrBK
	A6UybxSAXlabDuQbx1ettVneYYShOIpYi3kNPWvUP7SSBWUzifWEcyBOvg/G5NlPYVlXV
X-Gm-Gg: AYBFou3p0a2ddTK5jphbleOYWho2P/pSfsUmBrj0RJhWVlpBISR/Sr/gvk8gjs47yYM
	P32HLagQkTHk2uQEYZbfjt91VjuhiQXnpQaiUk78npqOFv7wCGD/+d5hrHRYvuayQhv5gTEHFSx
	ihYYCHmxmE+XGDLTJxUlFmrE/CyNDuHc9y0Grmkro0XuknV+3nbfPtSZ3RNBwBaoij4h80aXj+3
	NHyXUCm49rAagvP4Zi9yBsfPX9ybAXo8A1odDFPcLPC9BUnC75ZtOBPDf7G6u5bFhG2cd+X6IE4
	xvb3+WSTTOZqU7stjkjzfPu72qzyqT8rwsRtHTuZV4+7FkdapoWW3Ixz55luEu/lJCrPOcebUAl
	Me/Nju1hPkp6sUK3taHRWnpMUeG7NfLBzBclBxcijdCOagQHt2j372gm+SPXZe9zr44Nl3UXorn
	4=
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr640136685a.76.1793394581414;
        Fri, 30 Oct 2026 14:09:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr640132085a.76.1793394580963;
        Fri, 30 Oct 2026 14:09:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm178757295e9.10.2026.10.30.14.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:09:40 -0700 (PDT)
Message-ID: <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 21:09:39 +0000
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Le Qi <le.qi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
 <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GZrgGJgyBiPmLu4Sqbwzr5N1e9_BRtyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX1p2xFQyv73Ta
 a76S70/y/ofH2qD7qCkcb2KvFCERS0HAJqa+I9GfsYGS0/uW1fpS92tKiAfgg7q5VVcCD+qo35E
 jPOQT0aiXPsEfeb22qIQMl+pxB3MUu3mkH/bvCqLx6mUgvNl/fwy0srjGoz+NTXOnnXxpkpgBdB
 ujE+I94RQmbcgKYT0llQwsiWEnze76WFs626lbfC6abIqSRMDgirgEuA/HuQqIaS1OpWJdJNEUP
 0V7lU8o2Yjube1iJOK4+hPtOWVs7TAIdA6KiQvwPWtPhfMIteTPWmN/J1GAGfD8nJ0YNRuDWZwH
 xz50tqxVg194Yb2oxA+8vPtL51BXhUeqW5EJEMtP1k+v4X0khqa3poQcAyUOeVVKwwL5p1x4P9k
 mzJf8S18jF9cydUOONqdvXf6H5vTw+jd4B2ejF6R63tRd+Z6u5JYtRnyRwUeQ1tM67TyQ/U0VYZ
 I4r2klyjsDpUJO23b+A==
X-Proofpoint-GUID: GZrgGJgyBiPmLu4Sqbwzr5N1e9_BRtyW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX3cMzSb7oCAhT
 wbug1cNrEHYbktLunuOL2yVvuXeegkBP6c1geMVk3WzT8Ht2rKAWjUeLuxbuME7Zh8iUbo4Zez9
 0d+xwcnIQP7fwvDbWv9d7jZMacqjGsA=
X-Authority-Analysis: v=2.4 cv=FvOQbGrq c=1 sm=1 tr=0 ts=6ae5091a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cwMTcsmotyg-k-KcDEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300084

On 10/29/26 3:27 AM, Le Qi wrote:
> On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
>> On 10/9/26 5:04 AM, Le Qi wrote:
>>> The DP2 DAI link is missing from the sound card definition, preventing
>>> audio playback over the third DisplayPort interface.
>>>
>>> Add the required codec, CPU, and platform DAI configuration to enable
>>> audio playback over DP2.
>>>
>>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/
>>> boot/dts/qcom/purwa-iot-evk.dts
>>> index a811d8ca2dbf..93cefffd1f46 100644
>>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>> @@ -641,6 +641,22 @@ platform {
>>>                   sound-dai = <&q6apm>;
>>>               };
>>>           };
>>> +
>>> +        dp2-dai-link {
>>> +            link-name = "DP2 Playback";
>>> +
>>> +            codec {
>>> +                sound-dai = <&mdss_dp2>;
>>> +            };
>>> +
>>> +            cpu {
>>> +                sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>>> +            };
>>> +
>>> +            platform {
>>> +                sound-dai = <&q6apm>;
>>> +            };
>>> +        };
>> Srini, can/should this be in the SoC DT?
probably not,
1. because the dai-links do not have explicit disabled status, so these
get parsed
2. sound card itself is board specific.

--srini
>>
>> Konrad
> 
> Hi Konrad,
> 
> I think it is better to keep this in the board DT, since the sound card
> is board-specific. DP0 and DP1 DAI links are already defined here, so
> DP2 should be added alongside them.
> 
> Srini has also agreed to adding DP2 support in the audio topology.
> 
> Thanks,
> 

