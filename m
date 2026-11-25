Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604602;
	b=xJ/Q10XNdmfQWDfqY7Qrr7RBY5M0GnpVtLZI4Rvo3sQIgdgnVnPFJYbKnIX2iGh/bW9T
	 HYHElUnZmeHEBf6vP+SH8IXv3ELcgm/z917ihP7ARDAQ/SQhB4bY4BM/+XY/i6tw1cwbQ
	 BrLB3nNn2JKAxrSM0zRHG0w9BINvWr7jASdWegXsu+qBlE6FB35H4XIqfT8sM8aXkVety
	 A18IunzGGwqKzGw+sgbO57Mp23T/PcXzV9fwjyIY8P0vkMLdYkRLilPr2eXRis2ue45/Z
	 PX2ijG0y5C+CHSobIUHPqlaZ/rVqlp25qfav3CojJ5gafCqkP1Ut2GTJnFQYItrYveg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604602;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N3jXlxFsdDnYKftBj+HA4lSK/F7n4JJDj3rZ2WfFfZA=;
	b=qsTUBRgS8ejr+9030sdmAP3zN72GgzK3gE4iK/kfGfYlujAJLSEcI29yRgNyRAoMNbgR
	 w2QUcTJo3/3iMCbu3k/wZGbv8V4gCcUrwgIShcth7LWan48xNII7wQgxKkwMGThNhpBZu
	 +oIMBQ6syDUE+tx5OZ/MYVy7lyRc2H4Q4e9DTZ8AwzHZdrz8NyJD9d84gDSYGkpHXbVb4
	 q/7cerbENvpctx7hoM1QDvLc+uyvRl1QnAmrGIB3IqqN2ysb/pt/PxuTfYOmbL2xtPTyH
	 ySEocd5Ooy+yIDX0/RLyZyFG2wcj62FPt1qv9UHTlgv8RpzxnHZif+4wsmsJaqVkcWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b9horh27;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A3/r7GSh";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B440606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B440606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b9horh27;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3/r7GSh
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlV33611470
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3jXlxFsdDnYKftBj+HA4lSK/F7n4JJDj3rZ2WfFfZA=; b=b9horh27NV50ayY/
	B/SlS2tq8A9BXnKCZpmOaZn7KfLNquXoIFyN359bomonMfMHk0alIKaHfvcgKaa8
	Uly3kkop2GwUzV03rMQsMZ9hVPG6WLYJ5utD8DejvyncTLBdaaLmEv1CzD78vkVY
	xTK/0gIJPG6AtgCix1J2VWav6B+VYqaNlwlP/u1bR0YyylG5rshuZDbYfFaggybs
	DnOPttFymm0NIAgPYwgzaDLiw/V3Ewh/5y6L80TKrZFJqHiKjiuTvCK31Atbjs45
	u0ryOc5vntnsYxVbSHv0D3kRkJB1oIY96zOZNQrKdVu1Qt46FQqmcZY4hO9Tp+xs
	QM3KLA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:03:20 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so224923e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604599; x=1796209399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3jXlxFsdDnYKftBj+HA4lSK/F7n4JJDj3rZ2WfFfZA=;
        b=A3/r7GSh3rTD2zOyyMS/24VI42GYW9hxkeX5z0VO5y3h8baV37YJoooYndJCa77Ekq
         E2M0Pl/pCOwxo8oGLLxBPWtnSVSSZSmsFiZmDCGIIl8rvFCcST6sO9054duMHMi9GbP3
         FByt4mF/SIKVWurmkjLx9lKRjqe0qjgNRwy0HBDRjQzY0z9yv9qzWkkpvfwB0Jhb4zZk
         5s4sslN3/3Z0gHLqgD+PBd8K4yFhmyCiSEpUFrXQ4qMdrNZpjXOitdwWVhaohCdAMBMK
         n4FRFPmsCQoH/54rP2JyBUvqb3iE2iBeobWydiycCx0MJtjo4sybywJGt2jbmAeIpreO
         jOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604599; x=1796209399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3jXlxFsdDnYKftBj+HA4lSK/F7n4JJDj3rZ2WfFfZA=;
        b=24QfkR12uWku4Qkc/a9y8jTjbqnSJNajAIJnbGAfwueIT+GwG1s1s2cOFJNflOS3Vn
         xbG55ft89/kS68l9uuztgoYOpJpXH7u7l9Q6e4L3ZnbSMe6eL+0RPxWL+CKLadma33rB
         m1BfNKT6xwyXooCR+DJifHztbS3zCABSIf5QnzeoEuC3/I2EIMZFiBFlKgH8fr6usjea
         kVgFhd9pAUww79gSoalai2MCc82NsejNPXRzpBRiua0HeQSh2yWCXMgS+7RFLh6I1nVc
         PLu3mBFP6T+qUAihclutiJDI6sXvoGsqBkeXAWYWPRkba5+GrQnSb5+tZOMqxO+yy2W1
         4SUg==
X-Forwarded-Encrypted: i=1; AL+hErFmQDWsjnEzXaF3+MlJepTInqBcPYlg71sNTdvij//LWsXiaNi9eRHaCXf0RBJRDf/aRCRvt3BD3zgBNw0s@vger.kernel.org
X-Gm-Message-State: APuU4Z9BshyqYkOT7UM10ejSTw6/KYOTRyytddeo6mgSVOnwhZ3cpmat
	Ww8/6p3HmCbCtcaimWsOOQAMt9JVgxGZk9YvdS5T8rt7fBG9TuAglZu7rYMGG7GCww5E86eeDlr
	mwCJLb7lP8hr7D3I31t6rDYUaqk1RMBf9dx2e+Jxich6T6r0Pt8YmFE5R/Fp2ZHk6jd5+
X-Gm-Gg: AZFdTZdURIAWNaOmoW2zFMHbuUNZy0WLLDSy9x9slqQ18Vj2Np6HUyRc7P8NfFl9eHp
	caVes9kDHkBeLdoYztqmLFHlsqJ5QhOQXM31V2kZsAmdcOfuubkxcwh21a65ko8qDDStvXAy2OY
	ckkRNh5pZXWDXux4mz6tvwyOXFaaTBZ7sUPc8l0ASumLURMadhGiGJGfUnD9x4pO/+BC6BF2wcO
	9dKaDWYaLGCiiAshLXtFo345Eved0s4lzyNzsCdC7DQdOwkMew5oIbK0gybEy12vHyBLrn949EL
	tTuZ0amu+t7esnRZoaN4daEQy1znS6eIzTMaATZg+cfeSJWIJuTWMzX7FneksCImw88rrs2m6/4
	aCFj71wyTscFC4Z4rlCOcmNMCAniwNI738THwPTOaSCLosAAVjZb9HKfv7x+MlftirEWUvNE=
X-Received: by 2002:a05:6122:8495:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee8ad0e69dmr9793467e0c.0.1795604599336;
        Wed, 25 Nov 2026 03:03:19 -0800 (PST)
X-Received: by 2002:a05:6122:8495:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee8ad0e69dmr9793427e0c.0.1795604598783;
        Wed, 25 Nov 2026 03:03:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm630307466b.84.2026.11.25.03.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:03:18 -0800 (PST)
Message-ID: <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:03:15 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LR_vVgoqnwEQmPQ8HNBevs5yircwjmt9
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06c078 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vYosS4eGo4e4NTISwfIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfXyxrOzQkecbqA
 IFPxPAW8Qdk41fNoFMr/+j4z2vLkNVVvGYJ304WX7xKl8kJBLHvBlvsek8jTK/AjO59BShxDzU2
 vkLE8eq9H+gmxpGQL66cEbzHV+jBBq4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfXwAU6tzVYyDJw
 uNRbZZFSvvWCmugkxwHs897CfxK3fwUEri0a01eg5Z0Ug11ExRdfGA7SZqmI8cYaKSf4kGB6bmg
 ZU8d1vS58MehypJKsdxgaBIfabcZB7Mj4ZUQfbasa3/TzZqyiSuaczPUTMn81mL0wAso9DWJWs6
 6+NvmmYcfAq+YMrwHFtZKbWAj4n+cIWhhkI0W22dcq2xKrYPNRMi1O+Zhm2HdeSYjniZMvH0GO+
 JS1o8cGA3of1cXHSravz94G8GQWphU6sFoMXBj9p/8hQU/kFz1nIPE2emZJUeYHUU+Hp3oEuTvi
 9xTb5Bqe0Jg3jBo58ui+k/LCUdwRwVJOQilXYkGjfOa9xUtc3qamkvNAPwpoIX79VaAGf6k0ZTb
 t6Hy0pwCdBbaoj4b9yQ/0V0CzfKh6CEKI10u4qL3qjbK4dFNslD9Ax6hSe08qXctk/tSmsUXXan
 g3RK95RrlxXTKlZy+7w==
X-Proofpoint-ORIG-GUID: LR_vVgoqnwEQmPQ8HNBevs5yircwjmt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/23/26 11:08 PM, Krzysztof Kozlowski wrote:
> On 23/11/2026 20:06, Konrad Dybcio wrote:
>> On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
>>> On 23/11/2026 16:17, Konrad Dybcio wrote:
>>>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>>>> currently used only in the socinfo.c driver.  There should no and there
>>>>> is no in-tree DTS user of these, so none of these constants are really
>>>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>>>> that part matches the concept behind DT bindings.
>>>>>
>>>>> Driver have local copy of these defines, thus these can be dropped.
>>>>> This has no impact on in-tree ABI, but any outside users would be
>>>>> affected.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> I think we can move it altogether, to prevent a situation where one has
>>>
>>> We cannot move all, because some are actual ABI. I could try to leave
>>> these ones only, but that's a bit too much work, IMO, that's why I cut
>>> everything at ~450 value of ID.
>>
>> If you mean ABI as in "used in DTS", I don't think that's quite ABI
>> (again, looking at the glymur-ipcc.h case)
> 
> 
> True, not ABI in meaning something agreed between DTS and driver, but
> the values are used by bootloader, DTS and the driver, so I would just
> leave them as is. I rather care about not growing this for newer platforms.

Right, but they are compared against a hardware readout of a
well-defined value, not against made-up indices (i.e. these are
not bindings). I really don't like this ending up with 2 files
doing the same thing.

Konrad
