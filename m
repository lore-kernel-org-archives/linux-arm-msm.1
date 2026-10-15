Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B251DB07
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066620; cv=none; b=KDLak/AJyPsQCzw9y05I5jIpaRzt95jZ3wbU+HRWBhfuixa4MJVpedcue7/IDqkLQRFwnkMglnDFKHZ/n7YBu3e4oPpJqTbS3b6AAPLJn5cpfsAb7iPaA46LHRIRPQgqbLQdyLVZJjFi3j97e+V9o1CqBMl0kgcGP/7zm5of8WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066620; c=relaxed/simple;
	bh=RoSelfqR+JFVG/SXKTvafXJAkj900s5jRJkiQxTyBi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqLUzd/n6osogLVd62IPCHkr14Ebld+tpVx4B7A1hQrk2pBinoU0iKbp2adTkpm8YPT0XAcf/eLOr+S5AbNk3dOB/9xcgtQ2IXF3L7pJsyaMpvuzvZ+kRN53UVF9b57aI6I74EaQTNBtn+zO3c+ABHyGVkNCehJnL/CYwzstXyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M461zxc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUja6GKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M461zxc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUja6GKg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAQOHk1597262
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qeW+7v3cARPoD69ymwyoS4BW4yUp98r1IGfhAo6sxJU=; b=M461zxc+qhaAcn2/
	qklCd5eNp6kJ0EFD36l77Z1Jx6dCSpVVEI8/GLxzB0TxK12HJxxI/Lgi3qiPuzK/
	VmGQoKKqAtcGhDQ4dz03+gSjZxGWNmMSC+n/S785IhPvtuaGQk6YtCCf0zdBZ0EJ
	iqQBZfS7GB1DgXi3UfRIbrqasoSEz2cVBCKQ0bU3580ie1kKHrkSNHWS71Nw4OsG
	rkcLBm/Chln+rD1lrrUHKiM1IiD64bfuIzhPO1qdoAMpakSIZa6K1MtizlN+ezBs
	/DaMhjqRG4IZlEOqFbfutxCLnvMOWDrnmqkCsGdkRgpdSl9yPtySXvd8gwh02Efu
	UbQhvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8ctk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:16:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e942b1cc86so17105705ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066617; x=1792671417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeW+7v3cARPoD69ymwyoS4BW4yUp98r1IGfhAo6sxJU=;
        b=gUja6GKgnRkPICqsMcanmT1Pmnth7olZ6x91+0ce1xdJwTzI14fGbWkGaDq3Nq3aQA
         JDqLRIo1v2QBmLAXD3rCJoG8O7yUqBTzNJn1I/Q07NJLc9mevOIKVimhxKqY2qYIj1wo
         aoPQXlxfgJ7U6W+WcgmOVgcDIZKR7PgkWi9cGGElANWB4kUiS+NrA1fdTrdiFgud/2b1
         jzpnWMht/pnu2OarF8rSyHBPuOhnSyG2PqHsWlloCYtoFfRwNNXssNyhei+kXx+8lWv2
         hcQrSaR0RWkcK33MDsVPYfb3DA7u+TW8ItdHJzm/J1HcTtwsED5VjbOe2QrIWwsx/pV7
         m0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066617; x=1792671417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeW+7v3cARPoD69ymwyoS4BW4yUp98r1IGfhAo6sxJU=;
        b=Kchn+MdBQk/H2D12qkB5zKBieAhKUDOD9VFyKQyFKVQ1DFVB8XDC/uqrEGQJcsjp9H
         AwpjRYm3yHYXLaW06slyxLC+FQZvzgzh8Hn4ASnAJiZU9JlBZFntLzkXT7HkMUCbas2S
         SAqBwjDYITckEdKiEsN8Y6OwU2vUt08QsTQeOqSIGEDb6Lr0vPGO0Oul8lz07YGl703Q
         nc1eT2dnaKRRmSFTQJQyC9vpUR0vLq83Vg3clSHSF81xZlxMqCfflnoP4Y9LK3qd3+/c
         Z8rSOVSImaLwC1m9MqQvINPQP7usoW99+vvYgfKT5UCwltrFourVyKAF3++Hq+SXOh10
         TxGw==
X-Forwarded-Encrypted: i=1; AKwUvBxSKYYXnpVufOP1TsBs/JYwL64gbodA8VCXW8cJvODYpOJ38tfMEabLSBUxOmZM63bvcKipHnPVc0YpZiNG@vger.kernel.org
X-Gm-Message-State: AFq9FYIQUx/aNX2dt3yDX9oVnWTWN3eGhrcmvC5EHLnZFuOfwCsNlDD2
	LPdindT5+GZdhvul6JQmqYhcZi+sDNVblrYCOzgTHVrLRU4mFOOW8/MqXptYsQemZirduFTys6f
	sebuNpbg0qzUPvf9nm8Ce1PA2B59zhY7TgXffvBUj5eTAPShH8A0FE5fwVyil+Jq2vluC
X-Gm-Gg: AYBFou0GifLbiTQgQtJ8kgxsWrngqT+N92NPtf5iCmIURFh1897sdEV/cVsET0H6bIp
	2pdfL4giah4zFYQwEPTN4EL6VjDWeHxCU81yNztC0gGyNZunK4IeHPZWRrCRJ4Yx+65bDpOXLGg
	5TdZPYNEELW195KU2z+dc4T5ThQmvP90VQUOnljapTElx035UaOTrbb4pheRO+lhmU8oVVJ9bq+
	KbMCiu0Rr5hoX6mh4UkrzZXEZhoADnPItt72F/ITyxQHzEKNpyKJVoy/dllirGUACammclxMZz7
	zd+X5lsDqsGMKLLpol9xkU4IrxSoYCeLImsxeWoX2E1oWmzeMatO1RkihtbtNFVyEaaD9B/MX56
	iqG+bIwyNlC06lMR/csWPxd7Ul2HVyz3b
X-Received: by 2002:a17:902:ce07:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2e8429ad199mr147196165ad.36.1792066617461;
        Thu, 15 Oct 2026 05:16:57 -0700 (PDT)
X-Received: by 2002:a17:902:ce07:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2e8429ad199mr147195935ad.36.1792066616942;
        Thu, 15 Oct 2026 05:16:56 -0700 (PDT)
Received: from [10.218.10.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e94ba30f6asm15395685ad.57.2026.10.15.05.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:16:56 -0700 (PDT)
Message-ID: <52bc42c2-f60b-4249-976d-83d360933ede@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:46:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL
To: Birk Skyum <birk.skyum@pm.me>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, regressions@lists.linux.dev,
        Andi Shyti <andi.shyti@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
References: <179173732257.29426.7905170638383807320@pm.me>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <179173732257.29426.7905170638383807320@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX45itXyD/6j9l
 kpOPK/lqMJT0rXNeaGldtsNjAKAUF2hI9ERpHNCcPw+bAf8Wx4ahBz2BJ0hiLUG11HV7kS9TifT
 qD/+e0ntAGjd7YS4JeAY5uSCHAQgn4VyEBHSUQXMi0o9m4lyBqboUoIYWAEhT2WOOQsVB7Z23hQ
 yIuPzZ8NfoJeBm1C9ca5fdFvbrWViJC4FsZG4DaguTfrE4gzN/YAkXCgkf32/VfqoRR0jkQJ40g
 qRQtJa0sGZwyEYKjhvYJXU4PkSXinttKlShkYuZ/hX3Pne35Ptqi/fM0y0/LWutbxziYedcS2a2
 Fs0xW3l8DF/tZz8DNgCStnZvx2gcm387mK23rR3kHwtQtFlNX1+WTS289if0KOSB1fqEQR24h+2
 ToDEF2NGzA5c1fuYjOlSAbpAA4UD/GNFg+gsA9V1qeglNvwG08+pagaEN1JH+GBxKfY4KSQhRLG
 gVmD0/cSNKbMDmNcKYQ==
X-Proofpoint-ORIG-GUID: tqtbm70DfCYsckxsHKJcLh-sa_0KN-kY
X-Proofpoint-GUID: tqtbm70DfCYsckxsHKJcLh-sa_0KN-kY
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0c43a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=5YmnReTpXDDOs48wh34A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX7VTOBPBqGzJo
 O1e40NJyPa+hvJbBdZCNj+4Cx0Tz/SzVjcUz8LuYRWpgFPAzwKyPqXxS0sXUmbdScI/VNf+zmXQ
 eonHPsFhRaLFOhM5D7Uji9WgWDpmzKI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048



On 10/11/2026 10:18 PM, Birk Skyum wrote:
> Hi Viken,
> 
> This change takes away the built-in keyboard and touchpad of the Lenovo
> Yoga Slim 7x (x1e80100). It reached stable as 139efdb3ee6e in 7.2.9,
> and with it the laptop has no keyboard, also at the disk passphrase
> prompt.
> 
> With the change the first transfer on the keyboard's bus fails.
> 
>   geni_i2c b80000.i2c: Bus arbitration lost, clock line undriveable
>   i2c_hid_of 1-003a: failed to fetch HID descriptor: -11
>   i2c_hid_of 1-002c: failed to fetch HID descriptor: -110
> 
> The touchscreen on a80000.i2c keeps working. Both buses are set to
> 400 kHz in the device tree.
> 
> To narrow it down I took a 7.2.8 kernel that works on this laptop and
> replaced only i2c-qcom-geni.ko, built from the same tree. It is a
> distribution build of 7.2.8 whose patches touch neither this driver nor
> qcom-geni-se.
> 
>   7.2.8 driver                                keyboard works
>   7.2.9 driver (its five qcom-geni commits)   keyboard and touchpad dead
>   7.2.9 driver with 139efdb3ee6e reverted     keyboard works
> 
> One thing I can see from the outside. The driver does not set the rate
> of the SE clock. Without the change clk_summary shows the clocks of the
> I2C controllers at 19.2 MHz, so the 19.2 MHz table is used and
> SE_GENI_CLK_SEL is 0. With the change the same clocks read 32 MHz.
> 
>                                       without     with
>   gcc_qupv3_wrap0_s0_clk (b80000)    19200000    32000000
>   gcc_qupv3_wrap1_s0_clk (a80000)    19200000    32000000
> 
> So as far as I can tell these buses now run from the 32 MHz source with
> the 32 MHz table. I have not found why that fails on b80000 and not on
> a80000.
> 
> I have not tested mainline, which carries the change as cb97bf3d4f91.
> The same backport is in 6.18.y (5815329988ac) and 6.12.y
> (f5d0302416aa), which I have not tested either. I can test patches on
> this laptop.
> 
> #regzbot introduced: cb97bf3d4f91
> 
> Thanks,
> Birk
> 

Hi Birk,
 
Thank you for narrowing this down.
 
Could you please test whether increasing the I2C pad drive strength
resolves the failure with the new driver still applied?
 
On the Yoga Slim 7x, the affected b80000.i2c bus uses GPIO0 (SDA) and
GPIO1 (SCL), via the qup_i2c0_data_clk pinctrl state in hamoa.dtsi. It
currently specifies:
 
drive-strength = <2>;
 
Please change this to:
 
drive-strength = <6>;
 
and test with cb97bf3d4f91 present, including a cold boot if possible.
 
We have previously seen the same “Bus arbitration lost, clock line
undriveable” failure on another GENI I²C bus. Increasing the pad drive
strength from 2 mA to 6 mA resolved it there. This test would help
determine whether the 32 MHz clock selection exposes marginal I2C pad
drive strength on this board.
 
Thanks,
Viken
