Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C6749B5A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818917; cv=none; b=eumK7mXOm8MWPFq00IeZgEfLR+YO1wXM8SYiujRIOqofvSqd+PDmTiV3YaHyyaRXiKWC4OjtU6RyP9Yeu1oCqN8F7rclRQK0t7fV/PTc1tOiU5hgf+ZNUxqlHckpkzfphnaSL4zmIMBNa13KjpFg6hFkfB1XLz7ZN/mwtv3A7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818917; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRuVSsXdt6JIznZL9uNFb+ChdrZ/DuAGBok/Ilw+IP5dPNSghp921aHwP0FzQVBUCHWH05Rm2yVqBJ/8pwpF2o8KEHS1woQ5B78ZT1qN2MMifqyWHFNxF9u0rKFFh2k7EigMbDjVa9izyG7ag2m1Of4qNOKInsJ6mOlV0KrS4iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wxi0cwqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPiBgaPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wxi0cwqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPiBgaPC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07wx1686158
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=Wxi0cwqHkAgKc/8H
	47z7krdHcKVLZp9+6FREziNJLMk0AzO382/usxOMx/yTSjtbPjpCZsbpc0oY8PEp
	0ZommoQuB3V2CvFWrYDmy/3pekK7bbsVRMoLamWDHFO2J6nhgfz7AJdFeuPse9X4
	RSbuIvV4OOkZCg1/x8Y8xEsylH3Fucd5NGkTF9er5pJcr4NOA7JClvK6yYAP9hlb
	kCCY/zo1QCXjd/6WQXyw7P6XRo5PE2lNs6nVXfcPIfQtytKhmfn39Pnkx7EttP9/
	YNspKQj2E483gkIUCSflf4j2gHr+L0Ppq3GhDwsYiYIMlh4Us1JmXC+GXOookB6L
	dlVMTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1fw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc19d8e59so14399785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818914; x=1792423714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=JPiBgaPCS8uN7GBLwuJEJQjPJdIUAEZbhAEIfDErVRRmh1fBS2wZO3QRdMXUNckbCX
         BGI9NAukeKxOVz70hegrRIyZ2x3qBTjf5aO3XnVQUAUWXCnA9HgIdnFtX2gjcebAgAkL
         2qpdPGYeI6DV2tznV95/EzPSCJ0InzE5JLx9Kfwihlqr/XLJPEVTxpnFpYFNnxUr9C06
         /h+m0BPsUfTfOjQx5N4AHVOcTsfJRKXgnnarnHZM3kOSLj9TImJ2oGoLamO3+Tq4xW1U
         I6gjyrsVPsHpwKBI6QEpX1pmvNtI4kX2f1XnCno4VOfrTUuwB7tafeR8QR4vXWtCBHMq
         ATIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818914; x=1792423714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=PnOfX32HiRT3inyLFcsTjJ480TsxWup/eX1rpWNIA/exuSbsHTfnIEknAJb/ObH5L9
         S7f6ddgWx2bCglMUJ6mMfLn3IDyf64C8RhHCunm6gxHT/j2azxm58tuY9iV9omsKkC7C
         4EFWr07Z+QwVwixRiM4gtcCRK0TvB5VfzwBniZLBaENEAzerLTdO7Ktz3AjFGyhmJ7zL
         Hxg3F8wTiZNde/FC5Mlgq/2DP7x7OfLSsSpSlnfzx1ScDnxdAa65b2dbeL7AnYwLz9G9
         laXc+5TfQB4G1GyBWBz9KopqtL3UnDiyVHxhoQoCWDjmPsvEP5bR/kcc0UZMTC/oPRB5
         X49w==
X-Forwarded-Encrypted: i=1; AKwUvByNPHoepMEzO9GvaXEtHcwsuoKmwvttNj4tCVzGhUkH3/sQ+YUMT2Ji5Wz01cPWhBLFa7cPfX6PxFeeB6gn@vger.kernel.org
X-Gm-Message-State: AFq9FYIaEcVrW09jotmvhQD4/6LjGw/sQcrtywWpTpFPXqN7vUxB/jf2
	t7x7o0hqIDi/Q+fbRJCwpzb8pZGBg1mRGzlzbVkJgaHHtJyxx++k7+XpsPKLtmpBSWlKLtmU2TJ
	hBn39jz1ZnUBhmpnwIiAyFsIEWJkXEeM2ceNkklZPQAZlFDHep1W5FtfrljET2q/pCHSm
X-Gm-Gg: AYBFou0eb+4yhgYrxtpBD5xjRQ+BQEBUJk7pAv5PlmrCKLVIscS7S6BM+YCgkeIXGQT
	1geNaJ7RbJQ0kiO47PjDeyH+dl9IFhRlcM1LOa+cg37WrimPbC/S9Q7+gpfhh+SEt0RSQiduFre
	y0/0rIsqlolCnbFSBZlJrLK8e40z7tIW2zKF8nlaZitY/onH8fa8YA9wzJ9WvldAZjpJ86t72bK
	9p5eEvsVDeAF5QIpUhOgKEiIM1Aa0d4lC7nJWlT7vBUbjLLii+5gJDvnmXPYuIkYmI5+njcNssj
	wrdbAmIU7FIMvIWFdJt06BR3YVVKANuCrkWjyasMPtGq3j02bQuSyYZ6ntN1t/MMFLnBKpXgW0I
	gJ5aR/IIC5TKFPdMeyFuWzg==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1710087685a.0.1791818913841;
        Mon, 12 Oct 2026 08:28:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1710083285a.0.1791818913355;
        Mon, 12 Oct 2026 08:28:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm475916266b.65.2026.10.12.08.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:32 -0700 (PDT)
Message-ID: <2caed75e-ae69-4065-ae31-12d229de4b7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/38] arm: dts: qcom: ipq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c480d106c610e2c78b3e4c3f5e35fe19ccb067c8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c480d106c610e2c78b3e4c3f5e35fe19ccb067c8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXylsiJph9bw5P
 t5cA5HMmRc/W5kE0gUANIbVvQxrYKkFPvLO64Zhbk/y8pSU4FHUZqE6JInIF6T7UmWZmGjGNXnh
 WiHI6PB57MtMU0ttl3k+njdKFM1IdcY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX27OF5sWRbPbh
 A0h36mYHouedD1o+rLPIgmD1GKYeWcy0/f0lwOIw1A4Spwf6GAzqq8YY2qNTuq99TYloxZi6Zdq
 4tEsEZUTpzer7PFev5Dab7L2PC4DzxylgWSyi4zOO2k4bCvbStv02t1s/c8VAZHg7sZeIrESJDb
 lRZQSDI60BGOauCkvee5MnnXxryJMcE8PGRyIQfM0ky4t1GXYevpIt+cy+HQDR3yNc4c9Lv5ZXG
 gjpdQTYMRwmKdoDwgjbty7SRhl5+Bfb8lYFmAwynPjMk0LPomcU2NJjSEvnCml8pq8gPXuh536E
 4IcWev3XjCW46yuMRP6QMdYcKs7753eka5BH6Rr2ZgtQVwlecANt5z7JapLB1LwlhQ0rV2ly+Qd
 GcNvr1HJ0Fk3lROyC3Uaff/FC17j0T6NbiWMAbtdnRJ9tgf3hwUY/FYPi+7FzjNFKUYI41hNo7r
 /Maz81wuVPTm+KqxHRQ==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfca2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: Qw0-i6opq1zsCBbbch9_kVnCp10hB4-8
X-Proofpoint-GUID: Qw0-i6opq1zsCBbbch9_kVnCp10hB4-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
