Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1AD4CB8CD
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789112; cv=none; b=ZLphzJGpC1sHB1r9iio6Z45RUe2G8hHjuPQjaKx6Ieho3f80Wc5V9LYnCluQ1kv0M0XG1b7Ua8GdzY8P/B4jO0hzovpR8xGessBZmKU/pNHiNS+5szNB8fabNNQVO/uTFUMuZMZwDMFvm8RpuRthp12PZxvigryV7ptfHVQ7U48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789112; c=relaxed/simple;
	bh=VQ6kiCGze4ndD8UL+SDJp7bWahLizfXIwA6pMOHo8jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EY6JpOpcEAhuC493z3TXeyHwnDm4bPdnnkp4a1reBTiUxHhB/GJFfukF9VPvWCwabqcmsh4H+EpyNUfUcSDQJbGuCL7QQ4IVbYwc0BuFE+zAss/SzbtQfiDJGJvlkFWN4nvbKvKrbSWDzHFs0WFHedgeLJm1NnznnN0qGnxFFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edyNvj3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RthW/elu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edyNvj3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RthW/elu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdFf33554656
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=; b=edyNvj3Zi7nS0WhV
	zEkSKS8uSFr9w9JN/dGrK3yJMKggf2MfAXi5gntA2EE2Z67igbjT7sXEgR2/T/th
	0XeVFIDIwVKCcuKPMUA2fR5wKMJsF6Qx+ykDu+NBjXGIKmc9OOeeAX3iaOIjEekk
	zmWy3c8Vj7hl9cJYeNV82IguO/WGhVar0cxd7nu2gDouqPCml99m3yoXqXklh1ay
	IrmI9j+NAKsDHjnVhN9Sv5oOEPe/fbdpWcAwyx8z8tQQ3JAdqxSPJBltMIwz8mZc
	emV45a9sODzvqpn52nBK0Wx1JTmlcAd51Vjotc6qIRfHCQtMJEkIsGNYzUMWGHBZ
	e8sGdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw217s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:51:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so69330925ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788789109; x=1789393909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=;
        b=RthW/eluTxzYtu8j1GofXit5TBpum8geE0PzlVOBlNwTSRqEtkFfkLfYuBAHyx6Ul+
         n12X0Whw5kQQfRuGrI+ztDD6OOfrgm72GM0O4BHQ5vFedFx0Kzl/lfHG56hImSUPZbMy
         xzpgWqQj7/RXWw08EMXr0cdCUqiNnUFIGpAlh50jH5OSqPu2Fbo/7aXn2QtQI0MMdqbP
         arr4u/BXPLgQ91vPFj0BeYyoml7a5+FzsmJLaOKGz7avh7dpTemwGkzKtTmOyPLF5Q3g
         18rXTpAtU9srLYOZ5c958pR8bq2BD3P4BWNpWUM0t25GmIkqFjrrv1H5+MI77dz+H9j3
         mq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789109; x=1789393909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=;
        b=c8KGLoMTFhpobycXzqot06Uuz5uoc5t+mluOveg+YJTTW2FndOYxuRwQkeqZTC0Lmf
         XBCW8nySuFF2Tqzslnd5iEJlieJNHhhw8grvr8mNuGmv66s4sl6uOzGBobtGFux8yo3k
         rVpz27n7p4sIXvd2Liw8sqV7uZsbwm8fyft4KBslzgqVJfLs3wPGMYUkc9SmJS2T/E2z
         E+I2b5ArJtzkBJXYyM1PmIQdFrKiyJEOG0aG+5G2qK8o2KIhbiO3XUkEAcb9Ss/DVukq
         QHPvAHiqf2lWMwxlfDOdEw+O4GjiqT/vs7bD9ofAFVqZCxXkkwBzqFkeB3/Q71Qqwpno
         mFRw==
X-Forwarded-Encrypted: i=1; AKwUvBwS4udIYSto4If6t9MXI5GNfmHNPRA4okLohetfJgPUnTKNRwJUWDrzH4TqvWg8ZkEWh7W5k+i6V5un01XE@vger.kernel.org
X-Gm-Message-State: AFuF++l+1PiF08u7CfM9RwVW6c8Q9fHl/URGJqbtXSjOlDH9lUDJMQ+X
	9cavcJZyLYAiwjfuOBPXeHeu38xPBNVtYIrOhlhZWVNoJ04PkxhohkwerjOmKOrfRBRsJvatHUQ
	7/5QgG4Q6kdTCTZNammdlY0y/KSDGaCLGtQ0jU4TYxoWSMlZOhmuBQCW2rVuflCzzAXr5
X-Gm-Gg: AYBFou11v/Obb4rODLl7KBdRJRK6zMLBtNUYZGJpkDgVheUIIr69s/1GfqwTeU1VtAw
	i6+jSfcKrOa+NpIWYH3VSHEkuHrjaMxN/bJuOHnLkeSF3EyaCKhXeBM2ynuBRsliQK4t0Gmo3Qw
	WglbzdW5GkjYuraqrxxeTtt9krXl0I20Uobm2Sv64+v/icqDX+8DhWanFtc4YjWvIGN9yS8tOa+
	Bky9kY5J7Nz4p4uY5LEZrHFZAXNDG0OUKljqN64WezXR7KGdutxqgG0kgORdGA7lh+kCLwl2AZ8
	UH3uT1vezNc9aWT1fRiC1cFKsoQ0rjHdUsEaD9iG3zf+VubuMgdTVuzcAtxM1f+uhWbt30V2KO5
	nCvZxTqqGuh2meibQwkUMWUewr63uS10=
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr39790564a91.18.1788789109320;
        Mon, 07 Sep 2026 06:51:49 -0700 (PDT)
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr39790482a91.18.1788789108833;
        Mon, 07 Sep 2026 06:51:48 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.61.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm23752649c88.6.2026.09.07.06.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:51:48 -0700 (PDT)
Message-ID: <6475d1ef-0610-4b8e-9750-99681ca5ee87@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:21:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
 <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
 <841a008a-1ce6-40f9-95ad-09b4abc7456a@oss.qualcomm.com>
 <CAMRc=MefGHidh=BH+iF-4F5hJku333p4OMe=g5p7dfw_ieTfMA@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <CAMRc=MefGHidh=BH+iF-4F5hJku333p4OMe=g5p7dfw_ieTfMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uqidIR8Zr0GVoWRkoqKTHwl4D84aCj_i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1NCBTYWx0ZWRfX6X93mnISspIH
 KEzvNE7AfXApCfuUz/ImQslwjsWa/Pf4cQOQnMss/9px+TE8fzj7VOB14agXFCPbtjCaJDB9tpJ
 HWAMp3WLYqcjMcPUe/nfesKbdcI+p24=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9ec175 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=YDt4qybLIboWMMC/SFNjLA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=X6FU6-3TaxV6hX9_o7MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1NCBTYWx0ZWRfX2UGBC7OH7lGG
 gap0da/sAARVT/qW1c+hvjY7mB+Fa8/fA6/IZ3+ph4X6GUnSm/iXl9dcX9V9PJg0ZnBhD0329C0
 Ju8EO4vv4sspUSK8jR196q6mW91ee62qj+33CPPEPuyYxKxN/qIGscgyDDGykXNJKBs16NWC7wu
 QpvpOCLINCtweM4Y+q0TYVdks7bm5KSKPUcbidU+FtpAc1eyIjk2ZIcXQxURE8Psi8/BdFq00+z
 i3I/+D/nEBraxF6velRnLGhDCVvPIAGTBOgylSHEXOoUo+NQ0X+2rgLTV6VdiPw3RIH93j1H5ap
 AfNShc7ovarzaBQAVUd00Fd8Qymgwgsv0YG+QeA0VWpwuzFMHD2k4o/WUfSbz1GwK7NEdaC18A8
 MRLOVK30Ujgyv6C09T9xaAAupZ/A/NURcs4UQMvb6oz9JDmSCyKnBmYYNYrAQdyYx6vYbEi6bX9
 ad2aqhfYlj3G9bsuT2g==
X-Proofpoint-GUID: uqidIR8Zr0GVoWRkoqKTHwl4D84aCj_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070154



On 07-09-2026 19:14, Bartosz Golaszewski wrote:
> On Mon, 7 Sep 2026 15:39:10 +0200, Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> said:
>> On 07-09-2026 19:01, Abel Vesa wrote:
>>> On 26-09-07 17:33:37, Kuldeep Singh wrote:
>>>> Shikra is derived from Agatti and uses the same QCE integration.
>>>> Update the QCE node to match the underlying hardware implementation by
>>>> adjusting the fallback compatible and related properties, including
>>>> clocks and clock-names.
>>>>
>>>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>>>
>>> No fixes tag ?
>>
>> I was having confusion so didn't add it.
>>
>> The parent change is in linux-next branch and not in torvalds tree
>> currently.
>> Shall i update Fixes tag based on linux-next commit only? or not needed
>> at all?
>>
> 
> It still makes sense to add Fixes tag even if it's targetting the next cycle
> and fixing an issue queued for v7.4.

Sure, makes sense. Will update in next rev.
Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
nodes")
-- 
Regards
Kuldeep

