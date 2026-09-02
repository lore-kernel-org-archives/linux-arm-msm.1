Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A4476CF0
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357164; cv=none; b=AgRuyU8Bpat8O3xXHxcjlhoNKhurDcxDM48VQ53Ig8Zj4xXcltyCYIh7UEAhE2gW2GCSVJ2WWy9CD12pHqt+2KE9byJjfYjfKtrWvs/DGJpF5LZZkdEyyeLoqp2u4y2HVAgFNNwwIqxiuAUGl3lTPRk4JiWPVh0wFiKk8emIV1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357164; c=relaxed/simple;
	bh=jhVI0R+4vrT3l5buIfyfVPeaQvF5Do7MQWKlRsb+oaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhbqgqFSz+Lvfa9FzecOs7IllDjaUg0tZfpwZhFiOkn4TFCotru8kj2YjRG9JNQUr5jct1Ff6S+sUN5QqH5wQKHzmor3PvgozP552UEf8bwHxJl7ZHg+oiUymnaDuHkWbo20FQhterDdiusiriOeHAaESvr2rCBPru/J/OPYBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQoQaAhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJd1UUXj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQoQaAhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJd1UUXj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR2uZ1647115
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 13:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=; b=AQoQaAhc3WQ7s0LX
	f+JGdQKzFQGe5R5h56Jp+wetPEdXDwaOcySIzF4myt5OTHdGfnTab+iWNj4ZtQkO
	rLuNTIEkhPY0tly9rmrGa5nWApKtlvRyr8eHebFPeAXHMk7t1WXL0KAY6d1tI6DG
	cymAGk5FKJweF9OpP2fbuQsbyJGmzWegW2+FfG2vr3wy95KkvPk+Y0j74vSyywmz
	ezA6jo9aZfjwbsWuCe4au4jKMqv1b9QkcsApL4jUy/RR8vgzXaPT5qVbjwrhjZIB
	6+pBfKVGAwrO/423auc2slsx4MD+6DoQ+G1bHJisDFpNGZiGUZqYNG3VFiGnL3d0
	IXzTQQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv88j80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 13:52:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73a1cf1638fso34566137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357161; x=1788961961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=;
        b=YJd1UUXj1SLsLSTMpow/Dkn7QnOOg1laD4SnBYTtMKemBdXoB77TqgylHWOil+3wj+
         PF0gQBXH3BmQi/WNhlnG3pyKHxnsa7lGGUHXBP93wT3WCa6GYA6L3enPvR6BuAO4WqKd
         iEXPLNLydKCf1jUqKPAb68CHQOJNCEN738xmugatw1g9hDfmqmxALzEbM8hRI1HdghTh
         GXxYK/nDvRAyT2R3EMTqgyVojP2wSH1Qc0D2DoWEF8KGxIaC2bXUOZVL+ZL053MeLDjP
         OF3J+d5m9gh2qHeSMqFbEJkUoSlvfWe1WjWDKHwizGvAtsGTZNbSlM7Ql8Oany07TCY7
         e6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357161; x=1788961961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=;
        b=GvdujcSUXirY6WHYNbvwkH6vyqonR9KHngWRomypPDV6f43luzFrkEQd4GIkxBBKhB
         3QbuDjFz01IyiT0zlieZlpkh8gsv2XdtQXTZpofJYmIEbi965n5giVycubCHL5wIYfiA
         oOtqCEAGx40KHO884l49GWe8d/QcdN201taURImzFuxAgRntCoxyBi1Q+7+aEa55iZmg
         UddZoyvfm1yN1eqY+59CWW7cfXEEAUf+/fyAx69Q0H/Ts2ILkYiWzyVwa79+TGU9h1kH
         a2vo5hv/N63xK7Ee1O+zkqCNjycjNNV/zLumTl+Bspxmva2duhiFbT99KpzHS4PU8okG
         2I9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhGSou5w+OG2rTD99zjw5ck2R+Ff60VXKMJNs8tnDC9rk8z9iQH1XkUHIxDterbdD2ow1dGm3g28giIHeB@vger.kernel.org
X-Gm-Message-State: AFuF++mhMeTxH1PAUmlohLw1Cj+tkfoBg1/sU6gjkj77n2i1PLHRvQn3
	+CkPgHQ7NCAzevbLRjGY2OX11NadXQ5Kp9BIo+Xd+jhAPKRtiBkdeWPjniuq3dOlxQUnoW0Cn77
	l5dBZFZM7vGtRqUKyaAzK+F9gRziws902D+oomKJsPEmPtIZTxaf6GkeSAqLRJYkU3gxS
X-Gm-Gg: AYBFou0qTI7gz+QhXFCKhLRPe4EvMk/xv8Ows2+2i2b08aNCmtDzsl+HOzckomg2c9i
	nx0BoYyqk1v81J3kgT39eLH0Tu18C2F3VJ0fIxu0+NARuO85Kh03ZLCDspG+DQTGi/UTlJ7z3Wo
	dPsjdZtb95gCrUy+911HqtV0+b2j4mwYzIvHvK5IG7o8LXNn2k9G4DHGNV0dTMorRwiIPf8V0wP
	ei6o5mV1Zw3xcpkodBeplSnrTDeMIlgErxjRcqmax9BJk8Pl1lAR8vaZvscaIbbWacwv1jJVefl
	y3NEfdQNRSNCBQiY4Qe7oSLr5e5GS/AOqmzT9WcDJdML1PvFCpsutSR8oLoCLDaD8Ihsv1Fd0hc
	RYqF7chaaV8eEx7DyVUHLcg==
X-Received: by 2002:a05:6102:38c6:b0:784:a169:1925 with SMTP id ada2fe7eead31-78a1f3110b0mr583908137.2.1788357161514;
        Wed, 02 Sep 2026 06:52:41 -0700 (PDT)
X-Received: by 2002:a05:6102:38c6:b0:784:a169:1925 with SMTP id ada2fe7eead31-78a1f3110b0mr583898137.2.1788357161046;
        Wed, 02 Sep 2026 06:52:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b23fa3sm604620e87.32.2026.09.02.06.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:52:40 -0700 (PDT)
Message-ID: <9a7cee1d-1058-4184-a915-e7e943b4791c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2ZcHm3DKdYi9yK8-rTZCbVxd0GECEYNA
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a982a2a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uLxBzBmvjvUxPvobmToA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX+qwlhEPZlKf8
 XDgsbb8PlBbXEkyiR/uSco4pXPibOc918gHSynCG5H08LNSyg8ylEENIZtcH1CO43gUjqLFZMJS
 tP2aKQ1PpTOQqrVm+iObQGWxWFrOlPs0c2/LsrDbtYxdXyUmoE4vafOvKqeZFZiHng91pKH0HOL
 jHdb8AVaG0hxOvwwwOq/QcmOtWVBUEgjjXsZaLR0LaN6wQDBpyIqa6F9XmBvawbmYOCdS6brJHu
 glLGZggMdUe8qTE7CxpXuAYfZgMrbaa+GwSTu2fbPD2+epCT4MzMsV12caaN5nTR3FHHXVKigAM
 UQ/s4rwADa0Xq8DviVB/a/eGo5I864HZnngMg7ECvE12sGNSaT9tdcI+2MvgdpiwMP64xutODSX
 kR89SoA3ldKAGuPm51lqdrPFEqzESpVerDKFIRu2UZy82F7Sp5Lj37enPjsJAYulRmEf5eW9w+D
 6HTUgxlL8m6+3WJE92w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXzP5Sw62TUA26
 oJEm/d88h7ZGrT7cFjIB7xhq0KLyLW2DDNy3TGh0AFcBa8jtYd+8NfkmaAUJ6dD6aKCH+bn1YpI
 xeeKa+P4WeyMK9i+pRn9AoN7fcIc3Ys=
X-Proofpoint-ORIG-GUID: 2ZcHm3DKdYi9yK8-rTZCbVxd0GECEYNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020123

On 8/31/26 5:20 AM, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

With our previous discussion at <ao5Vh_d_dAlJknpl@QCOM-aGQu4IUr3Y>
in mind, can we reasonably assume the ADSP description is fine as-is?

Konrad
