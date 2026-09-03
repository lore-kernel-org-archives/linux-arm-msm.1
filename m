Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E144C504
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434585; cv=none; b=N01eCnhvkD9kF6MEcY7XAUff7VhbgsgMtDXFEEzm+KEjsj8/Kjrck+hkrO1LIUuGA24Vp8qa+ltmHvRFFE1bwFVGediiKwO4vywMiefJ7OqhNtA9IcjXuRHLJEr0SYr/9/6D5hw2CMb1R1MYnAwWjEnNeS71Pn3AH+hvCaR97C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434585; c=relaxed/simple;
	bh=w19mGtPuTLp9jvGdQh3cZL0Psm/nfOyVuwJJoagZ4NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOjpKkwhJUouCEfj/c8ccMGkDL2pHrCTzoDH1hqM4ULaHBX7EgSPp0q2FNLbezIs/liS0eBGJX5vla6WUe3HNXcuzW7ZT8CtkHlXVYeWop3mgwqXi7ZZ6qzua4TTeTsY6KOe4K4qBfS6rrrzTkBYSgd/7G+p/QX8wL6aebYsQig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdZSPcS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MocGR0t9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdZSPcS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MocGR0t9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAJU212406
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mbXb80h8j5+9y5ONWXdRJEvII7rgqz7hKhOEV4dOXfc=; b=VdZSPcS/4yuItS6c
	ebwcWGRMRQxzdPQSurPTMWV9o90psbGxwJ0brmGeX5Q1QTcgo4NYBQ96geI4xvuk
	RbP4JSwTPSw3w4JMz+aBFVZs/LEpybqzLHPgPDGAxpHtDzEJSxQ1qJxUU3kEOMez
	GOo+LuGL791/1yJ7UlSgpk95OGuIES14e5jSPR69QuZGDAAxykcloDZOdeyxIuOs
	0UOfGTfZ5ClMcNkTwXHyiz1RSXRKhLW0D/DS86hiGyveAnSP3xAuPCjWKQ5uu3xI
	+9LTneImcau1WyguCt/WmzbdGhf5AFRwpiY6XFOmuYomIPssiWQ0gttqSTBTfxZa
	1lG88Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhm8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:23:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2792017a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434581; x=1789039381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbXb80h8j5+9y5ONWXdRJEvII7rgqz7hKhOEV4dOXfc=;
        b=MocGR0t9bR58dQvc+tQ7ccdPNze0x8OCfl4tD0iZrL4aNOJAcK7YHW4on97w0l9XZ8
         +a71032vsDip9IvBEtCymy3j+AuxfELxZuW0b3ldR2+PkA3vwexRzHfUvwzEkxKA5O/j
         HF4viEedZD/Nnc1IjCnKHdLk9GjE4L5izyLDQZ14i4ATaHb1/7FJ4n4IbF+nMjLvYWcF
         debXFPHInLJGFDHC1OiIsr90i87VQQaqhJpDYIyDKSQhuo0tqxXoY0nyJ/KkwfqJSXGl
         QEEd7Ak7KYr3OGKUSM4Dt+34JxKQxLwOWNJpvdvzSwxawAv6ewUtlsA6tzKd4FJgaqeN
         lihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434581; x=1789039381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbXb80h8j5+9y5ONWXdRJEvII7rgqz7hKhOEV4dOXfc=;
        b=DgMrmSIBpT+52Y409HRDmtv21l3Wd6uYKPx8n/OFClX4k10zKVMwr4vv1phhNrytQy
         Ah+3SqhsNyuuca5oBn5W/IAylThfmsLjzwodimxa1Bv6dIv11MJaFnBGcHxJ4/WRjLlA
         mG2/aa0NXFIZ1uE/5aYLUENLh/3A2xaCFdPPYe0aIMB1Wht19GrtmjJxtLlzD47MrVWP
         Xe7vQNnZfzuR3RNaECJt5c9QlJew6fvOhL6Q0KUeNwGJVOlXJwv6RNke/FuKVuxauJWZ
         ljflXPdmplNi+Qul4LaPRqEA9DlsRzX2mwsH0+cKsKdFaZOv7RSDEmuvF1BwcZU84VaI
         iyxQ==
X-Gm-Message-State: AFuF++lkHh2eAVzVrCcUIz+xRu5ezOV3Fatihk09aQrWHG/rgGFdiTCa
	ppdQe38WA4sszmp8bajM5UDa6PEt9ILbC2mH88zhT4gyvmGX3jPLxfIACDkwTOofbrHCpOvLqfl
	IAq1DeGizEmSQC/y5b5pw+LS4q4RRgGgO8a7ya2bHfHk0SwZFYGpTWtK9/zxvOLaYU9rM
X-Gm-Gg: AYBFou1/hwqYulwRLWzJMb+T9ZAlbxpBbhwxL3elOgmIHypZY+9kXPX7f4rjmYPGH2F
	fBeSA4er8J6j+3YXMMkt4/kd2RBuOzZCtGtWnw0V9LRGU7YK+BFysvqMMeMwRpOuiyzhCaiYaYc
	DdKfY2pXCafjiEFa9/hxohKuCv3nGfFrCA/imsF0wbb7fg1ZcFBGaJ8Jm/mZtr3pN0d/NYU/C5R
	srDqXFuqmxIA3AVp6EIhg9/XPyrhFcXsQpv2s52KhSRV9qPC5RTwjaMCtwF0BuXHzYbLh4U9Kkj
	t6txZW9ZcNoOUAzuHqXYa1oVZxizdcIAKmbKgsr/j68d2jTovvCkUB82J4MfkAV8Wvr5I3oELLE
	nzZaX8hK1UG2vGdLDmcF9Fp11xA3/tCc+MoT1
X-Received: by 2002:a17:90b:1dd1:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39aedf5b05fmr20343392a91.11.1788434581491;
        Thu, 03 Sep 2026 04:23:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd1:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39aedf5b05fmr20343275a91.11.1788434580961;
        Thu, 03 Sep 2026 04:23:00 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994db8csm5169856c88.9.2026.09.03.04.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:23:00 -0700 (PDT)
Message-ID: <8f2f2e8e-b7ce-467d-83bf-fc25f6375107@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:52:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
 <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX1ioGsZ8CAv96
 uWWi23OPJcbybYfXaQhs/Yzq4YsNtCOWng06bLtmfo4TaWYxZxflOvNjH4Pz6tZcJ+Jyl/V8mgP
 XVPRSZoAp4KZNYXDC+ox5jM2zyLm/JOABpCegrIcKlU3rBvLMrb+m8oGhEzhbrJr6/zMAuWjDiN
 BJBqH6GfhMM28hUiblsl2yqaV7kz5yySfSNlcIhSOWFxlGDRzoOeE0l3AZ1ZFtgBtN6LL/npbhs
 ox1tgetGaFWvx5VItgCSWSsOdiEU8DT6trp/ARJWxGt0M/WUf7wjgOU/z6nBXIjeJiXfOK5K+bj
 sPGDAfnBm3xAa0nkkZNsIOhz2IRbU3wyiWNQSr1Tn1+T1MtZcMSpmylU3AtBfGkEeUBrjY4JGaR
 gXTn3sp3TDJYcAc+rok48WkKp57x+mt4nWIy7oibbqwnA788sTnd1Msi7LGgKzlvzLQ+25pDwgS
 ptvqwbqiYD4vhZQ8zaA==
X-Proofpoint-ORIG-GUID: jqpvGTtFypRfK2lMs1sscW_nM8r0N-6W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfXx85SezKI8GRo
 6SFN69WYe0/HxrbHp6oMTmDAMsmYxWZFszLQ+P322IgbH/yJ3KK4iHPDFVgShYuB+l1VvJsl9+o
 a0ZbiyhLrQ/5WEK/qv5keXDzFUKyO3U=
X-Proofpoint-GUID: jqpvGTtFypRfK2lMs1sscW_nM8r0N-6W
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a995896 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wdwvvVUDqnwxwjgyCowA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030099


On 6/26/2026 4:43 PM, Umang Chheda wrote:
> Add initial device tree support for monaco-ac EVK board,
> based on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.
>
> monaco-ac EVK is single board supporting these peripherals :
>    - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>      and eMMC.
>    - Audio/Video, Camera & Display ports.
>    - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
>    - PCIe ports.
>    - USB & UART ports.
>
> Compared to "monaco-evk" variant, which utilizes higher tier QCS8300-AA
> SKU (supporting 40 TOPS of NPU) and a 4-PMIC (2x PM8650AU + Maxim MAX20018
> + TI TPS6594) power delivery network (PDN) to support higher power
> requirement. This board utilizes lower tier QCS8300-AC SKU
> (Supporting 20 TOPS of NPU) and a simplified 2 PMIC(2x PM8650AU) PDN.
>
> Add support for the following components :
>    - GPI (Generic Peripheral Interface) and QUPv3-0/1
>      controllers to facilitate DMA and peripheral communication.
>    - TCA9534 I/O expander via I2C to provide 8 additional GPIO
>      lines for extended I/O functionality.
>    - USB1 controller routed to a TypeC connector in device mode to
>      support USB peripheral operations.
>    - Remoteproc subsystems for supported DSPs such as Audio DSP,
>      Compute DSP and Generic DSP, along with their corresponding
>      firmware.
>    - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
>      and other consumers.
>    - QCA8081 2.5G Ethernet PHY on port-0 and expose the
>      Ethernet MAC address via nvmem for network configuration.
>      It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
>    - Support for the Iris video decoder, including the required
>      firmware, to enable video decoding capabilities.
>    - PCIe0 and PCIe1 controller and phy-nodes.
>    - Sound card and max98357a based I2S speaker amplifier.
>
> Written with inputs from:
>      Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com> - GPIO
>      Expander.
>      Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com> - GPI/QUP.
>      Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
>      Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
>      Swati Agarwal <swati.agarwal@oss.qualcomm.com> - USB.
>      Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com> - PCIe.
>      Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com> - Audio.
>
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile          |   1 +
>   arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 938 +++++++++++++++++++++
>   2 files changed, 939 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
>
[...]

Reviewed-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Regards.
  - Avaneesh

