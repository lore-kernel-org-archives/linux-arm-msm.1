Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378C3D6491
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383716; cv=none; b=CKU5i3ehRtQaMAYPbLinNCfkyL+gXTmLuzbfWoMNNhFj/vn9DpjFzuiIEz+hokw9jNe8cORHFkoY27Gc4VTkbD8ngG10f3DPLjnAuOQftkVkKObH9iE5pBj4su9d4rFNLVimUIJj80Q44FbpEuxgtCHFjVE5aD6TiVfpmZbsZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383716; c=relaxed/simple;
	bh=WAny7QdWQoRZqoQZqKkBz2B7L+/1oBvpxAVPoMK7GUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKB2UxrV0xz8ZsnVXNQuGHsQfcqTpQ7gjYWrVxxLLXQPWBrRHcGKDHx67K23IcEV5O7csQPd5T8SkyDVY2al8ae6DljavxLem/HtCZeywlNqIKukV65oN5hWq0TXpil/XU0VNGJKxV+5En7qjqRUOzBriKubnE0nisZGh8POHBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9xWOOnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BO1fgNGO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9xWOOnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BO1fgNGO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwFB3860394
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=; b=P9xWOOnUmk7QRc9f
	CicOBz1sN8+BOXvw81Eij+o5kkT0/xNYhz4Dk58Q1353yKS1Y+NsPesUFQSen9oG
	v5f8IZvIe+rtBQGfiHqCS7Gj6BpQnTH3p0+dU2xGI6E+PTiCag7wZKOPyGEiXY+y
	2m2gB81sWzRoZOoHyyoF4Xmr+g2LUXeY0umjwJEhNBgFVGkmByEa2NZ/Ip1CArk7
	omQHCHXHy1iv0NWQTVQVkO4Po/XhejVGJ3hOh5ie9s6fF6MnC5Cuf3x8k7pYELfJ
	V4vQfXY7RbMAyHbGwjNHwIms6rRFAin5CqAvU3zcqHfEODsIPIx+iPUY25sd8oEQ
	4BqSPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0nmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso7346206d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383709; x=1789988509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=;
        b=BO1fgNGOvCRyejHohmO+yBeW3T7h7L7vYkPGjL2N71Hc6B5KNAzZgSLnv/CGlwaieI
         +QmjFMLruGl8dN2ueukEWhl23RnOzv6sB20iLT7I+zA6AmqYY8oXQ2lAGy9rSSXm01v0
         Ny6Fsqqol/Fj57MjACo1urolDa54D3vJJ3LlUu0vO+XSZtxdPjqu1MUyck528kcvCINf
         3Ap+ss3aUCFm2PkjgtPHVg+ywZaAE7ur87/FRD6fnSTnb9lyL5N+iDB0bqB7MiNoYDuh
         AQV9xjQLwN5utlQ9mKtURf4eHufEzov7yu9uq6kupSsAjKEexf7zqDKyULbtehI3g9DY
         NmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383709; x=1789988509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=;
        b=or6sdn/7dzk923mOkttNT2PDZB+7+qexdxFTt1uus6vVFwsZTgWOMfqdglrtBK3RPJ
         Bhh3mwU7AzXwsv5ckGssiuZMYDx/Dqd5LVdWDbUoM7I0KnI6rJ/VDzLmqVttqqntVRG9
         eGUIfFeDCUKe9hF2Dg0PQlj5KuV5ep7o+4T4p6RY55ChBtqzwcHZqPQgN96hGWa+Jzab
         1kw1wGTlLfZVBNU37C3roiWBW+IXbfvfEhVeMjkgcDWIkUZtOMO5PQJB2at2YIeBuGyH
         MJvQ1H7K/WfB4aMvt9tDX4BztBmtxPGE364/mV2M2Owmh96R8OKSPnqyRYcR9fXYX/r9
         VWQA==
X-Gm-Message-State: AFuF++kSajDMjZtyhqWU+sPh4pMJybG9uNhY38/c1H00tK4Unb8HLVtw
	BHzgOoTu9/nzozhKOC5KLL03zLTWONhkCK8WLKkyj61/3XGpmTwfe2bD3p4gSPDvAwS1zkluyoY
	SfIPrkr90KkNK4laJERRTb3b8JFRkJS+P/PCMjEs1QHxUkUZ7W9+tlbvqU2d313pq41Et
X-Gm-Gg: AYBFou22/LcZMP3LKU9S8DRtMrJJJ6Uk/lZaG3nqdn5AARo7dFVKGKVHeC8/pW5Sq0r
	mRgmcmdAwFnrSTlhy9R3x/kKDvRRoyqNPUE2uEa1JWoeSmbJhn+wxlLTEeegZ2xnyXWMJimQ8u/
	vO/beFK5psEJC/cBgFOOpiEvdgG/mNHkiHDSDeD5zFkjERSULMGdyDf2hONk2iSwooo9tqrP08Y
	LvKNQ+rbXIBHg94V798iAFb4BbV27er/06LcLCGZycKXQhA++bp3Z6OwMDxixxfxx2lISf7aAjE
	tihWexZDvWU9SmuKAZ1gN4BJMU3wWkZRcA7JkTF+Bte/PYzcKU7rC9/dyqi8nHwU2cO6eA8F+dB
	cvjIn5aWH3Oj83kaKVLF0Yw==
X-Received: by 2002:a05:6214:19ce:b0:908:2053:b57b with SMTP id 6a1803df08f44-9122e6f2b03mr25478286d6.5.1789383707541;
        Mon, 14 Sep 2026 04:01:47 -0700 (PDT)
X-Received: by 2002:a05:6214:19ce:b0:908:2053:b57b with SMTP id 6a1803df08f44-9122e6f2b03mr25477836d6.5.1789383707101;
        Mon, 14 Sep 2026 04:01:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966122101sm409951066b.54.2026.09.14.04.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:46 -0700 (PDT)
Message-ID: <ba6c9962-afbc-448f-86ce-3e21e609bb5b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/34] arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CqG-FWnqv4o6V-_t5zyHOGBIraUkYPQU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX/q3zrk5XC4A/
 oCkJP5WPIWd42zuuq73po8nInSw1uiHvQIrVfSBzwPDTPUQM6wFWoMqQNcOZxAbOd8dLf+vFdbd
 hVsekIQeCb8pPvi/hFWxH85adi/XtMU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX6xKtkfvhSC4o
 0lPtYkZQtSRNYhNLCk/Jk5sAby4Dbp9PeTP+yCoFjpLG5clRqxgFJViRdeP/np7oX1JUhiRiZSp
 eMDvjeuDU4HRUltC30Vr6WiOu22CQneuSMfO1+6KrTlDvxCK9Sm4WdTCyJ/24d/h02rhUGb3sZq
 u1lTzC+mmJAjLe4XgfAYvp/vCgKx7dDJ3UXcgu/QBDfMy+0y6ve8J8r/1RiVKhCntYovffL+dU/
 87mTkXNhytLQi1kUsItWJixLp7WfnKJFtqBV4dIp7YV+QJCuwWTtqs+hZBWXx5SKeJtJ2awmHkq
 790u6jxWYSjazPFtkUpMAcMJMDwHSI8PAAoYOpct68e4jpMPU9tzVwpfK+nC4hL/jFI0+uZXIsX
 1G9Hq2de1I7eXmCsCrP5yljEpBLe6AUUHU3sf2PnLinD/JIMk2xKwF4M0kXbiEOTvyQw3UxZWYg
 kHKrRy2X1KHyJsAyQbA==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7d41d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CqG-FWnqv4o6V-_t5zyHOGBIraUkYPQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
> controller override to &pcieport0 in the board file, renaming
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
