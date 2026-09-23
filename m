Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBFA534441
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179981; cv=none; b=NiR0AQiRqvH66q1Lz0tBcpXEY5YW2K4Q6aTT6nAOSVmGdB/2rHy2tpQCswIYPg9oa/rrt/ybyUsQ+z2uirKfYTYrwYWIcbpyvXeMcV6gDVWEtjuY962UetzHyfuIsCxkWNPSuC3i95ZSQuTqQzLDIpUGI9EDcUkrSXUvmB08D6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179981; c=relaxed/simple;
	bh=WEsX3nfOwJeTjm+sDD5a1HWuCIPHXuq7a0qd05FXfSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYRCf1lCVmMbzzAGqjd+LCQsC8nieiXAMMiXErcC+FEW+9+4e10CpCJJEOBmdCyZt/5fpDl6P/Zk6+W6GYsdg354leWpy6Y1X0AGaOM8gUZFDuB3xG2lZaxNGvTu5roThyZCv9U/Tey8i6CMa/kIwjw4tWku8D/fsBY3mdp5VKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwlwzVye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPPVb3JH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwlwzVye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPPVb3JH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NG9gI53039345
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iX4hJuIcUIaSD9eZWRKK+hn9xZsLliBabPjwvtMt+nA=; b=jwlwzVyedKeA0Uw3
	pYcH7l/EImfd67eQa7xUKv50QoG57GGvENLqAitEBZJaZhKdf2ck0gZmiFIWN1y4
	CeHWgRUGqopCFoI/jgplF1AZGeDvkgW4giLS6EMyyKp5pX1KE/b5cTc2rA4OTELK
	o5yxheJKBy0aCbLO+WCvOIh02SwY3CJQ8ITjAetkzr47pkZt2b0wlBITMj5aeh7v
	7uvgWt0Sz/AiEWLi1q1F1qs7xaWOEpwEFJSKkr7AIA973Twfdz6I/6Qv5HgsDjjR
	Y0//8iTFv9aCyX2cxPmj+bBg5nQDNkVa2h6r/46/DrZQa/lnz30TvLyjbR55adg1
	yZoDjw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hs96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:12:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso116580e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179976; x=1790784776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iX4hJuIcUIaSD9eZWRKK+hn9xZsLliBabPjwvtMt+nA=;
        b=LPPVb3JHHRcgjBWR+O3ETuWW8zKdGdyFHJbLyQz8js6ksIW+9NC1Xq7ZwHjS/6Gjix
         JIKPIDjiOkMLdeRXaMbUiENesfBQJD9X6L82BaGlr1sjgNkHFKrMH6XHrBfsox2AIil6
         ZNYRaQ3UmB58Rgmnwed/w39Ne0Bhj8y66hfSM56v1v/6DrfJ1Oe3CMXC/KslFaE6QxY/
         EGVnM//vZ21+PjKU5yFU8AVBaCr9bno+sodEoeqbtWDuPsBa4GZ4ahyluDvOmQc4e5TB
         aFlV5lSunIho9lADOJ47rg59MRG708VX2IFY42tf0XsIaLv+nRRKUdGI20oai/b8dTrC
         Jh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179976; x=1790784776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iX4hJuIcUIaSD9eZWRKK+hn9xZsLliBabPjwvtMt+nA=;
        b=I1jIK1w68uZaJm1XHcyAInQ2vIag3HrkAMwPqoKX0WHl2NL1bMCdNkf5MRkbZpH+v0
         P3cZcWbbxqLDK9/9YqXcHh0DRLbQA70Oe4bMoQ591Zt6FQeScZVhbit42me1gf+gCmo6
         pS0E2vxRoYcTGdOJsAenBe79DHqRZVMoq5OwJtvum3rzSsd7uNJIsyGB5GhnFW4JONaS
         kvvh/769CSlMuIOzuxkOb1zgjwBpqopOMuNC6R9JCFoPiTWY8Z4sLQcAfOydgTbM4GyV
         qSnvrKzRf4AE8CXch7rleRsQ1btXb9cQzOrrstfU/FY8I14i1ClszeXIr3Sswrppm7eQ
         6rxg==
X-Gm-Message-State: AFuF++mrcy+unPby7zrR9qv3xlwMyLeAen82gv5xU7qTW8UGf/7/JUve
	6wxIOrCWEGxDPRy37hkGXHPtfJc3sGCtlNR2kOc41Dn7hrCHkw9aJIQfRC+O6AdA00Cd1rCH3tC
	Ay/aYDA0MYGNLXsRMfl+vuNgZFzoNZY0JA/7h/yRe32pn5IDdgDA1V/Eqc4QQ2uWYT41k
X-Gm-Gg: AYBFou3FRdUhLviDjrbb7lcQR5Mtz7/IPdr06Kqq8e1iEue/ovz2266CwPwmbfROGgb
	kTfvIh22zFzMMT/PBUtjN9n54q2f3v7fqAjsCRFxUj/XnDycmqGoHzxTBuQdrS29etXPYhvIJfj
	M5RYZwJcKc+L8Jd2+OykomV7MqF4qnWjZOdLqfDrRbCooPUMSg/OLP+hLAs9Nomvr1lylk3lVrD
	Z1vLRA1jDUt4DgMKyb+xXHCi4nmdOje9WuKGNNjOsKGcZ+lfwjKu/WV6OsPxG2Ik8qrxZWnT0v2
	uxYmFxQzXl5SvwRB8UgW5AeoH1BRwIV3pgbASBkxK7g2ezVJkhBTKxZGO/ptf2QyhI+aDA3tyYU
	uJAeD6BJGCqHsZh0UlxPDLQ==
X-Received: by 2002:a05:6102:5e8c:b0:79e:3401:403d with SMTP id ada2fe7eead31-7ac1d0caf80mr2471810137.2.1790179976387;
        Wed, 23 Sep 2026 09:12:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8c:b0:79e:3401:403d with SMTP id ada2fe7eead31-7ac1d0caf80mr2471786137.2.1790179975654;
        Wed, 23 Sep 2026 09:12:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6c6944sm152523766b.55.2026.09.23.09.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:12:54 -0700 (PDT)
Message-ID: <1640b77a-a3ad-42fc-a16c-6bd3b279ebc0@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:12:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Add initial Valve
 Deckard devicetree
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
 <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
 <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
 <dad6af73-d58d-4eaa-9c1e-39c7b8423e91@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dad6af73-d58d-4eaa-9c1e-39c7b8423e91@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IjXQAk1eXu_RqNmKdLfIVfear4zOXKAb
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3fa89 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=YG64nluAAAAA:20 a=gZmbXTW_CG-Mw4ipQQMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX3lC6y1nF/a3A
 FZfEP/yinARaaE7Ro79EiqOh6dS2KrLPYx5j2+U2P9bZ3VKD+yPy5uI83gpb/bl7IwNoK2JJYtS
 +4e4SPZN3fF26v7iI6S0CSekkYHycBnyNSrMYWN5BsWZWH7uch2eDp9Kzi+z6yeI+PnaU0JeC5f
 DY+9BFU4yh9fiVDxmuHSVjJDiw25dSIIt56AppZh2tD6UK/yvFzEVaQ9Mb/qq8ZWPNJuITcq4Ma
 on5xOAInH7AEaGyWj6MAqwXZES+Vo80UGOJLA8qOcPndoJ7jyqjf81V05+iWR8LjoIrYXv2FpB7
 0ZBwFd169RRPPjqOhYew93uIGc+TRiriO2l20ZGiMAGag92DqCTx5sJmrWOBu5aBzmo1Z6niYGJ
 6fh8WoAwZcmmglU0VcgN0c+Fl45Alj05IcA+xzaCgRZDqjx7yAQd41ZpcuQauSAWfWF0hfdydRr
 FksVQmom36Cvf/Hp5EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX4kXmanQW30fp
 54/EMKBr2JEnYLINDfX3rMb89PNiuI1xXMW/Qt32tAOCY2GhXfWrlI17lh6oQkHgKGpeN3jL9H7
 QYIEy5CEiXWUVbw/FxnBY2/TzojBMQY=
X-Proofpoint-GUID: IjXQAk1eXu_RqNmKdLfIVfear4zOXKAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230064

On 9/23/26 6:11 PM, Neil Armstrong wrote:
> On 9/23/26 18:06, Konrad Dybcio wrote:
>> On 9/23/26 2:16 PM, Neil Armstrong wrote:
>>> Add an initial DeviceTree for the Valve "Steam Frame"
>>> codename Deckard. The Steam Frame is a virtual reality headset
>>> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
>>
>> [...]
>>
>>> +/ {
>>> +    model = "Valve Deckard";
>>> +    compatible = "valve,deckard", "qcom,sm8650";
>>
>> Sorry I missed this before, but you likely want
>>
>> chassis-type = "spectacles";
> 
> I wondered what to set, but I don't think "spectacles" is correct.
> 
> I was thinking proposing a new "headset" entry.

We can figure it out later. You'll want to extend this list:

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/root-node.yaml#L21

Konrad
