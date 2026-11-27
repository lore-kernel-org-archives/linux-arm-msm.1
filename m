Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778926;
	b=Cy0SSEKiz5ybNXwAyyztbC3pRnZVDP0ALpOCpiDSsGfCEow6pN6SZsB+QbqVu9FAssH3
	 TE/sMFj4okLSf+lIY0lj/qgzuqoJB+SBZ1RLDTuEFd/Am4n6m2N10r34jo++X1Jm8bqJI
	 wEMeBjw0+F3B3egSjVr78KgfkIn3qkCBowxUsglggDGzQ7JjwZIhjhdIbKo3SiEeC+Gbk
	 0T6o9WZ0SYGuL1DK2dDqZ9oPcCwz8HNf42Qf2cvepkMv4cueb7p0mTgSA+nmY+lwK5tWZ
	 1q2G2rOY6O+E7yjui6JnARU2nK2gh1xSY0OmOK3uIiReb+ZAhltyHIZjOIxY6RPf4Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3QcMFLkVoOVQbwwuwu7BQKszQucYPXEBAdfvcVBv04Q=;
	b=QTPOm9XVI64W2U1LA4gQO3Xth4aW4R18j8YOfcZmLoVo0s5E6TTabDp/M0J9jzePWc4k
	 7Kfa0tnGVYe8wBPV5FSlhM6uEe6qzXJru+xlJMOHIZa9GFieX+EXAKirFJodDn9/rBEsB
	 ToLwEZ0g49cuj1kox/TaSaCmEo4DYoSWPBQj35Fztq4Af3oQg3bqizbfknjVEqDIUmMt6
	 DfMkYHJXt+YHfmxJZsTbMLbfOMXdbsxJcEhUKsP+j2F2cYzpXMPy8eKp0gzhDIEZ9T/CA
	 6eANn0Z1FBQtqP1TBRcnzng2sRlCo8sgW3/I4j0GSTFEHR48ZmNCsA9VVrYHvry2Wew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cffWaVwq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eoXRxvyC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907CE606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cffWaVwq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eoXRxvyC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp1Ex1047034
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3QcMFLkVoOVQbwwuwu7BQKszQucYPXEBAdfvcVBv04Q=; b=cffWaVwqTRC4Xmkk
	q7CQKO27Qf+HBe7JXDPh3qS8EMBx76rrdczz6lIFAV0VPeOdqyVEZAGMh6+6g/cS
	NhmmwRw/QQGVUnYqkKcASyknzWEx8xdLsykuJh6v51+e8LVyVmAWq6bZeznxHcy2
	NWBaJzTR2kyRyrN0zSw5Tw7Xf1ApAJdCvdfTX64c9LAEms1IbghLnVzOLWcxoVZL
	IR966B1kRxA+GorI5u9NVn9IjJ6sd10Dqvp2/ov9FOe00Y3qfTk8RuqFdmVN9lrj
	Cxx07gW8c8NrPAdBpFJk9OsG/Hv6FlQGtoT7csVFMlUVcfWeyCXKIek2fN3flL0f
	Lk6hpA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkqkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:28:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55b9c41fc3cso21844661cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778924; x=1796383724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QcMFLkVoOVQbwwuwu7BQKszQucYPXEBAdfvcVBv04Q=;
        b=eoXRxvyCcG0GcIcguIYGwmHfNh5pI+biCVzVc7biSCICitb+H0DkMW9ywsUKxDWDlw
         2eI0Anexx22OtjIOu0K5DCmfLe6jVButs+1LotzkN+9fotpvLNvpiw/wJ6klowLu+Tyh
         h/A2TavREPeDBa1RzIQZEKE+iFxFSWE66fDcm3LN7qMjOKej5/WDKqxOe1CNPTrGo6UT
         rEWLhvNoR2sYPnPcHxW9m1DAHY/kOlM4EJEQ4DViiYFuzhmMSgK5t9aXW7Bd4p7uiGMr
         efU2fBE2rcwTrQw3sThmco0QB/6a4LSVdj7A2UIpQVRsut7szxdycng9s9TldFdCeTi1
         awXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778924; x=1796383724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QcMFLkVoOVQbwwuwu7BQKszQucYPXEBAdfvcVBv04Q=;
        b=UwlFCRellAliQIEARLjyQ/szXibdnTXW4tpMxr/bLCTZ43MgCtahbrhszK0XRGHm3z
         nY6PyELdG+7c2q0cwSnwkAU93fjvZDG1ruy2LL3pCozK39Jf4tjSlKyCK35awx0tgMio
         sc51dcugCqX3v3lJiLpfBUjEX98EsTG7TTyyaaea3MU4GSrXCcWJSpuQCNmhSeDVYbTA
         yp9Gq3tp3Vmyn6k0np2v6BnUuXv108ftmqt5QxbdUsbsy0Umes/LMDLO+mfLceBrGwRF
         zLpbpBb7pIediKxVg63Sqf1MlycJh+ZomdBMED+JcXaVE7cziy7ELzHjgeMw4pxyboV7
         vIrA==
X-Forwarded-Encrypted: i=1; AL+hErGkB9ZDfYbU1Mlcx9brHtJ0XXtOZwJhCQcnC0GLUzidwx3rjH/kJxUi8btul4yzNpoYFF9Nbxfgu/p9sJ8y@vger.kernel.org
X-Gm-Message-State: APuU4Z+Englzjb6ow7XOZI1V7W7obt0k7yXgGFUWGNLDS29hBWh4rku6
	naOQxAkbtO7KoK4pR96LQYLu1LDCvs/93lzq4Y6NjrI3AYaLKmsBK1rGjOeNGWIrKq3P8PK9+L9
	9htGdd+zO98S2ThzGsuYxl6SBDX27Q/sbtQL93oLFugYAV521vLN6hNmmDK/MGWXPWbAA
X-Gm-Gg: AZFdTZcqw/LrihumxjLLgBQJb9t7RKIxVyGPqMnQz+c9qdc8Rgi4zN/Nu9KD4gFtHkI
	O32yGwrJ7dYsnSvNXefuCuyVMVaXBnvVM6nt+ysIEk2VpvubpjRXgFExaSCwk/rU3RSMJ/U3VVi
	PtUABWF2g1+CV6Cg+9oWj0Bd2h1hBynvE6XnwUX1yg1AFLY1mOcrpOZRVbBZgvYx7fbhq97sMkX
	5/rzln74ADME1DMq9IGwoB/YzXJtOfAFAE/lJD+RSPwd3uOOH8xhzh28iXnH44cGy5VjOhZx7bw
	803XWDp7XZMvAOiMe8F3SauvhnDTQmpgiQwyksWnjGfWFMKY8oeoi0BpL+RFRoSobJfj0v3GTWX
	PRKTeqem81OowQ3yMHxRKx4L4wsZq7NO901emQ0ywU4Fl/zldi41lg6DDDAWmFI/iRoqamAc=
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4352519685a.4.1795778923975;
        Fri, 27 Nov 2026 03:28:43 -0800 (PST)
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4352512185a.4.1795778923280;
        Fri, 27 Nov 2026 03:28:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm853935966b.80.2026.11.27.03.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:28:42 -0800 (PST)
Message-ID: <a049f292-848e-46cb-a2b6-0c4a82e9a7e1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:28:40 +0100
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
Subject: Re: [PATCH v10 2/4] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
 <20261126-shutdown-v10-2-fed60d9687f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-shutdown-v10-2-fed60d9687f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lK7j4AiEVFmNv4FKohVd683uieSf1LlG
X-Proofpoint-ORIG-GUID: lK7j4AiEVFmNv4FKohVd683uieSf1LlG
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09696c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6YwwngTh1o4zImgwx78A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX+oOmUK+6OaBq
 JiMf6kH2LsJr4c0T0+LVVtFDuv1N7/LCeT78VOeYCEC4g5pGgSW7PNct4pMwZQMtIie5DSw02U2
 3Ds7YCDC0YojeouUzTb4c/dpt6h/tCk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX4axuT/+SmsJt
 I6igOvWvGkJC8MMnuh+7K5cMYgjpadad2CVI2IHAz4gd0l45I3a8aNUopWcpDjNnQvV0nAQBLax
 B3+cRQHW5GTvXKtqKaZgtt31c75lyK0QWIRQmFWK2F6UlbodEjzihG58XzJy2v5uekaVxuM+HZg
 h5kUcDPLMwulzQeLH5t2eWWlk4k5TEonAcEDPi7qWtHKtoN5WjdEXYFWzCuwIGARevEXXHGy8ef
 5uO5afXUgQviNWfGvINBeDacKjyGoWWlhPDw/tARutox5aOyEO3ZfSaQmtdzL/yuIz2tfSWFgoX
 TzqNpLmU7GgYJo/OQrrHz9TY7LV2WtSc44LHOM3hhHbtYNafYpsmrPBwH9j1ckS2eBGobqQpWpx
 QjS2WAUiR6itDxdVJzi/hQCB1MfwI3Uj9Zs0iMGOOK3tu2KwpMGDZ+OldaeQBB9OFYvwin8Yl93
 5JqoNti78byQnsisoBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/26/26 6:17 AM, Krishna Chaitanya Chundru wrote:
> dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
> to check whether every downstream endpoint can be put into D3cold before
> bothering to move the link to L2. If no endpoint supports it, the
> function returns early and leaves the link up.
> 
> Querying D3cold support during shutdown is actively harmful, not just
> slow: pci_host_common_d3cold_possible() requires every active endpoint
> to already be in PCI_D3hot, and returns false otherwise. If any endpoint
> is still in D0 -- which is common, since endpoint drivers aren't
> guaranteed to have suspended by the time the host's shutdown path runs
> the check fails and dw_pcie_suspend_noirq() returns early without ever
> moving the link to L2, leaving it up right up to the point where the
> system cuts power/clocks to the controller.
> 
> Add a force parameter to dw_pcie_suspend_noirq() that callers set
> explicitly to force this behavior, still call
> pci_host_common_d3cold_possible() unconditionally, since it's also how
> pme_capable gets set, but ignore its return value and force L2 entry
> regardless when force is set.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
