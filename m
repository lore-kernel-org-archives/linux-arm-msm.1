Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974D0435A9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991098; cv=none; b=iJxwTLokqSZrKNoA8I5BvHUnhmx4/AnmwvQyxwkFl2ENiFEZ8LRkuxMslkskLPhf+waJfkAtw4QGFzj3Mqqj3PHbOjz7YX3y9oDq+bkz1QfLcX5Z3bH1Vzc3//i1XHk+lEv3Bv0mWx600UK5DYDKLn7dD+9CcVjRsqb0d55A34I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991098; c=relaxed/simple;
	bh=P/ehlcwcSIptN0yDEvjTfDoiN2wwjIFY+ixKWIuUPqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F99W2H04br3r5vaQmzJHJ4LDOCi8icbkxHhIQ3jTF5A7m+iFmi0avoCaAP2q37z8z6zh5xc4ozV/34n2lvqE1GtovhI12vBlkjLye2fWwsAdBeybD0Co9kTs2igxMVJSsHkEZLyvlylDYRqtKkBxqt4CfpKHVLzmrBumQOOKycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGfd2RP4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhidlA2z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGfd2RP4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhidlA2z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe3Hs1564420
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qs5l2ZklcXkpQyTIj4J9g8bsXs2G4KWcTXKNEWTCVZo=; b=XGfd2RP4Hfr6GiEq
	LyFNftfapntzL7aAKfCMRQJwgX0/SvHzYpsqiF2MB3IE8VvvE439vazYxuX5VyO/
	f6p0WZUbV3OMv0rtUphUnGgttOhfwzlPLzFQf8A/FX6YWY78GORAAdngg2euRoMP
	DkHzbe4PBUF9g6QS5ZktoX0It/6HNIynrFjlyYotFqSc4acM0d74q/j1+IQQnGvw
	u7PHBrsJL4RDwOa6GPtRQ+/96Ed5J6H4C4nMhpjbVTEQthufyXm5nj8FhsXVMchq
	Fu0i83QXRDXc/Hw8dVAvR3vVprbilaZtbwFdzW6nEYlfeXe1cZBmZeDUocL9Tgpy
	MqspTg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw13pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:44:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106bb33cdfso6997446d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991094; x=1790595894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qs5l2ZklcXkpQyTIj4J9g8bsXs2G4KWcTXKNEWTCVZo=;
        b=RhidlA2zwVTlIUXlHIEyYDRM382WVPJO1pf2e3N0DazTFBb4VZ+w66BM0yCM5txFXx
         DNmShT497kxz62XSVleWp3T9Bo4ZP1LNta+fKNtRBlAE5o3lzhnlyvms/pQAd3xkO3/f
         0ek0St3Mp0LybEENLe/yBXKegM76BEpqBEHvvFkOyU0wga8rpPj05iMybswBsCvvquy6
         z6I5X3/UpsW8BAgAk/dqYLhMV0KvrKZqb/91tkU7BA0KZ0U1rN9ymsuVoPLNa8q0Xz4W
         Gm00TaBPasIyAk8cIsi1Jb5wbYNrc1JbLbzTf1HZLbX9v5Y8M6QbPnu7r3nZJjbCUjO5
         M1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991094; x=1790595894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qs5l2ZklcXkpQyTIj4J9g8bsXs2G4KWcTXKNEWTCVZo=;
        b=xMAsVUYj5iBRgwbAicB3/vDpHe/jjWucDHwika1/zq4iueyqrsYujMY3hsS7PXbzUz
         7r7aAQYHN+Nn1ifqZd8RZl7BjbfQmjonyGbROXHjNEoCC2eUhDhmLAesRqaPJWbOVHed
         s7J+0OD4z48w0Nivu1wsvRQoCOBXhCavqThtFeUWfAVgyc6loceNFjC4CosAOR9O0/6l
         4StwACoBYHMedCvvmGxD37UZfI7cW2SYA3yfMnb+ovbdwsOpLIviTNhZ35l5/XHsUYui
         gYBi2ywRd36QCmZBp7q88j4KjMIQ1K4MY7/rfMaUQpdJaEVwHn7MUAOI89hwOk+CG0en
         Yj7w==
X-Forwarded-Encrypted: i=1; AKwUvBzcqP/k7k8dHXJ32RZ80QxOBER3OzDJQ1yXPioRttkUelHjExl7DFFQjzAxRAhMnHLiwErHXmxo6p34Ajnh@vger.kernel.org
X-Gm-Message-State: AFuF++mdGP1qu1t9/eF79zBy09CSkhhZBLdD8l1hKufRZL255Kw/pJnF
	9M4UNMHEBfztyjU3AxSn52VgKxcJ4qLcBKpXpob0Tvz4AKdau+3hIBFRy2oSTI+L+c72YRzeWYj
	ZcQzm10bL7AcH+JJxJoNYXCQybSJttFM4Zw+p9i3tNFaDwR6iigznE2JVMKZDpr3rnPAxC4K/Rj
	We
X-Gm-Gg: AYBFou2t8MiF+vnmVA9fTDv3fEa2zmfuwlyVjneAHcghg+1KO9ueybwQ9XH8A+E7hCg
	VO1Aw/0xCRFZUxuTAYugwKrZn7VaVYD2uco1sYBrdCZPLeDn3bSF55KEkurT+U/gkghHTvgsSXg
	rLDX1sEIeY0TG/8u1brIzn5Oj7v7ISxCyvHFhqC7+c4OT6sG5BCUzPS5d9Uvz1hu7cOJi+1m/8j
	FHwNRDVtS85UGhLE9r3ITsdpDyppmJPp74kqN4TsskDVoh8sfG+Es72HEhcQZe44Fiekayybgwt
	vPhrgfNkpmHAi74DkN9WDqYBLqd9fkbaEChVNA8PSx97GRPQ+Npdwr1j4/edTMGz15qRBz9MezP
	2nsvnBK0GyE9NP2XK2Zn5hQ==
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr1419266d6.4.1789991094395;
        Mon, 21 Sep 2026 04:44:54 -0700 (PDT)
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr1419036d6.4.1789991093948;
        Mon, 21 Sep 2026 04:44:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e35d64sm4266508a12.30.2026.09.21.04.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:44:52 -0700 (PDT)
Message-ID: <15daa9f3-162c-43fd-b22e-0194b82f602c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:44:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for PCIe
 root ports
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
 <f2324e26-88a3-4411-acd5-9645552c4a14@oss.qualcomm.com>
 <fbtundyvbywomj67ee3jyogqhgrvndrjqctvkb7ttp7iy7pkvq@xocvzaiq7zmg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fbtundyvbywomj67ee3jyogqhgrvndrjqctvkb7ttp7iy7pkvq@xocvzaiq7zmg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfXwZ4gNp84jW6j
 F1iYIgdGNlGCc8raG9omXzFEFdPr3hwQUb28w7ps5BtrYB4VH/4noHCkbqzKyIYBPbyaJl6Opxw
 oOWCrK0CE+HJS/MYDzYjdTO7Saoh61MSe7Qlyk5rRmwzAFXmWX+mIz2fDH0lkjKhLvSZemr78L9
 xgGUvrlgcKmvBv1w/5y2pBTxtmtieVuE/b5QcYgW/ZVEg3PlvrOoL9Lf3oQH+bRt6AU9mfCIkfV
 NeX4ZkUYYWNIJrocCRCVWk5Q0cIUDHxsG9pgUfgaSEyscsE60L+tQq6MKwt8S8InIDjrF8KJZml
 1G0cHvLwG/PmZbQkyYQ/8dlyP0svH4hLMyh9vaLm4ctSw37zdQwnMwwHYIRQe5NPJLjfM+naUTS
 y6WaHk+ulQl0j+vbOhlO+lGAwzel2+3/br37SWPh/9FXsYBi0oip5bUryULv+Xh01paVLxH9vtM
 Mq21Bm46XDhajHGPtXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfXzzKFSbp2cyJO
 9c3b9LvBjTeO/RfgNGZTibgWmRhJS+/0S1yt8AGQ1nMfneSq2tHiFVrPp8tzbQB7FTM49IHQLFn
 dtTG0Y180gLWsZkFeMUnOUab2P44Qjg=
X-Proofpoint-ORIG-GUID: yXv0kbfSvCa7B1tYPYS0-vEHWt2Rr8Tu
X-Proofpoint-GUID: yXv0kbfSvCa7B1tYPYS0-vEHWt2Rr8Tu
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab118b6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ei8_fX62Guvo6lbYW7UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210170

On 9/21/26 1:34 PM, Manivannan Sadhasivam wrote:
> On Mon, Sep 21, 2026 at 04:40:43PM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 9/21/2026 2:09 PM, Konrad Dybcio wrote:
>>> On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
>>>> The Qualcomm PCIe host controller driver added support for parsing the
>>>> -power-on-us property[1] from each Root Port node and programming it as
>>>> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
>>>> this, T_POWER_ON was expected to be programmed correctly in hardware or
>>>> by the bootloader, but not all targets support this, which can lead to an
>>>> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
>>>> behavior.
>>> This is a good problem description. Does it have observable effects
>>> that could also be mentioned here, beyond perhaps lspci reporting
>>> an odd value?
>> we haven't seen direct problem till now, but we might seen some issue due to
>> incorrect LTR_L1.2_THRESHOLD value.
> 
> Can you specify what issue can be seen without this series? I'd assume the
> link will fail to enter L1.2 and will result in slightly more power drain as
> the link can only enter L1.1.

Would that produce an explicit warning message somewhere?

i.e. can I reasonably be able to tell I'm missing this change and
I need it?

(if not, this is of course not a blocker, but the answer to that
question is always worth sharing)

Konrad
