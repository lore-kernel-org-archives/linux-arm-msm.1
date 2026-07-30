Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D35F38E13F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429987; cv=none; b=Q7DC1ObiwQ1cvYbXFal4gmiIgTF33z8pJhSJwnhDRnlCo0OROsHUQUFRFcESU+1+IbSsWIYUAJ+bzUYNiIa75bk0fRcz+Sm/Kdx0hhCgR9TlVkWm414iD8g+TgQ818yQU7pc1sE6CvW4XeUk1V0P07oGyMvhCmX+N7bd61mK1E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429987; c=relaxed/simple;
	bh=IAI5fPC8kUOmVOXpbjJOoXS/9005rgomTstYB1sbH1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7EIsI0F1+AvbNSfUeFO+DS9qpJuUGv326Kodku0fmm7RUOM356eEglLOGLnzSryWLYRRX2bvboIvCcbkq+/erc9/t1Q/VbjzKl3bQL4AQhNEt1LSCySb/l7pXlFQy99a8ltzIOef2D3BHmSGISFu371bX4zDTOei9aD+nQrvmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipmUR5tl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/x4foCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipmUR5tl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/x4foCU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWoIs1643402
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41bv1bQPLiy8a8DyzT5YhAkpHkoFIBS2fv2LzdT9CjM=; b=ipmUR5tld1IyruPP
	gLTAvhy5UXbBEOd/bHHBUvy61Ek7rWw+V3LY4Tf3rWescP7bFORUy41PS7fj5Kep
	jtTqQOvktgowmxUHVdIF8PsuO+bLpk6EVfk5LQ++oVw/iWOGACKvRrvwM/tK89eS
	C8C4WVMXWyfjwh2vQ7rYxPXv1104hLdjN63CVIh+Z06zJrnKJSlQ+NJB09/PhNSm
	pe30Z9avESrmQzHn6rRTkohbdv/1VIr11gxjzmdeb9RW6W3oiKEwCsRFhwYyOym2
	mkRNmta4Jspk0/Rm/I7P8D3UPUFL9PSMVY9FS9xqqPH7DkkNFwKU9UGQ0Fvo8NiK
	SHUyYg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md0p23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:46:24 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9775a8105d6so25260241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429984; x=1786034784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41bv1bQPLiy8a8DyzT5YhAkpHkoFIBS2fv2LzdT9CjM=;
        b=O/x4foCUNwzA9OsePEbs81GnAhgUCyMnzwhHobTO2qihx5EVLXDmRQGGeZ6YeMCBG0
         v23sW6M0bLMayc3YawO3pDDyKksK4EnzjTgYyq1o43chStgm4A5N/AgMEugqNr/KBt6z
         QIWxhgmeQWG5Tx7xOt2mZu/g2LgT83DGd+gALkVvk6AOZnpEQazBaejKh+iwa62QnKQk
         LqCJ8uF/FZUgZX6KlqvGGS/10yrPpAJvEc8/atpxA3ruLAUp6ixvUHK0azN+n0DXyM6X
         1WXV31HSBTxQtLVGRbv+teHVdhvYaOfaZUSSeKGoRpMxjj4bui4rco2o5ucNqBEU0ICM
         IOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429984; x=1786034784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41bv1bQPLiy8a8DyzT5YhAkpHkoFIBS2fv2LzdT9CjM=;
        b=oGpTv69t5JHtwGBPq1fPhoVVPVdrJxEgkg5nwQDXJy2QkVeZ+942Re7AeUAqC9KZqP
         5R1q0B8s+z98cGYWdvMOfAsIwFgTyHwclE+1sc7C/iJ1FtzEb84XJD39w2dR9/+m9L+r
         IvYklI2cXtpVFcC8TLRz7HteqIZvEmdwYHcPuanTyXPOo4ukFmpcDA2TGkMgoP+HtYEo
         e3jfSYDoek98XWf+F258ppm9hZ3xgZfnivimx+v2bAHiS+94PmKE9P1M/gQ6D4hH2DeL
         9KrQHLknp1nwynzXMHwTJg8lP76MHMV6CuXINPP3V2xQg03De+WY27ZpKagYknYl7YsF
         hzjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqd8Z1wuoJVKMRHAKokz4VdlFcLu/Ed1TcK9ASxJwByu18ngzwrnmtoTs1sIgux+f/XOAGOyd1RLYysyZ5b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4cyhqIodJL9PFt350nu4TFaGQB8sZdmMKFnTWqmBidYV3A6BX
	5wBTMUqiDYjnhy/YBGgvmGp6AFryquaoTesgTYadDY2YMQZXlANTUGGeQcNIXS/y/wNS/llkcJx
	l+mgnmCbXxiCLYqrio0WI6G3UuDEO1khzSGc8yxuGrzzd/nthsoH411+upNW0EHuJmuYo
X-Gm-Gg: AR+sD13m0E3Vp+4smQ0RPzbuo1ZOxQ1PEF6UT7lDM1kRkI6Lpu5YOIYkQShc4I+w4FZ
	cxfw+DadSUD41jmyklOuTZvWzt+rJ/84PdqXDDyjTAOalSYEXX9m/xriReF+2fa+IxhxWEpDwUG
	HVUaCOmL3oUjF6Dljj2SlaktojTVIxcNdKteUUuA7iRxMCFSqCGfsu0eEgLgP4qSH10tfkCw4Nq
	epOaigC9UMRor2xWWn7K7nyVkV6eRYz9F6yeMB6R6BM0jmWvLqiW4YjtA2b9Jns66dqjZHYRsEf
	pMf/0uccHcTu2Z8piHbY9fcRUjlApzERSxBTiAUEmEXnmUnOP38UYmkHPI/AFqJWOyZVYV+qcht
	E4n76BZzU9uBr+Cys9heohr92
X-Received: by 2002:a05:6102:8090:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-758407c7a45mr602068137.2.1785429983670;
        Thu, 30 Jul 2026 09:46:23 -0700 (PDT)
X-Received: by 2002:a05:6102:8090:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-758407c7a45mr602044137.2.1785429983191;
        Thu, 30 Jul 2026 09:46:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa851b322sm91019666b.7.2026.07.30.09.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:46:22 -0700 (PDT)
Message-ID: <1bcd1a68-a1b8-4604-8a2d-ece01ccabc00@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:46:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode handling
 and support TYPEC_DP_STATE_F
To: jens.glathe@oldschoolsolutions.biz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, "Dr. David Alan Gilbert" <dave@treblig.org>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b7fe0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gxl3bz0cAAAA:8 a=Xqxl2qIfDM1Vn1vrR_wA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: xU-obDxOR9bDfFP6sUGeeyFkP8lzQ8Yn
X-Proofpoint-GUID: xU-obDxOR9bDfFP6sUGeeyFkP8lzQ8Yn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX94TG2cKproB9
 dnRKjXdKX85q9oCSNUXrf8CAxM+qQr6n+b12eiIOCT+slvlYDYd4YytVNdXris/98NPORMRSeUZ
 xRvhkW2MCOww/5JnHQiR7caag4uf18w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX4iNQF63cpPXk
 AnQl9vw9pr3+YF6n8Bo1gjmP0Qg2eTbYGwFHIQY1WkVh5N5Ryk6H1Q4qfIIZehBzrQseJLqdMLS
 Rafu8GeRMZye9+xxApJrl237OrDANfrMbDbhlBQJ0l39O0zZ82nypWL2g8ToyaMTlnfNWopOP3f
 GbQ65tmWcOc71UVx7Ec49SNhCfwtMsXFA6DTc6bJhbSFwVVg+6QydzuCv3WHGVgkZytaBSM0TAh
 xB6YLyZM8DT035JPwKYjJjp0lbuen3YCohpJkrnSa8kc7LNebPAgiB2pPCtDbfdV/f1TQRDzNbx
 719F6CVyjp2V9eGMDr1kv2Ut1H3PcSh0pjbCjrpW7Hov9poeQQVBebwrep8LBm4ux/DqZWFl+Xi
 GWi+5LvdIoEMplraCO1AmMiTjvtjctV56yvew1ARGCaVZekjl9nPOVVR5jw8uCHjsp2/eGc59l5
 BakNb0gzEoJTDHluJOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300125

On 7/18/26 7:06 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Several docks, including the Lenovo 40B0 and SSK SC220, still send the
> legacy TYPEC_DP_STATE_F mode request (deprecated since DisplayPort Alt
> Mode spec version 1.0b). Treat it as USB3 + DP altmode (same as
> TYPEC_DP_STATE_D) so that DP altmode works correctly, especially on
> the 40B0 in Type-C fallback mode.
> 
> Extract the state handling into ps883x_apply_dp_altmode() (modelled
> after qmp-combo-phy) for consistency.
> 
> Assisted-by: Grok(xAI):4.3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

I'd say just add a oneliner `case STATE_F` here instead

Konrad
