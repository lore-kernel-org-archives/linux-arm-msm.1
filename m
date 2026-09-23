Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA1393DE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139108; cv=none; b=KnfzOKvr5f+cbzJzBEGR6pVgAj13F7YZ9uqFKf/M2E+0A/doY271kk1g7lfCLPJlnNo8zlAf5r4eTJQ04VC5lQSoS8j/rccAWEIOWM6EzKXHdQXsGHZRTI02p5VYtCy7g0OdeSrtaaidbOUFqZSIcelY7FI24XX4aV+EiHvL7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139108; c=relaxed/simple;
	bh=gecKvURIaASpwy5OuMmJh6XsWNCm9L91BUQ1Aqi4Qrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDF8AvIUGuq5ZyNX4NzZZA9bPv33Z6hTpGRo5ZbFJHVgcRFYDGijMxNKe3JDEJuXJxAPh+TdclkF2pO0Nm+SOZoXE6KVa96JxYtQPQji2EAxJDkAleIXSlISIjP0LrQiuMia4jetYtymayhFDXkigGuwgePgYv8QyEp/YuduDfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr+fuC4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEmWJFDc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr+fuC4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEmWJFDc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iMmc783359
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gecKvURIaASpwy5OuMmJh6XsWNCm9L91BUQ1Aqi4Qrs=; b=nr+fuC4HOiLkIbY7
	sulsLEi2NsBD7Cz9qK2IQ2cXtwzCu8IJJDtMPh4UExleRiYODOCkNplUz7W2FqLf
	QVSIRFC4/PbRXyRsyCqMv7HCkjtrdhuIVJ0Hry/0ekeDR+ZuHC1At8cd3c0UsD5a
	7LD/sU9OmgmiYchchje3AM+c2QTa/mL8H6Hoqyu5Ab+21awnXbkxpq8fqakYXlDe
	Ki7bl7zfcnaMMEaye8XxFq409nGQs4+llk5/4LG+ksz0fP8i1dVlOjGY/K5n5nOo
	j6qIu8cP/u8vuxpnCk3bz8SDkYHBHGsLT6aY9RRLMKj9VoX+K5fhwU/QLP+CBfco
	tRx8Mg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma21pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:51:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-143803143c4so1050602c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139106; x=1790743906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gecKvURIaASpwy5OuMmJh6XsWNCm9L91BUQ1Aqi4Qrs=;
        b=VEmWJFDcvTzgebnWV5fIOKLd/rYfaqMd9LnXzh9m5uLcqYaWe4Zwhg87eWC05TrSck
         OQ2Se20P9OdML1Xfx+CoohCogMnMuKBoNA17Hvhz5s6xDPXK6r67zA0FYe45dhndMIeA
         HnoSnPLuWzLxS5YGwNSuDvyyVEa8s+kS1sNDdDd9Sz7BGeG6vEB73i7TsmbNsyNlgQHt
         3QTwn0zJu86F38JFprlDBRZoi/5Hs7Sk1/j4oycjZiDwE5CZIUwdSrmOLBcT0uFungee
         Hdec4HrGsb1zBRJWhrxQjKTtOrBF4aT28TT9D7UcwAgmQRgtQQm39GB1yBDYRJ810t14
         BTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139106; x=1790743906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gecKvURIaASpwy5OuMmJh6XsWNCm9L91BUQ1Aqi4Qrs=;
        b=VxmzRguk/S9BdgtvddNTXGZ4EUpRSaFBaOhFRR0B1so2nqlIMPjZhVCttRE/tysoQz
         ADsxQwso0o/FMxQW+NIRXkMVdrgKeCqixGzF5hxlUIQC9kePnrc8oymC6pxb/W3Ma/F+
         eVXiHH0mRAYiHuJTSzdWi0gJHCkPo2BLcIofSMMQWxj7RcL6d5bj8IJqnEmDX4VBy9bQ
         6oNd7bPAdkr5K2CCLzsG8DSm5PRlWnfwc7yB+WXjROur3rxtuuvJBCAQI2nlfViNUbCB
         o1/bAYCO5bNjx1DY1sXgBerXNY8lq34Ik1tQBdjrkOGYjFfGASC5XscQTIWZ51Vw/sA4
         0aFg==
X-Forwarded-Encrypted: i=1; AKwUvBxxUlpp23I8MVUsiIC+10QANhjWdjyYB7aINv9VOUSAeAj5ntc4CRFUuGvsea5YCi39PQl9F/T7U/1mwTG3@vger.kernel.org
X-Gm-Message-State: AFuF++kU2S14mV+PuS4LmbV52uRMdT7ymkaODa+iX8hbYBb70qFWpFGR
	HSvo5L0yLPFljkEXo1D0dIFaxozjTrxup0zvfoRDTSx01LhSuMgXn5TSWCIC2UpHAkdfvMVkPPQ
	IR2pyETQBfX8Y6m6YODb9Z6TYaWW7yccqbUCLlkZDe/G/9wvz5wKuPKFY6yuIDHZ6auZLOoJwQy
	Gl
X-Gm-Gg: AYBFou3wdg2a1BV0PaY98+/8z0r8220EgrbcJ+Xprg4nstmEDG4ldJGOryzWjNjYRfI
	XLS2azJ83766MdzeRhaNesYEseCX9MZDmpZCIFwq4zaLe8o851Bo+qDhsbSXhsjy+nSaE1lPF7i
	KeoLuuFZHsS+nKypc/P76RwOTE1YVUv/zjSmQEp3JOodqywh3BM5cG386XxIgsT1005K0RTfaWU
	dXp9DfgoH1rq2TXwWZeBcbfBv+pJDqkyHgepKv1kwbJtRPWJEL0R9f78mbUptIva26njfQF9RPr
	0XgEI+fx5MHNJTJnmDKbjudAA/y/8h8nkMUMkMU2vQ9fNe+c4vT1GPkdvAYvZTP0osU08tzXdrE
	LJ79JcF+zw/ety+KoZW59/nYBXlDJdqXe
X-Received: by 2002:a05:7022:43:b0:144:e0cd:76ad with SMTP id a92af1059eb24-144f916a44cmr2168772c88.36.1790139105775;
        Tue, 22 Sep 2026 21:51:45 -0700 (PDT)
X-Received: by 2002:a05:7022:43:b0:144:e0cd:76ad with SMTP id a92af1059eb24-144f916a44cmr2168735c88.36.1790139105208;
        Tue, 22 Sep 2026 21:51:45 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm2785088c88.12.2026.09.22.21.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 21:51:44 -0700 (PDT)
Message-ID: <cdfcb65e-9a17-4f93-a1f6-d739727ac709@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:21:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: X1E80100 USB4 PCI0 MSI-X routing under EL1/Gunyah
To: Birk Skyum <birk.skyum@pm.me>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "mani@kernel.org" <mani@kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <g7V4kc2AO9xogkH0h-XHDvPbjDXcnS11cp1q3hv0X96KPW-zed6V79HUJY5BFA4pBWUE-p2MBYCeDcjWwUGBIU2hXjDpodiWaxB38obe8RE=@pm.me>
 <arEjxhvfIFGGo9O9@hu-qianyu-lv.qualcomm.com>
 <C8SBDdV0hyOxs4G2FfZBHt4_1PSRVoxaNFSmy_riJk91MhqFMRAt30lpxdyniPMLWnc5Ph93lS0R1nCkVbuV941UrNmWyPNbDER9zIHlrJg=@pm.me>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <C8SBDdV0hyOxs4G2FfZBHt4_1PSRVoxaNFSmy_riJk91MhqFMRAt30lpxdyniPMLWnc5Ph93lS0R1nCkVbuV941UrNmWyPNbDER9zIHlrJg=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Lt7TBsq7uH-lp8JMZ0QjUslz3xa9p2Oh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX/DW93JEEVezO
 TVpOs1CEez44QjLV5vBfJsS9e4dpEtbV/RtHufPwA0tRLQFqxf33G6IDMr8gzr5qq0J/dkKMpqv
 jnvI/Uz2XBCBRX25ylghKmjgNVEOjOI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX0lEsMju8CUKU
 opUyhfWr2fyguwxbhOJq5yxe8TUk0LxL/56yMiI7hKtayskwKglvX+UiV/TI1EIgOBk1uK10ewx
 HYwHHcyNVAvlUqGnlJh66VieXirYJ4ElqCv3cpio19O/7OR8n+l7Se4Pma+9Qhpzf2AxK78+c9P
 HGkopLr+UtlOxpzcR7js/p1s4SotxkT2nCph+09ah75UNyBSuq7ANwCGkrUrwzCG3g20iveAuRY
 PcqKr6yWMypykA4PNMUeTLmzBoaQcfMgf0hYKTyDr+At1pYEMIIcpijzZZ3+u/Oh3BdIsQyiQ+5
 39A9eIbLPlA8xStxrjoWBErvg221TpuD25k5Ietpuiv6ibzT2MQU+1TwBYnoZPF31nLY9lys+WA
 B6Nv8IFAxv6DzDuT131v2H1+Ae21j6TRoQTR1ZljoeLqCyzv5Gg/Vd55ff6s0l2ZyaAI4zZGVmO
 S+hSMLvtNAp5wK9Q1BQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab35ae2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=2ddeW__lahgUgh2ldHsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Lt7TBsq7uH-lp8JMZ0QjUslz3xa9p2Oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019



On 9/23/2026 5:40 AM, Birk Skyum wrote:
> Two details were needed on top of the DT. The DBI MSI registers (0x820 to 0x830) had to be programmed after the tunnel BCR reset and the router reset requests, and MSI on the root port itself had to be opted out.
These two should be taken care already in the latest kernel 7.3 [1] & [2]

- Krishna Chaitanya.
[1] pcie-qcom.c - drivers/pci/controller/dwc/pcie-qcom.c - Linux source code
v7.3-rc3 - Bootlin Elixir Cross Referencer
<https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/pci/controller/dwc/pcie-qcom.c#L1809>
[2] pcie-designware-host.c - drivers/pci/controller/dwc/pcie-designware-host.c
- Linux source code v7.3-rc3 - Bootlin Elixir Cross Referencer
<https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/pci/controller/dwc/pcie-designware-host.c#L1181>

