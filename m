Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A41424D46
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976239; cv=none; b=GSGoNLAoibqn31Eb4afv0MuKagaNgsmUpIxX0S8FJvA+1Ladelq4wNR9DiUFAvErbPoUpswdP4M4R7XblQMLdWuNCuqpVZntznS0SgjRYNRJmYxmf1i6eUNfzYD75M24t6GBjnexXShYpEBe/TD+RzqtyXEnM2NZmpKncVyO/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976239; c=relaxed/simple;
	bh=zn/AZhlI9NSBovtLHa/ZrSMdu0QzWX4YxJ9bkOoAWso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8bfhgZkcFYI9bjlu+AzYRZ9h3lDJfFOwsTPvB6OF2oldDFtGnWyELTIYjEc7QTnOC6VJsb5YHTGX0Mvkqn45BfWM3dX2xeEvxDExIhHuUBzkQXnv5E9i8ey+cVkJ00qeiVMXbudV0f7zEc2sLknEFHLgN/a8eiJ753o/n+KN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVZ/bqTm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gs/3lb5F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVZ/bqTm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gs/3lb5F"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79s8Z1624331
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H4vkek0/ZbqGdMSZk4suthyJcTIAG7Z7PUDKSg5AbNk=; b=jVZ/bqTmgndhwE0J
	coxsNZ8+mrbKWW8CHCFPd0t+2fILFKxyHNCEub6ZxeOTHlwARyBQ4uOaFygaM2W7
	TicckL2T2tHhyKid3cooofHbUM18EvMktw12QbEOHx0famlhHi25FpgAxNFa7nN2
	malkcqr9k76IsdfGnvSgFbsVU4NwrfCObSs65oP6gxRVz2jvbJLGmfRTgBUXFlqE
	JJvAyLq2tyWluHF5FWp42RvvwVOs0UXml/rDih1aqYlbAQzsod04Uq+LD7ovmF9G
	eRIh8GSF6lyoIkX/Aaje21x+hQj6J+gqevKfospTyywVMcV5D+YbPXFN+mPZTykV
	uqr8AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3ws6tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:37:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so55285385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789976236; x=1790581036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4vkek0/ZbqGdMSZk4suthyJcTIAG7Z7PUDKSg5AbNk=;
        b=Gs/3lb5FKOcmcroC/9FWcR2LaGHwfguSWEu0/w6dhXMwpTSk3uj6WDalDra748Zcs9
         G9jrdHBAL8pfgRpWhGnQ6kGuLTz5ZlwWLwj+PMTGWg2ystBkWi1MRfSdvPUNnIr5kpDz
         InLQTuh4dmtNgdQHgFzxCrTgeomXqyYbbZ97ymfZS26jwxCbedLEMldglfAW9HxSNZiY
         EW0NvwkmD4zUt9+YknAbnz1/lbHzRPf4+9s1KH0d+l4lMK1o+LfKDqRXEL5R/1rBoT0Y
         7tTR/SIHAjnepcYwyGCrGRKR0unwMaTaTisGvahb/dEFNc9N69pG8ODP5o3FrOgwNBkc
         6H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976236; x=1790581036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4vkek0/ZbqGdMSZk4suthyJcTIAG7Z7PUDKSg5AbNk=;
        b=ymXhGX/XjTPWIoRnwgYtCTOjpXwnHnqe2dj7wtC+/WRovvDXxQSu7CmxKU+WHiqEbF
         C30JmNVC1/M/+LA2zto5mzq7VWk42r8YLUkz489r6qSTxsx2TETEIRcP5pcnohgHVNSh
         CjSja3jXirTqPSpp1TXC9nHpelmml5X6Jw4dMbIdf+iWnSOke/P55tOhIcBICxXQsKAw
         90zcyEeHWCJaKUjD2FmJJCYBbmFfThPUVnz3+oUk1h0pQy4iiwOpFj4e/tonR1hjg9HI
         /8KfRa2lZ84fiRxO3YTCMc/FKzrYFgY3asvCvhIqb+y0q62ifORELSiIRZpjvPFgdO42
         6YSg==
X-Forwarded-Encrypted: i=1; AKwUvBzk9Jn17CbrNd26oqhpqurpd2Ku4NBMZlIH2ymmmtLM2ycYSNQJrv0s2kMPgZmFns7JezzlaglMyyvonZYR@vger.kernel.org
X-Gm-Message-State: AFuF++nAZTD7QpyN4bSlfIc67mZU/N16/gnvSQ4VM8XjCTPXPOgRMe9P
	DA+4QFCTYeDOny4G7kmjBi143G+cafRUmLkpuvlz2ssX60OCjC/HmCMXcc5a2Q7CA4t0nrrQBxR
	X7witvJVDJEYgiNbyZrj9lQ55a1fnPbpMXTxbA38QVhv8gGwbMVPgCSSYwN4xv9oL3kxO
X-Gm-Gg: AYBFou07gSPnqeML86rGF2qKKyekZhawM0OhsNro6+dDaXynAcNqxiWpUX4mlmTv1/M
	wl/fXAlXtk2oY4sEx0VjFx2ecOhidhNj6womZQRX5UTqrkDhjOph9ra9geijlhCkyOhb2ZnrKl3
	whoNS2z5GOfPYTW6DLlhLXx6Q0+RXxKj2sJ/U6gHXcG6yGb/yzryFZRYXIoTadla2l5nwGXeSBz
	A098lCcw8uFKBjOBy7/HUJRGku/WpYNEErJ1Rqx9cIS0YHQz+dPo5D8b7C1UBlg7q3MnI23sHzz
	R8n7dYBb2uTCIdXkedMDIb/u2YvbSRUKfYWSyV2ZyxJN53ie1pAKBLRXBDg4UPcQvb3TTYL2VyW
	s2Ho2L3DQ3CeqEXGhY+R71Q==
X-Received: by 2002:a05:620a:6cc9:b0:92e:6485:f640 with SMTP id af79cd13be357-93bf577a07cmr801548485a.4.1789976236122;
        Mon, 21 Sep 2026 00:37:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc9:b0:92e:6485:f640 with SMTP id af79cd13be357-93bf577a07cmr801543985a.4.1789976235653;
        Mon, 21 Sep 2026 00:37:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3573ce12sm262631266b.35.2026.09.21.00.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:37:14 -0700 (PDT)
Message-ID: <dfad8320-5a92-4398-83bd-3e796faa24a1@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 09:37:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <arDPABIQl9wKYVKa@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <arDPABIQl9wKYVKa@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEwOCBTYWx0ZWRfXzEefO6b88fVd
 OtOL7lVdKP8P1otloWTvhCmaOW7P+WB5sQE+wcAqbO7E8SYxoJEjORgeiw7Wm3ZTaSWOEj0L6KE
 F6Two3qQ5Z06MxswTBkC1OpxUKHy/FgF2Pufz0dUeVli3nHvyPNTV+PQFxqo2bkYNi+6licuBOb
 LNZQ4q3WSWHi+twwgRJg7fph3Yp83rodb4W7C7O8mY/2Eo8RQmK9rI/2mWmqR5oEPuOudU6Os7Z
 ZeotUTGoFN0SRWYPUmngp8oSLD6QYQm8DUFpXkazX7Q8k28dn9IJosFZ8N2fYKK7Ru2SZ+IVSJv
 WAjK6+7ITYTvC7Qe52iBOzwduaU9KR7fvtkIhmzKqJHAuwxHpElzZYmzTjWmUNCKLbQwNycptdv
 l8z5LG3rRoXTtKJ/QLLn2so7xysVDjedyzFe8Bf3NuXWfLkdRkKkOpxlzUE3LEjmLQc3sgWgoLr
 seS5qAwzF0o3CTXsnQg==
X-Proofpoint-ORIG-GUID: KXlwEoI5fi6jWk1lUwZtQCp9BoJ5bZDB
X-Proofpoint-GUID: KXlwEoI5fi6jWk1lUwZtQCp9BoJ5bZDB
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0dead cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eQCDFL0YdFa3ysEWRUMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEwOCBTYWx0ZWRfX86GbwRHSTJxb
 7cv+xvKRivSedyYjewr20n1nveqj9/cRLoJvrRCPgTnregBsa8t3JnCCTCOSkVDM+RrEheyK71o
 jzuxD/1Fg5ishPYf0piKOG+Ajk49ClE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210108

On 9/21/26 8:30 AM, Qiang Yu wrote:
> On Mon, Sep 21, 2026 at 11:07:08AM +0530, Krishna Chaitanya Chundru wrote:
>> This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.
>>
>> Nord has a single Gen5-capable QMP PCIe PHY block split into four
>> independently-clocked and independently-resettable ports (A/B/C/D).
>> Firmware selects the active lane topology at boot via a TCSR
>> configuration register, and the same PHY block can appear as a single
>> x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
>> is similar in spirit to the Glymur multi-PHY support already posted,
>> except Nord's PHY registers are programmed by Linux rather than by
>> firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
>> tables along with the power-up/power-down/soft-reset sequencing needed
>> to bring each port up.
>>
>> The series also documents and wires up the qcom,nord-pcie compatible
>> (reusing the existing SA8775P PCIe controller binding), and adds a
>> CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
>> convergence issue in the PCIe power domain.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> Tested on Glymur CRD and Glymur QCB, devices can be enumerated.

A test of "this didn't break my completely different board" is
welcome, but looks a little confusing without you saying that
was the intent specifically - unless maybe it wasn't?

Konrad
