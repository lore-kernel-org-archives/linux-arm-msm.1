Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181363DA7E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383679; cv=none; b=KwNnQbXxKNz6FQDNDbjoAZKq/Wo5PvzgYjCbSfzY3funRas/B/Nw1Y9O2iZ4QunSk9PZeONpbi872NZBr0fIdzKTn49zLFqZ08QSJ18plHLVx2PmvbUyHZYyav65k928RosJT04TpeH8DFxVI3f74eZgE2YdcH5NUM6UaWqT1No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383679; c=relaxed/simple;
	bh=ZJyzsVWVEEqFSNNRHg2APKF6gHo90SoKotCklyECCZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OibDakuHgSpvPL0zzk43x82atkuO+0+l2MbRVDjMvKDOCptUaALhn/67YHzYm9xCrc5NYpaDBLaXkkvCTfcBTRMvnjtLd3heT/TN8MXbMSL/ujNw1CPMZNuZLbhaqr+rbzVXcbdY5KI7CR2hvhXSKrCD4qYSlbLqHQlct0U53I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBhnZ+uc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhxVrG+E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBhnZ+uc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhxVrG+E"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8ES530984
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=; b=PBhnZ+ucqsmLJ0qM
	dmfo6L5Sn3v7yK1ZtRPfKszNftHbvX31lKuq1iArXQwxPTzLNXb+27nZkqz13mXj
	Fm+G91NSulQm4IuywQIogOdp3f8Wpaic800pGaeB9THR8qAhEr//3Rya3rGWDakq
	hHbhNrwhBTctAaNoRivSuzZDHA9Qk9RShR4AAvVnn1FMEHrDyrV0BaPi23mL6Xcc
	hTkqmp2Fz7+CmkcPmdHta2gTX8h9lcNiGoZ4Rps4X29NGwZ3AxIrT5NNCPpDqH80
	/Nsbbc86Z7pPsUG8F7lxVsoUcZBgyufiwaXzqdWU62QJBphiRl4JawepVPSXv5/5
	Cl9BiA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst417-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:12 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82f9e26ebso87325e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383672; x=1789988472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=;
        b=dhxVrG+EocW/KUVv1jqFY1BDJMzeGME2D+HKC0dcphc6F8/n5I1+aZT/HY1b211MqC
         18PxRQeG9ftGL68FpZdqQ4hsEMn9XoTlZc4i8R4WWVlFZCECkrihSE/+YbdnAKvXg7S0
         9I4WlW6l8fFScExFG8OZI6tvQkU5namXTHjKtsCVPIaTCRUwdI/7oFoD+zpOUqSN51Kf
         ce/d0Ug+5YD+hyTlnEONTf1utkyhFimwiRh8Z5wveS+jxc/RPgihYDcf+VWp1SUEj3qF
         kt3fEi58csXJs9LP7Y5xmvWCI7nhcUXlzOv8awdYfTfQnx272REKEDEwMchalhFUTROD
         52Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383672; x=1789988472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=;
        b=osRxapxN5/LK/lvuLcOILVOxF6e2y7Jng2ZLVmgeI0nW9e9NV/+7Jk6MH1nvGFCRL9
         LXuxtDtamgJVEuuAryNZfuXMw2J8OOiyzKTpjva/IsoAL/xIA4qjQW0ecAOvQAe2u8WB
         VZljytvB7Oa8U4EjkMVJKs2jYKEj+HC4rCiFjWlJyJgn/y/zyl0pIEe1yELRDwi3u+VZ
         YMdnqJ1n7US/30Wj/L7w+lOFla8H52/HKOEKpmtC3hoYINMGlrDi1rh1i6sG8/GF6sOp
         3wyttun9QqaxMUS+lPJ+ytFZKc+m8vP/LwVWMXagM5SfWaPlkK7S44jM4PWLcvXP1qin
         13dg==
X-Gm-Message-State: AFuF++l5XDN1OxYk5V327BvuV6YpdTX6bTfdwEzw+QWdSUog0AoEUE3M
	oL+KXVSFCTwzQ4epZKgPVCMmwKtw1Xz/STbJFYTeJymW3PJwPDR0r6LwboWc9s9I3+wgkbqbytr
	xGQucP7rFb0XXwhwCUptTHnuthEPQJOWLScNghgnEQ/edYszJNvUh/zJk61Vs7iDpEIWh
X-Gm-Gg: AYBFou2U/Wk92Q07r+B0G09dfkEwQOguyo5rmJKsik8w4x93PUy8uqIZ2mM19pauNfV
	6BcSqT/czGt3V3yD82fMKe9V1yMihrOQxq2RsGHSuqVKvXbXkwAXgnNxXjWVBSqxfhyw/gOqqhr
	6Fjql6bH34Iq5Kf2UKln1/WTZGc0kG9TFhh3Iz2nFzzCEMrgWRzwI+WS2Ei8352Mxj/1+vm3Ysx
	805nH8vfYylH/mJJrkNm5FPCt+aE4MKrmvn1pooqkRTDUmmJnvHIkOzmWytz8fzbrvViInYRZ/d
	6OaUnrpOM/qBtfDk1/eycN2qur1FJ3T7/KcH4nhJkDAUF0gWCRM57j0ZWjBbw4FQvcFvtqYFD3B
	b+NyrmuWXROIBbYSsC0ZBqw==
X-Received: by 2002:a05:6123:420a:20b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c9818b534emr247946e0c.0.1789383671700;
        Mon, 14 Sep 2026 04:01:11 -0700 (PDT)
X-Received: by 2002:a05:6123:420a:20b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c9818b534emr247910e0c.0.1789383671322;
        Mon, 14 Sep 2026 04:01:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58314fasm3968386a12.3.2026.09.14.04.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:10 -0700 (PDT)
Message-ID: <cd69cd0b-99c9-4f79-8704-ee84a6a14dce@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/34] arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXzPNZZMXwUwdc
 pd3BwIvhnKgwCI3rhC+7SWMXBPg6IMoy4a+Vu12aXvoqnmtux17MUfEGpwgsALnIn3bnUYLsIhx
 VSCdV+RUtlfdstT+volKOxK8DFE9gIAltCoe31wp62bBAJYRrmHE5xYjBiq+gdOWhRH1uS/4j6I
 q1PPasPYSGc3UDPnh6VU7limEwwP7g2WFAaQZxe9f3tzwxUpTDjuQRWWgPifJECpG8r/pdPpiX0
 GMvdHOMGY/PEH6zwHoaJ+a/RJj4gK3MJcj6qdNQ/uyG5XJ98pRUo5aB9+ix79P4NhUT878IFhFM
 eRrg06jqLtE1vul5pKc02yTvWO47dU3WMsrYkczYlyA1q+/7EhRdjvcV6oPuwNmoaxPrGzECu9S
 L53dE3RzRkm+5+RnmKykM+QY6Qziv43E2dXbTN/HYkVxYSQT+LYjnGg3pIayMfY15g88a/sEi2V
 5lm6v7XFMMmybs7T0gA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d3f8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: r0uJMx0dO7YgDT0VE-2Kp3sJfJYVonIv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX+n0Dj7FlixzO
 slRBPku89qVSgzYvBhj8K/XN+ASVI/KQYYDATOrgxBaEPpKCTJMIZwT+urWl0qMh0JyBXIPGOy+
 Q4DLeQpq4VXtZFTnmzTYGGRllpdfUK8=
X-Proofpoint-ORIG-GUID: r0uJMx0dO7YgDT0VE-2Kp3sJfJYVonIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys, phy-names, and perst-gpios from the controller to
> pcie0_port0, adding a label to this node to allow board-level
> overrides, and renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
