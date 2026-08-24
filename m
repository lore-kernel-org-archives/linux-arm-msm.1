Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE4374185
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563395; cv=none; b=nxoQFSMWeIYlI6uJFIXJ37ZJxTh5nA8cuZ9YJr7v9Yap+froqOx0dg8Mp5fvkNnm+5K6HWLoiASJM8hWEPyL4Hs5oAdJlio2Qxscm19JcsFdwhBg3ryaiAFhhtvtCsTeECCHAVkZ5DnBaDSbEzf9KTvD+NxYlKYGl0UHKlZztf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563395; c=relaxed/simple;
	bh=fiZV015Qd6HElpgmaETT8aHHht51IUBqGIJVVF7M0Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuvYV6HRTkvNqLtB2ELJDDhQqpPmeHt2fneqWvZnPJ4Tmc4Zwel1dJ+xHMnVOOtqBlwJTkhfc7+kl6J34BxZFY0YIGWWIeeFezGlDqgf6ft4zdwbCit/V1xJIjsviYGyZDYcm3quVogg9wQhNZNLEl2DvmZrt8U1XwDP9o9waAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrJSLKeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaPE2bEv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrJSLKeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaPE2bEv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O9976s2081915
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JiepDIY3h187rwt4QlQW1p1AmwaHrzO3qaEhWN3lKz4=; b=GrJSLKeB61ROFGLC
	ZhbeWpOkfnERQyKK1/ciBv9Fi+d0PsfWE9ncYtd4aqRmGIjp91Ulk1oS8x1sHiF4
	K+TJFKK1fFkMZWyTvc5VmDvuKRJy3sKXCXHcm7KOq6sHeeBAzUUWmO63ePqqJyEf
	lOjMI/OfIPGB/p1glYn0J2n0B52PGT8RhNJ2uTeVO764+IY2QZxfmQI8WUz83Hqm
	KnfLDt1XbhiJzK32Bvv5S4g4QVeqzaHmjsocBxQ+LKB3NUAY/Jvfdy6mIzScoXMO
	sbmZ6/Sbtgf6VL2K2eqpeGiW+wD8cVYv7WD4nPQljhdI1euhy3A++wIBuow43suu
	HhF6VA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsgxhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:23:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so67741055ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787563388; x=1788168188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiepDIY3h187rwt4QlQW1p1AmwaHrzO3qaEhWN3lKz4=;
        b=LaPE2bEvsOe1hi8Imd//Nf9AsAQ0QW0AsEuITs64lcvF3mG4s5rDf0M7ivxiAOcHa2
         JOEy1zatxnW1rrr1fHP41lgUnX/6SZTbJrnbU/d5MI/wUVNeFPADoaMzK22QxnybqEKL
         OanmKyth+/LFIiSaGDnfrAJ4oBfzqTjiTaEU5b2/hwQs2UTzNd+xyYAFZRnS+69zMAj/
         2NLXsxXQAAqqxdaRpS5o1zNtGZQoPCKYIZaDC8nZsrD1UUJH4KrSMG6P1LfaqSkXh2UF
         k5gcGdTsvxrwSZ9vBtpZOckBviHU0NvdBvwYuwd4N+yvWV5c6MFoPjt9DkGNymTfU9lz
         jJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563388; x=1788168188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JiepDIY3h187rwt4QlQW1p1AmwaHrzO3qaEhWN3lKz4=;
        b=UVvOSAKsIrRKiRHBxmAl/zviyjo0Ne9QgFYsU7bu2OTzWh36tBlKr9JFjreEJG7lmF
         +u9okBfx5LCy3EG1lZOqFFddyo3O+RrUEbXIKs3ULAh5Pd61nvFfacj9+u/hjWZh61pX
         LmCTyONR6nJ/wydLE3/3vuwneVQIRbYKpJ4nfOx9XlbFl4yHKeSigTEnUSWZrB6o02dE
         x+FI+XICQg0FglanEI7ANqrAkgmde37gE6imUjXSrQVktoDl+vlRJj1pYI5FyHg3GKlY
         vi5dwObvcx8umeI2ngnTnqnQZX8D+H2/7osvL/DTM3yIBjAVcqVpTrDYkm5uC9Om2StL
         XFOw==
X-Gm-Message-State: AFuF++loZw+aLJ7aYEy/rFodS97ZnLY7oyXMizUtD8IrIwgE2OM2xIby
	x9CUtZUTDexsKfQOLt4YyRr39YUoENiktcZiuKIlZy/z9mj9b8JfzBbjVmdMgLJdd2qNDXzKKX8
	S47gvJs5qMK9S+2IS2Q53OBYDXxI5qx5vqPNBhhF6mtX+3YpWC1TFis1Vq5afZECmdQ4K
X-Gm-Gg: AR+sD10iulZfReiUSktIrBJh++a6wL1BkMFPeLjf1wibzGt8SgcM1gaA0vWDpzTu8+S
	9CMZFt5y3QDAwT00SDlxCe4dgFkvQ5OD+RssOIr5gAYzIQ5y/iIamyaBVazzdFZZfXwgtdNulzT
	wg10ioCx1VUGYyjy+N7nF2CTXflxibOBqwWbD4mFrZV8WjpRTtrLmWhr2ZznGwvHm41njLCfbfd
	uAbjVrlZ5B30RLzjGiWy4qB0fkvXhMekQJT4EJiMKtJWb3JlR/czm16W8G3dPif1R9QIBSvX+aP
	lhVwaEuj/kYTK2tLFMTiWUtWRR2sDAN9vvA/fXxtsX2Ix7W6kV3csnLjKYLh3NCHOraNtI16vCP
	xpVpJA2LRf9fXXFN1HdPdQbGtqvJSFLw=
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d64ada8eb8mr488968955ad.2.1787563387559;
        Mon, 24 Aug 2026 02:23:07 -0700 (PDT)
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d64ada8eb8mr488966475ad.2.1787563386539;
        Mon, 24 Aug 2026 02:23:06 -0700 (PDT)
Received: from [10.92.217.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768b9ad3sm15589595ad.58.2026.08.24.02.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:23:05 -0700 (PDT)
Message-ID: <a84f1764-9aa1-41c9-a560-4e0f3481f8c2@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:52:59 +0530
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
From: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
In-Reply-To: <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CV0vuxhzEWcwA8Rxz6jmAJ-8GqDoXs5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX5ricSI46L2E5
 00wlAcQ7XmAQv8OPjp+x+5o4nh18BwIes4kgXSYeDXTQE8bnXmsxHofn84Bn8MqBF+WusNbC4jj
 Rmoh/N/0XnCuTBBmEz6NSjl//qXdIiB7D6+1GHe0h4LA5+5elkQpkuKXskUPSJcVTd3LibnR7iK
 hKaTb97/76ZXBEsJo4VVFPA6jva8I0W/wyMCiiHMqGUTy81dCbYsdd4m3bK6g3vpbET4WYX3Kfr
 8SPtTq4nz7eQcTGpUrih7viegUEq3cau22ARBSQm/QxjPXCZ87FmbsV/7xSt2lhMoRdbaYUsCt2
 UrtxlluBToempLL2DQ1u9oI/ZQjse8xiN1QAdRZ2XkLve8N/CaRoqoZIzVaw5lFTAYOqESZrPu/
 UcbO27G+h33JShPgtJ3FW6BX/Xz5SkNYj695fM0fUgOwDdlSFfIqMQgtVQ2TWSll7u8//pbMAa9
 z7EbEawriA/GErTMzXw==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c0d7d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wdwvvVUDqnwxwjgyCowA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: CV0vuxhzEWcwA8Rxz6jmAJ-8GqDoXs5o
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX7BjwbZtDnoC4
 xNdfnkllQQZ6sij3D6FoIraTEJJvmOJzmRcpEh4BvlpNY0eDfJJy3k2LQxXEYMW/G+U04FhWuH2
 7f/a1L9WdXOEVaFuOVFaJNUHt7oAAvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240082


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
>
> [...]
>
>
> Tested-by: Nirmesh Kumar Singh<nirmesh.singh@oss.qualcomm.com>

Best Regards,
Nirmesh Kumar Singh

