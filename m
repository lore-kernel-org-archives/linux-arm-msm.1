Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106272;
	b=Aa7b8je4fpMYQAitA5qrukbzKQVAAFL0GTVlF0yfp36n+xTtIpYqrY0NJM+7pLErxzQg
	 HrXvktV5MNeBQz/CexI3gexmffVGfr0RJF9W5fa2MCLz9kdQSC5ntSvzF3PKN//RfshdQ
	 +Pj0Zzz5kpQPAXNxpFPgg/aUhLx7XC3S5fzTcILJqm8RcN+4ROLeir9XDFlA0nV2rARok
	 pGvzeK/QJRZKzbJnqi+6yCw+QUe+FW/caLcM5Tpdm3lWVHFq+BUtetccza3vVAJDJYeOJ
	 8oXERE8e1CgjEKpCyYfvR3YZTSkH0x9b5EgxM0iKHBFxx5aB01rq9j00EDu/fqMNOMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
	b=zIWvlBHWtrzdmAKVXGhfZTyctJfE4mNQaZPseo2xMyfj8epcZTy1p6zpBIW1VSuiIAuV
	 7ViZ7iqPRKqLw/VgWDy90wsWDsoL2sBPnKtoCOoS3EkpUCYUn/Jbx8xGnx5gKuktN557N
	 HKTuXJgxXDi0rSUwO+pzyKOligVJz0syfpLEed1isHGnAjUJzatHkRBXcPyolYRWcL+Nn
	 d8i3u0e6LpLfUaxEKKSXzsYuVo6z/+aWclWIxd4E2ROq2jxRuDs1aGdcAfWCsEIvvo563
	 y2HYHUkxd+uOu4WcDjF3UOxTG+07KJFPUqsVBeHoXMJJ7nIzYaaNqrUPM0wYIdRVRqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzoEnh2f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BD8liUP1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05254606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05254606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzoEnh2f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BD8liUP1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxsk2523923
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=; b=CzoEnh2fY3FWxv+S
	mTyVyGZt1JOg+PzIKup5Pv1txj9hnaELLI7UhW9atQHV1vRzQpmfQLCNyDl7dYRP
	2v6JkzqfmnHdJeCvEx0z3H/FdXaEoMfMiNotmlzWH9X+qWYvb9WMgBVrW4J8QjZL
	4cMteuqeRrUT1wPg79EoKsmR1JgrDdG/Ug22wxT1Z9Ms7RbZ5LvSHaN73atvd8q0
	MHQJzNkFICLfmxuIvfkGmjNCHjdPDQGxERMeqAcexn60WWlqZwj41RQzLW6U2LR7
	ok5WyZsHvE5huQFUHISRqYwmnPF/kPH4y/kENR8N9A50S9oICFsvIxPg93V7xHUt
	2unGSA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw216ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:04:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso246415e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106270; x=1793711070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
        b=BD8liUP1HYEvR60U6DRxz3FSP6rt4asjLuyFsoZfJI+dSHGYuA+jP3dkZTZr7E0AXs
         CFVA6dkq+F4yQkCLfzI6Qc+ykNgSDfhLDnvO6utVg/w64pDbZKIbeV55VIdf7fPFhgjF
         O5+MzmmjRVYmTDMPASXkGjoWZNWFerSPHroB2RFKZzfwJrractCnjsV8hAgUdgnpdeJw
         63KxNslt2FEyLgXb5WYb8aYoPkSqvEEUhIVGjQNyCJghO/5OEK16pVsho6B0MObZgvxq
         JsEzqUZiqITCFeRMQftUtyBb3h+NoqaM9R24Ne8yZab0Vuq9SwEAEmNGJXcr80ZhMdEL
         k4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106270; x=1793711070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
        b=JKTbDzdM6106lL09l1Kx9avQwOegxvjcUSGT+VtKAn4paCcnt8E6aVkjoBAakl5m1U
         N1mjcMN6n7E/pkAucEJotKQTO7ODXPBXmgLbXpx138wikWy6mXO8uZ+7vTF+YUrbBvX7
         TNzOkeDZ9n7D7QlSVQFIa3HTohsflXaVL5weht5hWXP+6imepOSR+g3W4zDQ2oYNzl2D
         F2GT7EX8CJR3mwk1e8zmfXWUDREvsT699E9ZntvxgH1djB0g09evSWGeanuWtODPRfR1
         vG9q85M7UrVHxGN0GuZ0BRLmqk+Rji8XloPjV+saBzol8roi/uGJdOza1xaMa3ibSaEU
         9qTg==
X-Gm-Message-State: AFq9FYLzMphJdFNy4Jddi8IfGZwNmxkfTnJAHZ4+jLdduwClSWM4QMQt
	EqAYV3JMCHdyBavMQspYy3lweSLAzov+YHQ/Poc3UUQKr+/AYkM627CnPS7euCNlM58KPYe/Lqi
	Hj0yyhUnO29a9ddLfL0ZkLBZWoiNFDMqgGcIb/fu1WN2QSkWt13wXPPb67AOan/BNqRrH
X-Gm-Gg: AYBFou160OU0/tilSKgyY2vKOCA4fYrWaF/ym2mSaoX7sS68MdN0Zb6kn5gdUuONA7e
	ZauWkNshxNy6ZYmcPPMyN5KR6H/7QKuX5mNWu3Vg7n+XbjaIaLNQ6Zz2MnbL3FrPukr2dRT3zBa
	y8TpAk2QblhdUGyA2N18XlW6bH261FejICyHF9xd3PEqjTo0zNybweE/l2vuLtntBIUViiJziy9
	6cJK60Ngl8qzDPZ/oFyhR/L0h2YzULREpZ9SX2dCwo60//Bfa406NmcUg+eI5/jNYo1xkQ2J5BA
	G5oIDZn6xqqISkGP38sza5gS4hGHT1Z5hYMnru9PuloyCYOufvXNX/YLNxiWwG/R3kbk33paQA9
	KdbF4Y1GslvvyyAV57Iz8lQ==
X-Received: by 2002:a05:6122:c2da:10b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec23230f38mr3698472e0c.3.1793106270031;
        Tue, 27 Oct 2026 06:04:30 -0700 (PDT)
X-Received: by 2002:a05:6122:c2da:10b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec23230f38mr3698435e0c.3.1793106269536;
        Tue, 27 Oct 2026 06:04:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a894d5sm2072671e87.50.2026.10.27.06.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:04:28 -0700 (PDT)
Message-ID: <08bc0714-4998-494b-baf5-bf1fed8a80f8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:04:26 +0100
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
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
To: Ishu Brar <patches@brar.si>, djakov@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        konradybcio@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-icc-sm7250-v4-0-f9bdaa3c1c7b@brar.si>
 <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX4TG50WblNeD3
 xcl8KuyV/eWZMOZbfg4r72PkNAYN/P/Ct62J8wg9aCzOsru4eInbjpbA6JlvmvwXxPTxNScsYaQ
 GP7LQgNgMrCuXIDTwqkzrxFC6oXOkcLsE2YEcJL5ppYqoUGjqHvQcLnR9Us0TFpUMymp42YT7pA
 1qAvS3lkQBt7OqrJbxzouP70/UNpVLsX3JcV2A59Zwv1xfOFm2VdHiKmaM0AG1idVFaN7jYRgox
 9cPRnrtwd6R4tL2E0rSnH2QFs/1+pKtm4v1mmk5jWFdE5D9XbLJESrZ3UiyFQGDumexKSQvNNli
 c0JqPXq7DkB03xUrrnlmLoLTxtxpfQOfagFI0Sw7SC6fTRAkdsxUSZEWi5CY+zIH8ENTpkRUJj9
 yHH7+JW2jKxdaglQudT0UznymmxsC/461kQ0lNz5QMMEdAId9TinQQVZi96reIgzw/fkt8KJUNt
 BKMpmWDygPrJ5T8hTBQ==
X-Proofpoint-GUID: 7h8-45X2vPfkFqTyEfOFeiEFPr8BDtrm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX0c6x+1huN6EF
 rou/DTm241TXvWpE3tKUeJSHnxSbnGs1HWZC+ThZhMuXN+e3Es4Tokhk1prnV23xgs5leOCsVBM
 oQXBSThU5lYfrnyreEVHdAOkqQ7Iexs=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0a15e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rbLHc7TusOZuPl1584oA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 7h8-45X2vPfkFqTyEfOFeiEFPr8BDtrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270051

On 10/27/26 1:42 PM, Ishu Brar wrote:
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
