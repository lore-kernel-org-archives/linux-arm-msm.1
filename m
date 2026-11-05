Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870318;
	b=1z0zaUJuz1jAuFEjEQWPQdiI85Gh4TlxIluuiVWnr6N9M0HSEHPln8LtupfbQWi1QCop
	 5gO3MfQJOmY4m/ZyKZpYl8kwNMdr6/13rWsFMfqWpVDmUdDthLX/CVO0bff/d1PjiwtBC
	 VZ5l75n9fq6mA4qNBOZkLHfbF1Z3l8C1gLLX5tauxwdp5pulsPSbXJ9xQOP/JP0TYk6JE
	 p9pJ0QrhhUdlz9G8WZN1r75obN3ITgIoRutrGPcdo+cAANzuQ10MKihRbRQwm6M/xo4bs
	 KaLVWBGz2NHbrz5wAmFNPbpHa8HEzlCsbSgDpHww5grMFEhU4QEcV/bnp4nrmkjO/ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
	b=KjyFzOPFgGfb+tRLXcgITcxuRfJuj8WwB6Vcw6UjeaXUKQcfDlHhBlk73qrckE3F3M5c
	 cpgZMl/DCLfsYs/ecbnkjnOmmbLnEaadLLYMkF54iRsC5YC+m8PfJhcY4IKjGAVULDjXV
	 uDliF0721bxlx2zVrcq/mOfNQU3GDr4v+eoPa8CWTORltOqXRJ8hZv3DoSs4C5hY4tUX4
	 rJImC9aQIALiLpQrRia/mJ8r5k7JwPASzuB/Id6apuXb7ZeNvnxykL8pojeHnajd3oH1u
	 +sr1jhS35EQdyVg+DN2jJ08o3UFKaZtapRucgGt+9fRRq3hw4p/QPo4uu4Yltt8Ha1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EiZLXGt1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyQWOc3p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88790606A332
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88790606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EiZLXGt1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyQWOc3p
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56V3dq2588427
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 09:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=; b=EiZLXGt1hJ/xxiV/
	sN1+jAlyHPZbyj2AacOxHz1eean0ky98SRnWvdsCNvEgq5ta4v0sP14YT+Y23/oA
	E7l72eTm+TibUI+BrqviZ8lDF4CiKLUH7dTIGqDOUHYd3C+u9tPwI/PBvUanKPTq
	oQykZpwTANZXI0r9kbNkDHzm+W3sx8IsvZCjN9+gKbOfzdVTss2VlrlsvVEEYbBq
	TA39MNHm3DnLtaBGky4aE1sCA8LWGjW95z1XlA9PVc4uFU5uHwUfUU/ToESV4OsL
	Pt6Rhl2W+/WcZLBmNKrxg/ktw8yszXDGgBiveW3kJKEPj9uEWzd/Q9floDSh+UjW
	A7tO2A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89suqsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 09:18:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so2080566eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793870312; x=1794475112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
        b=UyQWOc3pZn/33nOWjgNlnzJ9xMl1aZoosvW9ZXEBkwZwlUJkvhLNT90vFh1rd9DqlW
         cBT5jFjnI2pVWLNbqOTDcPhTlsBeQT9LR3L0kh5VBtdB7exSXZV5ej9QdrmsCX+7tlIz
         F1Gdxjja3iKjAWQG2iF2U8WV3w8f5W/K5dNigQDARkbvAVDp65gKh3OYDIekRqcNuFat
         mqHlA0rHm/pU49008grbjG8PEt4eL3rJ/3Zjvb4Ho2GGg1zOIMhEEV5r2F4drxf0/A7J
         gHBIjawPPxSrnbSrOE+Ixpdl1RB4g4PZynD/CTGfHN5etFG/UgxzjO1eYBJVXb6Ghw0E
         ScUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870312; x=1794475112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
        b=FSP343n+9hnc5YQLILbywpG6zx5sMHs3bNd7CORWUkCm0busI/N+aoJzJh/D3RpYnS
         Fw54/kHFZYu0zXOZbZRss+7MVyTbTqj+pKAYSEPflakRXH9Q52CDLadJX/UVj72zWYx9
         eG9UI5UOUFIyDCOwe7OdEqOpw59Z73fCq6rL8RxrwUxCukxLeGe6Sc8PXYJ++cRe9EtT
         sCwQQlklqcLVe1p8ov/TF8R2c+DBGZuJ16Y4EN9jVLM3k3S5fI8Xs+HORFPNOPWly7E+
         apPjVhhVdAuLdLzeFc9vf2ONeChf+ba7bP1CzxODOqGdx1kXerJrCZvcGBu1QW+ddxku
         xvhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFldwIaYXZzgfFv9bBXrSDgbjPIcR8E/44T12qfnZIKaAbq7bukemqyInrO1PsbuNWSs4CjeU87HdSkHUD@vger.kernel.org
X-Gm-Message-State: APuU4Z+d5/q0Iq4tm4DnNgks1SywiQMGBj+ac/dpRoA8jhgLGIE0Fb/7
	+OXGneqpMW4YX3umJfBn7Q47t28CC1KBX73pPB81FjagSqNZ8vCDuptgwhOshg10J8tnSHJCQIw
	ydPqvQ0vzZuVYLvrbPFK6sqJjfL9GRnHNbpFi69433SEdcCNVLRMRZRENo16PTiRrup7J
X-Gm-Gg: AYBFou0qzqF/MpabyOfe81t9kuIMiA+b3W+2LoKR7wdul2jjxHRrGcWGIbEIdTMoZ4Y
	AXSvJLkLha0Ox9dVsmeHTot7NWZjyQxfIg04PYEOX4skPAQo6bt5VhF9hvLp7fKf8vEqUcj+7zw
	AujS9+5NpqXSCWBALHaKBeC0aQnk0iYnX8Lsmf5fqY6V0bVvo7vrX1hXFsm/AIHUNwlam/T9Wyn
	KJMMKwKp0rUB1JT6W2WXHGJViqXtKoiBa65tMx6yk7luy1ZYzF/AJNtPSwjdHtfP+MTShHndgO/
	dO0mH7ncXQ7yewhrES1dNxKSYQrBZRD/nMF3AX9y3B53FRFVRCIbAaGcyRw2S5y4oSqM30G+anu
	LVEaoIPXAB1HHNY3HxzsTzsVJ1KqJcwIMVN/4NRkdFsc5gtyLV16JneVrQ2vdoxBpUZLkwz7dxo
	k=
X-Received: by 2002:a05:701b:4594:10b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b2559b698fmr593813c88.26.1793870311835;
        Thu, 05 Nov 2026 01:18:31 -0800 (PST)
X-Received: by 2002:a05:701b:4594:10b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b2559b698fmr593784c88.26.1793870311273;
        Thu, 05 Nov 2026 01:18:31 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm18261870c88.15.2026.11.05.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:18:30 -0800 (PST)
Message-ID: <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 14:48:25 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UmnvWC1S96PSQ3_1u-5Rg5eK4UdkzXcq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX2X+s0fBslhoV
 egDAUKo1xICOmBUiVnQ+gJt1HeqrRokaWY2/3p9QYZAtr6N2kRSjREch3Hqg9usPxAOZtqNYy3A
 b5rQiN54ndPSl/5HJsk45DTtoONIrBDW/ZCtBNaNHFN+TJRXPMyLjeZPv9/+0dww4V8mAm9/Sr2
 lkgnG4d6drc8eq39i/BCw6SrhMj9z0OeY3LkpPRGEj1MNun1TKmpDsNJtYmtHaRWabLr1SaWldE
 RlYaKM9bjK+1eT4lXFGr99S1BsbCkiJSQGe8Q7YpkSf/xGl5q89Qx77WSDj0fBklrEguDdz8+zj
 nYdtT4Sp3LFiMqORYbt3GaL0mdSuXMJGpb8xyEJtb4GjrG9qFXV9CT3NaBPIuOICIX4XNrXBRh3
 nf14GdUOuh3o9F62aNnsA+/dXONs4dy605/WLS28VQBoePFNZKfT0DWTJ6F9PR/gOOe3rrE8h6A
 hUlkkcCESs3JDTM5sVg==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec49e8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Ck8ZG94lijjEDa-JwdwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: UmnvWC1S96PSQ3_1u-5Rg5eK4UdkzXcq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX/ns0g6UEfq7h
 NQ7VgPtY/JYWZwOBWwrblnVst8GzYv7Yuyo+3FOOVl8egC47PpYkqdfUBSK8Z8Hm1vVQ1MvTjUk
 gEVnpjFyfibFhG70ccVJkSpq3lHYG9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050036



On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
>>> What is the problem exactly you are solving?
>>>
>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
>> graph should describe it as port@4, not port@2.
> Nothing like this is explained in commit msg.
> 
I will update commit message to explain it better.

>> The previous port@3 description only worked through the X1E80100 resource
>> table indirection:
>>
>>   port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4
>>
>> New standalone PHY path:
>>   port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4
> Then this breaks existing users, no? Anyway, what stops you from having
> there proper mapping?
> 
No existing upstream user should break here; this is still part of the Glymur
CAMSS enablement.

This follows the earlier discussion that CSIPHY4 should use the
CAMSS-side interface index as its graph port number:

https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/

> Did you find any existing practice of numbering ports logical numbering
> in this device, but some other logic coming from datasheet? Where?
> 

Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are not
present on the SoC. 

Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY mapping.
port@4 describes the CAMSS input directly and avoids introducing separate logical
numbering for Glymur.

-- 
Regards,
Nihal Kumar Gupta

