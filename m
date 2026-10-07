Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207E3D6487
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367979; cv=none; b=sMYxKRmOwdzb8zAcrnIB3auSZY9GRSp6OXPyjKQsRsK94V7Kbs2LaqcEX3EZ54n6GVK6sLVh85dMc7LNlxFB4MzoyRtv8yh0zUlPdBAGO6mGrVHGtNKTF4FWCU7z8iMoW1LUR8V0grEd6wGTvCFajPOSnn/j7+eh5/6hZQTLCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367979; c=relaxed/simple;
	bh=IAwDamHVFBlvrN/ewZeXs/nojdLkS/9i8Kn95PE44Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlVDVzDCloVOtf5DPuUcKFPfTZoDYfW9mLZZlDIlLECL9TmM7tYTQ4mKCFxK4ti9gnIg7Gywlmd1xwWJj8pvj2G6rJUpgt6eK0Re7vXthSYffAhkfVZLwZPBdDWOscMn4Jj9TnRHHVHkjh1xh5F9rxYakuUcMRuLgH1s7ztlxSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLe/B9L7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNQQ4U0X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLe/B9L7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNQQ4U0X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977juQ92312990
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 10:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gz/WHM/OxwiBIQSq/2goRMGFNB70MAazikHbrFYtcGg=; b=LLe/B9L75XqetSuj
	d+B+g1cZfUEiuL8LI30NJH5ddWPV1YHNGoXnp2JX/CH0rJnk3QrjdTTtQx9nuzRv
	nBpxQxoz3OPWOrK6sYgGw8E6KVbAso9l9ajg1cBXuBEnW+WcnDfFt2atGLhcBtfZ
	4ByEW83AxdetcYqthiUo8a3J+maX7z+z5Suubu+BwrZa3PBwHgeN99S878m87NYk
	2purfUHvHiiqwNb9CvrZTcB7mSNMt4kAW79oOZv/NpLqh35aHpTcuMnF5Z7Ya8e/
	DGCiNwztfVCPLehM9yAFlKeP6tbOXxyHAUoqTOpzK7cvnqI4dlU3H6j6HniYS3Z/
	12If5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53askwe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:12:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a470ead068so3677943a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367968; x=1791972768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gz/WHM/OxwiBIQSq/2goRMGFNB70MAazikHbrFYtcGg=;
        b=jNQQ4U0XMVe2fhDa5WnBjAy9b98y5LqQYZOcGZbUFrrqet8jPnLMl5wzl97imdwbjv
         u745GD9T5YHOqSTJGkNyjd+HQPYHXRrIiFLv5M1P7Vqg0VGMbNrtJS96QTZxXPcTNwfO
         KkpT8SHa6/ueAsjjLKhVfHrTlSrhrnsgkuVsvjqLYdluxuyIJi+Va52uhRWEc7DKAUI4
         hN2x77SiFLF0x/jk3dDv9ZyF4BdRa6crJcjFc8kC2dxAyB38M7x459txYzAMYcuduDcj
         0DpfIihhQcHGtrRI8x390EdvK46c3mVf2esE3CHTuL6QnXeMkEqOtqI9hfN5QP7zVi5+
         IuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367968; x=1791972768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gz/WHM/OxwiBIQSq/2goRMGFNB70MAazikHbrFYtcGg=;
        b=1p/UJxJ+rnAc9HCSGXevlyQKhOCSIL1jJ8wBFKp32IMxZ2p/+X4zklmWfDB017ETPy
         pR/iKkqmdtXdloQOzhcQt3SlO/mGeR4ph49E1Xq/33iYdCPTjSGwH00RXTNgGOoOUeWq
         q3ruM8dGe6CaWEwKwVAcGEaTyKZFaL0g0RCERv4rH73kqiW6d4L0Ij3fo/EDjLyAiisi
         EkrWvg0BYWRN3fgyGOo08w8nWa9ioJlNVWoC4FobKZuDfPFNZJ5wCF8MtWKfbrKKcaMi
         x6wa/C4VNiFDS6qfp8m+w6Kq/jSDbqSd0D9JLsZqL8MwGk3nTqkHeQEXlPsRaw6qEBL1
         FYQA==
X-Forwarded-Encrypted: i=1; AKwUvBx62RPpAT/nH3uWeokilaEutP3nFPGaq9I7WHN+qd6HiKx8HejkAdEeHbl4kYp7uWrjwQ9iKqMIHhAg3IKQ@vger.kernel.org
X-Gm-Message-State: AFq9FYI6FF4O2F6CZuUbRF3jd7IiDL9fdbDQ+SWiq2XYlmon0PidEqA+
	faiU5YE7EJ+fO+b5yNwaZ8QqzVprO5pNYJoeDfTYumr4HBXnVOwuKIRAA0XhxZ/pcPZbMtB0UMJ
	kzTSYzq+Fv9kLiiHrLns854TycBSNoNRn6nq+xeXMUywu+3NM2CDR/ZN7cjxgw7rlqQnL
X-Gm-Gg: AYBFou0s9SsgO1Kp8f5SP467hcqZT1M5G4Y2wJr6ugfid4Rd02ZgohE49Hxus7xivm/
	DaSSBbvZZrAEHvXmI2Cj23HXx+039mruJYLOKJ+07JpI7u347143t0SPDNtoezNYnyjo553sQSY
	U/LPau7JoLFcXScQ5UNeukaAhoPJDQIwwfAJPg09/YJOVnhY01ARluZbjJSN5V/CH+vNKpUJffr
	BA1aVWOZ8BYetw5875oXcEoiyvl2jSwjPVVZaR7tzCT/zSMMCRvhuNq3/1OWw63Wz7qTHyxCjx2
	2Pl+neuraauqUMQhni06X5SIlObSCheofvIB/FjEExSgriABVERb6rbMJ8j2dCgQPPTQu1FFak5
	dvNYVaXaqZZ0d11zJ93hb/sSBCdhQ
X-Received: by 2002:a17:90a:d646:b0:3a7:9afb:78c5 with SMTP id 98e67ed59e1d1-3a8a0ba243amr1054251a91.30.1791367967938;
        Wed, 07 Oct 2026 03:12:47 -0700 (PDT)
X-Received: by 2002:a17:90a:d646:b0:3a7:9afb:78c5 with SMTP id 98e67ed59e1d1-3a8a0ba243amr1054234a91.30.1791367967450;
        Wed, 07 Oct 2026 03:12:47 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d718355sm1326649a91.0.2026.10.07.03.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:12:47 -0700 (PDT)
Message-ID: <f533dbdb-8e63-4241-8b7d-0a08fdd39cab@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:42:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-1-44e2bc5370c2@oss.qualcomm.com>
 <20261007082515.xmjpa5jjptgrl6y6@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261007082515.xmjpa5jjptgrl6y6@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UU_5vKB6f62WZc7YXNdAU4ZHgCGuIcoW
X-Proofpoint-GUID: UU_5vKB6f62WZc7YXNdAU4ZHgCGuIcoW
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac61b20 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Hgre0dTw_wgs37D_MzoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX4riILp+N73XC
 kkpu6ZeTw+Zi0BKA3Z+frgOs6BZh4XZTSzgNlrhQxDCMNfjt2n2TC1parYX9sgV4HIFHu+FWHmQ
 GN3EwlLKl6Byqk+upI+fODIeRMIj1rRxHAf146jruXhqijO5dESOGGKRrkhTHXztHBFG19aq8Nw
 g67A5W0rq4hHZe9wTIzxJETXr4LDClyKh965Qxa7X+ps3D8gXclJ6gwzTut6yIMh/szu+7z+SIs
 KseOoUsYCIZZ2ptOGC9DfldDnaAPd6DbQlNKfl1LqufGo3TIKbuzclLeNxUBLBPMZ9X3QociTtH
 a4wAWsVRlVogqmGCoPC1Z9dSb1Xt/UxMfZhN4g5Asrzi415inc8SuznXWb0inM4lF7a5jaKyNl7
 nCLN/Mji2NidGZqzi4g7x9AJg8MPCUw/IdqJ2i+NwAChHuMotMYSgIMwX9zv381BFs057w2htNm
 86krosE8/uRC545Z1fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX4KlzoMnnCJVT
 bOR/k9k/XBrUiKeQDCb6AztgtXG1/CJDgkxoAru4t/HCAoKU5Z9VCzXG9lpt44waF5KYqN8yOOE
 q1kOWhS1C5oW4fNcBk9gCq5/dAanHds=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070040

On 07-10-2026 13:55, Mukesh Ojha wrote:
> On Tue, Oct 06, 2026 at 03:56:06PM +0530, Ekansh Gupta wrote:
>> The patternProperties key for compute-cb subnodes used [0-9]* which
>> only matches decimal digits. However, per DTS convention, node unit
>> addresses must be the lowercase hexadecimal representation of the reg
>> value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
>> the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
>> respectively, which are not matched by the current pattern.
>>
>> Extend the pattern to [0-9a-f]* to allow lowercase hex digits, making
>> it consistent with DTS unit address conventions.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
>> ---
>>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 49d2a5e8ba39..14fed91fee50 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -79,7 +79,7 @@ properties:
>>      const: 0
>>  
>>  patternProperties:
>> -  "(compute-)?cb@[0-9]*$":
>> +  "(compute-)?cb@[0-9a-f]*$":
> 
> 
> While you are changing this, original change had * which allows
> cb@ as well ? should we make it to "(compute-)?cb@[0-9a-f]+$":
ack, this looks better, thanks>
> 
>>      type: object
>>  
>>      description: >
>>
>> -- 
>> 2.34.1
>>
> 

