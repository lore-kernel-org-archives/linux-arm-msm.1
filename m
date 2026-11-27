Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778609;
	b=YAxgDNloYad8JyRgDd/ravsl6Sd13nmrTB7VYetcMrvGNnuxfRtS0HiEgJXItIj/00pz
	 l2+DmocMN2kz5PGcqiBrxSEH81mGpZ8qw3WxpZ4hBg9Gmqd7HKL8W7QSXFWzvEpe1FIVt
	 DCTPnzU4qKNtqaoNHX9Ujy3rkkGfApFowe0mzZXplzloY9JW3layggdPPxvYC+zpI4FbN
	 W657REt2kpoEjzsoIyeMM81hms1GMVAxR3XRXxKdLY5CsZwyUcyrli1ei5Cjf0xQUDfKv
	 K0yP4fx9KgHCuJx7iFLZeBS/RnND4AbCnx1N91ebSMgCdi0o5Z1Bc3oyivqTDyUuvLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bwbGdFEkDz0Diwrqb+uD4pMw+aTYw7fIvGX1BVepkok=;
	b=kBGw1P97onEHWi4HDBLdg08aQSggD/it84UqErhPZoGa2jkwZpWsp/LuKg2s4b97fybJ
	 I2t9+Qmn0TiQEpP2N+G+yPTiHHQslr08sUaApsldzm6MpuYQhi/nsFa+04ikvAxt7KwYI
	 h7m64sEebpNROIKzWrim+9dzlXmyKu+V1nW/tKBMeMX5kqHRu6ueeRrqc2lzFFOL0kty+
	 QQYSHJ5zfiN/ZyAKz47yO+h/GJGuDVw2KU2wgXHtV6xImqNiWEmZ644zhwsrvdg7fThMO
	 Oz/ALlt+UmpuxIG84Ht4PLe2PTO6VVflCK95lLsglVTp1qFAoDBMu0p0l/OedDJhWqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym46Pl68;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FG4RDLUr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E89606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E89606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym46Pl68;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FG4RDLUr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApHoB2677408
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwbGdFEkDz0Diwrqb+uD4pMw+aTYw7fIvGX1BVepkok=; b=Ym46Pl68RgkZGSS7
	h9p16gslZ7WCvAuEQIXPvvuZC2G6ggWUqZqbPX+O76nv4g2VGWPvhmq6TDB3lXQz
	l4qmQpwJVzWSoyex6gOm4kOnxvzWRb/n1OFWWY/lf5xIgXU4YKDKyl3IxScKYwEE
	m3Bnr+ogof+2kEgNBC4wq22J1EVgh4vg9u0wqh3YAWs5uqIOZQnWzwnqq32QumWR
	AFwV5Z46sH7iFi9bJiEId0+DaQI/Gt/cs5eL7w7n5xolzUVIoAlt1tcyNzwxZT2f
	/rbf3k1ShokZlBd1+G6pNIU8fLonVow28NkvwOJzv0/vP2G/mUcARDgb/qvMI9sF
	cFd//Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh95db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:23:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d3ad11f50so9994451cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778607; x=1796383407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwbGdFEkDz0Diwrqb+uD4pMw+aTYw7fIvGX1BVepkok=;
        b=FG4RDLUr419LzjrJUMgRXDitHecF8ZSOs7jARhzV3mWhLbZwfJU0ffzrvtOvpZJYbf
         qiQlBCU3nCdjuD42TmwqIFuRUmLgpAn7o44OmYlG52+BeR4D0Lsb12i/iA1LMO2bjZDV
         BM3/WCbxwDnfLOu4rJG8teGeO6a1iZXEfF/cXa0b53L7HjEWfNhBevnUjHTIElZ8/a5U
         HrZNXJ1BNNGmRCnTS69q7MHl2qJmZwiVMtjGlfxnkH9uGr+6GXOHh+/FagL59Y48pmhO
         7Peantjz7vpPC4Ip8v8EClrzFFZBFSfDm4HqtO/lMDwQcCicff9j3SztZz8vneHOsNv1
         r65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778607; x=1796383407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwbGdFEkDz0Diwrqb+uD4pMw+aTYw7fIvGX1BVepkok=;
        b=g3hmg8XKO4RokzXVwi1yNcNcYxsHUPWCAZYgoWuGg8gzxNTVzzlGxP/kvwpWrXley7
         QTNRGG8BNRhMjwEsHiKikprcsv5EewvRy5HHhQ339ps6A7joKlNdJIEY3jzKxMkNwqij
         u2TZW1kiZGN6C/udwh5rCg0iueIXkv5axEKq6JBf7LDcgZKBQcSgHs1zR9e2UQysTU3V
         rbcFCSmQXa6vWkp1n7XYbOcG7ZJe9nhDW7KFaLknTBmHVHXF5whK3QyK/e92+r4am2xt
         gLC7uZLyU/nZnKKAIvFOsQQxT3ZgPW2/DaijAd38lm4oASV+39xNwJdBLLgOBkpdHwD2
         Fs0A==
X-Forwarded-Encrypted: i=1; AL+hErFedWh0iFhJsMT+DpgYyzPFWvrxkE00c51i4OaSENJaZoSQyshbuI4EFslJz6xR0ELmDgPpYUcL+/0VNJnK@vger.kernel.org
X-Gm-Message-State: APuU4Z/crlFzJOQNJIqNhTe2k+bJcFnijmTw6lhEbT1rwk4iUqmh9TXK
	SUh8KXmFWTQxbW2+43ymxtgsbFu0B1H/gskzJR6sOBIFR2WJyoDSdQeQN4sfdDZDTwOHUNLNgzf
	ylXXMo5rObCAksFi/YcO0kgGmfTAd48J20inMlzUr89HmxxbZyNINHEaXhq2NpOFwmLVZ
X-Gm-Gg: AZFdTZcIAKzjyea1LZn1r17O1sgokkGW/xU6G+iyA5WmQsoC24kgCUWVF+oQcXJSM/o
	MdNTTXdCf4ZMPOxpDsPllCHVUNX9SwJfxyZT0XgCjrTggo9pdlFPXFE00pAKWdfWk1GZrF03SDw
	OcU7x+U/IUPs1kEHEm4EJQBGDfCgNdcMG108i7yJ+ELD5MhwC9lFfagZXy2aQz8iw3D930pyLBK
	/56DVGHoNVsaJfjpLYBE4lV+Ba9/v8mMY0EYkW5ElqihQq9f8GtK4ngicYllqFOt7kGLgR2M5ce
	nDfb60SRdG7yBegHqqlBnTUtAPYktPw/tjJ2lCKYl7YMJoVCmzfIXEq6JyYgSuCSLOy32kNvp8G
	ze6ZY0hoEcPkbxPww9oA/R7rf8Rb9EtrFXf4WAbq9a5mxNqq+0KA/DKvvVk7t34454pVnpNU=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr4637602885a.2.1795778607183;
        Fri, 27 Nov 2026 03:23:27 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr4637598185a.2.1795778606669;
        Fri, 27 Nov 2026 03:23:26 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm863728766b.39.2026.11.27.03.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:23:25 -0800 (PST)
Message-ID: <0d0fcbac-2d04-41dc-b596-21e6ea622e2d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:23:24 +0100
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
Subject: Re: [PATCH v9 1/4] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
 <20261114-shutdown-v9-1-5430c9f242ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261114-shutdown-v9-1-5430c9f242ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX5pOrGNt5k4XS
 JdNnza9bBRJAMBnmXQFeU2GToBwJws76XWqetO40m23A1aQeS2Py70e9rMY/NrovLEXcDKJ7ITo
 HVSBJandBWaUl+MEYoVto3PPAvQJias=
X-Proofpoint-GUID: mZ_bTIVCO_QiTqTS2Vk-2nvvnQ2oArtt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX03q+1ZJeypPZ
 2xIZzAkEVpfz/BXRMW/ATlZenKPlCGj7R0S213nfol1V2RPkeNR0SKKrkBp37WMNY+y0Njm/dcL
 7n1t+e08B9vmbcgiMNpfR3HfSvRmltOZrqHh8JIZjK2JF4GM70OyA9QmFWT+McmUliM4WTgbdCI
 5M+amUbdzAqrPeI8Bm59hrghAiuwunyQyHxh3MTrxDNmwOiOq0GMfqUy84ZDPFf463xbjU6Fmhe
 arXDqSl89jlhDqa0brF7Hb1rXIHyzGz3hvytwOApjI1fowDTzgygwl9FNgzRQqwtUkToygnoAfh
 BQKqaUkAqFtCkkO2g9aTgccdtRDs46tLcYV+QOAYOFUiJRoRjj7vwLrDAoubLx5CbhEMdnzV4vs
 WwSgN8LSIRcIkUED8AwJmt0SirwpujxmNOnhksHv0aTg3fyNrffiIQEXXe4qxZcMaDEhHK0PJAx
 0vwGOMMItQT4hddU8NQ==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09682f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1dD4SeorvVlWizVoyX0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mZ_bTIVCO_QiTqTS2Vk-2nvvnQ2oArtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270045

On 11/14/26 3:00 AM, Krishna Chaitanya Chundru wrote:
> __pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
> downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
> the walk as soon as its callback returns nonzero. Any device enumerated
> after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
> capable endpoint -- is then never visited, so pme_capable can come back
> false even though such a device exists on the bus.
> 
> Since pci_host_common_d3cold_possible() already returns false whenever
> any device disqualifies D3cold, aborting the walk buys nothing for the
> plain suspend path: the overall bool result is unaffected. But it
> silently drops pme_capable detection for any device ordered after the
> disqualifying one.
> 
> This matters for the upcoming shutdown path in particular: unlike plain
> suspend, shutdown forces the link into L2/D3cold regardless of whether
> pci_host_common_d3cold_possible() itself allows it (see the following
> "force_d3cold" changes), so at shutdown time it's common for an
> endpoint to still be in D0 and disqualify D3cold while a later,
> PME-capable device is never visited. dw_pcie_suspend_noirq() still
> uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
> result here can cause Vaux/wakeup support to be dropped for a device
> that actually supports PME from D3cold.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
