Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A374D1FF7C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737042; cv=none; b=Ux2LFNQ2pqJXyDJzhIuPqZaY2W+yHSenezh9/wZIwuKFxVU3/InGXyDyPEUFxaX9G+cYdVY6y44phxGSHnTa12K2+dWcChCUYBrtkqaUiRCyitFbxy+ScqlLsOi/EQGUKkpkaXyBvSrIUMUCFFRmcJuTHXSCSFRY+ipvSmvQ1ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737042; c=relaxed/simple;
	bh=NVKpyVtSiSWogk7+4Z1rtMjp4TUnvu6c9CDwJeyXwPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yiac0+IQgC8erfPcpkRuj5oZS7gRysUr1muT/4tDLn6Pr9gOF6YyJZKAsyP8q0gltjW0xuwzTpBZyIVvFhJNP1AFy8EklV8qLs7iiSWXHNfba+SATe0XinY+OSd+e68/+SA2cBuxUW+Q9VuxqkGNc2TW0l1GjfeX/S5kd/Tg7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocHephfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z11GDccQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocHephfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z11GDccQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672NQcH03531581
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 06:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxmZdCMt4qSTVaBzkPA3F8EgNAmm2OMKDc8A5xMIYjQ=; b=ocHephfbPLSjY+3u
	JDJCRMzEvoxWCGLRMp8MRRifWfAJ3Y4pEajoIHs+ArNgnQTC9VqsSKgZWn0VCIK9
	hmxWal7g6QCHhXK38wN7MgXiGzZjjep9PhflHhlA75+9xfdbr7UpLqfJi9yrPh5i
	h0oIgGWkOlPeUUNMczqKVj97HMe3dMK9xWOMM6xJz5qI4lzuPo/nihdLgNe2dDjZ
	ETIDTcgSFPpBS3csFzTdMDINMbv66T086aHAg+InCICN5kCmN3yP5277hzR1DRe5
	hPU6us79L0r78CJeeilfr15x8gToQ1BuWtL0xlUYMI7NaoAdEzMWc4sscRLQEyw+
	wEy3Kg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpvqeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 06:04:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so5152477a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 23:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785737040; x=1786341840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LxmZdCMt4qSTVaBzkPA3F8EgNAmm2OMKDc8A5xMIYjQ=;
        b=Z11GDccQa/UW8Qzlzr4pqrDwTYvP90pzT2ulfxjj32xqb8AJVayEzBQk5dU2JWnuc7
         KZCaD+KlyY75vr+AE2Jb9fC3L0uWmschKJyTyfUdBeLX6TPJO3a4TcqB00AoVuADR0Vp
         Dflq6VBHoEe2t/v0x78lyceuZ6tL5F+HWeV/xI67gSDUUK0EfF1y+cGWD0LzPX8TRhUe
         A+oKwuKPyaheatUkKGHFySpIJ4BFHEK7WWTXyPmNDXOnq1OrHm0QubQQa3kAt9lGBhVs
         rrKRbZJQEpkaG173USliKjlUwlHO9YCNfdhZAqP2JZfxmMENioRixWGarpS+Ut30CW8X
         gM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737040; x=1786341840;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxmZdCMt4qSTVaBzkPA3F8EgNAmm2OMKDc8A5xMIYjQ=;
        b=hRL71ACQy2GgbxrnfHCUbzM0cUmjQBKPNo/5HtVLCdcnIWTWXQ5N2YPxMG6NGcNHB7
         PbGrnOkfCkgAUSjyDuDjeu7d4nyvb2KSQsrrLsKu+TOPc/+aVQDb3e4CHKI8tV/eqgTW
         IJBsriN8rGAY0FhlWxcAZgKkH59dzQjN4gZmWkB6ptdkD+kl+YT9BKWskGnZq9LCwmqA
         Wk0w/KBBjky/ElekTykFRyU+ifBXshmU4So33r4H1CExSuyzGwMvNXZAlXimcg6E/IEJ
         8OQ2zeABqkfw0ujcKzXLWLxsLM8KpzRNULaNUpaqyaObXzPHKshQ7yUZCHOVMrc6JpPe
         NtyQ==
X-Gm-Message-State: AOJu0Yz3OLkqifTaT3rpHIjYVWxl1XO09WKPHb7fzU4sYzXlYVBKzpqy
	vE7KUPDZwbpeubuqZHOZFxgNH3OXmapoTEThi64Eq47OY1VXCMXl1CeQxl3BSm1g8PBLZ+kbamF
	8/wKXrDSyBr01VVad+vHDx87YlKgjqmqWhgdew7Tp3iOQ+metr7meEILrQesANwIZkqxnLv/oys
	+q
X-Gm-Gg: AR+sD13pAW8ePbMWP7FseckIOos0xu0llkfE3K/x6lKbRAHhaUgZoQClsbTXQlDpLaZ
	d0o/oMGtVHAfPPhwwgKhLf+IqgUvzPaJOjzNa/1RF+O03XTWyUukcEOGA70mnZsCtjkmUzD2aS+
	aqP9U8GF+4u+stB+EL1qNKSlNTFzXCrfc5J+vRNPt6607BOM5mnB1Oz3DKM6c95oWGrw/FQ+3ST
	eP27ilU76n9ei5cJpMF6aizoTYt3F1EiSswds6MX+GHsmIxiu51PJ8qJ/L9TSuuQnLjzvNt4sbs
	WaTPn6wJH9SORAAdSz9nLFtD48kvaXOJIC0F9vhZFKbw06hMHmTlfNoJMI4+37+7MVfG7KtKDni
	6leLMSwDvvEb/rCIg/bILoEBRPgR6JNYhI902SQrDOisVGrMQd5waGsi1XuK2/n7EXg==
X-Received: by 2002:a05:6a00:88c:b0:84e:2f2e:8c4b with SMTP id d2e1a72fcca58-84ee4844241mr8497314b3a.32.1785737040005;
        Sun, 02 Aug 2026 23:04:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:88c:b0:84e:2f2e:8c4b with SMTP id d2e1a72fcca58-84ee4844241mr8496765b3a.32.1785737026573;
        Sun, 02 Aug 2026 23:03:46 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35a76sm3148890b3a.6.2026.08.02.23.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:03:46 -0700 (PDT)
Message-ID: <1af31cdd-2e06-4373-887b-0ecc72d34d21@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 14:03:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830
 retimer
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>
References: <20260721074145.1534100-1-xin.liu@oss.qualcomm.com>
 <70349e4e-12d4-4cc4-91dd-9e5d45d3427b@oss.qualcomm.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <70349e4e-12d4-4cc4-91dd-9e5d45d3427b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA1MSBTYWx0ZWRfXyBRxOp94p39Y
 vN+KgbaoyNEvmAxxZqmbCm1TD0Z2qAHaQfDNikctmTOWvRzsSj8mrLC9MjcB9yZ6Nad3LpxOz5H
 yijzWM32YPxgewl4evZRpC7KUqaKAtcMoR0gBGBZWnUvzuk5nYpebUKK10lZ2693qk6OL2T05AG
 Ma7ejR/Mec1xC/gxCGyo/OmPTnkVBNf4zrURtPN2yT1ts9ZJZ94eTcbo8xVaReh2cyO3yUJ0B3e
 BO415Opr/5J6VdvtcGLAvqw2WlG/NSxJQNeDFED7V/I4bSyBkX5CWTBG5W2VdQWXzsKxcF4bNWu
 cmBTmWSwDon6L3NyP2nVbqnokMjYmagiHAcwnm4YdU8d5M+A9oKXDigO5PECYT0m6Ci1frwymaz
 LUHg+cJEvoGYeXlBhppCe20Iv7OFJAp/a9Sih84UkomjMEEDW++NTRbeAfhrDfcbmPDeAjCibiR
 zG/eJqHCzYD4KQXvL2A==
X-Proofpoint-GUID: paRDqPhEfxYxWRvgDKhuggfcsYqTlM0j
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a702f50 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iJ78zIDNj9ZIkR6p9HIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: paRDqPhEfxYxWRvgDKhuggfcsYqTlM0j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA1MSBTYWx0ZWRfXzEXfAEXwdQr6
 K1yaDGUwYD8aR1viF9ZGrVZznNLiinGY1M+8cd0/Fhzkd6yv8fmn51ZxcXjb8iQOrbjSc7ucV4J
 eIlCWrIKo5bwJ7vhWYsvjRCqU+Rlep0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030051


On 7/21/2026 10:28 PM, Konrad Dybcio wrote:
> On 7/21/26 9:41 AM, Xin Liu wrote:
>> The Hamoa IoT EVK populates a Parade PS8830 retimer on I2C3 for the
>> TypeC 0 port to support USB3.0 and SBU muxing. Describe the PS8830 and
>> route typec0 through it.
>>
>> The vreg_rtmr0_* rails provisioned for a retimer were already defined
>> but previously wired to nowhere. They are now consumed by the PS8830,
>> so drop the "Left unused" comment.
>>
>> The FSUSB42 SBU mux chip won't be populated on the final EVK
>> board, so remove the fsusb42 node and its pinctrl group.
> Are we sure about that? I inquired about this on a pre-release
> version of an equivalent patch and never got an answer. For sure
> there are a number of boards without a retimer, including in our CI
> (+CC Miłosz)..
>
> Konrad
Hi, Konrad

FSUSB42 is still present on the board but with all signal lines 
unconnected. It has also been confirmed that all CI test machines are 
using PS8833, not FSUSB42.

Xin
