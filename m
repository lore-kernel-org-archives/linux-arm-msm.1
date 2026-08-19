Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182593BD642
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152559; cv=none; b=nhQ5OCrRacJSr+w2Tq/PT9uHDJri3CpptBKTI2KpwcK+nNX+9IH5fvmRfd2Q8pLnSOhbSSuu4kmcHw5Z85CHLe9Fmwg+wPktLHQPFJHwFeUMDUzfgpYV+D2fK8MFtGEHmHrYHysLeoauuTPWwwNjnlOOXX0JrvWpKnfe7FW4CnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152559; c=relaxed/simple;
	bh=q9Fvccnh1qgEQFRYMQgxrzfahz9euTTZMK72oyDIe+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bk/ENBEFd3/dEjRdwgwMM+0oe6cq62b9qH6WSFJ93X+K4/B+jBZsH9O+pTPjmO1Yy33qGgeCKbnVx91CDSb1rAjdwF0+YepRxdXJBSBJeNzyYsE1i72xa3RS3V1CwQK4Vq+mQKzwv+uozuVbruHiQHjkhnz4KAp3ApHi9lV4DVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeoDfsWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUPP82fp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeoDfsWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUPP82fp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbbiw567005
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9Fvccnh1qgEQFRYMQgxrzfahz9euTTZMK72oyDIe+k=; b=SeoDfsWpQqPfDirM
	p/IZttyCiCuF3ZBAyuYxI9LnuMjjQySN8vQCG1axwLEPAcxywK6Cyoma25pQY6lG
	spCKVpQcMZKH8sfnX8xM9e3ODVPD71xH9KXKATciAAD3Er9Nszl9TdSzP7M1wuB0
	QGyV6JXzKvZVxfvbqC40+duCV4yZEJXjW1pQK3GByPzES5HaTZYVptaBaqiso5YY
	cbUQJcom7OKc8twKPLSVqGx5XN3UsQjhiafj1imPJ1NfHzRV1ahMVrjzBFNQ8Oty
	FrCYPAhXY1ASoQSKU8fQD/tGhS6e8/nVJHysezh1dkMyS78BTvoLvjQQYn2Jb1NV
	FdHJ6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa0hge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:15:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so2101311cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152554; x=1787757354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9Fvccnh1qgEQFRYMQgxrzfahz9euTTZMK72oyDIe+k=;
        b=ZUPP82fpij0hc/phu7o3J6KBpJ98wxXTSCVEk1ayDvpxIxyhX61mE6jviLznFlXrxP
         EHo0k7OlX9hclOCOi8gfdlgvRzCWMZEgVq2Hy2zZgAaDxHjZ3Jp51rwo9QibNvY1+5OW
         9w/SHy3F16SJ6s1s+w79NstoUrRYLzqQl+Ndf4fTSujwErNSNV2adPgLBUkykCC0f+N3
         jEfURFQwz9LaYRuCpkBqoFm5GM55I90EVIyvSRsbPGK1WGPzv0yhdqy1VltC0mlsj3Vc
         Yb7fGmwKqiRpKFO8m8sU2u8NOyizE28YYBauUtwxdT7O/yY/KL6nFywiJmQ+mrdZldfE
         FX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152554; x=1787757354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9Fvccnh1qgEQFRYMQgxrzfahz9euTTZMK72oyDIe+k=;
        b=d1Jdc3eX+gY1RwqW/Mc0E5Sgwac3O+9qfRaBsNbNJ+5xrCaAKs/Aw7WJs4p2+aaL2z
         UWBVeLHqpOIIyHgtBMA+CoAgbonUZvbUNtk4AFRA5rAbhhECdsZ1EntVj+JNMcnE5MEM
         XNEme/oKayjqIhoNvdgHccFOhKvV1pnIVmcNbolOCu1ymSDoiIF94IWzVj7M31L9pCoi
         aFzWwFhOvUAKp0nV7Ph5B3McPbMx3llU/F1iUgLXzmcLPeJ8GMStbN50JJero+ZIDw21
         KscYRJZGdX5/GNlvLvyObmdb/62EoQuYf3Krjg0BFoPDlaHAN0wulB9o9BTyMMyDVqML
         BBZw==
X-Forwarded-Encrypted: i=1; AHgh+RojMuhgaDkbHUHAZP+SDc9q8F2rPu7+ssp50azppN9ZulSz8DVoqIviRcZ0f0mASeXhqM+PDmNb7JaG4ojc@vger.kernel.org
X-Gm-Message-State: AOJu0YycVkn8HQVegjbEIDMzoDelCBP8qBNI9jW0JubDWrnNuOZvRjzQ
	6bwdzNUpxijKc/YP0PT8AVbdLzXGVnHSdyBAbFYIAZmfo+RKWTMcg91zwdybZcoHPHtyG0BqfD7
	XroO2x1Zda+ilAQR38Lm7O80HUQuwtN12aYqwEMFDTCkUOek74plVtV7MGvjkyjnX86hl
X-Gm-Gg: AR+sD105tBfzTOlYdLh/pKOhv7b2gbGyJUAfDhzGJYplb9AwLcBm3gxmE79TVRZFsd/
	4krFOVThdJGuXfKgyavWsGIS+cRqgvQH4ucNWMOtwwUA9HldjuVdp6N9lXJAKAQd/63uH5/BBNW
	eFSHbSK/Wv8kr/yKdan/IYcIpf7zfYK3tmWFb/n6GCxtmVxPCB3xfHJ89s6sTF2syhpnY9d5/gN
	PR29tCxF3x1BjTIrYX1bNNRxN9P59gpZ2tiqCbkT4yclWmcWoudfIXOG0Wk+AuPecgIbhpB4ary
	hTqK4STkVlRkcZbZB1F4A9DOFQ0t1B9j8gRodf56nA3HtBRx68KTvfL/QTS2dXgR2LaaN3ynCwK
	pcVRCpoLp12UpG/xXpbnWpRMd
X-Received: by 2002:ac8:7f84:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52dd57bc734mr36257181cf.1.1787152554113;
        Wed, 19 Aug 2026 08:15:54 -0700 (PDT)
X-Received: by 2002:ac8:7f84:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52dd57bc734mr36256521cf.1.1787152553666;
        Wed, 19 Aug 2026 08:15:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c8de334sm94990666b.5.2026.08.19.08.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:15:52 -0700 (PDT)
Message-ID: <10495d48-5add-45b3-a398-5e1c9d09b9b4@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:15:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
 <20260810-b4-kalambo-crd-v6-2-744e8ad1dae9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-2-744e8ad1dae9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85c8ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yRxRTG7gzZ9evFqw8iwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: _w2BP1LchZVBcSlcV7qrugudsEhPmQ9l
X-Proofpoint-ORIG-GUID: _w2BP1LchZVBcSlcV7qrugudsEhPmQ9l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXxrljrlXBFsTs
 JZ32M4GQTYO0zysM970f3LzSPECm76OdwTrXQsdwvlLK5CW0p6gow2HB+9TmBdYhP6WK2gnBqQL
 xu+TxXDtgQQD/5uTBP6xx6j4aU3jJLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX3Rn9g79Sc+9f
 T3v7zqS8DH97f11gV5P6mt0NTJC1BJHaANr9irxy8qoSC1sczmfQaO9vvbgqH0CEKJ1qgihP6NN
 w0D7cKshmULXjkUEpG1Q6Ij+gFY7eHjgOKa0vrF0UiIngKvqodSyyYCoNT8a1xMume7ETDx6duc
 wunFx0mZ0sp2nyeH4fRn2SqSV3/cBdmQy4HWMCQtxTjBXWkjqB7cZDJ5eD/cLIzomM+jwusV/1j
 ex9Y6lK8lQBn0grBxfyqCUSIlbVV989wlrerefZxno0mhnuLnYt38r/FZTRuuV4KPsm09AALc8v
 UAyUzqN1qYFCWsSORpOCtZu/G6MlE7f+onZAyJchyJ+loExkE69CM1GBjcaSqWAmQR7T66kOn01
 5UTL/Qy8LpkM9mM/3sF2/WWJ2LcXiTiUJ8KA3oJmpSHa+JWjnPJ5tTuBC6QGeC1+aIGTTwXpySv
 0ywh5YjYYxP0ZSXZUig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118

On 8/10/26 10:54 AM, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1
> (cpu6-cpu11). The surviving cluster is re-added in the cpu-map as
> cluster0, since the kernel stops scanning at the first missing clusterN
> index. cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain
> 1 is no longer present.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
