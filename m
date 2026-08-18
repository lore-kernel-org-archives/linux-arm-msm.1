Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B8F269D18
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060409; cv=none; b=KxNCPC4B4FGbXpLzgfSMkal10dcB5umN9KNxBwI6pQJLVnOedj6gAd6Kh6h+PR4UmmD9SQnoyJHdl7guK2dMvGkL1j/Hh2ch3zk4E8mUj7FmiSvdkO8vMM/0xUA/g1EpH9XC9p1eRw8NheRIDoFWl2kb86vVwrI+KzeTEti+pkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060409; c=relaxed/simple;
	bh=kR0i2l9OdS85XhRg13B/Ph3oo+0mTzqC0tAoql6xBQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d91wJi0EDHwbTogxBjT5ko7ISvKn2HoxzhFrQsjrmgoP7VHGZxqUW2CN79TwJk6S5DfdU/2CUl786abNDEUK3a0B2r8JytLCXyIxnyDb2Bi3fUYf+AVEuoB29yyRGejfutRVRTxPKKa8KCmzTHfF5L5X0YcT1g8FlFysN4LZuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTQw9N5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHd5ZwpF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTQw9N5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHd5ZwpF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDcHJT242279
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCY4pKiGRhamcV9wzHX9S3j8IK7dNAsjDICA3a/jg+Y=; b=kTQw9N5ju5wTN5P0
	dgGLsK1A5w5VGfwVFMHPnABPt9+dZF30hltGgktmHcy7iCdf8wMXUXCTs6v1YIcm
	qPmPkSFj/3ldd0FQ08XT0UBplJJSGO3jKrq1k5E1hrW1GOlDo7QL9lGGI37kUIo5
	m+VmG86hM9Ze9Qe1hOcUNPSgAEwjYrg2fW7jfjIdXf3vi/fWSA9zhpZohgH/HP6Y
	QKU/nTl4ww7ayj9oGd41C22sIQG03YYO43Z8FeoV2DNkLVcob0FLUUmQ4uYIvhfK
	Aeg7iFsCG/JIyBom3c63n7lBdKupUMy4umB6vtfF0KXQNi3xC8awGyBc4QXgmRBK
	RqV4Tg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4resg08h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:40:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4e315000so1735101cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787060406; x=1787665206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCY4pKiGRhamcV9wzHX9S3j8IK7dNAsjDICA3a/jg+Y=;
        b=UHd5ZwpFZOycxnR8aOTDoqgYDMxBQDKrKYSeybmSmUSJJY+QrGrzvHMJNsDuzkGbiB
         VhXUH+KHT0oV/mQZBlbes83/o3OYYeg4OOvuP6XWrvuW1Iwx+Sn4fN6I5kTIlaU2PX0O
         rwDXqiDsjuyDaSt5XZS0GUjaBjyJYGU3r3oQ+rfgjj3EyFFVEejLwtPYjCTKNm82Kppm
         Chbt6QNeVahjpkxbWH+GzdVk3ShX+Lsnf7uMoeqEixiQdzZaew9AAKeubsr8b+YziV3r
         hvIjWLR4Rs3SgXEgDRzNWKn2UyohDb8GqljqfIeVoHBcLW/GPjMBSft/zKGhk/W/ghpz
         ccGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060406; x=1787665206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCY4pKiGRhamcV9wzHX9S3j8IK7dNAsjDICA3a/jg+Y=;
        b=f2WqlppSEljgjQMWllkbO2w3mltTpubEXU2hUyCvmSvWW7ywESdU4zq2vR9IfgQhRs
         1V5Zp9Bm5/Eu68lK0Q7ljhqE+hj8J9SIE7lf3ldBwLc/+P7pWn7Gy+/Nk/0wLtL1AF2F
         JrUNOnoD+Km9CSBgXpdT4JWWkKxChZOZb0Bi2JU9Qnw+T3cgwsdAfN8jwIu2m/QcxZ4A
         kesjqr9wCTgeoNRdSUJqLXO+VMJd+GjQ4Jq9ekENpIILpmXuk3wTrVRAG1wCoJdlH0ky
         Z0WD6ASECg7EPTpqfpEKCmZUdwRpqSR4N2w3eN3C3aqrs4Tj2DcemiMJ17Z5fYywNOEe
         vyWg==
X-Forwarded-Encrypted: i=1; AHgh+RpPrBwXNCgcnv4mX0+AbndIaVrilGoG04c5bC+ezGJncDcrRIhzMycsqUU+7N+EGEzgOUk0QL45ZzPwNxvX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+sPFzhwXZjJUyAhG2srqYvZ6Q7m6XsPIKXMzz8rb1ZEI2F3FJ
	3pUPWwXHzK8FSnxCDQ2d9a/I3vUOO8BIu3xlO18plrVHRxj5twKSzvGJqaewCHEls2Xoi660Pqm
	o4udQbB2Ru/871hTJIDtBWlvyK9dhbpOF7pGBf7sLqmKtKAWH8lTUXPZw6OsbCa01NCP+
X-Gm-Gg: AR+sD12JNyjFJ15lFfqEjciRhrRB9RDl4rw1Cmeemzx3F/ya6+eISVlvFEXrjnQOF/b
	j+58ufN+HQe3DrfyAuGyMHfQ3253OONNMikUf1cjhdR8HATyxvYsPwrtpMUtGRiqM1/BxS8kZDH
	o5QDB9CeRxY3Rt6y5GUTmXWAOREgDzhugLyuS5e0pQ1V8vnWZI7jrZKVCNip98yuhV/QZIfBNcN
	MdGOiOL+M5nMDMoWtp+H9E/RoiFVOfY0xt+edouSu7R1dUIc9AHLDA9qX9C58cjbxfNdAygun9K
	N/rOxKHWw0kqcTVWXTTi5G4ic6htjcqh6ryQ5PLlPqauvxidbeNvmLYSwLgbsTBhGc1dQpWA7nh
	f5eCKhXFHNJFTT51PkkTo3vso
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr224934001cf.1.1787060406221;
        Tue, 18 Aug 2026 06:40:06 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr224933231cf.1.1787060405409;
        Tue, 18 Aug 2026 06:40:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc68e2sm161035066b.60.2026.08.18.06.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:40:04 -0700 (PDT)
Message-ID: <22918a4b-f972-444e-bf2d-f3cb0549b8ce@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:40:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
To: Bjorn Andersson <andersson@kernel.org>,
        sarath.ganapathiraju@oss.qualcomm.com
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com>
 <20260806-master-20260805-sync-v5-1-0ff42e9b6431@oss.qualcomm.com>
 <ann0rJhd0T6x9iLG@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ann0rJhd0T6x9iLG@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ne/WEWD4 c=1 sm=1 tr=0 ts=6a8460b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iMgLnehwJSa9vZC_7aAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: pjAeQ2ID-pUyHI0k3zXNjuTZvpAG5eQd
X-Proofpoint-ORIG-GUID: pjAeQ2ID-pUyHI0k3zXNjuTZvpAG5eQd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfXzaMjngZlxS/X
 4Rg8qYX6DPQSXZI6lAYIDrJXrPj0ISfdr3Yao7Dqa9r41H1/vMsZ1WZP4ZxyEU/aCRBi7Wuida/
 ZEJcQwNfCGCAgvxVvOvxaow8bgmAZIg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX0V5nK2FRkS32
 2zO9EUtApqlAUk+iS+aWhl6IMc3gprbgvfzeVVBWoGDIWvQMWx9B1XivxpVNh4rGHPSk8TSrq5A
 BukJh4LeN3RSNZmDfGRMaphc8XxrGxTGBxuwybKZKMRZEYGsWem5CpS4Pez4W2aK7ZJOC7a9g9s
 UVscYiqnliv44cEQV++WwCOcK1DNd9Tq7j4py4lxB78qYnuucrzQ/nFJVprT4/vTxuYwQtyePj+
 TZATpg1XheYR1JtauXAl2u5Hc5Cwo8R7CYjwl0jDVGRa4VpgZL3as4q1hgsGrahr9/U8WT9zjst
 4yR0nsrCTKWws6QIXwuVu2VmpRmq3rEKXhgdz5ZB/MUXwVpQQvrN5Ddqe7rMp7P6mLqyBX2U65G
 9IWC9MXIhd1eJUK8anuFI/8wNlwhfDDXwWeUprtsLqFFW+eXPFUoryp/mOTVYmzzSM0Ve9t7abp
 24Ie/p4NeKpx4rTEXkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180100

On 8/10/26 6:01 PM, Bjorn Andersson wrote:
> On Thu, Aug 06, 2026 at 08:21:36PM +0530, Sarath Ganapathiraju via B4 Relay wrote:
>> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
>>
>> Add a binding for the Qualcomm LPASS VA CSR rate generator node that
>> exposes the lpass_heartbeat_pulse clock on hawi.

[...]

>> +examples:
>> +  - |
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      clock-controller@7eed000 {
>> +        compatible = "qcom,hawi-lpass-va-csr";
>> +        reg = <0x0 0x07eed000 0x0 0x14>;
> 
> The two 0x0 cells are just there in the normal dtsi because we need
> address- and size-cells of 2. But you don't need that in your example.
> 
> If you change this to <0x07eed000 0x14> you can drop the
> address/size-cells and the whole soc {} level from the example.
> 
> 
> That said, is this really a 20 byte large IP-block? Or is this part of
> some larger function? Will we have overlapping/conflicting mappings of
> this block?

I raised a similar concern, but it seems my concern was misunderstood

https://lore.kernel.org/linux-arm-msm/20260804110714.2951829-1-sarath.ganapathiraju@oss.qualcomm.com/

I think we should still cover the full register space

Konrad
