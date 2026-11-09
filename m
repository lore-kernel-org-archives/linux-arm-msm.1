Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222390;
	b=YocTTdsmNjqDx9DMFi4yGYI7SjS/Fp8HGobjxgJALwIocvmxDPvkan0WGe8nddo63HBf
	 JgegG3sOryA1+FCih1A4oWcKJ0Vsav+qj01swQ4MeUXvZYTcqzcAATGC2nPa7ufBAlkIo
	 jA2YK50aFTiNcABTkRj9GoCWa7La/Gic1BQ+6O67quFKDXmZGzo3TVsaB7ygHo1Rd4U6n
	 mZ3NvwTQ0Yz5aTpFxBAwhHug1bWsLw+kfeukyrDOYK1utzxh2pSq+fTWptrkeLvCodtVp
	 s0zDklYVrA1o9B0H2K3o6rIrz0hlMVcKWu2FtTZ9op0r/gHTzUYikoLHqsSOJnz/qfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
	b=z/geIuikr1hIGGTJPZxbPJSxr2549nwbOlpubKDPaIK2z0DoVdE0rGWEaa9P3scnntn4
	 Cm+KrDkUK1efRaQMLvMzbenT+M0WOH0nIYN5tcum0YN/aWWsGmMXyFB/3T2Hns7xHwspY
	 D+jGZujheMtsYQqh+IA7rhkJVyG2E+i9X0JvZrKydeb2kc37MRtzqAs/HI9D89az0zJwL
	 ujQyB6Ynu2BaCUDwjnCNLBRW4922ESHvgHp002+OeERrH6FJyHejoMoZt9xlVbpE2NzFo
	 ZByvYUUBhzZ0hBh92m7dUsHXG4MSJ70t05kdMAyzVbPXjW1K9elmLwzG/u1kWYq9V5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRkS0TO7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FM7RtreP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515F606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3515F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRkS0TO7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FM7RtreP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uowY3600552
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 11:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=; b=nRkS0TO7MF+qY2hN
	q4vCsuWAzCc3xJRHF0iM01cb48E0wsANfmQtjKGnq15nZajIM/6EvDU4w38kw53c
	vU+Ma9dPr2FyvtGtDkzox4rs7CIrgXT1pKW1zIdpI6SP4COcwu2Omh97S36EN2HH
	mcasD5tJCOZLFJYbuxW58x1S4RontuFyuV+/LPO3XWCFK44dRlPJBrfUuEQ2nU6u
	MvS37Ftn4N0qk/MZjItIp7r2X40E50qNFatAdxSdW3NhVPPTnlMt7MQxZmat4ysw
	JrAfd4j0KyELZeyBmVkaEnci+/ebl77WFmFt9AYItBaujloW3SvJgj3N2MFw9Yn/
	Ll9hBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588pxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 11:06:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so21361585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222388; x=1794827188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
        b=FM7RtreP0fF0YudoAfpcz6PmoIkct9fSqvdhXamOp/pb2OJ2jlcJquyaPQ/FePvvK1
         FuRyweIZhpAf+UmWAtLt/aT8wZaMUhRyw0i+l9FgdqWmsGHo1XLdr9qyhbZVqkGRsErk
         K2KN8ZJzj37HopXNnuh0RmKM/LMGyHnq06Ty1F8iRuNFU5R91sziFGrsXOF3XZcK348d
         eM/lGsSXXkjO1vzkzRHo0PRZiS0XtlaBfZDxss3aVJzT7IaDe45Br9xBBX0H855v7tk7
         btaf2vuV1uCzog49Gt3nJc1vipibYkKbf+PiScLS9+P2rxPXHWqvXVT+5q3psDZZyWfg
         GldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222388; x=1794827188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
        b=0VKuRBSopPoATdJhh43DBCDiYnZFzwN/D8kR9Pw9fh1c/0qP834XqOxpLloyB+VmZE
         fJCITB0juFrcZys6wQC+4/pXRCF13OFxBa6mRA0mM+iWH04wnAH8Cknhu2kmgvy923A+
         JysD0pELyyO50d1DBGvfUTjN4Ug+Y49cXf7rfsI1KRJfnccRFQIHOtG9754/WRDQHvri
         xwqxFQds4lEXa4GiUdgS4BD7njrdVKPtr2eR3n6rd6uBzU/zKwqvbSJLRUhM6Sr1qgFQ
         FTLAON+fdwt/zOmpDDJaRGn+ot7uBDk03GZpJvzXCHRVaqxN7vu29lEQ8LrpsxI0rfQD
         4M2Q==
X-Forwarded-Encrypted: i=1; AL+hErEmFabEn5i/0npQlAJyrr5snqTSzjE+o32LkRevVdP5zfChe0iYNvnxuO2mEPmUrQ+WA20xq1L7/t5lCBM1@vger.kernel.org
X-Gm-Message-State: APuU4Z+pEk77G3NY4N2chcRsj3Jbxnll38z2a4HaaJ1FiCQinD9kfW+N
	/eWxSSPPn1loLf+pjJBDCn54mX0+FhtCmPUdEBU4D5Rok0bgocZVeT91T9gV30RAgfnc8bNdkts
	LlKpkmVEkX2gnmWrJ8AlwOaOSTCoO+CcRTDBCC1ZXa9XgnzVIc1MTkKPySwTdHaOGFqIH
X-Gm-Gg: AYBFou32Vf8TduArBE5eUfbUuTIFAHUe1tpSojsHA2Cdjppy/hpmGfbqxM41SUIK2so
	y/iTYjlfdCt0SNLamKp5YLjyCQVil3FVbbaHXzRtDDFbWawn59h2L986R7TjljcSuecitrTtMC9
	la0Y07CxVM8WnX5l7OH1/SlUCXJ5YgcB5pcv3DPYsGdPrr2a1ClgWQRrhGh8o/8usCFP3K7WIfp
	JVzOnqJe684fAJjP+9nS5zl7XyQNZCjgoRXArCUm0iiQjKKuQkEgv/Aqor8nsHSvLE1bLA+6zMq
	zxAYrXiSZoWs4TI/xw/6awuwLbclAZds8rA8Vsk0e4GqGzU5MxwaovPfHL2/KlT3sfhTl892P9I
	1zO8mncfjnsqTkIUgCVmeOTbn/1zYiRMhjVlx+P4AM1eXKzErFlVB47n4tCV69bXkWJpluQ==
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr514318785a.5.1794222388209;
        Mon, 09 Nov 2026 03:06:28 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr514312685a.5.1794222387596;
        Mon, 09 Nov 2026 03:06:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999b01sm150435266b.77.2026.11.09.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:06:26 -0800 (PST)
Message-ID: <09cbc285-1ea7-4613-a638-6921afce71e0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:06:22 +0100
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
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
To: Frieder Hannenheim <mail@fhannenheim.net>,
        David Heidelberg <david@ixit.cz>,
        Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-1-c6bbe6ded92e@fhannenheim.net>
 <70454ca2-3540-4cff-a051-758625be3278@ixit.cz>
 <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX0QLHzjhD1jg1
 IsTkx9sxpopU70VcjmKYH+7AW6v7VOBO3x0lQPNAgf+q2ZH75AVMokacF9p/nonMracSAY9d5vs
 i7xU6Gr1b0GujI8OVylkOeV5TFYzMwBz1iRfZ2hhXljFyuxq2yvPo06NksaTzOHjAZSfb6Zvm5u
 ibs0Mom09HmIVTXaAZmPopCwdfyWPwQMg16w9tTwlCBYjYD7lKTxE1lD3eXByiM7qN/CvquA/sW
 o1HXYVwK7NmnpTFAxttfc7dQZhbPu5uZ5LP9VHVgKP5YrKC2xxhVHbXp447SNX/cjtyW79zi6oX
 ZS3fgSABvzpGzJ/1V73nbm9ZC2mx1nwyhuJBMrUVIF9wgO8Og8IxIaX3yi67deAtQCmq5HJKSmq
 0iIJYyOkvoroVbZPJFr3b2QezVDVj6QwfDxntCSs9y/o/SshIrTJ+ukFXMpu6ij9ziDEMdD+X6M
 WYVCnIszDOpNrlAP1yw==
X-Proofpoint-ORIG-GUID: rKirtsI9eFLsgfTyE5629KfA13UUQICE
X-Proofpoint-GUID: rKirtsI9eFLsgfTyE5629KfA13UUQICE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX6C3+bxjwIhIZ
 xGJeuCaTLBOAUB+3DIo+yPN+QSybscvSdWGo6x2j5+/E/leZ1Mxp9KKe76GLmYfb8wQlaSg/oSV
 QN32H/3Xb5igw3+RpSbXlhiJuqDwXDM=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1a935 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WE8o4AYwAAAA:8 a=pw2Kr8DMFsTuVtHO7YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 11/8/26 9:58 PM, Frieder Hannenheim wrote:
> On 08.11.26 21:52, David Heidelberg wrote:
>> On 05/11/2026 20:20, Frieder Hannenheim wrote:
>>> Add compatible for OnePlus 8T
>>>
>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>> ---
>>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/ Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 50cc18a6ec5e..c21ef16e9ac8 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1067,6 +1067,7 @@ properties:
>>>         - items:
>>>             - enum:
>>> +              - oneplus,kebab
>>
>> How about oneplus,8t? We can use the non-so-much-confusing product name.
>> Looking at existing device-trees it seems customary to use the code name 
> of the product for phones. Examples include:
> - xiaomi,lavender
> - google,sargo
> - oneplus,cheeseburger

Indeed this is the precedent, I see no issue here

Konrad
