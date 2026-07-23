Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B140F75E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809060; cv=none; b=fdnmSSrUi0eH98L/gtHNUMETyvlWhDqjRmeP4jBqDvbwZgfMwNwqNC6X5Ds/GcWMoxDXQO2SKiwe8wagz0QeaD+CiDbdoPCq+5f3iGi65tR38r3ukvQed+RGPk64vLRVpKfU8H2xb6aei5axC7HVPYSUa7DUYXGgdG2BCxcKJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809060; c=relaxed/simple;
	bh=/bruNzIxfbcHvHDo3iooeiIAT9FyhKYP2GlTk3uuBSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWDmmOWvIPbxFi88Ay1mXMpZD4q8VBHA1IJnhElutBoXWoY1JcXR7EOZPKoIradLiUbp5DdFCGsGf5C2zZ40c08EMFqUZHdrP8LmdV4sSeEXXp/Ek21giJicUqFDJkKzpgNIknHuxjvcjN/n0pVMtePHvgWMr4RU+Ts0lWI8HMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3E628Zf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0gZcxT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3E628Zf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0gZcxT7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qfC43668159
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3m3dFbsSVHjGzv2+/KA2dKLaq99Nxpr4huew9CjjxFs=; b=a3E628ZfBw+cJT+G
	SyYA3wWuOC8c3VkQnfZNMtiY6VR5lwXZusziGXMB8KWiubLoODMytIaqyuJaZFSb
	EmY2orLNK9IY4/tdyPU7zI/tWLrw/XPeLWudOsUAgk/Ec1x15VcQRm8KYyd6Q+9e
	yxNrdKlFdxSE6HOSsKImAIYPn5WeU3ouXHN1YWfqT1b+hgoBIHZJL84F8oVfu0D5
	0KwdF3evULMZiubD+LykB+7Oe08rGhIzo1dFHa8MDM3+NpqKkyxdepxHFVhmzJeH
	EvHWf9xAg3jlXApeXjCbSWRVB8bYvK0UYvK9dUVyGPmlOnNvMXu75VPES8N5O67X
	o9qZuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc3536-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:17:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ca37ce4c3so2230461cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809057; x=1785413857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3m3dFbsSVHjGzv2+/KA2dKLaq99Nxpr4huew9CjjxFs=;
        b=R0gZcxT7q05sYaOAGxYNZoIdxNV5sSd9GA8sk+t5sPMauEDk15TKCbxgaoLcD3/O6P
         VZRfqyJR/SXYyUlLO6ekn6D1NyPAfVrlrcqN1ZPrPfzT5AF6url6eQLVTvVoa6D9qB4P
         mMbvwizxVzDqH9SYqMP3UQx5MwgukuttWRD/Vv2BpK9doYYveT/MQLZCWvQ1772urZZE
         HHMGFBUCRoM0Wr6OvG7Bv4szAco+E2h48LaBNGpUHRyOOSb8f0A5N7WPslfvr2nGAji1
         xru2kZpl/sSulEOp4+mpvmCh1gptSesxyzc/qx9OGaq5O2FoiBKRNsQtvbuEGixSImne
         3M3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809057; x=1785413857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m3dFbsSVHjGzv2+/KA2dKLaq99Nxpr4huew9CjjxFs=;
        b=THMyLHeUUBtr5HUExGy0IeYyxD0uxs30hstV0mc9hfx5KM9cO1bFLWVvulqhXb5fVR
         0MpwgB1TYQNLgx0MZGB/8PLkT4nT6SMnB3gQJARleRKMrAwPC+m6ALB/fa/AXExXm+li
         peYYEa6T+bpGq6y28WeN1ApU5ulNm84QJMdV8eeQmHFMGgK85+ZVI7ega50khBiyuGOc
         yWP4QDXNx23/mrnySD1yGx800HWeZr9ZX9voT7VLIjvtaynSrMGXJNCnCqbJE/xG7DvP
         Fd0Z6APmaaStv5ukndVRIo39OU/uU1s02A+gIcC9KAvROqYafOlvkwrqEFKvrMz7ZVBZ
         ml2Q==
X-Gm-Message-State: AOJu0Yzcc6c5jsIVQXjqPHflhkA7MIvE5oGh1bMw1dSUFrzL6w3Maa4x
	NPR6pzJQXdu3m0JQPtMWGzklRoCwySJNv5UG+XEEl1kh/HGVUb4Oiw0cVWcfnY4nMg7R57jo6rb
	+t6egI0CoUUJCXYhv/tBvtBRSHimUE4iP49sJg0rupOh14iz2zXW6mzM1LtKeh2bDmzq4
X-Gm-Gg: AR+sD10xvs1xNVbfjcsEXjGhtnBeGWuAkdnR95ihpo42V0LRF59G7FLW4tFTtrFk4Ao
	sXGPujbwPx6ICyciLZUEDtbWFCE6m1qZj+6rMUWUucNKc4YMMh385oi7acnwW6HcTModWQOGzZR
	fUHOOgfngBCeHKW0o6t8LzL1fP4H7+dgn9GEcFnsRyjpiS88yr6TnqY0u2siu7XO+GHrk308k2D
	SQ0dTRSdsC1MLxKS1j/f2Bs4EWeFF1ZN8H43hAkWiMpki+GlyqnhXnJjtW/RLens7mzjJdCA4MO
	2aGg2vdNDvJxZRYTAPiJncfEIf52fcGQ3LqnUGhaAX3u+3UcxLIQa1ImGKZTVrxTr9ec4hHtg0z
	pzagHBQqBMkpY1phyKA5KA15u
X-Received: by 2002:a05:622a:1b8e:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-52847441d12mr2688561cf.10.1784809057462;
        Thu, 23 Jul 2026 05:17:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-52847441d12mr2688261cf.10.1784809057014;
        Thu, 23 Jul 2026 05:17:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm221020566b.20.2026.07.23.05.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:17:36 -0700 (PDT)
Message-ID: <758cdf5f-a1e9-4001-a163-be45d0082438@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb
 controller nodes
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6IF-KnAo5FitH3wtROkCYLaOExFQKUBp
X-Proofpoint-GUID: 6IF-KnAo5FitH3wtROkCYLaOExFQKUBp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMSBTYWx0ZWRfXwGdchVn5i086
 MyvkY3vSlxD4qfpZHQyRmAncrk8UPDlzXynaOk2gNtqtW3LOKHLferdr8n+89kJaZWZE5nGpusN
 /qtrjRS9BvUAOpiV1gvGkBgmD7TAp80=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a620662 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Tttc8mTvhuDqHDTqi8UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMSBTYWx0ZWRfXyP3twl71o0wW
 LgcpKxeUoCGZQMyWY1FsTzeiuQSzivZvi/oej/AltC48BuMHd9peZF/aychIYyFEiHgSIDB4AQ3
 u/gXGnI3TQJaT8rjLgxVwW4QegOGbNMSJ+Ri9qFObNJZryyICBStUeUihLYqTn/i0RSCKGK87jD
 Bh3tj6QkBCkfFst31PU1fpfwtBAO00a9LfEuM2NewsYeWzN0sXqJjCkgVb5JhrgITsjXKEZJrtz
 nk/cVk5MJk0nOmZQg7z5EAHT9yX1z0a8pcfaABRYgg6u1q17XL0W/a267OxLXinii33S4s0gTQz
 3yTjnE5ICMXUdDJ8zeB17tAQ2uCrGoE9sH6DNWyIa/1OIoewOvVrZMAAAr18y2shxax3ys9lSB9
 Th9kFBIc5lCL5WzOSnFSZgcWuKaax7lrlkiDmfqSNL92fJ8fL8IbAom9EgM1EZc9GNoOCprsRZB
 iPH6MqbhY3yRx0reaow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230121

On 7/23/26 10:17 AM, Krishna Kurapati wrote:
> The following errors pop up when DTBS check is done for qcs404 based
> platforms:
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:2: 'hs_phy_irq' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
> dwc3): interrupt-names:2: 'hs_phy_irq' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> Modify ordering of hs_phy and qusb2_phy interrupts to fix the errors.
> 
> Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> This series has been only compile tested as there is no functional change.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
