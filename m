Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657CB39EF0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396740; cv=none; b=bQBvD/Ghc3KKT5Rfdl3VhRE9z6tH6br8OlbqRtCJxnExBBUu6qjpW72xr8EJUTS7vwC8u1irR541Clg+fBxVqWEKlNT2sZV4Tjx2xd8wcXYtJ+12idO1Gwmga3VQwsAPnaj7yOVUS10Xk39czCfPVpaYQMzWfmLO5rqEwG+a6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396740; c=relaxed/simple;
	bh=T0es1P/bitIX4zrKG0XKjZcNMTEe6MDK6wPyki/v21A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5oeSDFsatumogcCOO6BpDyEe2QlJ5gJVCCP3GZqhoVVn9L30hs0/R2+aPLfJDLpWesboGyH5Cc1qXucmS35n5+nj34eawREtne2AIHMpTuza1Oe9N6H7v054eufB6Xzf0vGfg9xqYCTdohVv+1Rm7sTQLWQQNLqSK3vSz2rBZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVYJ9L8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrwG9fpL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVYJ9L8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrwG9fpL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7Ouo91301127
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1V/2kuU7/xkS1hgux/0yw0TI8KeAdHTjjGG6KPdQZVg=; b=bVYJ9L8wfp8cJm9T
	oA+bmUPPPesUW0zZ9DXjRODl6ITADnZ09yr5PXc4xiIHs78HHmzeTNrU0RV8iN5F
	bXFLwKMuwb86wpdiWe8kH/TqGUa5dNAt9ljplB61rf5eP0BsmFFF0mMSaEw+gvGL
	cdw4a2PPTgqdhT12UgRA/yCD/om7botArpEvlPOJU0CtiHJCyKG8BQzmkE/VQZyS
	7q0mWwIzopi6yy49CdQZYQwAfcPOXnsC0KkcaKH6CI9AHvTMqzRtxNRFl93dppq9
	p5/+sgyE9/+enxyTUSzFAQR8iSsJXY8IOyLU58ZnUGWvqFRvuXIe13eHbSMKYrUS
	o8TIRQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr26t80yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:32:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-901fdbfc3abso5664216d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785396737; x=1786001537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1V/2kuU7/xkS1hgux/0yw0TI8KeAdHTjjGG6KPdQZVg=;
        b=DrwG9fpLn6uV68n/e8E1PfWmOlaQWN2oLHHyIxWPWxOWpLbTwZ2apsMVTOn2WK+L/g
         tuOAzKQ3Y26mCtBFdxqpYd+9DaXGHnsUc9gBjoCz4pbK0VpLTHk71/XGQ2BZ70F7dnL/
         Zo/jGYJPY6Tn/koEQVsPDiQwJzo9EAnnC/AneuWCMunw+itqPjhpstQG5b51s6YRmVbA
         nWIh4V1i+R1yB2ZJjR8fYInkIt+m9vafkRdjJ0hc5BclnCZmwFKCyOsztHtUNhhTVcV9
         ljoixgcbl3YH2Jq2SR3nUIhWL4+1uFUOhXD4igD2FVR/F0SoQmYsA93wzj/S5By1OlPk
         ywTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785396737; x=1786001537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1V/2kuU7/xkS1hgux/0yw0TI8KeAdHTjjGG6KPdQZVg=;
        b=h3b4FCuTB25jrl+9pqCeUkq9YavxVHQjJHTLVy0A9vRKan6vXD60EX3EdPRdUM3/Fb
         yL8+6eQW2UkXWJQ5thXvssdFISj5Zz2D73g/9YFBj1q71FL6DoDsdJ14XfLL8HFu7S9T
         WTUYkzi4Q8j24aqDIuYU994d4OQVUD+f1hHCTl1h/iF02OLGvbkbvqgy4qhYFaUKmRQD
         2IB19DXE0fW4QsR3s0XL8Shh8G4RSgoTpiP697ChHxdZI5G6g9lyaOPN5Q+0anxvSXRi
         fZeIzQF1jKd6uSOZM0voN6kLPCgLPVPckr1ty7TnYneytTCyKzXNncFG1HvlZtCPLWKJ
         LCdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeZNa1fZrvZNWv+wIgQXiMa8pxkuqL0IPSprkUrXNGYKHeOo+PZUlRFV4P2s7Rbzta3hiQoB/gSlo9WPN0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyq0lvCyZJy4PNerPpIdFfaSi6bBz/RrFxibma0ZvkEVpHgqBK
	8oLX1PvVTLfdbBlwdWwleKA6I07HDy7k7QNM9ZQwMepUzT5JNH9VIwPi7Tqido/zlvjtxVwlKS3
	et5XJHwtsDRsYWeO9tztBHLD6GBX49Q52z3HwixLQDbRH/XYSNSr3o8Kl7Y/g3Vkhbl7j
X-Gm-Gg: AR+sD13rChk8v62PV4tFsUIszy3xC8j9AOUorZNfCa7lThXWxpFKvjbqhCIcUWw7M0a
	k17IQSE03WHke059b5x44ryIyMZj3Y9VQixt1ee+r+NremvA6tbXzgxhRf2GwIrDf3HSD2DQmfv
	5BpsJCKx61OkXDAZfCF9TIteneJMAfv9gFWYSbZmS/xWs+4xNYFFAyAXq0ffLsdO/pM7b90ZiS1
	C4zMFYcAgoR0XTVizYWL+WxI+L/J1jWOKEt75kJCI3BrUUqdseXuG2A3jMD6eenZS9qrrDRp+KD
	MKmNpi27RK74s+Bq1CbPUIbWKyNGVRBQYl5NKXBxoOKo+K+SUsTjbChVo7wVy9gESgU0l4kfD37
	f0UDoPem5tvBg8f9q+4/MVZbB
X-Received: by 2002:a05:620a:a497:b0:92e:6071:7cc4 with SMTP id af79cd13be357-93487207edemr188760585a.4.1785396737398;
        Thu, 30 Jul 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a497:b0:92e:6071:7cc4 with SMTP id af79cd13be357-93487207edemr188757285a.4.1785396736885;
        Thu, 30 Jul 2026 00:32:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa857c8d0sm34396066b.25.2026.07.30.00.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 00:32:15 -0700 (PDT)
Message-ID: <3efa9f3f-0bc4-439a-92a1-a9bbf6b95d10@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 09:32:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 common
 DT file
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
 <35b14c17-2953-4b74-af15-4677390aec9a@oss.qualcomm.com>
 <amrxShOJc+bT9pjE@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <amrxShOJc+bT9pjE@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J7aaKgnS c=1 sm=1 tr=0 ts=6a6afe02 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hj7ihxJC1nvnysMjlhAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1MSBTYWx0ZWRfXxAhPjMtzDOje
 bhAnc95gO4DqLTPOw3LEnjftCdM5CvtxRO1Dj27eNY9eKKMJSkF16AatdMwRpAuLz4/doG2OnVk
 H5Dirh1LIKWlFARkDzvjslWBFepYIvcAXjcXHzVgKaSw9dJjKBUBLQx07bhBD3txgrUuMs2Om+S
 W4wSYGnKyFlGtqSeMb5ldK8qCDuC+70O1lKiTaZpXfyioG7hAoNB2m7wmmKWyiku+PeDekaRYme
 UEOiokiXB3jb92IJ4iAxzYy3B/g4lJI7PnH0VUpfFYttGRwea2wAOF/g1k3McSK+v1zWo91F2e1
 C3C+o5Y1EVbZqCyKCEVFaAyo3nC+YqZHXt4ip1dueToBLsVe21WOY+rV7R9MV6SHibCJmacZept
 pZgetuuzY1kfCeQCzwa4FAa7zP2lZXLoK73sHxEhRYvv7oeks+ZFC9UGsW/k9G6lf28opCxxFmH
 cMyWfJwT/vLHPiddsFA==
X-Proofpoint-GUID: c_klBMz0GbKa1fx6yPbJJtoa6FXFh1oW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1MSBTYWx0ZWRfX5ZO+Sio/+bVl
 GdvQ4rqZCVhbp2QIEweZfMt5gTvvds4WzI2QFmhvaxIM/xLlCQDO5Gf3mBvXqlfSrOuzWDU8FJZ
 IvGMWH0XP8QrN2H9a5aLu8JEOdW8Ozk=
X-Proofpoint-ORIG-GUID: c_klBMz0GbKa1fx6yPbJJtoa6FXFh1oW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300051

On 7/30/26 8:38 AM, Varadarajan Narayanan wrote:
> On Wed, Jul 29, 2026 at 02:10:56PM +0200, Konrad Dybcio wrote:
>> On 7/24/26 11:54 AM, Varadarajan Narayanan wrote:
>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>> share the GPIOs. The board has to be reworked to change from EMMC
>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>> and include it in variant specific DTS file.
>>>
>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>
>>> Remove ipq5210-rdp504.dtb from Makefile to avoid build break.
>>
>> You're essentially removing support for the board for this commit
>> Instead, this commit could be:
>>
>> create .dtsi (90% of the current .dts)
>> add #include .dtsi to .dts
> 
> Initially did that. In this the git rename of .dts to common.dtsi gets
> lost. So did it in this round about way. Will do this and post a new
> version.

Try this in your gitconfig:

[diff]
        renameLimit = 999999
        algorithm = histogram
        renames = copies

Konrad
