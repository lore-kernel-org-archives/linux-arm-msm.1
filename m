Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DD44718CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393802; cv=none; b=XGcjDxLZkPKyh2xKTFq/k0/s0u518FQ7G50GbDOMzg0IdoOlDlms3MYsSi0BCTyppwvH2QOVZTzHHmsBjk5o1glA32dZt/XH2H7ODsm4ZArK1VB2RpFJQpKTGxMq0AxrUxb1S3wfMVUpwWSaO1eTuVWoDu8sMuuGlmriCrDMBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393802; c=relaxed/simple;
	bh=UT06poTznfl8ZTAhUcuyx70LEC/HCesL6yPpBlRCnyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDu5A5hPXlt6horXaRNW/St3brmDsuAtUgxo2ERrbD2IlaKcuA/6jfYacagXS13cVpQ2lk0N9PQ2Lpd3UBMizurmSwpPF8Fl6lV4S989c8nucaiLmEKqd8YiEdWfCRCenKcfrD00iVgIQ4xjChKaP5bkgVMmT3NVA2LIdVafwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SF1vugy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clyTa6G4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SF1vugy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clyTa6G4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Q1v674431
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=; b=SF1vugy6tmxJ9Hb3
	/FBZDLS+4cz7nDXWp1+crGENkhyjij95AdcMLf/rFo8zeXbBVavHGJvBWO6ZlRGa
	sTxJIBwuvKbhzK8Fai+hdLeQpX36RNOdlBbmP9Iwaw71Pe82kEZjyuex9SDZYo7h
	YE62YjGxmLa/kUEaTU8Rqf+dOtXobfFfL2qCniywySt4ktcgriRDKTNEoooHHdbF
	mXwQWtWU+MFmQBj7NeK1DXGEh+fYXbtk6yGMNmollv9EXrgC2Eq582ZpmX6/BLjB
	D0U7eqyZVEvBPfWqFlUhX/CelJT3zX/ys8qTycl4noDf1sA9hf7Z+Uqnugw1C2Dq
	q1Zi6Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8yh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:50:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97c4f47fa57so35829241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393799; x=1789998599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=;
        b=clyTa6G41OmcgVz+BoTYkkRar1ffIRCGqepWY1Uxc+jLauYZ7cGTHER7eetIUrpP+c
         CJ+St2Zu8VbvU4Jsww6rcOlsnzuGI7qVyZFMkxlbDMYqjWIqn77IqH4RgJbfqMt8J37o
         3sejXNeoPsaRjjz/Zkme9YnVbMevWayWwnJpVfSpgn+XNFr5xXDudsUcydOdRV2uw9kY
         7NQVI22MmZohz48B6BUbRyH/42DVGLnhFT4T/FpWKlBDhKktDvLjHzJhWyfUCKT5z9F4
         LPhIA9qxhtEyfgL8BQhLatJXSazcUzfwFTF5wRxcjzS48fFFR1VWaeepmOx2NWxbhzMs
         Qbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393799; x=1789998599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=;
        b=rajoLV1GZRsfyiV+a142u/9GHFlW1KdhNvwkCli8am3WcZyH4+msNmv/s1PbQIXide
         zfyjHzht/JRKdJGJ48M/TKhYWaBbYT5j2syZEuKTH7E5cYrj7TNP2wm15c7csL706qYl
         s9f7pgNunCu1yjUlfaPaVm3BJ9o2n9FZBO5n24EC0QT4EbhvAmi7z0HVA7CUewoTRmcD
         TU3WcWArnXwf8E3ejayYaI+YeCVWCEav5qngL88vQjhSMYMpxIycLXStsJj6LJWnAjMg
         WAGl9BEAtZDZgZppyZIEstF34Qn2FlTwsWjbI1BRCd/DjCClj7D0+rIOeeU+XrM+GZO3
         1T7g==
X-Gm-Message-State: AFuF++mxucVbb+p0wAeCZdJnG5krB9+bzDVSqMDEgSwdrpv9CFevs8lP
	MXMszX2IdR8/Al7us3B4FX+OQR0/qFt4V1SpWSJ0Gyt48MYOuvWNzEQmzrUw7cPiFTURXaPGdXe
	WEt6tNMZ+Uoal5EtrdoKwd9BTF/KnxJK4R+HuAz3anV4tpa9ZigeKmP+NWjcAcvXkP4BA
X-Gm-Gg: AYBFou3GoLCsFAyh+GkLyKV8PKOjwuqZGfN0CeGP1cpJFa+jmoWPkRdk5m0wEbjXdBC
	n/LRsQlhfVB56labMmIcBwbl9bXpvGZNMdRLANxPJQ+xz21VlQBmc8Z1SixP+ox0YOjbNLcEq6f
	s5K8+2Qui3fJtfoY4nQ7L1gvfKbXDuu2gGogihWpGweauAyZiWHX1Q75T2+wZadk8HPsloDLugA
	0M1Pptog1U4Pi8u7Ft96VWJRKIUGP7XAXBAbXB74531KB/GbsAv960Zys1MMTUqv9nFMyVjRJqe
	4Sh5Y4T7PyfZCFKAaHYWraeZQjfSLA5ZHqPZKZYKchzVoRaJqXnZJXujKhLLj241fgSI4NH2eY0
	mJfwaXR4=
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr594970137.2.1789393799284;
        Mon, 14 Sep 2026 06:49:59 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr594950137.2.1789393798841;
        Mon, 14 Sep 2026 06:49:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead51sm440791566b.49.2026.09.14.06.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:49:58 -0700 (PDT)
Message-ID: <732f6e8c-d7b9-408b-9bde-7034f73667ce@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:49:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX0C+f3KzzfWGD
 RZL49v7ORUWtvDpSOB30cz+iW6kzotqC840pshcSQCIxgiJqKws4cnF2EiGbOXfhPvVP1uWWByD
 a/3lJjeLXoHTCwCinB7Z6vJqpYosD2U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX4n7cN6SlJjoz
 WuQ8aqhJTAjHWlF8W85a36ZA0Mx5+mWTetd3PFjk8jFZGnVSjlzVIJgaHE2Wl5m6tQCUeK5b8Ko
 FUB5QvMUtET4emNXiXM7evVccEz/5XAAwZsJi/mLwVAsmM3p/OJdotaWFhAPDJWqNXLWu4HpSJ2
 NqGT7k9Wa9tO6kMDU76lH1ao2Ak/pOxT9hbPW+jKVcbsLPFbWmMg0a3G/h+zTRicEqTxnAq5iMA
 LIYT6mYYpPpE7ae1DbO6o41Qa8eaxNBpeKHu/5f+O+HcMhHPIVCRAm4O2IDGTbE1PxHFWn6Jh0Y
 LXJigp2GMMfYiGkZGSAFIZ1F6Xm9jZFJubOrV1XD0ahElH3FIctkMMnE1Tci2irkJ4ot2TV1g1v
 m00gfMnBQhLwXPSra52ItxDRLPL/02Ub0AaAQ/x4A943azDI1IKvy9kqjPRUCSqwCJyvu5+mOdA
 F4/3uYdbNr5A7UorILA==
X-Proofpoint-GUID: -NWwPHUnUL2wZmveoXDxz3cr20ztqDv1
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7fb88 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=e1BaVoEGz4s6-YW_u0UA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: -NWwPHUnUL2wZmveoXDxz3cr20ztqDv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140198

On 9/11/26 6:47 PM, Pradeep P V K wrote:
> Add the init sequence tables and config for the UFS QMP phy found in
> the Glymur SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

GPT confirms the sequences are OK and I can see that the 217 mA
load on the regulator also has some confirmation in docs. Not sure
about the other one.

in general:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
