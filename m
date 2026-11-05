Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856755;
	b=TzY6WR7TXlyAI/LJ9IMSaAWWvCQ1iIqG9iDiYFByNn/FpCWwMpqYBORYQi9YRtURzufw
	 0l85G9RP3zIfxlw7BqqJEaplngGRlmofva8qUy6JzOg5HS/P9g7a7tD+WY+IfHr99SWzZ
	 0yAhNaXafg+7Z83PoApe+YWjIEjtd8l+RrtgUzdvQNJ7csChEfbgyicvasWPDzmKFmXgM
	 vmiVod1RbGKa+rMPwuWuaUB8N30yXiksk48HKgaSQySamUNrPEzdfaQ5EpnsWKSVpQA/F
	 9mUSFhKLyRbpiKKhrTB19rsuqUd8oxrPwGkIWs/N9f6SRp9lCIM9ltMOORb+W6EFYBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856755;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
	b=JCIldC5WatphSJz3ahLAHoOj7VFRINlgOsfCBP9HXdH5/Q81OseRyRZH0urJBKf6yavU
	 +FEhp2GoOR6jCqMiU+kuV+g9syDzTFU+PBaz9YhFsaQhJN6ra421BnELlSyo4tbUbQRC2
	 iNZz3zuwymmSSN13IG1Aw9BXyYzTQITPXVasWy/7J2Qqiq02+Sl9RWr5KLDMHFdsC+0jW
	 2GMzZxBI32JK50fFeoxsZ0TGDqjJx6Nflv9fl+szKZSKkDi5x4/7szKhIwZIEmH3jJiDO
	 +qmFZwQwEqMwUx3VgHeeRO+npVOQjZQtE5LQz2mJUukJEaZnmmlZRZPvfhT0Bqx9l/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATiem9ng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNliE1pm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E793D606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 05:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E793D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATiem9ng;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNliE1pm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oTOv2339732
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 05:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=; b=ATiem9ngPBFH6YEx
	TGjK/0BlMdYHEm/YHjSx8kFRH1vADGx+4lat/4D4RrG/lJCx7Vv6TsB5uIl1ztZY
	vvbYEaovUAyzEncLlZCUgzwYiLrRN8y1CZ3bi+nyha1dyBmLkZAUxg+rVGVBtRpB
	GDK093OwvevmdK1sbO0vgEGi+WMZtSKuLZe28ekdSamKDvTeBghnEquf/LiK07lu
	Jt9rVj4/6XjALxkU+fLGSEvfT2v3A8r9dNOVcKV6v6zG8/8GOFCJAdViI97QhjOG
	3pGfniZiocs2nudTu5Zhs1MdyuelEPZ1jy2Mn8pjp/ZTjIo2WstNWBJfgQkKkKNu
	1TEPxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r844j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:32:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so1368817b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 21:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793856748; x=1794461548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
        b=kNliE1pmKLwz2WykxnqDvlJMJlzO0eUpA8/xPUmNS59RENLsPDBOu0+ZDg9ltqNVrD
         VVWnIa90/HnXMqNXoxkDDeLLaklAV1iitzu2ZcQOVNMMbSBOxGdnN0JZcr0bHLabKcZ/
         6wV5hGbNVdw1uWfBe4l+TCbJm16ymAnlhaZbHIuUu30jzqePCMPLYbfn649qpb6gJo8f
         q7/cJ+xHaTnp4RYdT1kOFl+sTwSi+VkWi8Vao90Sr/30MHpf6bWBM9bwyWGYEq+QdFbZ
         +bHhTGexU2zFXjb7oPRVwkc48gyAJD02TIn/CXfKvrpDdzUUz95yyzilabl4XBV6C1a2
         M1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793856748; x=1794461548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
        b=tNFV73cTnQoWelTE1DLP30K1rax4YR+5nwvVJvotew9NL2hpNkBLjyBvlS07kQrbhB
         5wXBfzJPL2uOeXbGbzam6DU5PW+ueqXWCe63TLv+CjGBuFrajgO0ADosJUDwhQbDDfdg
         9FqHbwepDlfJKwLB/dRCH2gwVTZiG0zEyagBdbh4n/DcBStQnA0ppCsH2OwMaXlspjrS
         DVKR8AqLw7RqdWuijjUktv51JlmAxtP21Cr1fYCgt9swqWan1YLRJ8+PRu+IemHyoNqh
         Eyp4y9caEkfEiB87TOM8/2X2J77Yg5ms3VlMdyrAlXYCz2G8sigK7S8ifmwd32+p46bC
         93Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwSAOKiz3sViyNUApj3s4SL9A38dbDy0fIcnHOCusyR5xmZQ1NGSiWRQJdDftwbpd6Ul4qDDFt/8C/8GoPg@vger.kernel.org
X-Gm-Message-State: APuU4Z/H/HPxZtOmJ2GGhLyKwbQpIu6BeDWbh+L5ycxxevm/Y48K7noe
	xuLvB/PF2X2DeJXkgaurHsPAqVUIhd7zAtWsxo4SMN2gt34SS3Cy/PLvHPvz+ra9CCap/InxEFL
	uLb0+hYSDpJ4swJXXcsAyvNMG6dEn6khpE6yFTV+iekhK1xGr5Jwa2c2y6JLTQyiBrwqK
X-Gm-Gg: AYBFou0NFqK2TmAVDuHFwjImVj/fAfwv8MMxMTKdnOlGr7uuYgHnARIwDy+W78IcUNP
	S7KJeMYKR2Ejl0hI+PTeavMcd6MoFW/X7xaZoeMSb/w99J3VmhYM3mA3zen/lFTjoDIF0iR08Lc
	JX3z0lpQdjDVTk48RMjI9o5+XrWYn04pL/2fZ3C4CUtgraO4UFdRvmcJakmZsaIDGxvmmNy2Cd8
	zjyyZeBQvrnBrbpflhY9WGZoTu+LYBOGiZbj59Y8e1KggFZdLTfKfPRUvWPe8+GBJrQYHnLKLJ4
	2w7LnSCl5yd6VnoeJnrkX0l2mXEKdRF26NEA0gXkgouET5jzVPebmVn8f259lZG+aE/74r2cLVS
	GyOBGS3vxfB8eCmJLF4yULWwBRhkxiUdqagYDST2pG7uCJlSa2knc57aRUKqAcQ/zG/t4R+DY4T
	M=
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3e928a845f3mr13341105637.69.1793856747797;
        Wed, 04 Nov 2026 21:32:27 -0800 (PST)
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3e928a845f3mr13341084637.69.1793856747307;
        Wed, 04 Nov 2026 21:32:27 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569495sm1577758b3a.37.2026.11.04.21.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 21:32:26 -0800 (PST)
Message-ID: <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:02:20 +0530
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
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eSEmMpNihpfVzIwUVss5ChydWJ0W8_AI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX2ZC3NqD30yDd
 qer2my6Qu9JJw1QnwtbZh0OI7eg6JeeBM56KSAFyEkjv12ukyV4wUD7miSncXYx7jWpROH7rfpG
 uMnFN5J35o5m4vRPQHuTSYBU70/jlahJkBFFgnytPcE0ubO813ImDdE/KQaXrZ75fLjZL03h/PX
 2hYG2gZU12t7YyMpdLpgQBu2FFZlb4ilP5Ulxel3TDQ5KXN2ieIOnaqbRLI+UQlwt2nYoahJJvK
 /ZupaofI/u2XuhXKXYoMjiZ6B5oRMAEcVU25lpVm2/jW6VB3mEPLMwzGtS9ItGR8BP1CY3vaRjY
 uN6Ccy2Qg6ZY27MM64uBkbm7FwJbUXiNcvvd6j7TF19P3kwpdpbVuVfvmBMatsj06W8JayGekGW
 0DhZgswNT80JeDRiSiAOLsmq36FE30tGRmAbSao2uANAwr1qLlYhXqB47CuwAy7gFZKacto7Pq6
 EH42kuUlGuzV6FbUJ0g==
X-Proofpoint-GUID: eSEmMpNihpfVzIwUVss5ChydWJ0W8_AI
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aec14ec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=iBD9WU1rH6yjH3nr7zsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX5hbXRsGuQj0k
 ++8vQd3ZGXaxppcuqXsUF4WBNrXQ/ANt5XnUvmBblloM5nHcLS1xXVACYBP9CrQqwFJADY1otST
 9T/u94r2KtgtlD/mIscq0z7udgLgqMY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050021



On 04-11-2026 21:42, Krzysztof Kozlowski wrote:
>>>> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
>>>> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
>>>> where entry 3 carried CSIPHY id 4.
>>> You also remove port 2 without explanation.
>>>
>>>
>>>> Describe the hardware connection directly by allowing ports 0, 1 and 4,
>>>> and using port@4 for CSIPHY4.
>>> All this is confusing, why do you introduce gaps? What is the reason?
>>> Your datasheet naming does not matter.
>> Glymur CAMSS has populated inputs for CSIPHY0, CSIPHY1 and CSIPHY4, so I
>> used a sparse pattern for those ports only.
> port@0 is CSIPHY0
> port@1 is CSIPHY1
> port@2 is CSIPHY4
> 
> What is the problem exactly you are solving?
> 

The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
graph should describe it as port@4, not port@2.

The previous port@3 description only worked through the X1E80100 resource
table indirection:

  port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4

New standalone PHY path:
  port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4

>> That is confusing for the schema. I will allow the continuous range
>> port@0 through port@4 and keep the example limited to the populated
>> Glymur ports.

-- 
Regards,
Nihal Kumar Gupta

