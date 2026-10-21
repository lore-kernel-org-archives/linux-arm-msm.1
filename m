Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590621;
	b=JdvkqyHqUSR8Mgzr34FWaQlbnFifiZZabz4ffqciTCjIJU5IoQCCa5aMY8S5hEs2wxFn
	 g0Uea+pkVtB561ZUDRV7ytdwFWDmREx18zQeAgRRQKYh7B9MRCf5F4ePRfyflihPF8kUA
	 AygQUSw9bWpqZLwaFJ8q6J7Tou2Bmfd+wu06livKvJPOvalgUQpWlIB9DiDFUFP904niW
	 pIzcMs8m62U0YFIJIFAoaqo1gMDqD170D9os3Nw59uUs5/WLN/6ajI8pYp4ndfdyxZOUD
	 UD3/NRxfhvUkebO4UtprSr6ODmC+m1YlBPFPvpDvcK09cy2QKKl9HDo9Tqer/vNZLWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zMEwpcLgsczYX1rrm+kjFUQ4xC9iCSgKGEevdqq2NEA=;
	b=jCIyN/rtExHJHMApGzLy4q7nhBe6tDfPNZbweBDgSnDJHq3if1JqLx+e18dCrtDEpv89
	 HvsKMUVVQNcgmk/jX/OcoFTr5ulfJhYIkUXebySwpRg0AICECQizGftB4sJzWd4F3tTCZ
	 xstwdPRbkILQoczfqXolc0cPrs1xjahuMtIhPD0WBMz++cxwX+UCBd4R8Igk2uErAZnTX
	 unWOL7wE0rVKkI3gQ1u46CVcyMj4aZ8viipBgfF7CWcjyJTaUbRrJItWXstrYjVnCO0jQ
	 biJUUwWyiHBvGKV2WJk2pH8g1+Bje2EFPdb158HfpK9uzzfBkzyZ4BIVvt0LcKIeybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lobVPy3N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Atxbm7DZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0069606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0069606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lobVPy3N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Atxbm7DZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg792544091
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMEwpcLgsczYX1rrm+kjFUQ4xC9iCSgKGEevdqq2NEA=; b=lobVPy3Ngx5CsvoG
	kvvLAzgNQODA7NlDhuCeVNGdA/ODfjAIluvFPynabxfZIazv6d5FkOvYo2Pmvj8+
	ogNFUnHXME56k+Qn/sBSAATsDZ+BPiNt8Hlmn2U3G9EQTdkLTuAwLIM3OtAFb/Ji
	U1vDjUDjJvyD7g4rj3zPReBQ46H3ywvX++fY70kk/8NQnJjhpglanZzuJC+T2RiF
	F1DmNDvyF3wmiuoogHCXtNUCn8FONOb0lpQSiP9FAD1G577NperGx2vDn9NJEW8s
	9ty2WwaBp3zwlhbZpBi/5LzG2gJ/5caSvyOCR699JOneKAnFPCN118MgsDgggEl9
	PmHykA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj49137-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:50:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536708d1a3eso2178591cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590619; x=1793195419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMEwpcLgsczYX1rrm+kjFUQ4xC9iCSgKGEevdqq2NEA=;
        b=Atxbm7DZP+6Wcbf61QSoxpe+E6ORzPPuGlK6h05p08slfXImEIsgL+Xhp1JdCqJVB4
         PIl8fCOos203sH7U2LWKuYCNI1bLmii/IJ/AfHuobKQEEY18mdgHPbGGP6ZckNcNdFDN
         8QxoVoGmSTCZ2jF9yThx6/Nc0x2J5QpOKDO/cYmJ8IhuW9nzjEXnQjvYj13m45aqxZZ4
         byqin0BrlcRjQtmVjjtKMQA0DrgVVUmbDDvR5dhk6NI4Zp5vQpHTyZ60BTo2q4zF5dZP
         H+XBbEVAu8nOEOfTMs4WdoZmll20Zw4Vk1bxBjwVS4CTm8yj+l6kHem1TI29OvcvJyRO
         HdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590619; x=1793195419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMEwpcLgsczYX1rrm+kjFUQ4xC9iCSgKGEevdqq2NEA=;
        b=L2gXm7XpfVISB/LyOuN4KdFZ//Ye1V68eyoUDsNXXemhIoIOLlv+RzaJVeRJir1Orx
         0qHA8eBdO3jjzyD5c7XotgfOXOYqQJlI4/EYKQG/bxAskVW6oQZVGhwPUdJYbyNF8+kj
         Gyq5n49EKoOL2GLwUtFBmTfuXMOoEOOOQshiW8+TSUw93XvwfnhMzdABGG9Jip+uipek
         9VwZ/E0fMkD656CrcYhqtTwefNFhloiQkE5WfgN4uq/+5Jgwn1f3dEMG+vAuz+NuhdPc
         3SjAkhdTXhI7rbVcoAmWyaz8CiWxlpbAEHHOi57bmwOeDwDWZWHj8GN5ZXn0OR4RDxMj
         0DlA==
X-Forwarded-Encrypted: i=1; AKwUvBwRfnKRUt+zSfbCxxowsJosmf7tieIPZ241tIKfYgd4JvOSGBSdc/gdV37W4h3jwQK161bM+VVWPxi1gwAS@vger.kernel.org
X-Gm-Message-State: AFq9FYLtW3IuVoDgSWSXh+OtA09UvPQVr/fVcXqa745HZOUx2cH2DU8T
	hgmdSGVEY6OEVvmjVBNza3nzhwWrLoNyheDQMrAlDyZm580vq119qvJJMbXhRLDD+ugh0YiBwyC
	pjtFJFJXc1kWviFDngLCBz6zC/CEpjnlSp6b+EXfUUGmQ3nm4cDUKgEsbMJo03Ur5yFzZ
X-Gm-Gg: AYBFou0l1yqQpAfuMmr5AVdsMvXNeuyngDoEGwD7wfHC98EXyfAdcXHbKxAwfs1m0ne
	r86bZq+ASs+YPktdA7IiQRb4FtyrcMCKyxBPYHPxaIkHxptmotxLZJMlOsNNpWD+AodfLsSP2nF
	UnpwxhA1W167CNy6u52hLPvinsCwgBzKS7BW7Q/Kn0hzYuFC9gVZ5zWeFly0VvCS34CufQtiEEw
	d2I2WqY5JrWuQw6XITGvCm2vIDqyeqRX5RqRwjM5I5u40xg8Z2y6FbV7OwQVanRpKc6M3oQ1BGn
	fvkC2WkZNKqj9OqmhuL2WKLO2d6t+k8Yv2TcJWd7Mw7MFx0XbnWwZA61alGTQTlzsmz+XSjYgce
	NMs1f5KmRo5cfnzSgSeqKOQ==
X-Received: by 2002:a05:622a:1a94:b0:51c:2324:666 with SMTP id d75a77b69052e-5369b7b364cmr40181961cf.3.1792590618812;
        Wed, 21 Oct 2026 06:50:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:51c:2324:666 with SMTP id d75a77b69052e-5369b7b364cmr40181361cf.3.1792590618368;
        Wed, 21 Oct 2026 06:50:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59e493sm4978466b.55.2026.10.21.06.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:50:17 -0700 (PDT)
Message-ID: <cd73dcbb-ced0-4967-9ddf-c6c53a8a5c47@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:50:15 +0200
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
Subject: Re: [PATCH 22/38] arm: dts: qcom: ipq8064: Break long property array
 data
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@axis.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
 <4451c072-3a11-4819-aff4-e7de100cab8b@oss.qualcomm.com>
 <pndfqy5n343.a.out@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pndfqy5n343.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -qKqXqYhF6LJaxy1am7zygsIfPDm7Bn_
X-Proofpoint-GUID: -qKqXqYhF6LJaxy1am7zygsIfPDm7Bn_
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8c31b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8 a=dF5rLCIUvE07-0vWieQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX/9c754tq+l2d
 BrYCDwkgJC8NOfQjh5UNKFd05yA+RkM7QfmW/ezgaXH/zoHmiAY/RfrFxQmooGq/zvwbHxGDhcy
 TGVVm1XJ1SRMYYx7wxs8p3ipbXMfXigTBDYCTUu+DPkYEojmj7rMC/aAhjEE4gfvZNwqOvlmZIO
 9D541sBcZgJ+w4J/D/anxhVQz/T0e0PiNuWw5lRteVhPQZmbFZLoWnnpRUEpoLzz3iGWqHJqTUT
 mH8Z99Q2MsDKE6q/aZB7SZ3s17ax78FJlikd2+ePXwsLs7bdh/lUiwaOts1/vyjR6dy7nMT1Ixx
 Qt3Q5bdlK80Q5/Zc9OObIdPP8TAWrMyjLwLa4KiR1swxjGQbkBceNsot5hYHfQ6d6Hh9/0bb6pp
 XfbXOaGYyGISr1hcKIw+06I0qtZp5EiUmLgns2QhSs0iCmItqIzfx37glkTTLhmMJGBMD4PuxHV
 f4L5uKzZExlMQKWW8Fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX063oxKlnRSSN
 rpn6zzxwhi/PUuKjyfRCPBvCmpAyfUm7i+H2d29wdr/7FE8tR4J1EU0rj9034OOyZh3ipNkC9ZB
 MzWVpkvAzT+M93L4HzW7IFyhQWGCyIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/16/26 4:15 PM, Waqar Hameed wrote:
> On Mon, Oct 12, 2026 at 17:31 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>>> There is an awkward line break at the last elements expression. Put all
>>> elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
>>> formatter).
>>>
>>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>>> ---

[...]

> I think the above approach would format them quite nicely, for example
> 
> 		swr3: soundwire@6ab0000 {
> 			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";
> 
> 			...
> 
> 			qcom,ports-sinterval = /bits/ 16 <
> 				0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f
> 			>;
> 			qcom,ports-offset1 = /bits/ 8 <
> 				0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00
> 			>;
> 			qcom,ports-offset2 = /bits/ 8 <
> 				0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff
> 			>;
> 
> 			...
> 		};
> 
> in `arch/arm64/boot/dts/qcom/kaanapali.dtsi`. What do you think?

I don't have any better idea so might as well

Konrad
