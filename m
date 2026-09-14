Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABC30FC1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388534; cv=none; b=gg4e5NGuyOB2+I5OFbO7aT9qrFwElpZoBoE8KBYMh4a+x8BI3ujZUmuyhvUTwYDo7ZIF74Et7q8p1SCSIKdYOc/xDzwD24FucO+34oKhchK7Cgqu2QpT1xRkRWgtdKg3qnCr76sGfdL7GJB/BfWoRLouKFhBWu9CL8XH5N/06Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388534; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e3qS9/+gnUDC/IlwW+Ta5WQhlZk1GGfDLusv/IBAiZSEX7N58g8zmNKfUxLcUys0MWVEmanc7fl+VlXUWITMLfh4poSZQ+x5Ed44y8vJvDeKcEKAldsZGvkvvGKcUDeaXLuGKceg4vzSThnb9LggZsIRsRd43tFolk7rNeR/a7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVa4gdRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STNDUwEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVa4gdRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STNDUwEd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwY23860394
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=dVa4gdRyQPwlvKG5
	+UIyh/ogItCToVnPUkSE/evxRGDqC+Fyh0obLk9UglNDzlCfPWZ9I0lxsnoNGVhc
	EaQG2mucCqt0iiZpexSde3HhP6pW44RhIUCJ6CvlGGg2+RennqV5idTnx3ii8CET
	taeqyWAR69vWH/4QFEkLXJACqC/yNJwF5LKAbxVdA3vJvmAXBpT68zqI8vPdcc8q
	pxMADc69k6roQu7+jhgv5jTCr6oRqc0MEXiUPyX3T9DO4g7R8FXx5+/uedzObf7x
	8RMHOr48hRws/Hnmh/mfqLpQjOjytGcemF2CKEdwPub05hn9Hf/AQQF4CjZJQi94
	MDTOnA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0xg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83098d1e0so50043e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388531; x=1789993331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=STNDUwEdGSLp6TJN980yWMv32uwN6+fB9WWzo8Tvxb+lYxHhOF0cwCMnVXKll0ZHIr
         mlnt/zG7ZwdqafdBZIFc69RkT9mFMOFEilsXTGUBUtRQVpuaIsIVw9GEIiKG7zHUivEJ
         JQYLa2pyKc3+RIb5xEhQLAKU7LOjzqPnkXcp1xEINn+h8eY9T3roFszQaiTX4YkJrLUD
         lPP2tekek2QKE/yJpx5k9ClVHTehpqI8az6IeeylXK/DSdg6xPFOMvvfOnK+N/NhmXWr
         LAdDkwMqYvbQyGJ5UcyDcknvx+cXBLvVYSLCJssHIFCeySYdoTBWLy1f0+7E5s3VAYX/
         c6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388531; x=1789993331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=DRYY0mdt/PNVjtSpm8CH39LnaiyIU69vsLKb+twKBNrMGUXfaQGIUUWyNnBSDGSMA6
         T8+OF270jCbmmyS17z108ks5rZyGEPBgJvH78VP1cEx61Vlo1+IgWyRkeh8+sTkL4Kso
         WLRu4TPnC82exjQq9Ccjg6d8zDAVkhYtHM6c/wFWKmC0Qj4q4gc5O+t7kmpsp1W8ZpyD
         aZxwJkp/gJDhQCsM0g9xY+/Zz8oaTiGrA3Sl67cnBu9gW3B5twxS3scqsCnaHkg2f9gQ
         F7FNACVZKqGdxMjag2Q2Px6to3ZWfuKARvwMMdnqRiQX7D1SFJqAN69cqc3oaKAQyQCy
         Tiew==
X-Gm-Message-State: AFuF++lwKxHXnirG6MNyCT9iGTPY0G/vvBI3CnMB1ZhDRFE0qsPRXoSn
	Fwr9xn65bGhK7otEV4xdgDoARdvlBQl1mMgKnhiwKSQugz8SOzEMMAOFTF7nTOkGWkdNkndulcZ
	t5WXFjEdSIpgEOuUpBrrh2nIIkYv0KgyN2dv4p2PPR/NY+kQdKZrQzyMUrxVdV+T0c6RP
X-Gm-Gg: AYBFou2ACFqSxu9kfHRqpPXVGMZzz3Gvh88fRgpFC0mo8GDrV9BHt8UuG6+nfamJlUo
	kuh/CN4vtFP9UvDDKjNCZDuHoJKp7Ex4soRvOqUkt2nXpNh9xIYLj6wbZFVXw3spWj82GAtGotT
	HG67909/YkK1f0d6yhhWSQ0vU5mzIGU01mPlF8M8iMJfFhd25n7PaRYHIJljD4bjjktTfvm7Hzo
	Cfs1cwaTlQB57nq/MCcfzqCUxuBjWjL6ICgiyTpugUgNt9yiYxGs2G5JyP4f59BIZY9QYb9SsN9
	ysTa7ggXbmPtBigY9PXTSjlTGAIG28EJKrW3Umpua7xVPc1ND3eqSKFaD0CUONqZa4cQ5zV7SCH
	isqFLYrLyx/k7uFqFssoYiA==
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr376381e0c.1.1789388531045;
        Mon, 14 Sep 2026 05:22:11 -0700 (PDT)
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr376367e0c.1.1789388530626;
        Mon, 14 Sep 2026 05:22:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0471b6esm2391714e87.59.2026.09.14.05.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:22:08 -0700 (PDT)
Message-ID: <c21c5275-db7c-4606-81c8-87832a2f8104@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/31] arm64: dts: qcom: kaanapali: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j7oElBZCxDhyMxnci_37dwdzczsSdw93
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX0OQ1udoeQC5m
 a/HfpgZ9h9xINd/4Ic0rGPFT3J4QEQm5i+VLEX4Tog9/HwGfCoitwdsKNybpEz5EpQfUyUjkA1U
 u8Wcoan6V/5jFfsqA96GlHzEr1OV5Nc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXwc6dn6x5SW2k
 Zu0nKjlKgZ3Mpwt7/yZwVt7LGWlSLvW77gajEDnjNRKZEqoevj2jh19qymTH0ST+T4YfccV2gL7
 /jH2Sip6+/qQb9rlhoWf7xnT3/RyIcXyihP/IqRXtdgDLjzTG81zDvRhDnGuEUHIwxri4ewcvTg
 7XWM7D/Kzz6Luw0BsC+4wqBz85Smoie42BM6Xs4brm577CO1Lanw2FwphzzcTlWb1BaqmYfn3Yq
 XzT0JMXvqxczhgl8Y3l+p+w+l5oZBUGUjMnS5AugHDTuWfPIAQHooYmcGE/XOj+qdGcEC+wCZRK
 7T33p3o+hBQchzPN/TnnDuDoOzP9QB5gOZRBSqpE9cRmlcknvDWSwl7f+7m8GCqNK0r78aG1009
 37GKduqAbYyReaav63vR2CkCLVDS/c18ea6OW71cCzevdvKih5yLCRHlRKxa+fNbzUwDbmTka2/
 y/2jfY3BXKyRJMO+ZHg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7e6f3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: j7oElBZCxDhyMxnci_37dwdzczsSdw93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
