Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A8357D0C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563376; cv=none; b=sTgx7xOhn/JLLgcWAjgKXe2XQLiJ5YDXD1AZ88UE4/Osiage2LemfAJEgmqB0+JCnilm/Gm9oQOcCRHOhOPkWmeiyFQFcnoWtt/8cBnlrQD2u5GnMOLpAH2mtoKh+YbXaEY6whjsDV3H2un4lXMn7T+uxISiEjvcyu96EGF30JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563376; c=relaxed/simple;
	bh=Oip9GBI6mALpKmq9dgyitq6Uj+sBoyWs5jaVXDmyBUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YK72v3hUnfEgUYDQfUD827w1trsUoxcYRcp0dj1/GBLYP2k3SkNfEveFaU6fdaeCyIHXn56PkoRNxJn5Uxd/1w0CBnGFMaWGU6IwdM3PUTvZtXmoNdpH/tnYCiPFJuKf4kvJhw+ZrJkiuM7h9QQ0vfwXsFnTpsumCMFacEQWvv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GoPKN2Ys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4P5pUJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GoPKN2Ys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4P5pUJE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99DeY2355868
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1VbiPgmhqGT50egQYPEisH9b0+8udwN8dyBpOi8YZI=; b=GoPKN2YsoZ1Ncxq5
	Mjs8jTslU/ZT/BXIaBFrlbt+3n/FhxGSjZ1GsPknYmQt7U2EyFHSaguo/pJbLaft
	H9axYsH0KFUBct8yOX3FTqztTPFMsD7y/d3U1k/otTfYqvAHWqr7UQQBD1FbKLeX
	5TGcXgw8CoMvgH3zm3KO0NTlZdQn/yP8UWOwNBbe7Y1ybhKu/tRZekLZbcHSFeis
	3kzaiUwOes7bb2+S8bVZma5BMuDzBKnXSm2UGBeeRMO9N/wSHT02jFVBmoxF/5qB
	xwmrSzrhCW3yFWMjrYLGGGT1pNrGiYlI5xZpN2jl0Sro3wjWxZjoETHJ6xh7iG6w
	oeRsbA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn8ts6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:22:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97752c2acb7so37738241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787563370; x=1788168170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1VbiPgmhqGT50egQYPEisH9b0+8udwN8dyBpOi8YZI=;
        b=d4P5pUJESNih+xSx1nPit3irRuRouWq1at1QX6X9gSGq1ueqdcIBP6bdlkf4PsiD5e
         M0ifJ1ueW1q6VVDRrB2oXzijlI4D02IKl2Y0lQdUmzH9XsITJKbgpe+NxtS1ZVL2umls
         Ra1383wVEBa4NkgM7xjaPeKErNjnbDrTONqOUIODrUBYlvvTDzMY5vjgyc3DTb8jdoRI
         sDIkF9TyKeYF/Hia3SxN+rdJs8OEyS/1NTG8kbFS1UnCMkELkDuHwUJsK+eS2t/LAMwp
         8hcd/KKX6tpbw3/9rSW/01kXGsU2ZOf3ZxTPvr4rUhOmgme2hSDLlDaVI5gV8UBuCkB1
         B+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563370; x=1788168170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1VbiPgmhqGT50egQYPEisH9b0+8udwN8dyBpOi8YZI=;
        b=VNoFr3K1PaePNCsOM/KhUDroc3RjhDOHr2Ky05DVGhBLQ9ruehLLzrQBOWUaAvST+V
         lxQDtEFZ/uhupYZPhIPzTM93W5pygVxnurlLBYr0tovQ0pVYQxDiTiAdBqmKmlKfMi4M
         JMmC8pzW4vewdIuX0gALJAw+aq+R6Rm8SEPTMDy9URLie3vxHzpoZpaDBnu94GOrc7Av
         BPCwIWviWo09YtvcvFIDCilZZ1SXUaz3BGxcFrQfusrV1i1DX3d8mbThvQEA5pYDemTg
         8bMByACXclrGY5dr1GSnPImnVcjZLwg9VoZJ8uUdlv6p2HTDzfWDiVR6wVPYryP0ynyF
         0U8A==
X-Forwarded-Encrypted: i=1; AHgh+RoF5oEFrk7/eSqx6/1wGAVni6n5HTkJivElspdZDq4RKucdQryoIzG67OcI3cj3v7Duvy8p5+3lTYXHomz4@vger.kernel.org
X-Gm-Message-State: AFuF++nPrlhP/BXRZ1UhIJJ7nbGYyWF4/GI0sN12qP9l52TCjS8pdF4S
	OPXffvC206V8JitfkFZgTq3VUPWY2k2VIBWfMuDb0ZUiJPSUIFsOB9ArKgJ50UK67z3z7Cofk4K
	DLxC1oddr1Bjt3th834cBmm1HkdNgzgCcCw86VjICHBs0cL1v5riMHZ/bcp4MvnGB6fREVBn7Ni
	JD
X-Gm-Gg: AR+sD10KMV58bfx4I2GQUvfixZQSoOTW+kzruPuBHWNOCScbPZgC3ZXpfL3pnihIh8a
	pnmwNxUXNL33GcWRkpIAn9Jus6f8UYRZ6uKktNCH0dKkFirKTmIP3t9DcSzhz8VCrN43PUWipzp
	uz6U6aOB4CZWYK60YrrQgEsWzDTY7MJDWh1XcbJspNhtwRh4YRZsm5bMFzEU5p813f5yn9XGlbo
	hZA8aEs+Xeaw/ps6RoAQKe2/gC9r8Ci+yQxYZU3DlQNPN0zCDArFNoMjkq78Kn5eksPiAehfQDX
	UW0+OelJTvzG8MOOt3haVSGQCRHq/VzMdfSdtxGLiuZPdNADA56L0U251JwdnZbnUgujuZSCejM
	Fuy+tPUE37XW+KlAI7T8C62Ku
X-Received: by 2002:a67:fe89:0:b0:77b:b14e:b72c with SMTP id ada2fe7eead31-77bb14ee6famr1714026137.0.1787563369781;
        Mon, 24 Aug 2026 02:22:49 -0700 (PDT)
X-Received: by 2002:a67:fe89:0:b0:77b:b14e:b72c with SMTP id ada2fe7eead31-77bb14ee6famr1714021137.0.1787563369384;
        Mon, 24 Aug 2026 02:22:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e0190d3sm7681403a12.9.2026.08.24.02.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:22:48 -0700 (PDT)
Message-ID: <fbeaf7b6-8eee-481a-bea2-d1468ced4677@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:22:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: qcom-geni: update frequency table to fix
 timing parameters
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
 <20260812-ipq5424_i2c_scl_updates-v2-1-e09cd39d01d7@oss.qualcomm.com>
 <e3b06684-496c-4efe-9bc4-65d29583cb7a@oss.qualcomm.com>
 <62eedb1a-1da7-4e65-99db-7c510844bd99@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62eedb1a-1da7-4e65-99db-7c510844bd99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX84Ed+IWDqGWQ
 TGHosgZhzgXZ1Ng8blz0AhS+61b+5IxaOOeE1AQ8jfFIgFFN9mwkf2UcbPqJ1I0gHBdUSfDb9Ue
 S8kcnJYN4+XHJTdsMEXEr7qmqVuSf7g=
X-Proofpoint-GUID: meJ5GvWWnSW5rQdeZpUcNG1EXKk0FPkD
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c0d6a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6pWSofttRPDz3FuI-oQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX2PYa7NsR75vn
 3eehIX5pVEuR5BJNr+DUYyF3+fdWayNlWzYk6as/siATeLl/xbyGQ9sHTKotDbk3/8llvCBlpRM
 7aaUoxdliX8MQnNjriL7g0LSjsz59D8Lr15422fUtmCQZIuAt2xO/JMQ8hsH6Zp472cR1HU43Qi
 KvEH42wxPnAAK2Y3PI2ALW1SRPxXs2KFKhfSNFs2n6PG0wJsbJ5Qn6jo2/PE6EKDdKf0VWbDdND
 yDIjMtvg9imE37z8fy4Ckpagaf0dKjshtlpeNUupgamCZua/LRhPnZKoI0kNdmuK85WLjU3dL04
 eWvLYjHDJf5dgSPj2nOI080UsoenrOSGdSegoloC+GH5HbAYyoi5kS3dXan1zWJ46UqNqb1DPjH
 R//JAP4pXmgfFxoRrpeNUYjfMfqRNNWTYiB0BGQHUqX0kE7lIeyrrQnNNCE1Iila0nmEx0DGHCi
 N/gnr5hbVLqICHZShhw==
X-Proofpoint-ORIG-GUID: meJ5GvWWnSW5rQdeZpUcNG1EXKk0FPkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240082

On 8/18/26 12:58 PM, Kathiravan Thirumoorthy wrote:
> 
> On 8/17/2026 7:25 PM, Konrad Dybcio wrote:
>> On 8/12/26 10:30 AM, Kathiravan Thirumoorthy wrote:
>>> In IPQ5424, to meet the setup and hold timing requirements in the
>>> standard mode, update the frequency table with the values recommended by
>>> HW design team.
>> Does this have any ipq5424 specifics, or are these just adjusted for
>> the generic case of srcclk=32mhz?
> 
> As far as I know, IPQ5424 is the first SoC which uses srcclk as 32MHz. IPQ5210 and IPQ9650 also uses srcclk as 32MHz which leverages the same SCL configuration.

OK, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
